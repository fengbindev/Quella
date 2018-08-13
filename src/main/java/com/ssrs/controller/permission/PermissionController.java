package com.ssrs.controller.permission;


import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.core.manager.PermissionManager;
import com.ssrs.permission.model.Permission;
import com.ssrs.permission.service.IPermissionService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedList;
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
@Scope(value = "prototype")
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    /**
     * 通过角色id查询对应的角色权限信息
     * @return
     */
    @RequestMapping(value = "getPermissionTree",method = RequestMethod.GET)
    @ResponseBody
    public Object getPermissionTree(){
        Map<String,Object> resultMap = new HashMap<>(16);
        //查询权限Tree信息
        List<Permission> permissions =  permissionService.getPermissionTree();
        List<Map<String,Object>> mapList = new LinkedList<>();
        //构建前端Tree数据
        List<Map<String,Object>> buildPermissions = PermissionManager.buildPermission(permissions,mapList);
        resultMap.put("tree",buildPermissions);

        return resultMap;
    }

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(){
        return "permission/index";
    }

    /**
     * 得到分页数据
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "getPermissionPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getPermissionPage(int page ,int limit){
        Page<Permission> permissionPage = permissionService.selectPage(new Page<>(page, limit));
        Map<String, Object> map = PageManager.buildPage(permissionPage);
        return map;
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("permission/add");
        List<Permission> permissions = permissionService.selectList(null);
        modelAndView.addObject("permissions",permissions);
        return modelAndView;
    }

    /**
     * 权限添加方法
     * @param permission
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Permission permission){
        int count = permissionService.insert2(permission);
        return count>0? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }


    /**
     * 跳转到编辑页面
     * @param id 权限id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("permission/update");
        List<Permission> permissions = permissionService.selectList(null);
        Permission permission = permissionService.selectById(id);
        modelAndView.addObject("permission",permission);
        modelAndView.addObject("permissions",permissions);
        return modelAndView;
    }

    /**
     * 编辑方法
     * @param permission
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Permission permission){
        boolean b = permissionService.updateById(permission);
        return b?APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 权限删除方法
     * @return
     */
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id){
        boolean b = permissionService.deleteById(id);
        return b?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

}

