package com.ssrs.controller.menu;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ssrs.controller.BaseController;
import com.ssrs.core.manager.MenuManager;
import com.ssrs.permission.model.Menu;
import com.ssrs.permission.service.IMenuService;
import com.ssrs.permission.service.IPermissionService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ssrs
 * @since 2018-08-08
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("menu")
public class MenuController extends BaseController {

    @Autowired
    private IMenuService menuService;
    @Autowired
    private IPermissionService permissionService;

    /**
     * 跳转到菜单首页
     *
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("menu/index");
        //查询出所有菜单
        List<Menu> menus = menuService.getRootMenu();
        modelAndView.addObject("menus", menus);
        return modelAndView;
    }

    /**
     * 跳到菜单添加页面
     *
     * @return
     */
    @RequestMapping("goAdd")
    public ModelAndView goAdd() {
        ModelAndView modelAndView = new ModelAndView("menu/add");
        List<Menu> menus = menuService.selectList(new EntityWrapper<Menu>().isNull("parent_id"));
        modelAndView.addObject("menus", menus);
        return modelAndView;
    }

    /**
     * 构建前端路由数据
     *
     * @return
     */
    @RequestMapping(value = "buildMenuUrl", method = RequestMethod.GET)
    @ResponseBody
    public Object buildMenuUrl() {
        //查询出所有子菜单
        List<Menu> menuList = menuService.selectList(new EntityWrapper<Menu>().isNotNull("parent_id"));
        List<MenuVo> menuVoList = MenuManager.buildMenuUrl(menuList);
        return menuVoList;
    }

    /**
     * 菜单添加方法
     * @param menu
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Menu menu) {
        menu.setIcon("&#"+menu.getIcon()+";");
        int count = menuService.insert2(menu);
        return count==1?APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 跳转到编辑页面
     * @param id 菜单id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("menu/update");
        Menu menu = menuService.selectById2(id);
        modelAndView.addObject("menu",menu);
        List<Menu> menus = menuService.selectList(null);
        modelAndView.addObject("menus",menus);
        return modelAndView;
    }

    /**
     * 菜单修改方法
     * @param menu
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Menu menu){
        menu.setIcon("&#"+menu.getIcon()+";");
        int count = menuService.updateById2(menu);
        return count==1?APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 菜单删除方法
     * @param id 菜单id
     * @return
     */
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Integer id,Long permissionId){
        int count = menuService.deleteById2(id,permissionId);
        return count==1?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }


}
