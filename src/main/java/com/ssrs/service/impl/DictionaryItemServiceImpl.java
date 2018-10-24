package com.ssrs.service.impl;

import com.ssrs.model.DictionaryItem;
import com.ssrs.mapper.DictionaryItemMapper;
import com.ssrs.service.IDictionaryItemService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-10-24
 */
@Service("dictionaryItemService")
public class DictionaryItemServiceImpl extends ServiceImpl<DictionaryItemMapper, DictionaryItem> implements IDictionaryItemService {

}
