package com.ssrs.permission.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssrs.permission.model.Role;
import com.ssrs.permission.mapper.RoleMapper;
import com.ssrs.permission.model.RolePermission;
import com.ssrs.permission.service.IRolePermissionService;
import com.ssrs.permission.service.IRoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
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

    @Autowired
    private IRolePermissionService rolePermissionService;

    @Override
    public Set<String> findRoleByUserId(Long userId) {
        //select r.type from u_role r,u_user_role ur where ur.rid = r.id and ur.uid = #{id,jdbcType=BIGINT}
        return baseMapper.findRoleByUserId(userId);
    }

    /**
     * 查入角色，也插入role_permission 表中这个角色对应的权限信息
     * @param role
     * @param pids
     * @return
     */
    @Override
    public int insertRoleAndPermission(Role role, String pids) {
        Integer count = baseMapper.insert(role);
        Long rid = role.getId();
        String[] s = pids.split(",");
        for (int i=0;i<s.length;i++){
            RolePermission rp = new RolePermission();
            rp.setRid(rid);
            rp.setPid(Long.parseLong(s[i]));
            rolePermissionService.insert(rp);
        }
        return count;
    }

    /**
     * 修改角色权限，先删除原有权限再添加新权限
     * @param role
     * @param pids
     * @return
     */
    @Override
    public int updateById(Role role, String pids) {
        Integer count = baseMapper.updateById(role);
        Long rid = role.getId();
        String[] ids = pids.split(",");
        rolePermissionService.delete(new EntityWrapper<RolePermission>().eq("rid",rid));
        for (int i=0;i<ids.length;i++){
            RolePermission rp = new RolePermission();
            rp.setRid(rid);
            rp.setPid(Long.parseLong(ids[i]));
            rolePermissionService.insert(rp);
        }
        return count;
    }
}
