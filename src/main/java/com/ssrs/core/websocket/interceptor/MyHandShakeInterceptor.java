package com.ssrs.core.websocket.interceptor;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Map;

import com.ssrs.util.commom.LoggerUtils;
import org.apache.log4j.Logger;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

/**
* @Description:    实现获取上传的参数，然后设置到socke 的session中
* @Author:          ssrs
* @CreateDate:     2018/10/25 16:33
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/25 16:33
* @Version:        1.0
*/
public class MyHandShakeInterceptor implements HandshakeInterceptor{
	
	public void afterHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		
	}

	public boolean beforeHandshake(ServerHttpRequest request,
			ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		try {
			if (request instanceof ServletServerHttpRequest) {
				ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
				String uid = servletRequest.getServletRequest().getParameter("uid");
				LoggerUtils.debug(getClass(),"servlet request uid is :" + uid);
				if (uid != null) {
					attributes.put("uid", uid);
				} else {
					return false;
				}
			}
			LoggerUtils.debug(getClass(),"websocket handshake success");
			return true;
		} catch (Exception e) {
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			LoggerUtils.error(getClass(),sw.toString());
			LoggerUtils.error(getClass(),"websocket 的handshake出现异常");
			return false;
		}
	}

}
