package com.ssrs.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ssrs
 * @since 2018-08-21
 */
@TableName("ssrs_sign")
public class Sign implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识
     */
    @TableId(value = "sign_id", type = IdType.INPUT)
    private String signId;
    /**
     * 手机号码
     */
    private String signPhone;
    /**
     * MD5( 验证码+盐）
     */
    private String signCode;
    /**
     * 发送时间
     */
    private Date signTime;
    /**
     * 状态（1：未使用，2：已经使用）
     */
    private Integer signType;


    public String getSignId() {
        return signId;
    }

    public void setSignId(String signId) {
        this.signId = signId;
    }

    public String getSignPhone() {
        return signPhone;
    }

    public void setSignPhone(String signPhone) {
        this.signPhone = signPhone;
    }

    public String getSignCode() {
        return signCode;
    }

    public void setSignCode(String signCode) {
        this.signCode = signCode;
    }

    public Date getSignTime() {
        return signTime;
    }

    public void setSignTime(Date signTime) {
        this.signTime = signTime;
    }

    public Integer getSignType() {
        return signType;
    }

    public void setSignType(Integer signType) {
        this.signType = signType;
    }

    @Override
    public String toString() {
        return "Sign{" +
        ", signId=" + signId +
        ", signPhone=" + signPhone +
        ", signCode=" + signCode +
        ", signTime=" + signTime +
        ", signType=" + signType +
        "}";
    }
}
