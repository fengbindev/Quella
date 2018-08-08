package com.ssrs.core.freemarker.extend;

import com.ssrs.core.freemarker.Constant;
import com.ssrs.core.shiro.token.manager.TokenManager;
import com.ssrs.permission.model.User;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

public class FreeMarkerViewExtend extends FreeMarkerView {
	
	protected void exposeHelpers(Map<String, Object> model, HttpServletRequest request){
		
		try {
			super.exposeHelpers(model, request);
		} catch (Exception e) {
			LoggerUtils.fmtError(FreeMarkerViewExtend.class,e, "FreeMarkerViewExtend 加载父类出现异常。请检查。");
		}
		model.put(Constant.CONTEXT_PATH, request.getContextPath());
//		model.putAll(Ferrmarker.initMap);
		User token = TokenManager.getToken();
		//String ip = IPUtils.getIP(request);
		if(TokenManager.isLogin()){
			model.put("token", token);//登录的token
		}
		
		model.put("_time", new Date().getTime());
		model.put("NOW_YEAY", Constant.NOW_YEAY);//今年
		
		model.put("_v", Constant.VERSION);//版本号，重启的时间
//		model.put("cdn", Constant.DOMAIN_CDN);//CDN域名
		model.put("basePath", request.getContextPath());//base目录。
		
	}
}
