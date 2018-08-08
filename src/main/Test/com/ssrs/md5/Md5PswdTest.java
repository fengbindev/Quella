package com.ssrs.md5;

import com.ssrs.core.manager.UserManager;
import com.ssrs.permission.model.User;
import org.junit.Test;

/**
* @Description:    用户密码加密测试
* @Author:         ssrs
* @CreateDate:     2018/8/7 14:34
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/7 14:34
* @Version:        1.0
*/
public class Md5PswdTest {

    @Test
    public void md5PswdTest(){
        User user = new User();
        user.setEmail("ssrs@qq.com");
        user.setPswd("123456");

        User user1 = UserManager.md5Pswd(user);
        System.out.println(user.getPswd());
    }
}
