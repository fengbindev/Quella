package com.ssrs.permission.service;

import com.ssrs.permission.model.Permission;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
public interface IPermissionService extends IService<Permission> {

    Set<String> findPermissionByUserId(Long userId);

    List<Permission> getPermissionTree();

    List<String> findPermissionByRoleId(Long id);

    Long getParentIdByMenuParentId(Integer parentId);

    int insert2(Permission permission);
}
