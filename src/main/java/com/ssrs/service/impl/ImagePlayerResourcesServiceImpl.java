package com.ssrs.service.impl;

import com.ssrs.model.ImagePlayerResources;
import com.ssrs.mapper.ImagePlayerResourcesMapper;
import com.ssrs.service.IImagePlayerResourcesService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 图片播放器图片列表 服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-10-20
 */
@Service("imagePlayerResourcesService")
public class ImagePlayerResourcesServiceImpl extends ServiceImpl<ImagePlayerResourcesMapper, ImagePlayerResources> implements IImagePlayerResourcesService {

}
