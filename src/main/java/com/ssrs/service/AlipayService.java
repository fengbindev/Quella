package com.ssrs.service;

import com.ssrs.core.config.Alipay;
import com.ssrs.model.PaySettingAlipay;
import com.ssrs.model.Trade;
import java.util.Map;

/**
 * @author zhengjie.me
 * @date 2018/08/24 14:05:11
 */
public interface AlipayService {

    /**
     * 处理来自PC的交易请求
     * @param alipay
     * @param trade
     * @return
     * @throws Exception
     */
    Map toPayAsPC(PaySettingAlipay alipay, Trade trade) throws Exception;

    /**
     * 处理来自手机网页的交易请求
     * @param alipay
     * @param trade
     * @return
     * @throws Exception
     */
    Map toPayAsWeb(PaySettingAlipay alipay, Trade trade) throws Exception;
}
