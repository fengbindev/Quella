package com.ssrs.util.code.template;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ssrs.util.code.domain.Field;
import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.enums.FieldType;
import com.ssrs.util.code.util.CodeUtil;
import com.ssrs.util.code.util.GenerateUtil;
import com.ssrs.util.code.util.TemplateUtil;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.nio.file.FileAlreadyExistsException;
import java.util.Date;
import java.util.Map;


public class EntityTemplate {

    public String templateSuffix = "";

    /**
     * 生成类体
     */
    private static void genClazzBody(Generate generate) {
        CodeUtil.annoBr(Data.class);
        CodeUtil.append(CodeUtil.anno(TableName.class)).append("(\"").
                append(generate.getBasic().getTablePrefix()).append(generate.getBasic().getTableName()).append("\")").append(CodeUtil.lineBreak);
        CodeUtil.append("public class ").append(generate.getBasic().getTableEntity()).append(" implements ").
                append(CodeUtil.clazz(Serializable.class)).append(" {").append(CodeUtil.lineBreak);
        Map<Long, String> fieldType = CodeUtil.enumToMap(FieldType.class);
        for (Field field : generate.getFields()) {
            genField(field, fieldType);
        }
        CodeUtil.lineNo("}");
    }

    /**
     * 生成类字段
     *
     * @param field 字段对象
     */
    private static void genField(Field field, Map<Long, String> fieldType) {
        String type = fieldType.get((long) field.getType());
        CodeUtil.tabLineNo(1, "// " + field.getTitle());
        switch (type) {
            case "Long":
                if ("id".equals(field.getName())) {
                    CodeUtil.importLine(IdType.class);
                    CodeUtil.tabLineNo(1, CodeUtil.anno(TableId.class) + "(value = \"id\", type = IdType.AUTO)");
                    CodeUtil.tabLineNo(1, "private " + type +" "+ field.getName()+";");
                }else {
                    CodeUtil.tabLineNo(1, "private " + type +" "+ field.getName()+";");
                }
                break;
            case "Date":
                CodeUtil.importLine(Date.class);
                CodeUtil.tabLineNo(1, CodeUtil.anno(DateTimeFormat.class) + "(pattern = \"yyyy-MM-dd HH:mm:ss\")");
                CodeUtil.tabLineNo(1, CodeUtil.anno(JsonFormat.class) + "(pattern = \"yyyy-MM-dd HH:mm:ss\",timezone=\"GMT+8\")");
                CodeUtil.tabLineNo(1, "private " + type + " " + field.getName()+";");
                break;
            case "Text":
                CodeUtil.tabLineNo(1, "private " + "String" + " " + field.getName()+";");
                break;
            case "Character":
                CodeUtil.tabLineNo(1, "private " + "String" + " " + field.getName()+";");
                break;
            default:
                CodeUtil.tabLine(1, "private " + type + " " + field.getName());
        }
    }

    /**
     * 生成实体类模板
     */
    public static String generate(Generate generate) {
        CodeUtil.create();
        CodeUtil.setPackageName(TemplateUtil.getPackage(generate, "model"));
        CodeUtil.addImportAll("javax.persistence");
        TemplateUtil.genAuthor(generate);
        EntityTemplate.genClazzBody(generate);

        // 生成文件
        String filePath = GenerateUtil.getJavaFilePath(generate, "model", "");
        try {
            GenerateUtil.generateFile(filePath, CodeUtil.save());
        } catch (FileAlreadyExistsException e) {
            return GenerateUtil.fileExist(filePath);
        }
        return filePath;
    }
}
