package com.ssrs.permission.service.impl;

import com.ssrs.permission.model.RolePermission;
import com.ssrs.permission.mapper.RolePermissionMapper;
import com.ssrs.permission.service.IRolePermissionService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
@Service(value = "rolePermissionService")
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionMapper, RolePermission> implements IRolePermissionService {

}
