package com.ssrs.core.freemarker.tags;

import com.ssrs.core.freemarker.Constant;
import com.ssrs.util.commom.LoggerUtils;
import com.ssrs.util.commom.SpringContextUtil;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;

import java.util.HashMap;
import java.util.Map;

import static freemarker.template.ObjectWrapper.DEFAULT_WRAPPER;

/**
* @Description:    Freemarker 自定义标签 API公共入口
* @Author:          ssrs
* @CreateDate:     2018/10/22 10:58
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/22 10:58
* @Version:        1.0
*/

public class APITemplateModel extends WYFTemplateModel {

	@Override
	@SuppressWarnings({  "unchecked" })
	protected Map<String, TemplateModel> putValue(Map params)
			throws TemplateModelException {
		
		Map<String, TemplateModel> paramWrap = null ;
		if(null != params && params.size() != 0 || null != params.get(Constant.TARGET)){
			String name =  params.get(Constant.TARGET).toString() ;
			paramWrap = new HashMap<String, TemplateModel>(params);
			
			/**
			 * 获取子类，用父类接收，
			 */
			SuperCustomTag tag =  SpringContextUtil.getBean(name,SuperCustomTag.class);
			//父类调用子类方法
			Object result = tag.result(params);
			
			//输出
			paramWrap.put(Constant.OUT_TAG_NAME, DEFAULT_WRAPPER.wrap(result));
		}else{
			LoggerUtils.error(getClass(), "Cannot be null, must include a 'target' attribute!");
		}
		return paramWrap;
	}
}
