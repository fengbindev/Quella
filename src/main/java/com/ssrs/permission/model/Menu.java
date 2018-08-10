package com.ssrs.permission.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author ssrs
 * @since 2018-08-08
 */
@Data
@TableName("ssrs_menu")
public class Menu implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 排序序号
     */
    private Integer sequence;
    /**
     * 菜单图标
     */
    private String icon;
    /**
     * 路径地址
     */
    private String title;
    private String url;
    /**
     * 上级id
     */
    private Integer parentId;
    /**
     * 权限id
     */
    @TableField(exist = false)
    private Permission permission;
    /**
     * 是否允许编辑 |  1:允许，2：不允许
     */
    private Integer systemMenu;

    @TableField(exist = false)
    private List<Menu> children = new ArrayList<>();
}
