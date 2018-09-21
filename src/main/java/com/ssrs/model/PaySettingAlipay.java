package com.ssrs.model;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 支付宝支付配置信息
 * </p>
 *
 * @author ssrs
 * @since 2018-09-21
 */
@Data
@TableName("ssrs_pay_setting_alipay")
public class PaySettingAlipay implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "psa_id", type = IdType.INPUT)
    private Integer psaId;
    /**
     * appId
     */
    private String psaAppId;
    /**
     * 密钥
     */
    private String psaPrivateKey;
    /**
     * 支付宝公钥
     */
    private String psaPublicKey;
    /**
     * 支付宝开放安全地址(一半不需要修改)
     */
    private String psaServerUrl;
    /**
     * 支付宝返回回调地址前缀
     */
    private String psaDoMain;

    /**
     * 支付宝异步通知地址
     */
    private String psaNotifyUrl;

    /**
     * 设置字符集编码
     */
    private String psaCharset;
    /**
     * 仅支持JSON
     */
    private String psaFormat;
    /**
     * 设置符号类型
     */
    private String psaSignType;



}
