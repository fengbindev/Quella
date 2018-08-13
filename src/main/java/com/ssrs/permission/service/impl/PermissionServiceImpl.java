package com.ssrs.permission.service.impl;

import com.ssrs.permission.model.Permission;
import com.ssrs.permission.mapper.PermissionMapper;
import com.ssrs.permission.model.RolePermission;
import com.ssrs.permission.service.IPermissionService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.permission.service.IRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
@Service(value = "permissionService")
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {
    @Autowired
    private IRolePermissionService rolePermissionService;
    @Override
    public Set<String> findPermissionByUserId(Long userId) {
        return baseMapper.findPermissionByUserId(userId);
    }

    @Override
    public List<Permission> getPermissionTree() {
        return baseMapper.getPermissionTree();
    }

    @Override
    public List<String> findPermissionByRoleId(Long id) {
        return baseMapper.findPermissionByRoleId(id);
    }

    @Override
    public Long getParentIdByMenuParentId(Integer menuParentId) {
        return  baseMapper.getParentIdByMenuParentId(menuParentId);
    }

    /**
     * 添加权限也把这个权限添加到admin角色中
     * @param permission
     * @return
     */
    @Override
    public int insert2(Permission permission) {
        Integer count = baseMapper.insert(permission);
        //给admin角色添加这个权限
        RolePermission rp = new RolePermission();
        rp.setPid(permission.getId());
        rp.setRid(1L);
        rolePermissionService.insert(rp);
        return count;
    }

}
