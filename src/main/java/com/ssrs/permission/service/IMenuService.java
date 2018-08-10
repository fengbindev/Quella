package com.ssrs.permission.service;

import com.baomidou.mybatisplus.service.IService;
import com.ssrs.permission.model.Menu;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-08
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> getRootMenu();

    int insert2(Menu menu);

    Menu selectById2(Long id);

    int updateById2(Menu menu);

    int deleteById2(Integer id,Long permissionId);
}
