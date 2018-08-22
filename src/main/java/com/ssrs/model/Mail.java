package com.ssrs.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ssrs
 * @since 2018-08-22
 */
@Data
@TableName("ssrs_mail")
public class Mail implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 邮件服务器的SMTP地址
     */
    private String host;
    /**
     * 邮件服务器的SMTP端口
     */
    private Integer port;
    /**
     * 发件人（必须正确，否则发送失败）
     */
    private String from;
    /**
     * 用户名
     */
    private String user;
    /**
     * 密码（注意，某些邮箱需要为SMTP服务单独设置密码）
     */
    private String pass;
    /**
     * SSL方式发送
     */
    private Boolean startttlsEnable;
    /**
     * 邮件有效期(天)
     */
    private Integer vaildateDay;



}
