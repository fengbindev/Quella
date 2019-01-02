package com.ssrs.controller.form;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* @Description:    表单构建
* @Author:          ssrs
* @CreateDate:     2019/1/2 21:30
* @UpdateUser:     ssrs
* @UpdateDate:     2019/1/2 21:30
* @Version:        1.0
*/
@Controller
@Scope(value = "prototype")
@RequestMapping("/form")
public class FormBuildController {

    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(){
        return "form/index";
    }
}
