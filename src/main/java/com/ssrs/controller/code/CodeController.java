package com.ssrs.controller.code;


import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.enums.FieldQuery;
import com.ssrs.util.code.enums.FieldType;
import com.ssrs.util.code.enums.FieldVerify;
import com.ssrs.util.code.template.*;
import com.ssrs.util.code.util.DefaultValue;
import com.ssrs.util.commom.ToolUtil;
import com.ssrs.util.result.ResultVo;
import com.ssrs.util.result.ResultVoUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@Scope(value = "prototype")
@RequestMapping("/code")
public class CodeController {

    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(Model model){
        model.addAttribute("basic", DefaultValue.getBasic());
        model.addAttribute("fieldList", DefaultValue.fieldList());
        model.addAttribute("fieldType", ToolUtil.enumToMap(FieldType.class));
        model.addAttribute("fieldQuery", ToolUtil.enumToMap(FieldQuery.class));
        model.addAttribute("fieldVerify", ToolUtil.enumToMap(FieldVerify.class));
        return "code/index";
    }

    @RequestMapping(value = "save" ,method = RequestMethod.POST)
    @ResponseBody
    public ResultVo save(@RequestBody Generate generate){
        Map<String, String> fieldMap = new HashMap<>();
        if(generate.getTemplate().isEntity()){
            fieldMap.put("实体类", EntityTemplate.generate(generate));
        }
//        if(generate.getTemplate().isValidator()){
//            fieldMap.put("验证类", ValidatorTemplate.generate(generate));
//        }
        if(generate.getTemplate().isRepository()){
            fieldMap.put("数据访问层", RepositoryTemplate.generate(generate));
        }
        if(generate.getTemplate().isService()){
            fieldMap.put("服务层", ServiceTemplate.generate(generate));
            fieldMap.put("服务实现层", ServiceImplTemplate.generate(generate));
        }
        if(generate.getTemplate().isController()){
            fieldMap.put("控制器", ControllerTemplate.generate(generate));
//            menuRule(generate);
        }
//
        if(generate.getTemplate().isIndex()){
            fieldMap.put("列表页面", IndexHtmlTemplate.generate(generate));
        }
//        if(generate.getTemplate().isAdd()){
//            fieldMap.put("添加页面", AddHtmlTemplate.generate(generate));
//        }
//        if(generate.getTemplate().isDetail()){
//            fieldMap.put("详细页面", DetailHtmlTemplate.generate(generate));
//        }
        return ResultVoUtil.success(fieldMap);
    }
}
