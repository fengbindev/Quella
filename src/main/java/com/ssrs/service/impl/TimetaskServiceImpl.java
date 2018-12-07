package com.ssrs.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.mapper.TimetaskMapper;
import com.ssrs.model.Timetask;
import com.ssrs.service.ITimetaskService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs2
 * @since 2018-12-03
 */
@Service("timetaskService")
public class TimetaskServiceImpl extends ServiceImpl<TimetaskMapper, Timetask> implements ITimetaskService {

}
