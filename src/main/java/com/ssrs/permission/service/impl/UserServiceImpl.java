package com.ssrs.permission.service.impl;

import com.ssrs.permission.model.User;
import com.ssrs.permission.mapper.UserMapper;
import com.ssrs.permission.service.IUserService;
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
@Service(value = "userService")
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Override
    public User login(String username, String pswd) {
        User user = new User();
        user.setEmail(username);
        user.setPswd(pswd);
        User user1 = baseMapper.selectOne(user);
        return user1;
    }

    @Override
    public void updateByPrimaryKeySelective(User user) {
        baseMapper.updateById(user);
    }
}
