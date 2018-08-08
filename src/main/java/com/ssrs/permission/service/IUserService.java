package com.ssrs.permission.service;

import com.ssrs.permission.model.User;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
public interface IUserService extends IService<User> {

    User login(String username, String pswd);

    void updateByPrimaryKeySelective(User user);
}
