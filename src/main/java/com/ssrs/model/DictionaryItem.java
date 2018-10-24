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
 * 
 * </p>
 *
 * @author ssrs
 * @since 2018-10-24
 */
@Data
@TableName("ssrs_dictionary_item")
public class DictionaryItem implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 序号
     */
    private Integer sequence;
    /**
     * 描述
     */
    private String summary;
    /**
     * 字典内容
     */
    private String text;
    /**
     * 值
     */
    private String value;
    /**
     * 所属字典类型
     */
    private Integer typeId;

}
