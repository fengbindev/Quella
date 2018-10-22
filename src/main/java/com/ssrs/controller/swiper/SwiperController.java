package com.ssrs.controller.swiper;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.ImagePlayer;
import com.ssrs.model.ImagePlayerResources;
import com.ssrs.service.IImagePlayerResourcesService;
import com.ssrs.service.IImagePlayerService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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

    @Autowired
    private IImagePlayerService imagePlayerService;
    @Autowired
    private IImagePlayerResourcesService imagePlayerResourcesService;

    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(){
        return "swiper/index";
    }

    @RequestMapping(value = "goAdd" ,method = RequestMethod.GET)
    public String goAdd(){
        return "swiper/add";
    }
    @RequestMapping(value = "goDetail" ,method = RequestMethod.GET)
    public String detail(Model model,int id){
        model.addAttribute("img",imagePlayerService.selectById(id));
        return "swiper/detail";
    }
    @RequestMapping(value = "goUpdate" ,method = RequestMethod.GET)
    public String goUpdate(Model model,int id){
        model.addAttribute("img",imagePlayerService.selectById(id));
        return "swiper/update";
    }

    @RequestMapping(value = "getSwiperPage" ,method = RequestMethod.POST)
    @ResponseBody
    public Object getSwiperPage(int page,int limit){
        Page<ImagePlayer> imagePlayerPage = imagePlayerService.selectPage(new Page<>(page, limit));
        return PageManager.buildPage(imagePlayerPage);
    }

    @RequestMapping(value = "add" ,method = RequestMethod.POST)
    @ResponseBody
    public Object add(ImagePlayer imagePlayer){
        boolean insert = imagePlayerService.insert(imagePlayer);
        return insert?APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    @ResponseBody
    public Object update(ImagePlayer imagePlayer){
        boolean b = imagePlayerService.updateById(imagePlayer);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(int id){
        boolean b = imagePlayerService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

    @RequestMapping(value = "goAddChild" ,method = RequestMethod.GET)
    public String goAddChild(){
        return "swiper/addChild";
    }

    @RequestMapping(value = "addChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object addChild(HttpServletRequest request){
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String sequence = request.getParameter("sequence");
        String img = request.getParameter("img");
        String url = request.getParameter("url");
        String startAndEndTime = request.getParameter("startAndEndTime");
        String type = request.getParameter("type");
        String imagePlayerId = request.getParameter("imagePlayerId");
        ImagePlayerResources imagePlayerResources = new ImagePlayerResources();
        imagePlayerResources.setImagePlayerId(Integer.parseInt(imagePlayerId));
        imagePlayerResources.setTitle(title);
        imagePlayerResources.setSummary(summary);
        imagePlayerResources.setSequence(Integer.parseInt(sequence));
        imagePlayerResources.setImg(img);
        imagePlayerResources.setUrl(url);
        imagePlayerResources.setType("on".equals(type) ? 1 : 2);
        String[] strings = startAndEndTime.split(" - ");
        imagePlayerResources.setStartTime(DateUtil.parse(strings[0]));
        imagePlayerResources.setEndTime(DateUtil.parse(strings[1]));
        imagePlayerResources.setTime(DateUtil.date());
        boolean b = imagePlayerResourcesService.insert(imagePlayerResources);
        return b?APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    @RequestMapping(value = "getSwiperChildPage" ,method = RequestMethod.POST)
    @ResponseBody
    public Object getSwiperChildPage(int imagePlayerId,int page,int limit){
        Page<ImagePlayerResources> playerResourcesPage = imagePlayerResourcesService.selectPage(new Page<>(page, limit), new EntityWrapper<ImagePlayerResources>().eq("image_player_id", imagePlayerId));
        return PageManager.buildPage(playerResourcesPage);
    }

    @RequestMapping(value = "goUpdateChild" ,method = RequestMethod.GET)
    public String goUpdateChild(int id,Model model){
        ImagePlayerResources imagePlayerResources = imagePlayerResourcesService.selectById(id);
        model.addAttribute("ipr",imagePlayerResources);
        return "swiper/updateChild";
    }

    @RequestMapping(value = "updateChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object updateChild(HttpServletRequest request){
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String sequence = request.getParameter("sequence");
        String img = request.getParameter("img");
        String url = request.getParameter("url");
        String startAndEndTime = request.getParameter("startAndEndTime");
        String type = request.getParameter("type");
        ImagePlayerResources imagePlayerResources = new ImagePlayerResources();
        imagePlayerResources.setId(Integer.parseInt(id));
        imagePlayerResources.setTitle(title);
        imagePlayerResources.setSummary(summary);
        imagePlayerResources.setSequence(Integer.parseInt(sequence));
        imagePlayerResources.setImg(img);
        imagePlayerResources.setUrl(url);
        imagePlayerResources.setType("on".equals(type) ? 1 : 2);
        String[] strings = startAndEndTime.split(" - ");
        imagePlayerResources.setStartTime(DateUtil.parse(strings[0]));
        imagePlayerResources.setEndTime(DateUtil.parse(strings[1]));
        imagePlayerResources.setTime(DateUtil.date());
        boolean b = imagePlayerResourcesService.updateById(imagePlayerResources);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    @RequestMapping(value = "delChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object delChild(int id){
        boolean b = imagePlayerResourcesService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }
}
