package com.ssrs.permission.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssrs.permission.model.Menu;
import com.ssrs.permission.mapper.MenuMapper;
import com.ssrs.permission.model.Permission;
import com.ssrs.permission.model.RolePermission;
import com.ssrs.permission.service.IMenuService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.permission.service.IPermissionService;
import com.ssrs.permission.service.IRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-08
 */
@Service("menuService")
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Autowired
    private IPermissionService permissionService;
    @Autowired
    private IRolePermissionService rolePermissionService;

    @Override
    public List<Menu> getRootMenu() {
        return baseMapper.getRootMenu();
    }

    @Override
    public int insert2(Menu menu) {
        Permission permission = menu.getPermission();
        permission.setUrl(menu.getUrl());
        //通过菜单的parentId找到要这个菜单权限的parentId
        Long permissionParentId = permissionService.getParentIdByMenuParentId(menu.getParentId());
        permission.setParentId(permissionParentId);
        permissionService.insert(permission);
        //给admin角色添加这个权限
        RolePermission rp = new RolePermission();
        rp.setPid(permission.getId());
        rp.setRid(1L);
        rolePermissionService.insert(rp);
        return baseMapper.insert2(menu);
    }

    @Override
    public Menu selectById2(Long id) {
        return baseMapper.selectById2(id);
    }

    @Override
    public int updateById2(Menu menu) {
        permissionService.updateById(menu.getPermission());
        return baseMapper.updateById2(menu);
    }

    @Override
    public int deleteById2(Integer id,Long permissionId) {
        //因为外教约束必须先删除菜单再删除权限
        int count =  baseMapper.deleteById(id);
        permissionService.deleteById(permissionId);
        //删除菜单时也删除这个菜单对应的权限
        rolePermissionService.delete(new EntityWrapper<RolePermission>().eq("pid",permissionId));
        return count;
    }
}
