package com.ssrs.mapper;

import com.ssrs.model.WebVisitCount;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * 站点统计表 Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-10-12
 */
public interface WebVisitCountMapper extends BaseMapper<WebVisitCount> {

    WebVisitCount selectByWeek();
}
