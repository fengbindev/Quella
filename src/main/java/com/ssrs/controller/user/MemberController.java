package com.ssrs.controller.user;

import com.ssrs.bo.UserOnlineBo;
import com.ssrs.core.shiro.session.CustomSessionManager;
import com.ssrs.permission.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @Description: 在线用户管理
 * @Author: ssrs
 * @CreateDate: 2018/8/14 15:12
 * @UpdateUser: ssrs
 * @UpdateDate: 2018/8/14 15:12
 * @Version: 1.0
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("member")
public class MemberController {
    /***
     * 用户手动操作Session
     * */
    @Autowired
    CustomSessionManager customSessionManager;
    @Autowired
    IUserService userService;

    /**
     * 跳转到首页
     *
     * @return
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public ModelAndView index() {
        List<UserOnlineBo> list = customSessionManager.getAllUser();
        List<UserOnlineBo> newList = new ArrayList<>(100);
        Iterator<UserOnlineBo> iterator = list.iterator();
        //将同一个用户的session去重,之保留最后登录的session
        while (iterator.hasNext()){
            UserOnlineBo bo = iterator.next();
            Iterator<UserOnlineBo> iterator1 = newList.iterator();
            while (iterator1.hasNext()){
                UserOnlineBo newBo = iterator1.next();
                if (newBo.getEmail().equals(bo.getEmail()) && newBo.getLastLoginTime().getTime()<bo.getLastLoginTime().getTime()){
                    iterator1.remove();
                }
            }
            newList.add(bo);
        }
        return new ModelAndView("member/index", "list", newList);
    }

    /**
     * 在线用户管理
     *
     * @return
     */
    @RequestMapping(value = "online", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView online() {
        List<UserOnlineBo> list = customSessionManager.getAllUser();

        return new ModelAndView("member/online", "list", list);
    }

    /**
     * 在线用户详情
     *
     * @return
     */
    @RequestMapping(value = "onlineDetails", method = RequestMethod.GET)
    public ModelAndView onlineDetails(String sessionId) {
        UserOnlineBo bo = customSessionManager.getSession(sessionId);
        return new ModelAndView("member/detail", "bo", bo);
    }

    /**
     * 改变Session状态
     *
     * @param status
     * @param sessionIds
     * @return
     */
    @RequestMapping(value = "changeSessionStatus", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changeSessionStatus(Boolean status, String sessionIds) {
        return customSessionManager.changeSessionStatus(status, sessionIds);
    }
}
