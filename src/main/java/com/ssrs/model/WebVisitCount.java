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
 * 站点统计表
 * </p>
 *
 * @author ssrs
 * @since 2018-10-12
 */
@Data
@TableName("ssrs_web_visit_count")
public class WebVisitCount implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 每日ip数
     */
    private Integer ipCount;
    /**
     * 每日pv数
     */
    private Integer pvCount;
    private Date createTime;

}
