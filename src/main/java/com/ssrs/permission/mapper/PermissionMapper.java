package com.ssrs.permission.mapper;

import com.ssrs.permission.model.Permission;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
public interface PermissionMapper extends BaseMapper<Permission> {
    Set<String> findPermissionByUserId(Long userId);

    List<Permission> getPermissionTree();

    List<String> findPermissionByRoleId(Long id);

    Long getParentIdByMenuParentId(Integer menuParentId);
}
