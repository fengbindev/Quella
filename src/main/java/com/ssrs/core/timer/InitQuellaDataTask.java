package com.ssrs.core.timer;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssrs.model.SystemLog;
import com.ssrs.permission.service.IUserService;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
* @Description:    定时调用存储过程，初始化数据库
* @Author:         ssrs
* @CreateDate:     2018/8/17 13:35
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/17 13:35
* @Version:        1.0
*/
public class InitQuellaDataTask {

    @Autowired
    IUserService userService;

    public void run(){
        LoggerUtils.debug(getClass(),"开始初始化数据库");
        try {
            userService.initQuellaData();
        }catch (Exception e){
            e.printStackTrace();
            LoggerUtils.fmtError(getClass(),e,"初始化数据库错误[%s]",e.getMessage());
        }
    }

}
