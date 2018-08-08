package com.ssrs.core.shiro.cache.impl;

import com.ssrs.core.shiro.cache.JedisManager;
import com.ssrs.core.shiro.cache.JedisShiroCache;
import com.ssrs.core.shiro.cache.ShiroCacheManager;
import org.apache.shiro.cache.Cache;

/**
* @Description:    自定义的shiro cache Manger
* @Author:         ssrs
* @CreateDate:     2018/8/6 10:54
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/6 10:54
* @Version:        1.0
*/
public class JedisShiroCacheManager implements ShiroCacheManager {

    private JedisManager jedisManager;

    @Override
    public <K, V> Cache<K, V> getCache(String name) {
        return new JedisShiroCache<K, V>(name, getJedisManager());
    }

    @Override
    public void destroy() {
    	//如果和其他系统，或者应用在一起就不能关闭
    	//getJedisManager().getJedis().shutdown();
    }

    public JedisManager getJedisManager() {
        return jedisManager;
    }

    public void setJedisManager(JedisManager jedisManager) {
        this.jedisManager = jedisManager;
    }
}
