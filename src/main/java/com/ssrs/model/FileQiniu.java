package com.ssrs.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 七牛云配置
 * </p>
 *
 * @author ssrs
 * @since 2018-08-23
 */
@Data
@TableName("ssrs_file_qiniu")
public class FileQiniu implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "fq_id", type = IdType.AUTO)
    private Integer fqId;
    @TableField("fq_accessKey")
    private String fqAccesskey;
    @TableField("fq_secretKey")
    private String fqSecretkey;
    /**
     * 创建的空间名字
     */
    private String fqBucket;
    /**
     * 这个表示七牛给你的调用地址
     */
    private String fqUrl;
    /**
     * 机房信息
     */
    private String fqZone;


}
