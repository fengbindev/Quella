package com.ssrs.service.impl;

import com.ssrs.model.WebVisitCount;
import com.ssrs.mapper.WebVisitCountMapper;
import com.ssrs.service.IWebVisitCountService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 站点统计表 服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-10-12
 */
@Service("webVisitCountService")
public class WebVisitCountServiceImpl extends ServiceImpl<WebVisitCountMapper, WebVisitCount> implements IWebVisitCountService {

    @Override
    public WebVisitCount selectByWeek() {
        return baseMapper.selectByWeek();
    }
}
