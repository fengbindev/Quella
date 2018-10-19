package com.ssrs.controller.swiper;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* @Description:    图片播放器
* @Author:          ssrs
* @CreateDate:     2018/10/19 16:11
* @UpdateUser:     ssrs
* @UpdateDate:     2018/10/19 16:11
* @Version:        1.0
*/
@Controller
@Scope(value="prototype")
@RequestMapping("/swiper")
public class SwiperController {

    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(){
        return "swiper/index";
    }
}
