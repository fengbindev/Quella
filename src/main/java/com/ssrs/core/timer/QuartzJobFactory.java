package com.ssrs.core.timer;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @Description: 计划任务执行处 无状态
 * @author wison
 * @date 2017年11月11日 下午5:05:47
 */
public class QuartzJobFactory implements Job {
    public final Logger log = LoggerFactory.getLogger(this.getClass());
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
        TaskUtils.invokMethod(scheduleJob);
    }
}
