package com.ssrs.service.impl;


import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.ssrs.core.config.Alipay;
import com.ssrs.model.PaySettingAlipay;
import com.ssrs.model.Trade;
import com.ssrs.service.AlipayService;
import com.ssrs.util.alipay.AlipayUtils;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zhengjie
 * @date 2018/07/27 15:40:12
 */
@Service
public class AlipayServiceImpl implements AlipayService {

    private AlipayUtils alipayUtils = new AlipayUtils();

    @Override
    public Map toPayAsPC(PaySettingAlipay alipay, Trade trade) throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(alipay.getPsaServerUrl(), alipay.getPsaAppId(), alipay.getPsaPrivateKey(), alipay.getPsaFormat(), alipay.getPsaCharset(), alipay.getPsaPublicKey(), alipay.getPsaSignType());

        /**
         * 创建API对应的request(电脑网页版)
         */
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();

        /**
         * 订单完成后返回的页面和异步通知地址
         */
        request.setReturnUrl(alipay.getPsaDoMain());
        request.setNotifyUrl(alipay.getPsaNotifyUrl());

        /**
         *  填充订单参数
         */
        request.setBizContent("{" +
                "    \"out_trade_no\":\""+trade.getOutTradeNo()+"\"," +
                "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "    \"total_amount\":"+trade.getTotalAmount()+"," +
                "    \"subject\":\""+trade.getSubject()+"\"," +
                "    \"body\":\""+trade.getBody()+"\"," +
                "    \"extend_params\":{" +
//                "    \"sys_service_provider_id\":\""+alipay.getSysServiceProviderId()+"\"" +
                "    }"+
                "  }");//填充业务参数
        /**
         * 调用SDK生成表单
         * 通过GET方式，可以获取url
         */
        String payUrl = alipayClient.pageExecute(request, "GET").getBody();
        Map<String,String> map=new HashMap<>(1);
        map.put("payUrl",payUrl);
        return map;

    }

    @Override
    public Map toPayAsWeb(PaySettingAlipay alipay, Trade trade) throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(alipay.getPsaServerUrl(), alipay.getPsaAppId(), alipay.getPsaPrivateKey(), alipay.getPsaFormat(), alipay.getPsaCharset(), alipay.getPsaPublicKey(), alipay.getPsaSignType());

        /**
         * 创建API对应的request(手机网页版)
         */
        AlipayTradeWapPayRequest request = new AlipayTradeWapPayRequest();

        /**
         * 订单完成后返回的页面和异步通知地址
         */
        request.setReturnUrl(alipay.getPsaDoMain());
        request.setNotifyUrl(alipay.getPsaNotifyUrl());
        /**
         *  填充订单参数
         */
        request.setBizContent("{" +
                "    \"out_trade_no\":\""+trade.getOutTradeNo()+"\"," +
                "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "    \"total_amount\":"+trade.getTotalAmount()+"," +
                "    \"subject\":\""+trade.getSubject()+"\"," +
                "    \"body\":\""+trade.getBody()+"\"," +
                "    \"extend_params\":{" +
//                "    \"sys_service_provider_id\":\""+alipay.getSysServiceProviderId()+"\"" +
                "    }"+
                "  }");//填充业务参数

        /**
         * 调用SDK生成表单
         * 通过GET方式，可以获取url
         */
        String payUrl = alipayClient.pageExecute(request, "GET").getBody();
        Map<String,String> map=new HashMap<>(1);
        map.put("payUrl",payUrl);
        return map;
    }
}
