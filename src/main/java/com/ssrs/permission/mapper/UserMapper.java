package com.ssrs.permission.mapper;

import com.ssrs.permission.model.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.CacheNamespace;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-08-06
 */
@CacheNamespace(implementation = com.ssrs.core.cache.RedisMybatisCache.class )
public interface UserMapper extends BaseMapper<User> {

    void initQuellaData();
}
