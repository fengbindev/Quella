package com.ssrs.permission.service.impl;

import com.ssrs.permission.model.Menu;
import com.ssrs.permission.mapper.MenuMapper;
import com.ssrs.permission.service.IMenuService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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

    @Override
    public List<Menu> getRootMenu() {
        return baseMapper.getRootMenu();
    }
}
