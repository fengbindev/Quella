package com.ssrs.model;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *  定时任务 mode
 * </p>
 *
 * @author ssrs2
 * @since 2018-12-03
 */
@Data
@TableName("ssrs_timetask")
public class Timetask implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 递增主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 任务名
     */
    private String name;
    /**
     * 任务组
     */
    private String groupName;
    /**
     * 开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date startTime;
    /**
     * 结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date endTime;
    /**
     * cron表达式
     */
    private String cron;
    /**
     * 发布状态
     */
    private String jobStatus;
    /**
     * 计划状态
     */
    private String planStatus;
    /**
     * 运行状态
     */
    private Integer isConcurrent;
    /**
     * 参数
     */
    private String jobData;
    /**
     * 方法
     */
    private String methodName;
    /**
     * 实例bean
     */
    private String beanName;
    /**
     * 任务描述
     */
    private String description;
    /**
     * 创建者id
     */
    private Long createUserId;
    /**
     * 创建时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    /**
     * 修改者id
     */
    private Long modifyUserId;
    /**
     * 修改时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date modifyTime;

}
