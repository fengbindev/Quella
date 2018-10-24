package com.ssrs.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 字典类型表
 * </p>
 *
 * @author ssrs
 * @since 2018-10-24
 */
@Data
@TableName("ssrs_dictionary_type")
public class DictionaryType implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 编码
     */
    private String code;
    /**
     * 字典类型名称
     */
    private String name;


}
