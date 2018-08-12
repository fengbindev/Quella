package com.ssrs.core.manager;

import com.ssrs.permission.model.Permission;
import com.ssrs.util.commom.LoggerUtils;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
/**
* @Description:    permission Manager
* @Author:         ssrs
* @CreateDate:     2018/8/11 16:38
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/11 16:38
* @Version:        1.0
*/
public class PermissionManager {
    /**
     * 构建前端所需数据
     * @param permissions
     * @return
     */
    public static List<Map<String,Object>> buildPermission(List<Permission> permissions,List<Map<String,Object>> mapList) {
        LoggerUtils.debug(PermissionManager.class,"进行权限tree构建");

        for (Permission p: permissions) {
            if (p!=null){
                Map<String,Object> map = new HashMap<>(16);
                map.put("id",p.getId());
                map.put("name",p.getName());
                if (p.getChildren().size()>0){
                    map.put("open",true);
                    map.put("isParent",true);
                    //递归
                    List<Map<String,Object>> mapChildrenList = new LinkedList<>();
                    map.put("children",buildPermission(p.getChildren(),mapChildrenList));
                }
                mapList.add(map);
            }
        }
        return  mapList;
    }


}
