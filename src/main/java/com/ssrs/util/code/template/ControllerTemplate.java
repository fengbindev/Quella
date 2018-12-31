package com.ssrs.util.code.template;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.enums.FieldQuery;
import com.ssrs.util.code.util.CodeUtil;
import com.ssrs.util.code.util.GenerateUtil;
import com.ssrs.util.code.util.TemplateUtil;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.StringUtils;
import com.ssrs.util.commom.ToolUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;

import java.nio.file.FileAlreadyExistsException;
import java.util.List;

/**
 * @author 小懒虫
 * @date 2018/10/24
 */
public class ControllerTemplate {

    /**
     * 生成需要导入的包
     */
    private static void genImport(Generate generate) {
        String tableEntity = generate.getBasic().getTableEntity();
        CodeUtil.importLine(Page.class);
        CodeUtil.importLine(PageManager.class);
        CodeUtil.importLine(EntityWrapper.class);
        CodeUtil.importLine(APPUtil.class);
        CodeUtil.importLine(StringUtils.class);
        CodeUtil.importLine(Autowired.class);
        CodeUtil.importLine(Controller.class);
        CodeUtil.importLine(Model.class);

        CodeUtil.importLine(TemplateUtil.getPath(generate) + ".model." + tableEntity);
        CodeUtil.importLine(TemplateUtil.getPath(generate) + ".service.I" + tableEntity + "Service");
        CodeUtil.importLine("org.springframework.web.bind.annotation.*");
        CodeUtil.importLine(List.class);
    }

    /**
     * 生成类体
     */
    private static void getClazzBody(Generate generate) {
        // 构建数据
        String var = ToolUtil.lowerFirst(generate.getBasic().getTableEntity());
        String obj = generate.getBasic().getTableEntity();
        String title = generate.getBasic().getGenTitle();
        String module = generate.getBasic().getGenModule();
        String filePath = ControllerTemplate.class.getResource("").getPath()
                + ControllerTemplate.class.getSimpleName() + ".code";

        // 生成Class前部分
        String clazzTarget = TemplateUtil.getTemplate(filePath, "Class");
        clazzTarget = clazzTarget.replace("#{var}", var);
        clazzTarget = clazzTarget.replace("#{obj}", obj);
        clazzTarget = clazzTarget.replace("#{title}", title);
        CodeUtil.append(clazzTarget).append(CodeUtil.lineBreak);

        // 生成page方法
            String pageTarget = TemplateUtil.getTemplate(filePath, "Page");
            pageTarget = pageTarget.replace("#{var}", var);
            pageTarget = pageTarget.replace("#{obj}", obj);
            // 生成模糊查询字段
            StringBuilder sb = new StringBuilder();
            generate.getFields().forEach(field -> {
                if(field.getQuery() == FieldQuery.Like.getCode()){
                    sb.append(",String ").append(field.getName());
                }
            });
            if (StringUtils.isBlank(sb.toString())){
                pageTarget = pageTarget.replace("#{search}","");
            }else {
                pageTarget = pageTarget.replace("#{search}",sb.toString());
            }
            StringBuilder matcher = new StringBuilder();
            StringBuilder like = new StringBuilder();
            generate.getFields().forEach(field -> {
                if(field.getQuery() == FieldQuery.Like.getCode()){
                    String fieldName = field.getName();
                    matcher.append("boolean is").append(fieldName).append(" = false;").append(CodeUtil.lineBreak);
                    matcher.append("\t\tif (StringUtils.isNotBlank(").append(fieldName).append(")){").append(CodeUtil.lineBreak);
                    matcher.append("\t\t\tis").append(fieldName).append(" = true;").append(CodeUtil.lineBreak);
                    matcher.append("\t\t}").append(CodeUtil.lineBreak);
                    like.append("\t\t\t\t.like(is").append(fieldName).append(",\"").append(StrUtil.toUnderlineCase(fieldName))
                            .append("\",").append(fieldName).append(")").append(CodeUtil.lineBreak);
                }
            });

            pageTarget = pageTarget.replace("#{matcher}", matcher);
            pageTarget = pageTarget.replace("#{like}", like);
            CodeUtil.append(pageTarget).append(CodeUtil.lineBreak);

        // 结束类
        CodeUtil.lineNo("}");
    }

    /**
     * 生成控制器模板
     */
    public static String generate(Generate generate) {
        CodeUtil.create();
        CodeUtil.setPackageName(TemplateUtil.getPackage(generate, "controller."+ToolUtil.lowerFirst(generate.getBasic().getTableEntity())));
        CodeUtil.addImportAll("org.springframework.web.bind.annotation");
        TemplateUtil.genAuthor(generate);
        ControllerTemplate.genImport(generate);
        ControllerTemplate.getClazzBody(generate);

        // 生成文件
        String filePath = GenerateUtil.getJavaFilePath(generate, "controller."+ToolUtil.lowerFirst(generate.getBasic().getTableEntity()), "Controller");
        try {
            GenerateUtil.generateFile(filePath, CodeUtil.save());
        } catch (FileAlreadyExistsException e) {
            return GenerateUtil.fileExist(filePath);
        }
        return filePath;
    }

}
