package com.ssrs.controller.link;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.ImagePlayer;
import com.ssrs.model.ImagePlayerResources;
import com.ssrs.model.Link;
import com.ssrs.model.LinkGroup;
import com.ssrs.service.ILinkGroupService;
import com.ssrs.service.ILinkService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  友情链接控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-10-23
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/link")
public class LinkController {

    @Autowired
    private ILinkGroupService linkGroupService;
    @Autowired
    private ILinkService linkService;

    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(){
        return "link/index";
    }

    @RequestMapping(value = "getLinkPage" ,method = RequestMethod.POST)
    @ResponseBody
    public Object getLinkPage(int page,int limit){
        Page<LinkGroup> linkGroupPage = linkGroupService.selectPage(new Page<>(page, limit));
        return PageManager.buildPage(linkGroupPage);
    }

    @RequestMapping(value = "goAdd" ,method = RequestMethod.GET)
    public String goAdd(){
        return "link/add";
    }

    @RequestMapping(value = "goUpdate" ,method = RequestMethod.GET)
    public String goUpdate(Model model,int id){
        model.addAttribute("link",linkGroupService.selectById(id));
        return "link/update";
    }
    
    @RequestMapping(value = "add" ,method = RequestMethod.POST)
    @ResponseBody
    public Object add(LinkGroup linkGroup){
        boolean insert = linkGroupService.insert(linkGroup);
        return insert? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }
    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    @ResponseBody
    public Object update(LinkGroup linkGroup){
        boolean b = linkGroupService.updateById(linkGroup);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(int id){
        boolean b = linkGroupService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

    @RequestMapping(value = "getLinkChildPage" ,method = RequestMethod.POST)
    @ResponseBody
    public Object getLinkChildPage(int linkGroupId,int page,int limit){
        Page<Link> linkPage = linkService.selectPage(new Page<>(page, limit), new EntityWrapper<Link>().eq("link_group_Id", linkGroupId));
        return PageManager.buildPage(linkPage);
    }
    @RequestMapping(value = "goAddChild" ,method = RequestMethod.GET)
    public String goAddChild(){
        return "link/addChild";
    }

    @RequestMapping(value = "goUpdateChild" ,method = RequestMethod.GET)
    public String goUpdateChild(int id,Model model){
        Link link = linkService.selectById(id);
        model.addAttribute("link",link);
        return "link/updateChild";
    }

    @RequestMapping(value = "addChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object addChild(Link link){
        boolean b = linkService.insert(link);
        return b?APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    @RequestMapping(value = "updateChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object updateChild(Link link){
        boolean b = linkService.updateById(link);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    @RequestMapping(value = "delChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object delChild(int id){
        boolean b = linkService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }
}

