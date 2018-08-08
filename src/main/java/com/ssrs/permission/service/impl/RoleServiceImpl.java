package com.ssrs.permission.service.impl;

import com.ssrs.permission.model.Role;
import com.ssrs.permission.mapper.RoleMapper;
import com.ssrs.permission.service.IRoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
@Service(value = "roleService")
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

    @Override
    public Set<String> findRoleByUserId(Long userId) {
        //select r.type from u_role r,u_user_role ur where ur.rid = r.id and ur.uid = #{id,jdbcType=BIGINT}
        return baseMapper.findRoleByUserId(userId);
    }
}
