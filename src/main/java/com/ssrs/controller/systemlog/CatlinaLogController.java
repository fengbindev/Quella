package com.ssrs.controller.systemlog;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
* @Description:    实时显示catlina.out日志信息
* @Author:          ssrs
* @CreateDate:     2018/10/25 17:51
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/25 17:51
* @Version:        1.0
*/
@Controller
@Scope(value = "prototype")
@RequestMapping("/catlinaLog")
public class CatlinaLogController {

    @RequestMapping(value = "out" ,method = RequestMethod.GET)
    public String out(HttpServletRequest request, Model model){
        String path = request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        model.addAttribute("path",path);
        return "log/catlinaLog";
    }
}
