package com.ssrs.controller.user;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.controller.BaseController;
import com.ssrs.core.manager.PageManager;
import com.ssrs.core.manager.UserManager;
import com.ssrs.core.shiro.token.manager.TokenManager;
import com.ssrs.model.WebSetting;
import com.ssrs.permission.model.*;
import com.ssrs.permission.service.*;
import com.ssrs.service.IWebSettingService;
import com.ssrs.util.commom.APPUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @Description: 用户管理
 * @Author: ssrs
 * @CreateDate: 2018/8/8 8:53
 * @UpdateUser: ssrs
 * @UpdateDate: 2018/8/8 8:53
 * @Version: 1.0
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("user")
public class UserCoreController extends BaseController {


    @Autowired
    private IMenuService menuService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IUserRoleService userRoleService;
    @Autowired
    private IWebSettingService webSettingService;

    /**
     * 登录成功跳转到登录首页
     *
     * @return
     */
    @RequestMapping("index")
    public ModelAndView index(HttpServletRequest request) {
        Long userId = TokenManager.getUserId();
        ModelAndView modelAndView = new ModelAndView("user/index");
        //查询出所有的菜单,然后进行菜单权限过滤
        List<Menu> menus = menuService.getRootMenu();
        menus = UserManager.checkMenuPermission(menus);
        modelAndView.addObject("menus",menus);
        WebSetting webSetting = webSettingService.selectById(1);
        modelAndView.addObject("websetting",webSetting);
        return modelAndView;
    }

    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(){
        return "user/list";
    }

    /**
     * 用户分页数据
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "getUserPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getUserPage(int page,int limit){
        Page<User> userPage = userService.selectPage(new Page<>(page, limit));
        return PageManager.buildPage(userPage);
    }

    /**
     * 跳转到用户添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public String goAdd(){
        return "user/add";
    }

    /**
     * 用户添加方法
     * @param user
     * @param rids 角色ids
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(User user,String rids){
        int i = userService.selectCount(new EntityWrapper<User>().eq("email", user.getEmail()));
        //检查该邮箱是否已经注册
        if (i>0){
            Map<String ,Object> map = new HashMap<>(16);
            map.put("status",101);
            map.put("message","该邮箱已经注册！");
            return  map;
        }
        //密码加密
        user.setPswd(UserManager.md5Pwsd(user.getEmail(),user.getPswd()));
        user.setCreateTime(new Date());
        int count = userService.insertUserAndRole(user,rids);
        return count>0? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 跳转到用户编辑页面
     * @param id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("user/update");
        User user = userService.selectById(id);
        modelAndView.addObject("user",user);
        List<String> rids = userRoleService.findRoleIdByUserId(id);
        String s = StringUtils.join(rids, ",");
        modelAndView.addObject("selectvalue",s);
        return modelAndView;
    }

    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(User user,String rids){
        //如果密码为空表示不修改密码
        if (com.ssrs.util.commom.StringUtils.isBlank(user.getPswd())){
            user.setPswd(null);
        }
        int count = userService.updateById(user,rids);
        return count>0? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id){
        boolean b = userService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

    /**
     * 是否允许登录
     * @param user
     * @return
     */
    @RequestMapping(value = "updateType",method = RequestMethod.POST)
    @ResponseBody
    public Object updateType(User user){
        boolean b = userService.updateById(user);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 跳转到个人中心页面
     * @return
     */
    @RequestMapping(value = "my",method = RequestMethod.GET)
    public ModelAndView my(){
        ModelAndView modelAndView = new ModelAndView("user/my");
        return modelAndView;
    }

    /**
     * 个人资料修改
     * @return
     */
    @RequestMapping(value = "updateSelf",method = RequestMethod.POST)
    @ResponseBody
    public Object updateSelf(User user){
        boolean b = userService.updateById(user);
        //重新登录一次
        boolean isRembered = false;
        if (SecurityUtils.getSubject().isRemembered()){
            isRembered = true;
        }
        TokenManager.login(TokenManager.getToken(), isRembered);
        return b?APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 密码修改
     * @return
     */
    @RequestMapping(value="updatePswd",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updatePswd(String pswd,String newPswd){
        //根据当前登录的用户帐号 + 老密码，查询。
        String email = TokenManager.getToken().getEmail();
        pswd = UserManager.md5Pwsd(email,pswd);
        User user = userService.login(email, pswd);

        if(null == user){
            resultMap.put("status", 300);
            resultMap.put("message", "密码不正确！");
        }else{
            user.setPswd(newPswd);
            //加工密码
            user = UserManager.md5Pswd(user);
            //修改密码
            userService.updateByPrimaryKeySelective(user);
            resultMap.put("status", 200);
            resultMap.put("message", "修改成功!");
            //重新登录一次
            boolean isRembered = false;
            if (SecurityUtils.getSubject().isRemembered()){
                isRembered = true;
            }
            TokenManager.login(user, isRembered);
        }
        return resultMap;
    }


}
