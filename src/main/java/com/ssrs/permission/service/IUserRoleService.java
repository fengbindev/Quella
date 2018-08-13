package com.ssrs.permission.service;

import com.ssrs.permission.model.UserRole;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
public interface IUserRoleService extends IService<UserRole> {

    List<String> findRoleIdByUserId(Long id);
}
