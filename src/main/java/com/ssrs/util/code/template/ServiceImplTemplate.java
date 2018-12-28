package com.ssrs.util.code.template;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.util.CodeUtil;
import com.ssrs.util.code.util.GenerateUtil;
import com.ssrs.util.code.util.TemplateUtil;
import com.ssrs.util.commom.ToolUtil;
import org.springframework.stereotype.Service;

import java.nio.file.FileAlreadyExistsException;

/**
* @Description:    ServiceImplTemplate.java
* @Author:          ssrs
* @CreateDate:     2018/12/27 22:44
* @UpdateUser:     ssrs
* @UpdateDate:     2018/12/27 22:44
* @Version:        1.0
*/
public class ServiceImplTemplate {

    /**
     * 生成需要导入的包
     */
    private static void genImport(Generate generate) {
        String tableEntity = generate.getBasic().getTableEntity();
        CodeUtil.importLine(TemplateUtil.getPath(generate) + ".model." + tableEntity);
        CodeUtil.importLine(TemplateUtil.getPath(generate) + ".mapper." + tableEntity + "Mapper");
        CodeUtil.importLine(TemplateUtil.getPath(generate) + ".service.I" + tableEntity + "Service");
        CodeUtil.importLine(ServiceImpl.class);
        CodeUtil.importLine(Service.class);
    }

    /**
     * 生成类字段
     */
    private static void genClazzBody(Generate generate) {
        // 构建数据
        String var = ToolUtil.lowerFirst(generate.getBasic().getTableEntity());
        String obj = generate.getBasic().getTableEntity();
        String filePath = ServiceImplTemplate.class.getResource("").getPath()
                + ServiceImplTemplate.class.getSimpleName() + ".code";

        // 生成Class部分
        String clazzTarget = TemplateUtil.getTemplate(filePath, "Class");
        clazzTarget = clazzTarget.replace("#{var}", var);
        clazzTarget = clazzTarget.replace("#{obj}", obj);
        CodeUtil.append(clazzTarget).append(CodeUtil.lineBreak);
    }

    /**
     * 生成服务实现层模板
     */
    public static String generate(Generate generate) {
        CodeUtil.create();
        CodeUtil.setPackageName(TemplateUtil.getPackage(generate, "service.impl"));
        TemplateUtil.genAuthor(generate);
        ServiceImplTemplate.genImport(generate);
        ServiceImplTemplate.genClazzBody(generate);

        // 生成文件
        String filePath = GenerateUtil.getJavaFilePath(generate, "service.impl", "ServiceImpl");
        try {
            GenerateUtil.generateFile(filePath, CodeUtil.save());
        } catch (FileAlreadyExistsException e) {
            return GenerateUtil.fileExist(filePath);
        }
        return filePath;
    }
}
