package com.ssrs.mapper;

import com.ssrs.model.WebSetting;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.CacheNamespace;

/**
 * <p>
 * 项目配置表，有且仅有一条数据，不要删除 Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-12-01
 */
@CacheNamespace(implementation = com.ssrs.core.cache.RedisMybatisCache.class )
public interface WebSettingMapper extends BaseMapper<WebSetting> {

}
