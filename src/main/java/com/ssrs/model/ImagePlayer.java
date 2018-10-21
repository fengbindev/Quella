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
 * @since 2018-10-20
 */
@Data
@TableName("ssrs_image_player")
public class ImagePlayer implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 播放器名称
     */
    private String name;
    /**
     * 播放器宽度
     */
    private Integer width;
    /**
     * 播放器高度
     */
    private Integer height;
    /**
     * 播放器类型
     */
    private Integer swiperType;
    /**
     * 播放器显示最大条数
     */
    private Integer displayCount;
    /**
     * 是否反序
     */
    private String displayDesc;

}
