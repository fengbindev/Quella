package com.ssrs.controller.message;


import cc.openkit.common.KitUtil;
import com.alibaba.fastjson.JSONObject;
import com.ssrs.core.manager.UserManager;
import com.ssrs.model.Alidayu;
import com.ssrs.model.Sign;
import com.ssrs.model.WebSetting;
import com.ssrs.service.IAlidayuService;
import com.ssrs.service.ISignService;
import com.ssrs.service.IWebSettingService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.LoggerUtils;
import com.ssrs.util.commom.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 阿里大鱼短信通用接口
 * </p>
 *
 * @author ssrs
 * @since 2018-08-21
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/alidayu")
public class AlidayuController {

    @Autowired
    private IAlidayuService alidayuService;
    @Autowired
    private ISignService signService;
    @Autowired
    private IWebSettingService webSettingService;

    /**
     * 跳转到首页
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("message/index");
        Alidayu alidayu = alidayuService.selectById(1);
        if (alidayu != null) {
            modelAndView.addObject("alidayu", alidayu);
        }
        return modelAndView;
    }

    /**
     * 修改短信配置,验证码长度要去网站设置的一致
     * @param alidayu
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Alidayu alidayu){
        alidayu.setId(1);
        boolean b = alidayuService.updateById(alidayu);
        WebSetting webSetting = new WebSetting();
        webSetting.setId(1);
        webSetting.setSigeSize(alidayu.getSignSize());
        webSettingService.updateById(webSetting);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 短信测试
     * @param phone
     * @param code
     * @return
     */
    @RequestMapping(value = "messageTest",method = RequestMethod.POST)
    @ResponseBody
    public Object messageTest(String phone,String code){
        Map<String,Object> map = alidayuService.send(phone,code);
        return map;
    }

    /**
     * 通用发送短信验证码接口,阿里大鱼模板必须有且只有一个变量为 code
     * @return
     */
    @RequestMapping(value = "commonSendSign" ,method = RequestMethod.POST)
    @ResponseBody
    public Object commonSendSign(String phone){
        if (StringUtils.isBlank(phone)){
            return APPUtil.returnMap("101","手机号码不能为空");
        }
        Map<String, Object> map = new HashMap<String, Object>(16);
        // 验证手机是否可以发送验证码
        map = signService.isOk(phone);
        if ("101".equals(map.get("code"))){
            return JSONObject.toJSON(map);
        }

        //得到阿里大鱼验证码位数
        Alidayu alidayu = alidayuService.selectById(1);
        Integer signSize = alidayu.getSignSize();
        int code = KitUtil.randomNumber(signSize);
        LoggerUtils.fmtDebug(getClass(),"发送的验证吗是[%s]",code);

        //验证码token
        String kst = KitUtil.uuid();
        Sign sign = new Sign();
        sign.setSignId(kst);
        sign.setSignCode(UserManager.md5Pwsd("ssrs",String.valueOf(code)));
        sign.setSignPhone(phone);
        sign.setSignType(1);//未使用状态
        sign.setSignTime(new Date());

        //保存这条信息
        boolean b = signService.insert(sign);
        if (b){
            String newCode = "code,"+code;
            map = alidayuService.send(phone,newCode);
            map.put("KST",kst);
        }
        return map;
    }

    @RequestMapping(value = "isSignOk" ,method = RequestMethod.POST)
    @ResponseBody
    public Object isSignOk(String phone,String kst,String code){
        Map<String, Object> map = signService.isSignOk(phone,kst,code);
        return map;
    }
}

