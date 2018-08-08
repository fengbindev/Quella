package com.ssrs.core.shiro.session;

import java.io.Serializable;

/**
* @Description:    session状态
* @Author:         ssrs
* @CreateDate:     2018/8/6 11:13
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/6 11:13
* @Version:        1.0
*/
public class SessionStatus implements Serializable {
	private static final long serialVersionUID = 1L;

	//是否踢出 true:有效，false：踢出。
	private Boolean onlineStatus = Boolean.TRUE;

	
	public Boolean isOnlineStatus(){
		return onlineStatus;
	}

	public Boolean getOnlineStatus() {
		return onlineStatus;
	}
	public void setOnlineStatus(Boolean onlineStatus) {
		this.onlineStatus = onlineStatus;
	}
	
	
}
