package com.ssrs.permission.service;

import com.ssrs.permission.model.Role;
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
public interface IRoleService extends IService<Role> {

    Set<String> findRoleByUserId(Long userId);

    int insertRoleAndPermission(Role role, String pids);

    int updateById(Role role, String pids);

}
