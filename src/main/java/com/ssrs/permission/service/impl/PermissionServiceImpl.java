package com.ssrs.permission.service.impl;

import com.ssrs.permission.model.Permission;
import com.ssrs.permission.mapper.PermissionMapper;
import com.ssrs.permission.service.IPermissionService;
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
@Service(value = "permissionService")
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

    @Override
    public Set<String> findPermissionByUserId(Long userId) {
        return baseMapper.findPermissionByUserId(userId);
    }
}
