package com.ssrs.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.extra.mail.MailAccount;
import cn.hutool.extra.mail.MailUtil;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.mapper.MailMapper;
import com.ssrs.model.Mail;
import com.ssrs.service.IMailService;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-22
 */
@Service("mailService")
public class MailServiceImpl extends ServiceImpl<MailMapper, Mail> implements IMailService {

    @Override
    public boolean sendHtmlMail(String email,String title ,String content) {
        try {
            Mail mail = baseMapper.selectById(1);
            MailAccount account = new MailAccount();
            account.setHost(mail.getHost());
            account.setPort(mail.getPort());
            account.setAuth(true);
            account.setFrom(mail.getFrom());
            account.setUser(mail.getUser());
            account.setPass(mail.getPass());
            account.setStartttlsEnable(mail.getStartttlsEnable());
            MailUtil.send(account, CollUtil.newArrayList(email),title,content,true);
            return true;
        }catch (Exception e){
            LoggerUtils.fmtError(getClass(),e,"向[%s]发送邮件发生错误",email);
            throw new RuntimeException("邮件发送失败");
        }

    }
}
