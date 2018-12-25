package com.ssrs.util.code.domain;

import lombok.Data;


@Data
public class Basic {
    private String projectPath;
    private String packagePath;
    private String author;
    private String genTitle;
    private String genModule;
    private Long genPMenu;
    private String tablePrefix;
    private String tableName;
    private String tableEntity;
}
