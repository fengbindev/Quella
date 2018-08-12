package com.ssrs.controller.permission;


import com.ssrs.core.manager.PermissionManager;
import com.ssrs.permission.model.Permission;
import com.ssrs.permission.service.IPermissionService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

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
     * @param id 角色id
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

}

