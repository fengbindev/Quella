package com.ssrs.core.config;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 * 支付宝配置类
 * @author zhengjie.me
 * @date 2018/08/24 13:50:06
 */
@Data
@Component
public class Alipay {

    /**
     * 应用ID,APPID，收款账号既是APPID对应支付宝账号
     */
    private String appID;

    /**
     * 商户私钥，您的PKCS8格式RSA2私钥
     */
    private String privateKey;

    /**
     * 支付宝公钥
     */
    private String publicKey;

    /**
     * 签名方式
     */
    private String signType;

    /**
     * 支付宝开放安全地址
     */
    private String gatewayUrl;

    /**
     * 编码
     */
    private String charset;

    /**
     * 异步通知地址
     */
    private String notifyUrl;

    /**
     * 订单完成后返回的页面
     */
    private String returnUrl;

    /**
     * 类型
     */
    private String format="JSON";

    /**
     * 商户号
     */
    private String  sysServiceProviderId;

}
