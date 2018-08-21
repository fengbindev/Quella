package com.ssrs.service;

import com.ssrs.model.Alidayu;
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
public interface IAlidayuService extends IService<Alidayu> {

    Map<String,Object> send(String phone, String code);
}
