package com.ssrs.service;

import com.ssrs.model.WebVisitCount;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 站点统计表 服务类
 * </p>
 *
 * @author ssrs
 * @since 2018-10-12
 */
public interface IWebVisitCountService extends IService<WebVisitCount> {

    WebVisitCount selectByWeek();
}
