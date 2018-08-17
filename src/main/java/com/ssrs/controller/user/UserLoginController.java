package com.ssrs.controller.user;

import com.ssrs.controller.BaseController;
import com.ssrs.core.manager.UserManager;
import com.ssrs.core.shiro.token.manager.TokenManager;
import com.ssrs.permission.model.User;
import com.ssrs.permission.service.IUserService;
import com.ssrs.util.commom.LoggerUtils;
import com.ssrs.util.commom.StringUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Description: 用户登录相关
 * @Author: ssrs
 * @CreateDate: 2018/8/6 16:59
 * @UpdateUser: ssrs
 * @UpdateDate: 2018/8/6 16:59
 * @Version: 1.0
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("u")
public class UserLoginController extends BaseController {

    @Autowired
    IUserService userService;

    /**
     * 登录跳转
     *
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "user/login";
    }

    /**
     * 注册跳转
     *
     * @returnBaseController
     */
    public String register() {
        return "user/register";
    }

    /**
     * 登录
     * @param user 实体类
     * @param remeberMe 是否记住我
     * @param request
     * @return
     */
    @RequestMapping(value = "submitLogin", method = RequestMethod.POST)
    @ResponseBody
    public Object submitLogin(User user, Boolean remeberMe, HttpServletRequest request) {
        try {
            User loginInfo = TokenManager.login(user, remeberMe);
            resultMap.put("status", 200);
            resultMap.put("message", "登录成功");
            //获取登录之前的地址
//            SavedRequest savedRequest = WebUtils.getSavedRequest(request);
//            String url = null;
//            if (savedRequest != null) {
//                url = savedRequest.getRequestUrl();
//            }
//            LoggerUtils.fmtDebug(getClass(), "获取登录之前的URL:[%s]", url);
            //如果登录之前没有地址，那么跳转到首页
//            if (StringUtils.isBlank(url)) {
//                url = "/"+request.getContextPath() + "user/index";
//            }
//            resultMap.put("back_url", url);
        } catch (DisabledAccountException e) {
            resultMap.put("status", 500);
            resultMap.put("message", "账户已经禁用");
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("message", "账户或密码错误");
        }

        return resultMap;
    }

    /**
     * 退出
     * @return
     */
    @RequestMapping(value="logout",method =RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> logout(){
        try {
            TokenManager.logout();
            resultMap.put("status", 200);
        } catch (Exception e) {
            resultMap.put("status", 500);
            logger.error("errorMessage:" + e.getMessage());
            LoggerUtils.fmtError(getClass(), e, "退出出现错误，%s。", e.getMessage());
        }
        return resultMap;
    }

}
