package com.ssrs.core.cache.utils;

import com.ssrs.core.shiro.cache.JedisManager;
import com.ssrs.util.commom.SerializeUtil;
import com.ssrs.util.commom.SpringContextUtil;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
* @Description:    注解缓存的Redis帮助类，与JedisManager、VCache 没有区别，只是key都不进行序列化
* @Author:          ssrs
* @CreateDate:     2018/8/7 16:33
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/7 16:33
* @Version:        1.0
*/
@SuppressWarnings("unchecked")
public class HCache {
	/**
	 * 不对key进行序列化是因为序列化后redis放回的String类型的key前面有一串乱码。
	 */
	final static JedisManager J = SpringContextUtil.getBean("jedisManager", JedisManager.class);
	final static int dbIndex = 2; //redis DB 索引
	final static String chartSet = "UTF-8"; //字符编码
	final static int scanCount = 100;//redis.scan的count大小，看数据调节大小
	private HCache() {}
	
	/**
	 * 简单的set但是不key不序列化,主要是给自定义的直接缓存使用。
	 * 因为使用scan的返回值是一个String,反序列化过来前面有一段乱码，解决方法就是key不序列化
	 * @param key
	 * @param value
	 */
	public static void setNoSerialize(String key ,Object value){
		Jedis jds = null;
		boolean isBroken = false;
		try {
			jds = J.getJedis();
			jds.select(dbIndex);
			byte[] skey = key.getBytes(chartSet);
			byte[] svalue = SerializeUtil.serialize(value);
			jds.set(skey, svalue);
		} catch (Exception e) {
			isBroken = true;
			e.printStackTrace();
		} finally {
			returnResource(jds, isBroken);
		}
	}

    /**
     * 过期时间的
	 * @param key
     * @param value
     * @param timer
	 */
	public static void setNoSerializeEX(String key, Object value, int timer) {
		Jedis jds = null;
		boolean isBroken = false;
		try {
			jds = J.getJedis();
			jds.select(dbIndex);
			byte[] skey = key.getBytes(chartSet);
			byte[] svalue = SerializeUtil.serialize(value);
			jds.setex(skey, timer, svalue);
		} catch (Exception e) {
			isBroken = true;
			e.printStackTrace();
		} finally {
			returnResource(jds, isBroken);
		}
	}
	/**
	 * 与上面的set对应
	 * @param key
	 * @return
	 */
	public static Long delByKeyNoSerialize(String key){
		Jedis jds = null;
		boolean isBroken = false;
		try {
			jds = J.getJedis();
			jds.select(dbIndex);
			Long result = jds.del(key);
			return result;
		} catch (Exception e) {
			isBroken = true;
			e.printStackTrace();
		} finally {
			returnResource(jds, isBroken);
		}
		return new Long(dbIndex);
	}

	/**
	 * 简单的Get
	 * @param <T>
	 * @param key
	 * @param requiredType
	 * @return
	 */
	public static <T> T getNoSerialize(String key , Class<T>...requiredType){
		Jedis jds = null;
		boolean isBroken = false;
		try {
			jds = J.getJedis();
			jds.select(dbIndex);
			byte[] skey = key.getBytes(chartSet);
			return SerializeUtil.deserialize(jds.get(skey),requiredType);
		} catch (Exception e) {
			isBroken = true;
			e.printStackTrace();
		} finally {
			returnResource(jds, isBroken);
		}
		return null;
	}

	/**
	 * 判断是否存在，不序列化key
	 * @param key
	 * @return
	 */
	public static boolean existsNoSerialize(String key){
		Jedis jds = null;
		boolean isBroken = false;
		try {
			jds = J.getJedis();
			jds.select(dbIndex);
			byte[] lkey = key.getBytes(chartSet);
			return jds.exists(lkey);
		} catch (Exception e) {
			isBroken = true;
			e.printStackTrace();
		} finally {
			returnResource(jds, isBroken);
		}
		return false;
	}

	/**
	 *因为redis.keys()的时间复杂度为O(n) 在大数据查询的下发生线程阻塞，所以用scan来代替
	 * 具体说明：http://blog.ssrsdev.top/index.php/archives/103/
	 * @param keys
	 * @return
	 */
	public static Set<String> keys(String keys) {
		Jedis jds = null;
		boolean isBroken = false;
		try {
			jds = J.getJedis();
			jds.select(dbIndex);
			ScanParams scanParams = new ScanParams();
			scanParams.match(keys.getBytes(chartSet));
			scanParams.count(scanCount);
			ScanResult<String> scan = jds.scan("0", scanParams);
			Set<String> set = new HashSet(scanCount);
			List<String> result1 = scan.getResult();
			set.addAll(result1);
			String stringCursor = scan.getStringCursor();
			while (!"0".equals(stringCursor)){
				scan = jds.scan(stringCursor, scanParams);
				stringCursor = scan.getStringCursor();
				List<String> result = scan.getResult();
				set.addAll(result);
			}
			return set;
		} catch (Exception e) {
			isBroken = true;
			e.printStackTrace();
		} finally {
			returnResource(jds, isBroken);
		}
		return null;
	}


	/**
	 * 释放
	 * @param jedis
	 * @param isBroken
	 */
	public static void returnResource(Jedis jedis, boolean isBroken) {
        if (jedis == null)
            return;
//        if (isBroken)
//            J.getJedisPool().returnBrokenResource(jedis);
//        else
//        	J.getJedisPool().returnResource(jedis);
//        版本问题
        jedis.close();
	 }



}
