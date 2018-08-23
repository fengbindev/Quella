package com.ssrs.controller.editor;

import com.ssrs.model.Mail;
import com.ssrs.service.IMailService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-08-22
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/editor")
public class EditorController {

    /**
     * 跳转到首页
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index() {
        return "editor/index";
    }

}

