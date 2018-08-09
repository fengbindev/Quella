package com.ssrs.controller.menu;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssrs.core.manager.MenuManager;
import com.ssrs.permission.model.Menu;
import com.ssrs.permission.service.IMenuService;
import com.ssrs.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-08-08
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    /**
     * 跳转到菜单首页
     * @return
     */
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(){
        return "menu/index";
    }

    @RequestMapping(value = "buildMenuUrl",method = RequestMethod.GET)
    @ResponseBody
    public Object buildMenuUrl(){
        //查询出所有子菜单
        List<Menu> menuList = menuService.selectList(new EntityWrapper<Menu>().isNotNull("parent_id"));
        List<MenuVo> menuVoList = MenuManager.buildMenuUrl(menuList);
        return menuVoList;
    }
}

