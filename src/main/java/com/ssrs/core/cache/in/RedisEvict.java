package com.ssrs.core.cache.in;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
* @Description:    清除缓存注解
* @Author:          ssrs
* @CreateDate:     2018/11/26 17:45
* @UpdateUser:     ssrs
* @UpdateDate:     2018/11/26 17:45
* @Version:        1.0
*/
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface RedisEvict {
    String fieldKey(); //缓存key
}
