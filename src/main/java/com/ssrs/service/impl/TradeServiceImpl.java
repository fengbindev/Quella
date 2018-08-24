package com.ssrs.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.mapper.TradeMapper;
import com.ssrs.model.Trade;
import com.ssrs.service.TradeService;
import org.springframework.stereotype.Service;
import java.util.Map;

/**
 * @author zhengjie
 * @date 2018/07/30 15:35:01
 */
@Service
public class TradeServiceImpl extends ServiceImpl<TradeMapper, Trade> implements TradeService {

    @Override
    public void createTrade(Trade trade, Map map) {
        trade.setPayUrl(map.get("payUrl")+"");
        trade.setState("待付款");
        baseMapper.insert(trade);
    }

    @Override
    public Trade findByOutTradeNo(String outTradeNo){
        Trade trade = baseMapper.findTradeByOutTradeNo(outTradeNo);
        return trade;
    }

    @Override
    public void updateTrade(Trade trade) {
        baseMapper.insert(trade);
    }
}
