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
 * 项目配置表，有且仅有一条数据，不要删除
 * </p>
 *
 * @author ssrs
 * @since 2018-12-01
 */
@Data
@TableName("ssrs_web_setting")
public class WebSetting implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 网站名称
     */
    private String webName;
    /**
     * 验证码位数
     */
    private Integer sigeSize;
    /**
     * 验证码有效时间（单位分钟）
     */
    private Integer signActiveTime;
    /**
     * 网站底部信息
     */
    private String fotterInfo;

}
