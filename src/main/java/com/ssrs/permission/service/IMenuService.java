package com.ssrs.permission.service;

import com.ssrs.permission.model.Menu;
import com.baomidou.mybatisplus.service.IService;

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
}
