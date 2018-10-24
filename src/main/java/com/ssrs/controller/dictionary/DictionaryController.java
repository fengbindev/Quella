package com.ssrs.controller.dictionary;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.DictionaryItem;
import com.ssrs.model.DictionaryType;
import com.ssrs.service.IDictionaryItemService;
import com.ssrs.service.IDictionaryTypeService;
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
 * 数据字典 前端控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-10-24
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/dictionary")
public class DictionaryController {

    @Autowired
    private IDictionaryTypeService dictionaryTypeService;
    @Autowired
    private IDictionaryItemService dictionaryItemService;

    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(){
        return "dictionary/index";
    }

    @RequestMapping(value = "getDictionaryPage" ,method = RequestMethod.POST)
    @ResponseBody
    public Object getDictionaryItemPage(int page,int limit){
        Page<DictionaryType> dictionaryGroupPage = dictionaryTypeService.selectPage(new Page<>(page, limit));
        return PageManager.buildPage(dictionaryGroupPage);
    }

    @RequestMapping(value = "goAdd" ,method = RequestMethod.GET)
    public String goAdd(){
        return "dictionary/add";
    }

    @RequestMapping(value = "goUpdate" ,method = RequestMethod.GET)
    public String goUpdate(Model model, int id){
        model.addAttribute("dictionary",dictionaryTypeService.selectById(id));
        return "dictionary/update";
    }

    @RequestMapping(value = "add" ,method = RequestMethod.POST)
    @ResponseBody
    public Object add(DictionaryType dictionaryGroup){
        boolean insert = dictionaryTypeService.insert(dictionaryGroup);
        return insert? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }
    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    @ResponseBody
    public Object update(DictionaryType dictionaryGroup){
        boolean b = dictionaryTypeService.updateById(dictionaryGroup);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(int id){
        boolean b = dictionaryTypeService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

    @RequestMapping(value = "getDictionaryChildPage" ,method = RequestMethod.POST)
    @ResponseBody
    public Object getDictionaryItemChildPage(int dictionaryTypeId,int page,int limit){
        Page<DictionaryItem> dictionaryPage = dictionaryItemService.selectPage(new Page<>(page, limit), new EntityWrapper<DictionaryItem>().eq("type_id", dictionaryTypeId));
        return PageManager.buildPage(dictionaryPage);
    }
    @RequestMapping(value = "goAddChild" ,method = RequestMethod.GET)
    public String goAddChild(){
        return "dictionary/addChild";
    }

    @RequestMapping(value = "goUpdateChild" ,method = RequestMethod.GET)
    public String goUpdateChild(int id,Model model){
        DictionaryItem dictionary = dictionaryItemService.selectById(id);
        model.addAttribute("dictionary",dictionary);
        return "dictionary/updateChild";
    }

    @RequestMapping(value = "addChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object addChild(DictionaryItem dictionary){
        boolean b = dictionaryItemService.insert(dictionary);
        return b?APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    @RequestMapping(value = "updateChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object updateChild(DictionaryItem dictionary){
        boolean b = dictionaryItemService.updateById(dictionary);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    @RequestMapping(value = "delChild" ,method = RequestMethod.POST)
    @ResponseBody
    public Object delChild(int id){
        boolean b = dictionaryItemService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }
}

