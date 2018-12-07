package com.ssrs.core.timer.job;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssrs.model.SystemLog;
import com.ssrs.service.ISystemLogService;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
/**
* @Description:    定时清除系统日志
* @Author:         ssrs
* @CreateDate:     2018/8/15 16:18
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/15 16:18
* @Version:        1.0
*/
@Component
public class CleanSystemLogTask {

    @Autowired
    private ISystemLogService systemLogService;
    public void run() {
        LoggerUtils.debug(getClass(),"开始清除系统日志");
        try {
            systemLogService.delete(new EntityWrapper<SystemLog>().le("time",new Date()));
        }catch (Exception e){
            e.printStackTrace();
            LoggerUtils.fmtError(getClass(),e,"清除系统日志错误[%s]",e.getMessage());
        }
    }
}
