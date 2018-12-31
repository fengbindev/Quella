package com.ssrs.util.code.template;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.util.GenerateUtil;
import com.ssrs.util.code.util.TemplateUtil;
import com.ssrs.util.commom.ToolUtil;
import org.apache.commons.collections.ListUtils;

import java.nio.file.FileAlreadyExistsException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author 小懒虫
 * @date 2018/10/25
 */
public class AddHtmlTemplate {

    /**
     * 生成页面
     */
    private static String genHtmlBody(Generate generate) {
        // 构建数据
        String var = ToolUtil.lowerFirst(generate.getBasic().getTableEntity());
        String title = ToolUtil.lowerFirst(generate.getBasic().getGenTitle());
        String filePath = AddHtmlTemplate.class.getResource("").getPath()
                + AddHtmlTemplate.class.getSimpleName() + ".code";

        // 提取html页面
        String htmlTarget = TemplateUtil.getTemplate(filePath, "html");

       //字段验证，对应FieldVerify枚举
        String[] required = {"","required","email","phone","number","required","url","identity"};
        // 遍历字段
        String fieldTarget = TemplateUtil.getTemplate(filePath, "field");
        StringBuilder fieldBuilder = new StringBuilder();
        generate.getFields().forEach(field -> {
            List<String> requiredList = new ArrayList<>();
                String temp = fieldTarget;
                temp = temp.replace("#{field.title}", field.getTitle());
                temp = temp.replace("#{field.name}", field.getName());
                List<Integer> verify = field.getVerify();
                verify.forEach(code -> {
                    requiredList.add(required[code]);
                });
                String join = ArrayUtil.join(requiredList.toArray(), "|");
                temp = temp.replace("#{required}",join);

            fieldBuilder.append(temp);
        });
        htmlTarget = htmlTarget.replace(fieldTarget, fieldBuilder);

        //提取 laydate
        String laydateTarget = TemplateUtil.getTemplate(filePath, "laydate");
        StringBuilder laydateBuilder = new StringBuilder();
        generate.getFields().forEach(field -> {
            //如过是Date类型
            if (field.getType() == 11){
                String temp = laydateTarget;
                temp = temp.replace("#{field.name}",field.getName()+"_hash");
                laydateBuilder.append(temp);
            }
        });
        htmlTarget = htmlTarget.replace(laydateTarget, laydateBuilder);

        // 替换基本数据
        htmlTarget = htmlTarget.replace("#{var}", var);
        htmlTarget = htmlTarget.replace("#{title}", title);
        return htmlTarget;
    }

    /**
     * 生成添加页面模板
     */
    public static String generate(Generate generate) {
        String filePath = GenerateUtil.getHtmlFilePath(generate, "add");
        String content = AddHtmlTemplate.genHtmlBody(generate);
        try {
            GenerateUtil.generateFile(filePath, content);
        } catch (FileAlreadyExistsException e) {
            return GenerateUtil.fileExist(filePath);
        }
        return filePath;
    }
}
