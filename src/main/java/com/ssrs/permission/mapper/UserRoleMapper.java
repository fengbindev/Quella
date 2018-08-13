package com.ssrs.permission.mapper;

import com.ssrs.permission.model.UserRole;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {


    List<String> findRoleIdByUserId(Long id);
}
