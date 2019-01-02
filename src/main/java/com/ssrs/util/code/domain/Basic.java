package com.ssrs.util.code.domain;

import lombok.Data;


@Data
public class Basic {
    /**
     * 本地代码地址
     */
    private String projectPath;
    /**
     * 基本包名：com.ssrs
     */
    private String packagePath;
    /**
     * 作者
     */
    private String author;
    /**
     * 业务名称
     */
    private String genTitle;
    /**
     * 模块名称
     */
    private String genModule;
    /**
     * 所属的父菜单ID
     */
    private Long genPMenu;
    /**
     * 表前缀
     */
    private String tablePrefix;
    /**
     * 表名
     */
    private String tableName;
    /**
     * 实体类名
     */
    private String tableEntity;
    /**
     * 数据表的ddl
     */
    private String ddl;
}
