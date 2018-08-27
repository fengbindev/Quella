package com.ssrs.model;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

/**
 * 交易详情
 * @author zhengjie.me
 * @date 2018/08/24 13:57:50
 */
@Data
@TableName("ssrs_trade")
public class Trade {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     *  支付方式 如果是微信，请传“WEIXINPAY”，如果是支付宝“ALIPAY”
     */
    public String payType;

    /**
     * （必填）商品描述
     */
    private String body;

    /**
     * （必填）商品名称
     */
    private String subject;

    /**
     * （必填）商户订单号
     */
    private String outTradeNo;

    /**
     * （必填）第三方订单号，微信，支付宝
     */
    private String tradeNo;

    /**
     * （必填）价格
     */
    private String totalAmount;

    /**
     * 付款的url
     */
    private String payUrl;

    /**
     * 订单状态,已支付，未支付..
     */
    private String state;

    /**
     * 创建时间
     */
    private Date createTime;

    public boolean check(String totalAmount){
        return this.getTotalAmount().equals(totalAmount)?true:false;
    }
}
