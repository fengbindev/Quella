package com.ssrs.controller.role;


import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.controller.BaseController;
import com.ssrs.core.manager.PageManager;
import com.ssrs.core.manager.RoleManager;
import com.ssrs.permission.model.Permission;
import com.ssrs.permission.model.Role;
import com.ssrs.permission.service.IPermissionService;
import com.ssrs.permission.service.IRoleService;
import com.ssrs.util.commom.APPUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
@Controller
@Scope(value="prototype")
@RequestMapping("/role")
public class RoleController extends BaseController{

    @Autowired
    private IRoleService roleService;

    @Autowired
    private IPermissionService permissionService;

    /**
     * 跳转到角色页面
     * @return
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("role/index");
        return modelAndView;
    }

    @RequestMapping(value = "getRolePage",method = RequestMethod.POST)
    @ResponseBody
    public Object getRolePage(int page,int limit){
        Page<Role> rolePage = roleService.selectPage(new Page<>(page, limit));
        Map<String,Object> map = PageManager.buildPage(rolePage);
        return map;
    }

    /**
     * 跳转到角色编辑页面
     * @param id 角色id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("role/update");
        //查询角色信息
        Role role = roleService.selectById(id);
        modelAndView.addObject("role",role);
        //查询角色权限信息
        //更据角色id查询对应权限
        List<String> list =  permissionService.findPermissionByRoleId(id);
        String s = StringUtils.join(list, ",");
        modelAndView.addObject("selectvalue",s);
        return modelAndView;
    }

    /**
     * 角色编辑
     * @param role
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Role role,String pids){
        int count = roleService.updateById(role,pids);
        return count>0? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 角色删除
     * @param id
     * @return
     */
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id){
        boolean b = roleService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public String goAdd(){
        return "role/add";
    }

    /**
     * 角色添加方法
     * @param role
     * @param pids
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Role role ,String pids){
        int count = roleService.insertRoleAndPermission(role,pids);
        return count>0?APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    @RequestMapping(value = "getAllRole",method = RequestMethod.GET)
    @ResponseBody
    public Object getAllRole(){
        List<Role> roles = roleService.selectList(null);
        List<Map<String, Object>> mapList = RoleManager.buildRoleTree(roles);
        return mapList;
    }


}

