package com.ssrs.model;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import javax.persistence.*;
import java.sql.Timestamp;

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
    @Column(nullable = false)
    public String payType;

    /**
     * （必填）商品描述
     */
    @Column(nullable = false)
    private String body;

    /**
     * （必填）商品名称
     */
    @Column(nullable = false)
    private String subject;

    /**
     * （必填）商户订单号
     */
    @Column(nullable = false,unique = true)
    private String outTradeNo;

    /**
     * （必填）第三方订单号，微信，支付宝
     */
    private String tradeNo;

    /**
     * （必填）价格
     */
    @Column(nullable = false)
    private String totalAmount;

    /**
     * 付款的url
     */
    @Column(nullable = false,length = 2000)
    private String payUrl;

    /**
     * 订单状态,已支付，未支付..
     */
    @Column(nullable = false)
    private String state;

    /**
     * 创建时间
     */
    @Column(name = "create_time",nullable = false)
    private Timestamp createTime;

    public boolean check(String totalAmount){
        return this.getTotalAmount().equals(totalAmount)?true:false;
    }
}
