package com.ssrs.core.cache;

import com.ssrs.core.shiro.cache.VCache;
import com.ssrs.util.commom.LoggerUtils;
import org.apache.ibatis.cache.Cache;

import java.util.List;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
* @Description:    使用Redis作为mybatis的二级缓存（注意mybatis的二级缓存脏读问题）
* @Author:          ssrs
* @CreateDate:     2018/11/26 16:16
* @UpdateUser:     ssrs
* @UpdateDate:     2018/11/26 16:16
* @Version:        1.0
 * 使用方式：（1）在mapper接口上加上：@CacheNamespace(implementation = com.ssrs.core.cache.RedisMybatisCache.class )
 *           （2）在xml 文件上加上 ：<cache type= "com.ssrs.core.cache.RedisMybatisCache.class" />
*/
public class RedisMybatisCache implements Cache {
    private ReadWriteLock readWriteLock = new ReentrantReadWriteLock(); //读写锁
    private String id;

    public RedisMybatisCache(String id) {
        if(id==null){
            throw new IllegalArgumentException("Cache instance requires an ID");
        }
        LoggerUtils.debug(getClass(),"create an cache instance with id"+id);
        this.id=id;
    }

    @Override
    public String getId() {
        return this.id;
    }

    @Override
    public void putObject(Object key, Object value) {
        if (key == null ){
            return;
        }
        VCache.set(key, value);
        //将key保存到redis.list中
        VCache.setVByList(id,key);
    }

    @Override
    public Object getObject(Object key) {
        if (key == null ){
            return null;
        }
        //缓存穿透
        Object values = VCache.get(key);
        //算法：计算一定时间内没有命中的键，存起来   key->value
        if(values==null){
            return null;
        }
        return values;
    }

    @Override
    public Object removeObject(Object key) {
        if (key == null){
            return  null;
        }
        //删除缓存
        Long result = VCache.delByKey(key);
        //将key从redis.list中删除
        VCache.delKeyByList(id,1,key);
        return result;
    }

    /**
     * flushCache="true" 的时候会调用这个地方  mybatis默认不是select语句都会调用
     */
    @Override
    public void clear() {
        /**
         * 千万不要直接 redis.flushDb()，会把整个redis的东西都清除掉，我不相信你的redis里没有其他东西
         * 获取redis.list中的保存的key值，遍历删除
         */
        Long length = VCache.getLenByList(id);
        if (0==length){
            return;
        }
        List<Object> list = VCache.getVByList(id, 0, (int) (length - 1), Object.class);
        for (Object o : list) {
            VCache.delByKey(o);
        }
        list.clear();
    }

    @Override
    public int getSize() {
        return VCache.getLenByList(id).intValue();
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }
}
