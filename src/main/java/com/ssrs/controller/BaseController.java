package com.ssrs.controller;

import com.ssrs.util.commom.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.Map.Entry;

/**
* @Description:    抽取公共controller
* @Author:         ssrs
* @CreateDate:     2018/8/7 10:42
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/7 10:42
* @Version:        1.0
*/
public class BaseController {
	protected final static Logger logger = LoggerFactory.getLogger(BaseController.class);
	protected Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
	public static String URL404 =  "commom/404.ftl";

	/**
	 * 往Request里带值
	 * @param request
	 * @param key
	 * @param value
	 */
	protected static void setValue2Request(HttpServletRequest request, String key, Object value){
		request.setAttribute(key, value);
	}
	
	/**
	 * [获取session]
	 * @param request
	 * @return
	 */
	public static HttpSession getSession(HttpServletRequest request){
		return request.getSession();
	}

	public ModelAndView redirect(String redirectUrl, Map<String,Object>...parament){
		ModelAndView view = new ModelAndView(new RedirectView(redirectUrl));
		if(null != parament && parament.length > 0){
			view.addAllObjects(parament[0]);
		}
		return view;
	}
	public ModelAndView redirect404(){
		return new ModelAndView(new RedirectView(URL404));
	}
	

	private Map<String, Object> handleParams(Map<String, Object> params) {
		Map<String, Object> result = new HashMap<String, Object>(16);
		if (null != params) {
			Set<Entry<String, Object>> entrySet = params.entrySet();
			
			for (Iterator<Entry<String, Object>> it = entrySet.iterator(); it.hasNext(); ) {
				Entry<String, Object> entry = it.next();
				if (entry.getValue() != null) {
					result.put(entry.getKey(), StringUtils.trimToEmpty((String)entry.getValue()));
				}				
			}
		}
		return result;
	}
	
}
