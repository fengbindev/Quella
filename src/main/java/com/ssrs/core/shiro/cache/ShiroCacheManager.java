package com.ssrs.core.shiro.cache;

import org.apache.shiro.cache.Cache;

/**
* @Description:    shiro cache manager 接口
* @Author:          ssrs
* @CreateDate:     2018/8/6 10:53
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/6 10:53
* @Version:        1.0
*/
public interface ShiroCacheManager {

    <K, V> Cache<K, V> getCache(String name);

    void destroy();

}
