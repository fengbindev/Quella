package com.ssrs.service.impl;

import com.ssrs.model.DictionaryType;
import com.ssrs.mapper.DictionaryTypeMapper;
import com.ssrs.service.IDictionaryTypeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 字典类型表 服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-10-24
 */
@Service("dictionaryTypeService")
public class DictionaryTypeServiceImpl extends ServiceImpl<DictionaryTypeMapper, DictionaryType> implements IDictionaryTypeService {

}
