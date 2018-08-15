package com.ssrs.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ssrs
 * @since 2018-08-15
 */
@Data
@TableName("ssrs_system_log")
public class SystemLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private String clientIp;
    private String uri;
    private String type;
    private String method;
    private String paramDara;
    private String sessionId;
    @JsonFormat(pattern = "HH:mm:ss",timezone="GMT+8")
    private Date time;
    @JsonFormat(pattern = "HH:mm:ss",timezone="GMT+8")
    private Date returnTime;
    private String returnData;
    private String httpStatusCode;
    private Integer timeConsuming;

}
