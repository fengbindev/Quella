package com.ssrs.service.impl;

import com.ssrs.model.LinkGroup;
import com.ssrs.mapper.LinkGroupMapper;
import com.ssrs.service.ILinkGroupService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-10-23
 */
@Service("linkGroupService")
public class LinkGroupServiceImpl extends ServiceImpl<LinkGroupMapper, LinkGroup> implements ILinkGroupService {

}
