package com.ssrs.service;

import com.ssrs.model.Timetask;
import org.quartz.SchedulerException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

public interface ITimeTaskOptService {
    /**
     * 获取所有计划中的任务列表
     * @param request
     * @return
     * @throws SchedulerException
     */
    Map<String,Object> getAllJob(HttpServletRequest request) throws SchedulerException;

    /**
     * 所有正在运行的job
     * @param request
     * @return
     * @throws SchedulerException
     */
    Map<String,Object> getRunningJob(HttpServletRequest request) throws SchedulerException;

    /**
     * 添加任务
     * @param timetask
     * @return
     * @throws IOException
     */
    Map<String,Object> addJob(Timetask timetask);

    /**
     * 暂停一个job
     * @param timetask
     * @return
     */
    Map<String,Object> pauseJob(Timetask timetask);

    /**
     * 恢复一个job
     * @param timetask
     * @return
     */
    Map<String,Object> resumeJob(Timetask timetask);

    /**
     * 删除一个job
     * @param timetask
     * @return
     */
    Map<String,Object> deleteJob(Timetask timetask);

    /**
     * 立即执行job
     * @param timetask
     * @return
     * @throws IOException
     * @throws SchedulerException
     */
    Map<String,Object> runAJobNow(Timetask timetask);

    /**
     * 更新job时间表达式
     * @param timetask
     * @return
     */
    Map<String,Object> updateJobCron(Timetask timetask);
}
