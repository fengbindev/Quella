package com.ssrs.core.shiro.filter;

import com.ssrs.core.shiro.cache.VCache;
import com.ssrs.core.shiro.session.ShiroSessionRepository;
import com.ssrs.core.shiro.token.manager.TokenManager;
import com.ssrs.util.commom.LoggerUtils;
import net.sf.json.JSONObject;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
* @Description:    相同账号登录控制
* @Author:         ssrs
* @CreateDate:     2018/8/7 16:26
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/7 16:26
* @Version:        1.0
*/
@SuppressWarnings({"unchecked","static-access"})
public class KickoutSessionFilter extends AccessControlFilter {
//	//静态注入
//	static String kickoutUrl;
	//在线用户
	final static String ONLINE_USER = KickoutSessionFilter.class.getCanonicalName()+ "_online_user";
	//踢出状态，true标示踢出
	final static String KICKOUT_STATUS = KickoutSessionFilter.class.getCanonicalName()+ "_kickout_status";
	static VCache cache;
	
	//session获取
	static ShiroSessionRepository shiroSessionRepository;
	
	
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
                                      ServletResponse response, Object mappedValue) throws Exception {
		
		HttpServletRequest httpRequest = ((HttpServletRequest)request);
		String url = httpRequest.getRequestURI();
		String basePath = httpRequest.getContextPath();//获取basePath
		if(null != url && url.startsWith(basePath)){
			url = url.replaceFirst(basePath, "");
		}
		Subject subject = getSubject(request, response);
		//如果是相关目录 or 如果没有登录 就直接return true
		if(url.startsWith("/open/") || (!subject.isAuthenticated() && !subject.isRemembered())){
			return Boolean.TRUE;
		}
		Session session = subject.getSession();
		Serializable sessionId = session.getId();
		/**
		 * 判断是否已经踢出
		 * 1.如果是Ajax 访问，那么给予json返回值提示。
		 * 2.如果是普通请求，直接跳转到登录页
		 */
		Boolean marker = (Boolean)session.getAttribute(KICKOUT_STATUS);
		if (null != marker && marker ) {
			Map<String, String> resultMap = new HashMap<String, String>();
			//判断是不是Ajax请求
			if (ShiroFilterUtils.isAjax(request) ) {
				LoggerUtils.debug(getClass(), "当前用户已经在其他地方登录，并且是Ajax请求！");
				resultMap.put("user_status", "300");
				resultMap.put("message", "您已经在其他地方登录，请重新登录！");
				out(response, resultMap);
			}
			return  Boolean.FALSE;
		}
		
		
		//从缓存获取用户-Session信息 <UserId,SessionId>
		LinkedHashMap<Long, Serializable> infoMap = cache.get(ONLINE_USER, LinkedHashMap.class);
		//如果不存在，创建一个新的
		infoMap = null == infoMap ? new LinkedHashMap<Long, Serializable>() : infoMap;
		
		//获取tokenId
		Long userId = TokenManager.getUserId();
		
		//如果已经包含当前Session，并且是同一个用户，跳过。
		if(infoMap.containsKey(userId) && infoMap.containsValue(sessionId)){
			//更新存储到缓存1个小时（这个时间最好和session的有效期一致或者大于session的有效期）
			cache.setex(ONLINE_USER, infoMap, 3600);
			return Boolean.TRUE;
		}
		//如果用户相同，Session不相同，那么就要处理了
		/**
		 * 如果用户Id相同,Session不相同
		 * 1.获取到原来的session，并且标记为踢出。
		 * 2.继续走
		 */
		if(infoMap.containsKey(userId) && !infoMap.containsValue(sessionId)){
			Serializable oldSessionId = infoMap.get(userId);
			Session oldSession = shiroSessionRepository.getSession(oldSessionId);
			if(null != oldSession){
				//标记session已经踢出
				oldSession.setAttribute(KICKOUT_STATUS, Boolean.TRUE);
				shiroSessionRepository.saveSession(oldSession);//更新session
				LoggerUtils.fmtDebug(getClass(), "kickout old session success,oldId[%s]",oldSessionId);
			}else{
				shiroSessionRepository.deleteSession(oldSessionId);
				infoMap.remove(userId);
				//存储到缓存1个小时（这个时间最好和session的有效期一致或者大于session的有效期）
				cache.setex(ONLINE_USER, infoMap, 3600);
			}
			return  Boolean.TRUE;
		}
		
		if(!infoMap.containsKey(userId) && !infoMap.containsValue(sessionId)){
			infoMap.put(userId, sessionId);
			//存储到缓存1个小时（这个时间最好和session的有效期一致或者大于session的有效期）
			cache.setex(ONLINE_USER, infoMap, 3600);
		}
		return Boolean.TRUE;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		
		//先退出
		Subject subject = getSubject(request, response);
		subject.logout();
		WebUtils.saveRequest(request);
		//再重定向
		WebUtils.issueRedirect(request, response,ShiroFilterUtils.KICKED_OUT);
		return false;
	}

	private void out(ServletResponse hresponse, Map<String, String> resultMap)
			throws IOException {
		try {
			hresponse.setCharacterEncoding("UTF-8");
			PrintWriter out = hresponse.getWriter();
			out.println(JSONObject.fromObject(resultMap).toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			LoggerUtils.error(getClass(), "KickoutSessionFilter.class 输出JSON异常，可以忽略。");
		}
	}

	public static void setShiroSessionRepository(
			ShiroSessionRepository shiroSessionRepository) {
		KickoutSessionFilter.shiroSessionRepository = shiroSessionRepository;
	}
//
//	public static String getKickoutUrl() {
//		return kickoutUrl;
//	}
//
//	public static void setKickoutUrl(String kickoutUrl) {
//		KickoutSessionFilter.kickoutUrl = kickoutUrl;
//	}


}
