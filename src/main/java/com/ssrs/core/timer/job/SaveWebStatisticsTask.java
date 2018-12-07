package com.ssrs.core.timer.job;

import cn.hutool.core.date.DateUtil;
import com.ssrs.core.shiro.cache.VCache;
import com.ssrs.model.WebVisitCount;
import com.ssrs.service.IWebVisitCountService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
* @Description:    定时保存每日站点统计数据到数据库
* @Author:         ssrs
* @CreateDate:     2018/10/12 13:52
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/12 13:52
* @Version:        1.0
*/
@Component
public class SaveWebStatisticsTask {

    @Autowired
    private IWebVisitCountService webVisitCountService;

    public void run(){
        LoggerUtils.debug(getClass(),"保存站点统计数据到数据库");
        WebVisitCount webVisitCount = new WebVisitCount();
        webVisitCount.setIpCount(VCache.getLenBySet(APPUtil.IP_COUNT).intValue());
        webVisitCount.setPvCount(VCache.get(APPUtil.PV_COUNT,Integer.class));
        webVisitCount.setCreateTime(DateUtil.date());
        webVisitCountService.insert(webVisitCount);
        //初始化Redis缓存shuju
        VCache.delSetByKey(APPUtil.IP_COUNT,null);
        VCache.set(APPUtil.PV_COUNT,0);
    }
}
