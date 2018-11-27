package com.ssrs.mapper;

import com.ssrs.model.ImagePlayer;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.CacheNamespace;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-10-20
 */
@CacheNamespace(implementation = com.ssrs.core.cache.RedisMybatisCache.class )
public interface ImagePlayerMapper extends BaseMapper<ImagePlayer> {

}
