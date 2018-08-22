package com.ssrs.mp;

import com.ssrs.permission.model.User;
import com.ssrs.permission.service.IUserService;
import com.ssrs.permission.service.impl.UserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;

/**
* @Description:    java类作用描述
* @Author:         ssrs
* @CreateDate:     2018/8/3 17:52
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/3 17:52
* @Version:        1.0
*/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestIUserService {

    @Autowired
    private IUserService userService;

    @Test
    public void testUserInsert(){
        User user = new User();
        user.setEmail("ssrs@qq.com");
        user.setNickname("ssrs");
        user.setCreateTime(new Date());
        user.setLastLoginTime(new Date());
        user.setPswd("123456");
        user.setStatus(1L);
        userService.insert(user);
    }

}
