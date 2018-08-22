package com.ssrs.email;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.extra.mail.MailAccount;
import cn.hutool.extra.mail.MailUtil;
import com.ssrs.model.Mail;
import com.ssrs.service.IMailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
/**
* @Description:    邮件发送测试
* @Author:         ssrs
* @CreateDate:     2018/8/22 9:38
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/22 9:38
* @Version:        1.0
*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class SendEmailTest {

    @Autowired
    private IMailService mailService;

    /**
     * 发送html格式的邮件
     */
    @Test
    public void sendHtmlMail(){
        Mail mail = mailService.selectById(1);
        MailAccount account = new MailAccount();
        account.setHost(mail.getHost());
        account.setPort(mail.getPort());
        account.setAuth(true);
        account.setFrom(mail.getFrom());
        account.setUser(mail.getUser());
        account.setPass(mail.getPass());
        account.setStartttlsEnable(mail.getStartttlsEnable());
        MailUtil.send(account, CollUtil.newArrayList("2382828864@qq.com"),"测试标题","<h1>邮件测试HTML内容</h1>",true);

    }

}
