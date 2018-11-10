package com.ssrs.controller.file;

import cc.openkit.kitMemory.qiniu.config.QiniuConfig;
import cc.openkit.kitMemory.qiniu.service.QIniuService;
import cn.hutool.core.collection.CollUtil;
import com.qiniu.storage.model.DefaultPutRet;
import com.ssrs.model.FileQiniu;
import com.ssrs.service.IFileQiniuService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

/**
 * @Description: 文件上传控制器
 * @Author: ssrs
 * @CreateDate: 2018/8/24 9:09
 * @UpdateUser: ssrs
 * @UpdateDate: 2018/8/24 9:09
 * @Version: 1.0
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/file")
public class FileController {
    @Autowired
    private IFileQiniuService fileQiniuService;

    /**
     * 通用七牛云单文件上传
     *
     * @param file
     * @return
     */
    @RequestMapping(value = "commonUploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Object commonUploadFile(MultipartFile file) {
        FileQiniu fileQiniu = fileQiniuService.selectById(1);
        Map<Object, Object> map = CollUtil.newHashMap(16);
        try {
            String hash = upload(file);
            map.put(APPUtil.RESULT_STATUS, APPUtil.RESULT_OK);
            map.put("src", fileQiniu.getFqUrl()+"/"+hash);
        } catch (IOException e) {
            e.printStackTrace();
            LoggerUtils.fmtError(getClass(), "文件上传出错");
            map.put(APPUtil.RESULT_STATUS, APPUtil.RESULT_ERROR);
            map.put(APPUtil.RESULT_MESSAGE, "文件上传错误");
            return map;
        }
        return map;
    }

    /**
     * 通用七牛云多文件上传
     *
     * @param files
     */
    @RequestMapping(value = "commonUploadFiles", method = RequestMethod.POST)
    @ResponseBody
    public Object commonUploadFiles(MultipartFile[] files) {
        Map<Object, Object> map = CollUtil.newHashMap(16);
        FileQiniu fileQiniu = fileQiniuService.selectById(1);
        String[] strings = new String[files.length];
        for (int i = 0; i < files.length; i++) {
            try {
                String hash = upload(files[i]);
                strings[i] = fileQiniu.getFqUrl()+"/"+hash;
            } catch (IOException e) {
                e.printStackTrace();
                LoggerUtils.fmtError(getClass(), "文件上传出错");
                map.put(APPUtil.RESULT_STATUS, APPUtil.RESULT_ERROR);
                map.put(APPUtil.RESULT_MESSAGE, "文件上传错误");
                return map;
            }
        }
        map.put(APPUtil.RESULT_STATUS, APPUtil.RESULT_OK);
        map.put("data", strings);
        return map;
    }

    /**
     * 用于wangEditor的图片上传
     * @param file
     * @return
     */
    @RequestMapping(value = "wangEditorUploadImg")
    @ResponseBody
    public Object wangEditorUploadImg(@RequestParam("file") MultipartFile[] file){
        Map<Object, Object> map = CollUtil.newHashMap(16);
        String[] strings = new String[file.length];
        FileQiniu fileQiniu = fileQiniuService.selectById(1);
        for (int i = 0; i < file.length; i++) {
            try {
                String hash = upload(file[i]);
                strings[i] = fileQiniu.getFqUrl()+"/"+hash;
            } catch (IOException e) {
                e.printStackTrace();
                LoggerUtils.fmtError(getClass(), "文件上传出错");
                map.put("errno", 1);
                return map;
            }
        }
        map.put("errno", 0);
        map.put("data", strings);
        return map;
    }

    /**
     * 返回上传成功文件的七牛云hash值
     *
     * @param file
     * @return
     * @throws IOException
     */
    public String upload(MultipartFile file) throws IOException {
        FileQiniu fileQiniu = fileQiniuService.selectById(1);
        QiniuConfig config = new QiniuConfig(fileQiniu.getFqAccesskey(), fileQiniu.getFqSecretkey(), fileQiniu.getFqBucket());
        Map<String, Object> qiniumap = QIniuService.uploadByFileRecorder(config, file.getBytes(), fileQiniu.getFqZone());
        DefaultPutRet putRet = (DefaultPutRet) qiniumap.get("putRet");
        if (!"200".equals(qiniumap.get("code"))) {
            return null;
        }
        return putRet.hash;
    }
}