package com.ssrs.controller.qiniu;


import cc.openkit.kitMemory.qiniu.config.QiniuConfig;
import cc.openkit.kitMemory.qiniu.service.QIniuService;
import cn.hutool.core.collection.CollUtil;
import com.qiniu.storage.model.DefaultPutRet;
import com.ssrs.model.Alidayu;
import com.ssrs.model.FileQiniu;
import com.ssrs.service.IFileQiniuService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 七牛云配置 前端控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-08-23
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/fileQiniu")
public class FileQiniuController {

    @Autowired
    private IFileQiniuService fileQiniuService;
    @Autowired
    private ServletContext servletContext;

    /**
     * 跳转到首页
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("qiniu/index");
        FileQiniu fileQiniu = fileQiniuService.selectById(1);
        if (fileQiniu != null) {
            modelAndView.addObject("fileQiniu", fileQiniu);
        }
        return modelAndView;
    }

    /**
     * 修改七牛云存储配置
     *
     * @param fileQiniu
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(FileQiniu fileQiniu) {
        fileQiniu.setFqId(1);
        boolean b = fileQiniuService.updateById(fileQiniu);
        return b ? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE) : APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 七牛云文件上传测试接口
     *
     * @param file
     * @return
     */
    @RequestMapping(value = "fileQiniuUploadTest", method = RequestMethod.POST)
    @ResponseBody
    public Object fileQiniuUploadTest(MultipartFile file) {
        Map<Object, Object> map = CollUtil.newHashMap(16);
        FileQiniu fileQiniu = fileQiniuService.selectById(1);
        QiniuConfig config = new QiniuConfig(fileQiniu.getFqAccesskey(), fileQiniu.getFqSecretkey(), fileQiniu.getFqBucket());
        try {
            Map<String, Object> qiniumap = QIniuService.uploadByFileRecorder(config, file.getBytes(), fileQiniu.getFqZone());
            if ("200".equals(qiniumap.get("code"))) {
                DefaultPutRet putRet = (DefaultPutRet) qiniumap.get("putRet");
                map.put(APPUtil.RESULT_STATUS, APPUtil.RESULT_OK);
                map.put("src", putRet.hash);
            } else {
                map.put(APPUtil.RESULT_STATUS, APPUtil.RESULT_ERROR);
                map.put(APPUtil.RESULT_MESSAGE, "文件上传错误");
            }
        } catch (IOException e) {
            e.printStackTrace();
            LoggerUtils.fmtError(getClass(), "测试文件上传出错");
            map.put(APPUtil.RESULT_STATUS, APPUtil.RESULT_ERROR);
            map.put(APPUtil.RESULT_MESSAGE, "文件上传错误");
        }
        return map;
    }
}

