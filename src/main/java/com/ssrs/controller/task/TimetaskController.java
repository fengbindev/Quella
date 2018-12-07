package com.ssrs.controller.task;


import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.core.shiro.token.manager.TokenManager;
import com.ssrs.core.timer.ScheduleJob;
import com.ssrs.model.Timetask;
import com.ssrs.service.ITimeTaskOptService;
import com.ssrs.service.ITimetaskService;
import com.ssrs.util.commom.APPUtil;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  定时任务 前端控制器
 * </p>
 *
 * @author ssrs2
 * @since 2018-12-03
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/timetask")
public class TimetaskController {

    @Autowired
    private ITimetaskService timetaskService;
    @Autowired
    private ITimeTaskOptService timeTaskOptService;

    /**
     * 跳转到显示页面
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index() {
        return "task/index";
    }

    /**
     * 得到定时任务分页数据
     *
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping(value = "getTimeTaskPageInfo", method = RequestMethod.POST)
    @ResponseBody
    public Object getTimeTaskPageInfo(int limit, int page, HttpServletRequest request) throws SchedulerException {
        Page<Timetask> timetaskPage = timetaskService.selectPage(new Page<>(page, limit));
        Map<String, Object> timeTaskListMap = PageManager.buildPage(timetaskPage);
        List<Timetask> list = (List<Timetask>) timeTaskListMap.get("data");
        Map<String, Object> runningJobMap = timeTaskOptService.getRunningJob(request);
        Map<String, ScheduleJob> map = new HashMap<String, ScheduleJob>();
        if (200 == (int) runningJobMap.get("status")) {
            List<ScheduleJob> jobList = (List<ScheduleJob>) runningJobMap.get("data");
            for (ScheduleJob job : jobList) {
                map.put(job.getJobId().toString(), job);
            }
        }
        for (Timetask timetask : list) {
            if (map.containsKey(timetask.getId().toString())) {
                timetask.setIsConcurrent(1);
            }
        }
        // 查询task的计划状态
        Map<String, Object> allJobMap = timeTaskOptService.getAllJob(request);
        Map<String, ScheduleJob> planMap = new HashMap<String, ScheduleJob>();
        if (200 == (int) allJobMap.get("status")) {
            List<ScheduleJob> jobList = (List<ScheduleJob>) allJobMap.get("data");
            ;
            if (jobList.size() > 0) {
                for (ScheduleJob job : jobList) {
                    planMap.put(job.getJobId().toString(), job);
                }
            }
        }
        for (Timetask timetask : list) {
            if (planMap.containsKey(timetask.getId().toString())) {
                String status = planMap.get(timetask.getId().toString()).getJobStatus();
                timetask.setPlanStatus(status);
            }
        }
        timeTaskListMap.put("data", list);
        return timeTaskListMap;
    }

    @RequestMapping(value = "goAdd", method = RequestMethod.GET)
    public String goAdd() {
        return "task/add";
    }

    /**
     * 添加任务到数据库
     *
     * @param timetask
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(Timetask timetask) {
        timetask.setIsConcurrent(Integer.parseInt(ScheduleJob.CONCURRENT_NOT));
        timetask.setPlanStatus(Trigger.TriggerState.NONE.toString());
        timetask.setJobStatus(ScheduleJob.STATUS_NOT_RUNNING);
        DateTime data = DateUtil.date();
        timetask.setCreateTime(data);
        timetask.setCreateUserId(TokenManager.getUserId());
        timetask.setModifyTime(data);
        timetask.setModifyUserId(TokenManager.getUserId());
        boolean b = timetaskService.insert(timetask);
        return b ? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE) : APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }


    @RequestMapping(value = "goUpdate" ,method = RequestMethod.GET)
    public String goUpdate(int id, Model model){
        Timetask timetask = timetaskService.selectById(id);
        model.addAttribute("timetask",timetask);
        return "task/update";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(Timetask timetask) {
        timetask.setModifyTime(new Date());
        timetask.setModifyUserId(TokenManager.getUserId());
        boolean b = timetaskService.updateById(timetask);
        if (b){
            timeTaskOptService.updateJobCron(timetask);
        }
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE): APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 发布任务
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "publishJob", method = RequestMethod.POST)
    @ResponseBody
    public Object publishJob(int id) {
        Timetask timetask = new Timetask();
        timetask.setId(id);
        timetask.setJobStatus(ScheduleJob.STATUS_RUNNING);
        boolean b = timetaskService.updateById(timetask);
        return b ? APPUtil.returnMap("200", "发布成功") : APPUtil.returnMap("200", "发布失败");

    }

    /**
     * 添加任务到计划列表，也就是放在内存中运行
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "addTtask2job", method = RequestMethod.POST)
    @ResponseBody
    public Object addTtask2job(int id) {
        Timetask timetask = timetaskService.selectById(id);
        return timeTaskOptService.addJob(timetask);
    }

    /**
     * 立即执行一次任务
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "runAJobNow", method = RequestMethod.POST)
    @ResponseBody
    public Object runAJobNow(int id) {
        Timetask timetask = timetaskService.selectById(id);
        return timeTaskOptService.runAJobNow(timetask);
    }

    @RequestMapping(value = "pauseJob", method = RequestMethod.POST)
    @ResponseBody
    public Object pauseJob(int id){
        Timetask timetask = timetaskService.selectById(id);
        return timeTaskOptService.pauseJob(timetask);
    }

    @RequestMapping(value = "resumeJob" ,method = RequestMethod.POST)
    @ResponseBody
    public Object resumeJob(int id){
        Timetask timetask = timetaskService.selectById(id);
        return timeTaskOptService.resumeJob(timetask);
    }

    @RequestMapping(value = "deleteJob" ,method = RequestMethod.POST)
    @ResponseBody
    public Object deleteJob(int id){
        Timetask timetask = timetaskService.selectById(id);
        return timeTaskOptService.deleteJob(timetask);
    }
}
