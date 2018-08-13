package com.ssrs.core.manager;

import com.ssrs.permission.model.Role;
import com.ssrs.util.commom.LoggerUtils;

import java.util.*;

public class RoleManager {


    public static List<Map<String, Object>> buildRoleTree(List<Role> roles) {
        LoggerUtils.debug(RoleManager.class,"进行角色tree构建");
        List<Map<String,Object>> maps = new LinkedList<>();
        for (Role role:roles) {
            if (role!=null){
                Map<String,Object> map = new HashMap<>(16);
                map.put("id",role.getId());
                map.put("name",role.getName());
                maps.add(map);
            }
        }
        return maps;
    }
}
