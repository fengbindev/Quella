package com.ssrs.service.impl;

import com.ssrs.model.WebSetting;
import com.ssrs.mapper.WebSettingMapper;
import com.ssrs.service.IWebSettingService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 项目配置表，有且仅有一条数据，不要删除 服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-12-01
 */
@Service("webSettingService")
public class WebSettingServiceImpl extends ServiceImpl<WebSettingMapper, WebSetting> implements IWebSettingService {

}
