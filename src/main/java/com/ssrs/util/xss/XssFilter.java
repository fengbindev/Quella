package com.ssrs.util.xss;

import cn.hutool.core.util.StrUtil;
import org.apache.commons.lang.BooleanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Xss攻击拦截器
 *
 */
@WebFilter(filterName="xssMyfilter",
			urlPatterns="/*",
			initParams = {
							@WebInitParam(name = "isIncludeRichText" , value = "false"),
							@WebInitParam(name = "excludes" ,value = "/favicon.ico,/images/*,/js/*,/css/*,/plugins/*")
})
public class XssFilter implements Filter {

	// 是否过滤富文本内容
	private static boolean IS_INCLUDE_RICH_TEXT = false;

	private List<String> excludes = new ArrayList<>();

	@Override
	public void init(FilterConfig filterConfig) {
		String isIncludeRichText = filterConfig.getInitParameter("isIncludeRichText");
		if (StrUtil.isNotBlank(isIncludeRichText)) {
			IS_INCLUDE_RICH_TEXT = BooleanUtils.toBoolean(isIncludeRichText);
		}
		String temp = filterConfig.getInitParameter("excludes");
		if (temp != null) {
			String[] url = temp.split(",");
			excludes.addAll(Arrays.asList(url));
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		if (handleExcludeURL(req)) {
			chain.doFilter(request, response);
			return;
		}
		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper((HttpServletRequest) request,
				IS_INCLUDE_RICH_TEXT);
		chain.doFilter(xssRequest, response);
	}

	@Override
	public void destroy() {

	}

	private boolean handleExcludeURL(HttpServletRequest request) {
		if (excludes == null || excludes.isEmpty()) {
			return false;
		}
		String url = request.getServletPath();
		return excludes.stream().map(pattern -> Pattern.compile("^" + pattern)).map(p -> p.matcher(url)).anyMatch(Matcher::find);
	}

}
