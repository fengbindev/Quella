package com.ssrs.core.freemarker.tags;


import com.ssrs.core.freemarker.utils.FreemarkerTagUtil;
import freemarker.core.Environment;
import freemarker.template.*;

import java.io.IOException;
import java.util.Map;


/**
* @Description:     基础标签类
* @Author:          ssrs
* @CreateDate:     2018/10/22 11:31
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/22 11:31
* @Version:        1.0
*/
@SuppressWarnings("unchecked")
public abstract class WYFTemplateModel implements TemplateDirectiveModel{

	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		
		
		/**
		 * 模版方法模式，把变化委派下去，交给子类实现！
		 */
		Map<String, TemplateModel> paramWrap = putValue(params);
		
		
		Map<String, TemplateModel> origMap = FreemarkerTagUtil.convertToTemplateModel(env, paramWrap);
		if (body!=null){
			body.render(env.getOut());
		}
		FreemarkerTagUtil.clearTempleModel(env, paramWrap, origMap);
	}

	/**
	 * 子类实现
	 * @param params
	 * @return
	 * @throws TemplateModelException
	 */
	protected abstract Map<String, TemplateModel> putValue(Map params) throws TemplateModelException;
}
