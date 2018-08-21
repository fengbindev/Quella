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
 * @since 2018-08-21
 */
@TableName("ssrs_alidayu")
@Data
public class Alidayu implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 阿里大鱼AccessKeyId
     */
    private String keyId;
    /**
     * 阿里大鱼AccessKeySecret
     */
    private String keySecret;
    /**
     * 阿里大鱼短信签名
     */
    private String signName;
    /**
     * 阿里大鱼短信模板
     */
    private String template;
    /**
     * 使用通用验证码接口时验证码长度
     */
    private Integer signSize;


}
