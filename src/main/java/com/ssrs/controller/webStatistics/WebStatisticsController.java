package com.ssrs.controller.webStatistics;

import com.ssrs.core.shiro.cache.VCache;
import com.ssrs.core.shiro.filter.ShiroFilterUtils;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.IPUtil;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @Description: 站点统计，用于统计ip,pv等
 * @Author: ssrs
 * @CreateDate: 2018/10/11 16:59
 * @UpdateUser: ssrs
 * @UpdateDate: 2018/10/11 16:59
 * @Version: 1.0
 */
@Controller
@Scope(value = "prototype")
public class WebStatisticsController {

    @RequestMapping("webStatistics")
    @ResponseBody
    public Object webStatistics(HttpServletRequest request) {
        //1.判断是否是ajax请求，如果是ajax请求就不统计
        if (ShiroFilterUtils.isAjax(request)) {
            return null;
        }
        //2.从redis缓存中读取ip数与pv数进行自增(redis 定时每天23:59:00 将数据保存数据库ssrs_web_visit_count并初始化数据)
        Integer pvCount = VCache.get(APPUtil.PV_COUNT, Integer.class);
        if (pvCount == null) {
            VCache.set(APPUtil.PV_COUNT, 0);
        } else {
            VCache.set(APPUtil.PV_COUNT, pvCount + 1);
        }
        String ip;
        try {
            ip = IPUtil.getIpAddress(request);
        } catch (IOException e) {
            e.printStackTrace();
            LoggerUtils.error(WebStatisticsController.class, "IP获取失败");
            return "IP获取失败";
        }
        VCache.setVBySet(APPUtil.IP_COUNT,ip);
        return null;
    }
}
