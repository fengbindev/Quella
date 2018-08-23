package com.ssrs.service.impl;

import com.ssrs.model.FileQiniu;
import com.ssrs.mapper.FileQiniuMapper;
import com.ssrs.service.IFileQiniuService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 七牛云配置 服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-23
 */
@Service("fileQiniuService")
public class FileQiniuServiceImpl extends ServiceImpl<FileQiniuMapper, FileQiniu> implements IFileQiniuService {

}
