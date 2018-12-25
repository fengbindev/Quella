package com.ssrs.util.code;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.ssrs.util.code.domain.Field;
import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.enums.FieldType;
import com.ssrs.util.code.util.CodeUtil;
import com.ssrs.util.code.util.GenerateUtil;
import com.ssrs.util.code.util.TemplateUtil;
import lombok.Data;

import java.io.Serializable;
import java.nio.file.FileAlreadyExistsException;
import java.util.Date;
import java.util.Map;


public class EntityTemplate {

    public String templateSuffix = "";

    /**
     * 生成类体
     */
    private static void genClazzBody(Generate generate){
//        CodeUtil.annoBr(Entity.class);
//        CodeUtil.append(CodeUtil.anno(Table.class)).append("(name=\"").append(Generate.getBasic().
//                getTablePrefix()).append(Generate.getBasic().getTableName()).append("\")").append(CodeUtil.lineBreak);
        CodeUtil.annoBr(Data.class);
        CodeUtil.append(CodeUtil.anno(TableName.class)).append("(\"").
                append(generate.getBasic().getTablePrefix()).append(generate.getBasic().getTableName()).append("\")").append(CodeUtil.lineBreak);
//        CodeUtil.append(CodeUtil.anno(EntityListeners.class)).append("(").
//                append(CodeUtil.clazz(AuditingEntityListener.class)).append(".class)").append(CodeUtil.lineBreak);
        CodeUtil.append("public class ").append(generate.getBasic().getTableEntity()).append(" implements ").
                append(CodeUtil.clazz(Serializable.class)).append(" {").append(CodeUtil.lineBreak);
        Map<Long, String> fieldType = CodeUtil.enumToMap(FieldType.class);
        for (Field field: generate.getFields()) {
            genField(field, fieldType);
        }
        CodeUtil.lineNo("}");
    }

    /**
     * 生成类字段
     * @param field 字段对象
     */
    private static void genField(Field field, Map<Long, String> fieldType){
        String type = fieldType.get((long) field.getType());
        switch (field.getName()){
            case "id":
                CodeUtil.importLine(IdType.class);
                CodeUtil.tabLineNo(1, CodeUtil.anno(TableId.class)+"(value = \"id\", type = IdType.AUTO)");
                CodeUtil.tabLineNo(1, "private " + type + " id;");
                break;
            case "createDate":
                CodeUtil.tabLineNo(1, "// " + field.getTitle());
                CodeUtil.tabLineNo(1, "private " + CodeUtil.clazz(Date.class) + " createDate;");
                break;
            case "updateDate":
                CodeUtil.tabLineNo(1, "// " + field.getTitle());
                CodeUtil.tabLineNo(1, "private " + CodeUtil.clazz(Date.class) + " updateDate;");
                break;
//            case "createBy":
//                CodeUtil.tabLineNo(1, "// " + field.getTitle());
//                CodeUtil.tabLineNo(1, CodeUtil.anno(CreatedBy.class));
//                CodeUtil.tabLineNo(1, CodeUtil.anno(ManyToOne.class)
//                        + "(fetch="+ CodeUtil.clazz(FetchType.class) +".LAZY)");
//                CodeUtil.tabLineNo(1, CodeUtil.anno(JoinColumn.class) + "(name=\"create_by\")");
//                CodeUtil.tabLineNo(1, CodeUtil.anno(JsonIgnore.class));
//                CodeUtil.tabLineNo(1, "private " + CodeUtil.clazz(User.class) + " createBy;");
//                break;
//            case "updateBy":
//                CodeUtil.tabLineNo(1, "// " + field.getTitle());
//                CodeUtil.tabLineNo(1, CodeUtil.anno(LastModifiedBy.class));
//                CodeUtil.tabLineNo(1, CodeUtil.anno(ManyToOne.class)
//                        + "(fetch="+ CodeUtil.clazz(FetchType.class) +".LAZY)");
//                CodeUtil.tabLineNo(1, CodeUtil.anno(JoinColumn.class) + "(name=\"update_by\")");
//                CodeUtil.tabLineNo(1, CodeUtil.anno(JsonIgnore.class));
//                CodeUtil.tabLineNo(1, "private " + CodeUtil.clazz(User.class) + " updateBy;");
//                break;
//            case "status":
//                CodeUtil.tabLineNo(1, "// " + field.getTitle());
//                CodeUtil.tabLineNo(1, "private Byte status = " + CodeUtil.clazz(StatusEnum.class) + ".OK.getCode();");
//                break;
            default:
//                if(type.equals(FieldType.Text.getMessage())){
//                    CodeUtil.tabLineNo(1, CodeUtil.anno(Lob.class) + " " + CodeUtil.anno(Column.class) + "(columnDefinition=\"TEXT\")");
//                }
                CodeUtil.tabLineNo(1, "// " + field.getTitle());
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
