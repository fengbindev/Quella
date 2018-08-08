package com.ssrs.core.shiro.token;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
* @Description:    自定义的token
* @Author:         ssrs
* @CreateDate:     2018/8/6 13:36
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/6 13:36
* @Version:        1.0
*/
public class ShiroToken extends UsernamePasswordToken implements java.io.Serializable{
	
	private static final long serialVersionUID = -6451794657814516274L;

	public ShiroToken(String username, String pswd) {
		super(username,pswd);
		this.pswd = pswd ;
	}
	
	
	/** 登录密码[字符串类型] 因为父类是char[] ] **/
	private String pswd ;

	public String getPswd() {
		return pswd;
	}


	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	
	
	
	
	
}
