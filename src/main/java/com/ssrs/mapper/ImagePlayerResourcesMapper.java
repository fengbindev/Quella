package com.ssrs.mapper;

import com.ssrs.model.ImagePlayerResources;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.CacheNamespace;

/**
 * <p>
 * 图片播放器图片列表 Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-10-20
 */
@CacheNamespace(implementation = com.ssrs.core.cache.RedisMybatisCache.class )
public interface ImagePlayerResourcesMapper extends BaseMapper<ImagePlayerResources> {

}
