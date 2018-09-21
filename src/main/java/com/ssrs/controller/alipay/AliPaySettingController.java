package com.ssrs.controller.alipay;

import com.ssrs.model.Alidayu;
import com.ssrs.model.PaySettingAlipay;
import com.ssrs.service.IPaySettingAlipayService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;

/**
* @Description:    支付宝支付设置控制器
* @Author:         ssrs
* @CreateDate:     2018/9/21 15:08
* @UpdateUser:     ssrs
* @UpdateDate:     2018/9/21 15:08
* @Version:        1.0
*/
@RestController
@RequestMapping("/aliPaySetting")
public class AliPaySettingController {

    @Autowired
    private IPaySettingAlipayService paySettingAlipayService;

    /**
     * 跳转到首页
     * @return
     */
    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("alipay/index");
        PaySettingAlipay paySettingAlipay = paySettingAlipayService.selectById(1);
        modelAndView.addObject("psa" ,paySettingAlipay);
        return modelAndView;
    }

    /**
     * 修改支付宝支付配置
     * @param alipay
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(PaySettingAlipay alipay){
        alipay.setPsaId(1);
        boolean b = paySettingAlipayService.updateById(alipay);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

}
