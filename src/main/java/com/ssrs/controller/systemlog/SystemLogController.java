package com.ssrs.controller.systemlog;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.SystemLog;
import com.ssrs.service.ISystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-08-15
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/systemLog")
public class SystemLogController {

    @Autowired
    private ISystemLogService systemLogService;

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(){
        return "log/index";
    }

    /**
     * 得到分页数据
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "getSystemLogPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getSystemLogPage(int page ,int limit){
        Page<SystemLog> systemLogPage = systemLogService.selectPage(new Page<>(page, limit),new EntityWrapper<SystemLog>().orderBy("time",false));
        Map<String, Object> map = PageManager.buildPage(systemLogPage);
        return map;
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("log/add");
        List<SystemLog> logs = systemLogService.selectList(null);
        modelAndView.addObject("logs",logs);
        return modelAndView;
    }
}

