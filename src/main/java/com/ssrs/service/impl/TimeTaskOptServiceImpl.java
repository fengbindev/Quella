package com.ssrs.service.impl;

import com.ssrs.core.timer.InitQuartzJob;
import com.ssrs.core.timer.ScheduleJob;
import com.ssrs.model.Timetask;
import com.ssrs.service.ITimeTaskOptService;
import com.ssrs.util.commom.APPUtil;
import org.quartz.*;
import org.quartz.impl.matchers.GroupMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @Description: 定时任务接口实现类
 * @Author: ssrs
 * @CreateDate: 2018/12/5 15:49
 * @UpdateUser: ssrs
 * @UpdateDate: 2018/12/5 15:49
 * @Version: 1.0
 */
@Service("timeTaskOptService")
public class TimeTaskOptServiceImpl implements ITimeTaskOptService {
    public final Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SchedulerFactoryBean schedulerFactoryBean;


    @Override
    public Map<String, Object> getAllJob(HttpServletRequest request) throws SchedulerException {
        Scheduler scheduler = schedulerFactoryBean.getScheduler();
        GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
        Set<JobKey> jobKeys = scheduler.getJobKeys(matcher);
        List<ScheduleJob> jobList = new ArrayList<>();
        for (JobKey jobKey : jobKeys) {
            List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
            for (Trigger trigger : triggers) {
                ScheduleJob job = new ScheduleJob();
                job.setJobId(Integer.parseInt(trigger.getDescription()));//description 放的是job的id
                job.setJobName(jobKey.getName());
                job.setJobGroup(jobKey.getGroup());
                job.setDescription("触发器:" + trigger.getKey());
                Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
                job.setJobStatus(triggerState.name());
                if (trigger instanceof CronTrigger) {
                    CronTrigger cronTrigger = (CronTrigger) trigger;
                    String cronExpression = cronTrigger.getCronExpression();
                    job.setCronExpression(cronExpression);
                }
                jobList.add(job);
            }
        }
        Map<String, Object> map = new HashMap<>(3);
        //输出
        if (jobList.size() > 0) {
            map.put("status", 200);
            map.put("data", jobList);
        } else {
            map.put("status", 101);
            map.put("message", "没有计划任务");
        }
        return map;
    }

    @Override
    public Map<String, Object> getRunningJob(HttpServletRequest request) throws SchedulerException {
        Scheduler scheduler = schedulerFactoryBean.getScheduler();
        List<JobExecutionContext> executingJobs = scheduler.getCurrentlyExecutingJobs();
        List<ScheduleJob> jobList = new ArrayList<ScheduleJob>(executingJobs.size());
        for (JobExecutionContext executingJob : executingJobs) {
            ScheduleJob job = new ScheduleJob();
            JobDetail jobDetail = executingJob.getJobDetail();
            JobKey jobKey = jobDetail.getKey();
            Trigger trigger = executingJob.getTrigger();
            job.setJobName(jobKey.getName());
            job.setJobGroup(jobKey.getGroup());
            job.setDescription("触发器:" + trigger.getKey());
            Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
            job.setJobStatus(triggerState.name());
            if (trigger instanceof CronTrigger) {
                CronTrigger cronTrigger = (CronTrigger) trigger;
                String cronExpression = cronTrigger.getCronExpression();
                job.setCronExpression(cronExpression);
            }
            jobList.add(job);
        }
        Map<String, Object> map = new HashMap<>(3);
        //输出
        if (jobList.size() > 0) {
            map.put("status", 200);
            map.put("data", jobList);
        } else {
            map.put("status", 101);
            map.put("message", "没有正在执行的任务");
        }
        return map;
    }

