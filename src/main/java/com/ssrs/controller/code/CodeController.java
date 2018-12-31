package com.ssrs.controller.code;


import com.ssrs.permission.model.Menu;
import com.ssrs.permission.model.Permission;
import com.ssrs.permission.service.IMenuService;
import com.ssrs.permission.service.IPermissionService;
import com.ssrs.util.code.domain.Basic;
import com.ssrs.util.code.domain.Generate;
import com.ssrs.util.code.enums.FieldQuery;
import com.ssrs.util.code.enums.FieldType;
import com.ssrs.util.code.enums.FieldVerify;
import com.ssrs.util.code.template.*;
import com.ssrs.util.code.util.DefaultValue;
import com.ssrs.util.commom.ToolUtil;
import com.ssrs.util.result.ResultVo;
import com.ssrs.util.result.ResultVoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope(value = "prototype")
@RequestMapping("/code")
public class CodeController {

    @Autowired
    private IMenuService menuService;
    @Autowired
    private IPermissionService permissionService;

    @RequestMapping(value = "index" ,method = RequestMethod.GET)
    public String index(Model model){
        List<Menu> menus = menuService.getRootMenu();
        model.addAttribute("basic", DefaultValue.getBasic());
        model.addAttribute("fieldList", DefaultValue.fieldList());
        model.addAttribute("fieldType", ToolUtil.enumToMap(FieldType.class));
        model.addAttribute("fieldQuery", ToolUtil.enumToMap(FieldQuery.class));
        model.addAttribute("fieldVerify", ToolUtil.enumToMap(FieldVerify.class));
        model.addAttribute("menus",menus);
        return "code/index";
    }

    @RequestMapping(value = "save" ,method = RequestMethod.POST)
    @ResponseBody
    public ResultVo save(@RequestBody Generate generate){
        Map<String, String> fieldMap = new HashMap<>();
        if(generate.getTemplate().isEntity()){
            fieldMap.put("实体类", EntityTemplate.generate(generate));
        }
//        if(generate.getTemplate().isValidator()){
//            fieldMap.put("验证类", ValidatorTemplate.generate(generate));
//        }
        if(generate.getTemplate().isRepository()){
            fieldMap.put("数据访问层", RepositoryTemplate.generate(generate));
        }
        if(generate.getTemplate().isService()){
            fieldMap.put("服务层", ServiceTemplate.generate(generate));
            fieldMap.put("服务实现层", ServiceImplTemplate.generate(generate));
        }
        if(generate.getTemplate().isController()){
            fieldMap.put("控制器", ControllerTemplate.generate(generate));
            menuRule(generate);
        }

        if(generate.getTemplate().isIndex()){
            fieldMap.put("列表页面", IndexHtmlTemplate.generate(generate));
        }
//        if(generate.getTemplate().isAdd()){
//            fieldMap.put("添加页面", AddHtmlTemplate.generate(generate));
//        }
//        if(generate.getTemplate().isDetail()){
//            fieldMap.put("详细页面", DetailHtmlTemplate.generate(generate));
//        }
        return ResultVoUtil.success(fieldMap);
    }

    /**
     * 生成菜单和权限
     * @param generate
     */
    private void menuRule(Generate generate){
        Basic basic = generate.getBasic();
        String baseUrl = "/"+ToolUtil.lowerFirst(basic.getTableEntity());

        //添加菜单以及菜单权限
        Menu menu = new Menu();
        menu.setIcon("&#xe62e;");
        menu.setParentId(basic.getGenPMenu().intValue());
        menu.setSequence(50);
        menu.setSystemMenu(1);
        menu.setUrl(baseUrl+"/index");
        menu.setTitle(basic.getGenTitle());
        Permission menuPermission = new Permission();
        menuPermission.setName(basic.getGenTitle());
        menu.setPermission(menuPermission);
        menuService.insert2(menu);

        //添加基本权限：add,update,del

        Permission addPermission = new Permission();
        addPermission.setUrl(baseUrl+"/add");
        addPermission.setParentId(menu.getPermission().getId());
        addPermission.setName(basic.getGenTitle()+"添加");
        permissionService.insert2(addPermission);

        Permission updatePermission = new Permission();
        updatePermission.setUrl(baseUrl+"/update");
        updatePermission.setParentId(menu.getPermission().getId());
        updatePermission.setName(basic.getGenTitle()+"编辑");
        permissionService.insert2(updatePermission);

        Permission delPermission = new Permission();
        delPermission.setUrl(baseUrl+"/del");
        delPermission.setParentId(menu.getPermission().getId());
        delPermission.setName(basic.getGenTitle()+"删除");
        permissionService.insert2(delPermission);


    }
}
