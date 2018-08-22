package com.ssrs.service;

import com.ssrs.model.Mail;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-22
 */
public interface IMailService extends IService<Mail> {

    boolean sendHtmlMail(String email, String title ,String content);
}
