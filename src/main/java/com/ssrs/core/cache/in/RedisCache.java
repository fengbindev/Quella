package com.ssrs.core.cache.in;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
* @Description:    缓存注解
* @Author:          ssrs
* @CreateDate:     2018/11/26 16:48
* @UpdateUser:     ssrs
* @UpdateDate:     2018/11/26 16:48
* @Version:        1.0
*/
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface RedisCache {
    String fieldKey();//缓存key
    int expire() default 0;//过期时间，默认无限期
}
