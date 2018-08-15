package com.ssrs.service.impl;

import com.ssrs.model.SystemLog;
import com.ssrs.mapper.SystemLogMapper;
import com.ssrs.service.ISystemLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-15
 */
@Service("systemLogService")
public class SystemLogServiceImpl extends ServiceImpl<SystemLogMapper, SystemLog> implements ISystemLogService {

}
