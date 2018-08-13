package com.ssrs.permission.service.impl;

import com.ssrs.permission.model.UserRole;
import com.ssrs.permission.mapper.UserRoleMapper;
import com.ssrs.permission.service.IUserRoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
@Service(value = "userRoleService")
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    @Override
    public List<String> findRoleIdByUserId(Long id) {
        return baseMapper.findRoleIdByUserId(id);
    }
}
