package com.ssrs.controller.websetting;

import com.ssrs.model.Alidayu;
import com.ssrs.model.WebSetting;
import com.ssrs.service.IAlidayuService;
import com.ssrs.service.IWebSettingService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* @Description:    网站设置  前端控制器
* @Author:          ssrs
* @CreateDate:     2018/12/1 17:41
* @UpdateUser:     ssrs
* @UpdateDate:     2018/12/1 17:41
* @Version:        1.0
*/
@Controller
@Scope(value="prototype")
@RequestMapping("/websetting")
public class WebSettingController {

    @Autowired
    private IWebSettingService webSettingService;
    @Autowired
    private IAlidayuService alidayuService;

    /**
     * 跳转到网站设置页面
     * @param model
     * @return
     */
    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(Model model){
        WebSetting webSetting = webSettingService.selectById(1);
        model.addAttribute("webSetting",webSetting);
        return "websetting/websetting";
    }

    /**
     * 网站设置修改,验证码长度要与阿里大鱼的验证码长度一致
     * @param webSetting
     * @return
     */
    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    @ResponseBody
    public Object add(WebSetting webSetting){
        webSetting.setId(1);
        boolean b = webSettingService.updateById(webSetting);
        Alidayu alidayu = new Alidayu();
        alidayu.setId(1);
        alidayu.setSignSize(webSetting.getSigeSize());
        alidayuService.updateById(alidayu);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }
}
