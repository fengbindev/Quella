package com.ssrs.mapper;

import com.ssrs.model.FileQiniu;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.CacheNamespace;

/**
 * <p>
 * 七牛云配置 Mapper 接口
 * </p>
 *
 * @author ssrs
 * @since 2018-08-23
 */
@CacheNamespace(implementation = com.ssrs.core.cache.RedisMybatisCache.class )
public interface FileQiniuMapper extends BaseMapper<FileQiniu> {

}
