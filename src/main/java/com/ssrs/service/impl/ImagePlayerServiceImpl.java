package com.ssrs.service.impl;

import com.ssrs.model.ImagePlayer;
import com.ssrs.mapper.ImagePlayerMapper;
import com.ssrs.service.IImagePlayerService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-10-20
 */
@Service("imagePlayerService")
public class ImagePlayerServiceImpl extends ServiceImpl<ImagePlayerMapper, ImagePlayer> implements IImagePlayerService {

}
