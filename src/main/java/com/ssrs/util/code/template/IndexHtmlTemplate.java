package com.ssrs.util.code.template;

import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.util.GenerateUtil;
import com.ssrs.util.code.util.TemplateUtil;
import com.ssrs.util.commom.ToolUtil;

import java.nio.file.FileAlreadyExistsException;

/**
* @Description:    IndexHtmlTemplate.java
* @Author:          ssrs
* @CreateDate:     2018/12/29 22:06
* @UpdateUser:     ssrs
* @UpdateDate:     2018/12/29 22:06
* @Version:        1.0
*/
public class IndexHtmlTemplate {

    /**
     * 生成页面
     */
    private static String genHtmlBody(Generate generate) {
        // 构建数据
        String var = ToolUtil.lowerFirst(generate.getBasic().getTableEntity());
        String obj = generate.getBasic().getTableEntity();
        String title = generate.getBasic().getGenTitle();
        String filePath = IndexHtmlTemplate.class.getResource("").getPath()
                + IndexHtmlTemplate.class.getSimpleName() + ".code";

        // 提取html页面
        String htmlTarget = TemplateUtil.getTemplate(filePath, "html");

        // 添加模块入口
        if(!generate.getTemplate().isAdd()){
            String addTarget = TemplateUtil.getTemplate(filePath, "add");
            String editTarget = TemplateUtil.getTemplate(filePath, "edit");
            htmlTarget = htmlTarget.replace(addTarget, "");
            htmlTarget = htmlTarget.replace(editTarget, "");
        }

        // 编辑模块入口
        if(!generate.getTemplate().isDetail()){
            String detailTarget = TemplateUtil.getTemplate(filePath, "detail");
            htmlTarget = htmlTarget.replace(detailTarget, "");
        }

        // 拼接搜索模块
        String searchTarget = TemplateUtil.getTemplate(filePath, "search");
        StringBuilder searchBuilder = new StringBuilder();
        generate.getFields().forEach(field -> {
            if (field.getQuery() > 0) {
                String temp = searchTarget;
                temp = temp.replace("#{search.title}", field.getTitle());
                temp = temp.replace("#{search.name}", field.getName());
                searchBuilder.append(temp);
            }
        });
        htmlTarget = htmlTarget.replace(searchTarget, searchBuilder);

        // 拼接列表数据
        String thTarget = TemplateUtil.getTemplate(filePath, "th");
        String listTarget = TemplateUtil.getTemplate(filePath, "list");
        StringBuilder thBuilder = new StringBuilder();
        StringBuilder ListBuilder = new StringBuilder();
        generate.getFields().forEach(field -> {
            if(field.isShow()){
                // 表头标题信息
                thBuilder.append(thTarget.replace("#{table.th}", field.getTitle()));

                // 列表信息
                switch (field.getName()) {
                    case "status":
                        ListBuilder.append(listTarget.replace("#{table.list}", "th:text=\"${#dicts.dataStatus(item.status)}\">状态"));
                        break;
                    case "createDate":
                    case "updateDate":
                        ListBuilder.append(listTarget.replace("#{table.list}", "th:text=\"${#dates.format(item." +
                                field.getName() + ", 'yyyy-MM-dd HH:mm:ss')}\">" + field.getTitle()));
                        break;
                    default:
                        ListBuilder.append(listTarget.replace("#{table.list}" ,
                                "th:text=\"${item." + field.getName() + "}\">"+ field.getTitle()));
                }
            }

        });
        htmlTarget = htmlTarget.replace(thTarget, thBuilder);
        htmlTarget = htmlTarget.replace(listTarget, ListBuilder);

        // 替换基本数据
        htmlTarget = htmlTarget.replace("#{var}", var);
        htmlTarget = htmlTarget.replace("#{obj}", obj);
        htmlTarget = htmlTarget.replace("#{title}", title);
        return htmlTarget;
    }

    /**
     * 生成列表页面模板
     */
    public static String generate(Generate generate) {
        String filePath = GenerateUtil.getHtmlFilePath(generate, "index");
        String content = IndexHtmlTemplate.genHtmlBody(generate);
        try {
            GenerateUtil.generateFile(filePath, content);
        } catch (FileAlreadyExistsException e) {
            return GenerateUtil.fileExist(filePath);
        }
        return filePath;
    }
}
