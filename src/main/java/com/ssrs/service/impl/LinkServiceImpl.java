package com.ssrs.service.impl;

import com.ssrs.model.Link;
import com.ssrs.mapper.LinkMapper;
import com.ssrs.service.ILinkService;
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
@Service("linkService")
public class LinkServiceImpl extends ServiceImpl<LinkMapper, Link> implements ILinkService {

}
