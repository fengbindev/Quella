package com.ssrs.util.xss;

import cn.hutool.core.util.StrUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.util.stream.IntStream;

/**
 * Jsoup过滤http请求，防止Xss攻击
 *
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

	private HttpServletRequest orgRequest;

	private boolean isIncludeRichText;

	XssHttpServletRequestWrapper(HttpServletRequest request, boolean isIncludeRichText) {
		super(request);
		orgRequest = request;
		this.isIncludeRichText = isIncludeRichText;
	}

	/**
	 * 覆盖getParameter方法，将参数名和参数值都做xss过滤
	 * 如果需要获得原始的值，则通过super.getParameterValues(name)来获取
	 * getParameterNames,getParameterValues和getParameterMap也可能需要覆盖
	 */
	@Override
	public String getParameter(String name) {
//		if (("content".equals(name) || name.endsWith("WithHtml")) && !isIncludeRichText) {
//			return super.getParameter(name);
//		}
		name = JsoupUtil.clean(name);
		String value = super.getParameter(name);
		if (StrUtil.isNotBlank(value)) {
			value = JsoupUtil.clean(value);
		}
		return value;
	}

	@Override
	public String[] getParameterValues(String name) {
		String[] arr = super.getParameterValues(name);
		if (arr != null) {
			IntStream.range(0, arr.length).forEach(i -> arr[i] = JsoupUtil.clean(arr[i]));
		}
		return arr;
	}

	/**
	 * 覆盖getHeader方法，将参数名和参数值都做xss过滤
	 * 如果需要获得原始的值，则通过super.getHeaders(name)来获取
	 * getHeaderNames 也可能需要覆盖
	 */
	@Override
	public String getHeader(String name) {
		name = JsoupUtil.clean(name);
		String value = super.getHeader(name);
		if (StrUtil.isNotBlank(value)) {
			value = JsoupUtil.clean(value);
		}
		return value;
	}

	/**
	 * 获取原始的request
	 */
	private HttpServletRequest getOrgRequest() {
		return orgRequest;
	}

	/**
	 * 获取原始的request的静态方法
	 */
	public static HttpServletRequest getOrgRequest(HttpServletRequest req) {
		if (req instanceof XssHttpServletRequestWrapper) {
			return ((XssHttpServletRequestWrapper) req).getOrgRequest();
		}
		return req;
	}

}
