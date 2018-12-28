package com.ssrs.util.code.template;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.util.CodeUtil;
import com.ssrs.util.code.util.GenerateUtil;
import com.ssrs.util.code.util.TemplateUtil;
import org.apache.ibatis.annotations.CacheNamespace;

import java.nio.file.FileAlreadyExistsException;

/**
* @Description:    RepositoryTemplate.java
* @Author:          ssrs
* @CreateDate:     2018/12/27 22:28
* @UpdateUser:     ssrs
* @UpdateDate:     2018/12/27 22:28
* @Version:        1.0
*/
public class RepositoryTemplate {

    /**
     * 生成需要导入的包
     */
    private static void genImport(Generate generate) {
        String tableEntity = generate.getBasic().getTableEntity();
        CodeUtil.importLine(TemplateUtil.getPath(generate) + ".model." + tableEntity);
        CodeUtil.importLine(BaseMapper.class);
        CodeUtil.importLine(CacheNamespace.class);
    }

    /**
     * 生成类字段
     */
    private static void genClazzBody(Generate generate) {
        // 构建数据
        String obj = generate.getBasic().getTableEntity();
        String filePath = RepositoryTemplate.class.getResource("").getPath()
                + RepositoryTemplate.class.getSimpleName() + ".code";

        // 生成Class部分
        String clazzTarget = TemplateUtil.getTemplate(filePath, "Class");
        clazzTarget = clazzTarget.replace("#{obj}", obj);
        CodeUtil.append(clazzTarget).append(CodeUtil.lineBreak);
    }

    /**
     * 生成Dao层模板
     */
    public static String generate(Generate generate) {
        CodeUtil.create();
        CodeUtil.setPackageName(TemplateUtil.getPackage(generate, "mapper"));
        TemplateUtil.genAuthor(generate);
        RepositoryTemplate.genImport(generate);
        RepositoryTemplate.genClazzBody(generate);

        // 生成文件
        String filePath = GenerateUtil.getJavaFilePath(generate, "mapper", "Mapper");
        try {
            GenerateUtil.generateFile(filePath, CodeUtil.save());
        } catch (FileAlreadyExistsException e) {
            return GenerateUtil.fileExist(filePath);
        }
        return filePath;
    }
}
