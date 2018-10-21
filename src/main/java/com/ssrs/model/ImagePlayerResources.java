package com.ssrs.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 图片播放器图片列表
 * </p>
 *
 * @author ssrs
 * @since 2018-10-20
 */
@Data
@TableName("ssrs_image_player_resources")
public class ImagePlayerResources implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 序号（数字越大越靠前，1-9999之间，默认是50）
     */
    private Integer sequence;
    /**
     * 图片地址
     */
    private String img;
    /**
     * 图片需要跳转的地址
     */
    private String url;
    /**
     * 发布时间
     */
    private Date time;
    /**
     * 开始时间
     */
    private Date startTime;
    /**
     * 结束时间
     */
    private Date endTime;
    /**
     * 是否关闭（关闭将不显示，1：显示，2：关闭）
     */
    private Integer type;
    /**
     * 标题
     */
    private String title;
    /**
     * 概述（1-100之间）
     */
    private String summary;

    /**
     * 所属图片播放器ID
     */
    private Integer imagePlayerId;
}
