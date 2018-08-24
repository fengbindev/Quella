package com.ssrs.service;

import com.baomidou.mybatisplus.service.IService;
import com.ssrs.model.Trade;
import java.util.Map;

/**
 * @author zhengjie.me
 * @date 2018/08/24 14:05:50
 */
public interface TradeService extends IService<Trade> {

    /**
     * 创建一个订单
     * @param trade
     * @param map
     */
    void createTrade(Trade trade, Map map);

    /**
     * 根据订单编号，获取详情
     * @param outTradeNo
     * @return
     */
    Trade findByOutTradeNo(String outTradeNo);

    /**
     * 更新订单
     * @param trade
     */
    void updateTrade(Trade trade);
}
