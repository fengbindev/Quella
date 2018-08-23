package com.ssrs.controller.mail;

import com.ssrs.model.Mail;
import com.ssrs.service.IMailService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-08-22
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/mail")
public class MailController {

    @Autowired
    private IMailService mailService;

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("mail/index");
        Mail mail = mailService.selectById(1);
        if (mail != null) {
            modelAndView.addObject("mail", mail);
        }
        return modelAndView;
    }

    /**
     * 修改邮件配置
     *
     * @param mail
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(Mail mail) {
        mail.setId(1);
        boolean b = mailService.updateById(mail);
        return b ? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE) : APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 邮件发送测试
     *
     * @param email
     * @param content
     * @return
     */
    @RequestMapping(value = "emailTest", method = RequestMethod.POST)
    @ResponseBody
    public Object emailTest(String email, String title, String content) {
        boolean sendOk = false;
        try {
            sendOk = mailService.sendHtmlMail(email, title, content);
        } catch (Exception e) {
            return APPUtil.returnMap("101", e.getMessage());
        }
        return sendOk ? APPUtil.returnMap("200", "邮件发送成功") : APPUtil.returnMap("101", "邮件发送失败");
    }
}

