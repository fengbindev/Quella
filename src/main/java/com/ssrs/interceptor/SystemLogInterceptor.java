package com.ssrs.interceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ssrs.core.shiro.filter.ShiroFilterUtils;
import com.ssrs.core.shiro.token.manager.TokenManager;
import com.ssrs.model.SystemLog;
import com.ssrs.service.ISystemLogService;
import com.ssrs.service.impl.SystemLogServiceImpl;
import com.ssrs.util.commom.IPUtil;
import com.ssrs.util.commom.SpringContextUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.Date;
import java.util.Map;

/**
* @Description:    系统日志拦截器
* @Author:         ssrs
* @CreateDate:     2018/8/15 8:50
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/15 8:50
* @Version:        1.0
*/
public class SystemLogInterceptor implements HandlerInterceptor{

    private static final String LOG_SEND_TIME = "_send_time";
    private static final String LOG_ENTITY = "_log_entity";
    private static final String LOG_RRTURNDATA = "_log_return_data";
    @Autowired
    private ISystemLogService systemLogService;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
       //创建日志实体
        SystemLog log = new SystemLog();
        //获取sessionId
        String  sessionId = (String) TokenManager.getSession().getId();
        //获取请求路径
        String requestURI = httpServletRequest.getRequestURI();
        String paramData = "";
        if (requestURI!=null && requestURI.startsWith("//u/submitLogin")){
            //获取请求参数
             paramData = JSON.toJSONString(httpServletRequest.getParameter("email"), SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
        }else {
            //获取请求参数
             paramData = JSON.toJSONString(httpServletRequest.getParameterMap(), SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue);
        }
       //获取客户端ip
        String clienIp = IPUtil.getIpAddress(httpServletRequest);
        //获取请求方法
        String method = httpServletRequest.getMethod();
        //获取请求类型
        String type = ShiroFilterUtils.isAjax(httpServletRequest)?"Ajax":"Json";
        //封装数据
        log.setSessionId(sessionId);
        log.setUri(requestURI);
        log.setParamDara(paramData);
        log.setClientIp(clienIp);
        log.setMethod(method);
        log.setType(type);

        httpServletRequest.setAttribute(LOG_SEND_TIME,System.currentTimeMillis());
        httpServletRequest.setAttribute(LOG_ENTITY,log);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

        if (modelAndView!=null){
            Map<String, Object> model = modelAndView.getModel();
            httpServletRequest.setAttribute(LOG_RRTURNDATA,model);
        }

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //获取请求状态码
        int status = httpServletResponse.getStatus();
        //当前时间
        long currentTime = System.currentTimeMillis();
        //请求开始时间
        long time = Long.valueOf(httpServletRequest.getAttribute(LOG_SEND_TIME).toString());
        //获取本次请求日志实体
        SystemLog log = (SystemLog) httpServletRequest.getAttribute(LOG_ENTITY);
        log.setTimeConsuming((int) (currentTime-time));
        log.setTime(new Date(time));
        log.setReturnTime(new Date(currentTime));
        log.setHttpStatusCode(String.valueOf(status));
        log.setReturnData(JSON.toJSONString(httpServletRequest.getAttribute(LOG_RRTURNDATA),SerializerFeature.DisableCircularReferenceDetect, SerializerFeature.WriteMapNullValue));
        //写入数据库
        systemLogService.insert(log);

    }
}
