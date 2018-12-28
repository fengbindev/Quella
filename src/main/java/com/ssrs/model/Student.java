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
 * @author 上善若水
 * @date 2018/12/28
 */
@Data
@TableName("ssrs_student")
public class Student implements Serializable {
	// 主键ID
	@TableId(value = "id", type = IdType.AUTO)
	private Long id;
	// 标题
	private String title;
	// 备注
	private String remark;
	// 创建时间
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date createDate;
	// 更新时间
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date updateDate;
	// 创建者
	private Long createBy;
	// 更新者
	private Long updateBy;
	// 数据状态
	private Byte status;
}