    @Override
    public Map<String, Object> addJob(Timetask timetask) {
        ScheduleJob job = new ScheduleJob();
        if (timetask == null) {
            return APPUtil.resultMap("status" ,101);
        }

        job.setJobId(timetask.getId());
        job.setJobGroup(timetask.getGroupName()); //任务组
        job.setJobName(timetask.getName());// 任务名称
        job.setJobStatus(timetask.getJobStatus());  // 任务发布状态
        job.setIsConcurrent("1".equals(timetask.getIsConcurrent()) ? "1" : "0"); // 运行状态
        job.setCronExpression(timetask.getCron());
        job.setBeanClass(timetask.getBeanName());// 一个以所给名字注册的bean的实例
        job.setMethodName(timetask.getMethodName());
        job.setJobData(timetask.getJobData()); //参数
        job.setStartTime(timetask.getStartTime());//任务开始时间
        job.setEndTime(timetask.getEndTime());//任务结束时间

        try {
            InitQuartzJob.addJob(job);
        } catch (SchedulerException e) {
            e.printStackTrace();
            return APPUtil.returnMap("101","任务添加失败");
        }
        return APPUtil.returnMap("200","成功");
    }

    @Override
    public Map<String, Object> pauseJob(Timetask timetask){
            if (timetask != null) {
                Scheduler scheduler = schedulerFactoryBean.getScheduler();
                JobKey jobKey = JobKey.jobKey(timetask.getName(), timetask.getGroupName());
                try {
                    scheduler.pauseJob(jobKey);
                } catch (SchedulerException e) {
                    e.printStackTrace();
                    return APPUtil.returnMap("101","失败");
                }
                return APPUtil.returnMap("200","成功");
            } else {
                return APPUtil.returnMap("101","任务不存在");
            }
        }

    @Override
    public Map<String, Object> resumeJob(Timetask timetask){

            if (timetask != null) {
                Scheduler scheduler = schedulerFactoryBean.getScheduler();
                JobKey jobKey = JobKey.jobKey(timetask.getName(), timetask.getGroupName());
                try {
                    scheduler.resumeJob(jobKey);
                } catch (SchedulerException e) {
                    e.printStackTrace();
                    return APPUtil.returnMap("101","失败");
                }
                //输出
                return APPUtil.returnMap("200","成功");
            } else {
                return APPUtil.returnMap("101","任务不存在");
            }
    }

    @Override
    public Map<String, Object> deleteJob(Timetask timetask){

            if (timetask != null) {
                Scheduler scheduler = schedulerFactoryBean.getScheduler();
                JobKey jobKey = JobKey.jobKey(timetask.getName(), timetask.getGroupName());
                try {
                    scheduler.deleteJob(jobKey);
                } catch (SchedulerException e) {
                    e.printStackTrace();
                    return APPUtil.returnMap("101","失败");
                }
                return APPUtil.returnMap("200","成功");
            } else {
                return APPUtil.returnMap("101","任务不存在");
            }
    }

    @Override
    public Map<String, Object> runAJobNow(Timetask timetask){
        Map<String, Object> map = new HashMap<>(2);
            if (timetask != null) {
                Scheduler scheduler = schedulerFactoryBean.getScheduler();
                JobKey jobKey = JobKey.jobKey(timetask.getName(), timetask.getGroupName());
                try {
                    scheduler.triggerJob(jobKey);
                } catch (SchedulerException e) {
                    e.printStackTrace();
                    return APPUtil.returnMap("101","失败");
                }
                //输出
                return APPUtil.returnMap("200","成功");
            } else {
                //输出
               return APPUtil.returnMap("101","任务不存在");
            }
    }

    @Override
    public Map<String, Object> updateJobCron(Timetask timetask) {
        try {
                if (timetask != null) {
                    Scheduler scheduler = schedulerFactoryBean.getScheduler();
                    JobKey jobKey = JobKey.jobKey(timetask.getName(), timetask.getGroupName());

                    TriggerKey triggerKey = TriggerKey.triggerKey(timetask.getName(), timetask.getGroupName());

                    CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

                    CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(timetask.getCron());

                    trigger = trigger.getTriggerBuilder().withIdentity(triggerKey)
                            .withSchedule(scheduleBuilder).startAt(timetask.getStartTime()).endAt(timetask.getEndTime()).build();

                    scheduler.rescheduleJob(triggerKey, trigger);
                    //输出
                    return APPUtil.returnMap("200","成功");
                } else {
                    return APPUtil.returnMap("101","任务不存在");
                }

        } catch (SchedulerException e) {
            e.printStackTrace();
            return APPUtil.returnMap("101","失败");
        }
    }

}
