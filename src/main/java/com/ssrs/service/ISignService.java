package com.ssrs.service;

import com.ssrs.model.Sign;
import com.baomidou.mybatisplus.service.IService;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-21
 */
public interface ISignService extends IService<Sign> {

    Map<String,Object> isOk(String phone);
    Map<String, Object> isSignOk(String phone,String kst,String code);
}
