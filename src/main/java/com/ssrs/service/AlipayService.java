package com.ssrs.service;

import com.ssrs.core.config.Alipay;
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
    Map toPayAsPC(Alipay alipay, Trade trade) throws Exception;

    /**
     * 处理来自手机网页的交易请求
     * @param alipay
     * @param trade
     * @return
     * @throws Exception
     */
    Map toPayAsWeb(Alipay alipay, Trade trade) throws Exception;
}
