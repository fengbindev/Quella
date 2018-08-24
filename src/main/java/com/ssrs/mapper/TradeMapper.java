package com.ssrs.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.model.Sign;
import com.ssrs.model.Trade;

/**
 * Trade Mapper 接口
 * @author zhengjie.me
 * @since 2018/08/24 14:13:01
 */
public interface TradeMapper extends BaseMapper<Trade> {

    /**
     * 根据订单号，查询
     * @param outTradeNo
     * @return
     */
    Trade findTradeByOutTradeNo(String outTradeNo);
}
