package com.ssrs.permission.mapper;

import com.ssrs.permission.model.Role;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.Set;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
public interface RoleMapper extends BaseMapper<Role> {
    Set<String> findRoleByUserId(Long userId);
}
