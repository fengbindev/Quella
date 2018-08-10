package com.ssrs.permission.service.impl;

import com.ssrs.permission.model.Menu;
import com.ssrs.permission.mapper.MenuMapper;
import com.ssrs.permission.model.Permission;
import com.ssrs.permission.service.IMenuService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.permission.service.IPermissionService;
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

    @Override
    public List<Menu> getRootMenu() {
        return baseMapper.getRootMenu();
    }

    @Override
    public int insert2(Menu menu) {
        Permission permission = menu.getPermission();
        permission.setUrl(menu.getUrl());
        permissionService.insert(permission);
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
        return count;
    }
}
