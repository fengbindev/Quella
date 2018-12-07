package com.ssrs.core.timer;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
* @Description:     若一个方法一次执行不完下次轮转时则等待该方法执行完后才执行下一次操作
* @Author:          ssrs
* @CreateDate:     2018/12/3 20:27
* @UpdateUser:     ssrs
* @UpdateDate:     2018/12/3 20:27
* @Version:        1.0
*/
public class QuartzJobFactoryDisallowConcurrentExecution implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        ScheduleJob scheduleJob = (ScheduleJob) jobExecutionContext.getMergedJobDataMap().get("scheduleJob");
        TaskUtils.invokMethod(scheduleJob);
    }
}
