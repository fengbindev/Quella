package com.ssrs.controller.user;

import com.ssrs.controller.BaseController;
import com.ssrs.core.manager.UserManager;
import com.ssrs.core.shiro.token.manager.TokenManager;
import com.ssrs.permission.model.Menu;
import com.ssrs.permission.model.Permission;
import com.ssrs.permission.model.Role;
import com.ssrs.permission.service.IMenuService;
import com.ssrs.permission.service.IPermissionService;
import com.ssrs.permission.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
    private IRoleService roleService;
    @Autowired
    private IPermissionService permissionService;
    @Autowired
    private IMenuService menuService;

    /**
     * 登录成功跳转到首页
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
        return modelAndView;
    }
}
