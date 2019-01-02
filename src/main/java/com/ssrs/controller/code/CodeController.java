package com.ssrs.controller.code;


import cn.hutool.core.util.StrUtil;
import com.ssrs.permission.model.Menu;
import com.ssrs.permission.model.Permission;
import com.ssrs.permission.service.IMenuService;
import com.ssrs.permission.service.IPermissionService;
import com.ssrs.util.code.domain.*;
import com.ssrs.util.code.enums.FieldQuery;
import com.ssrs.util.code.enums.FieldType;
import com.ssrs.util.code.enums.FieldVerify;
import com.ssrs.util.code.template.*;
import com.ssrs.util.code.util.CodeUtil;
import com.ssrs.util.code.util.DefaultValue;
import com.ssrs.util.code.util.TableParseUtil;
import com.ssrs.util.commom.StringUtils;
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

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

@Controller
@Scope(value = "prototype")
@RequestMapping("/code")
public class CodeController {

    @Autowired
    private IMenuService menuService;
    @Autowired
    private IPermissionService permissionService;
    @Autowired
    private DataSource dataSource;

    /**
     * 代码在线生成
     * @param model
     * @return
     */
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

    /**
     * 代码逆向生成
     * @param model
     * @return
     */
    @RequestMapping(value = "index2" ,method = RequestMethod.GET)
    public String index2(Model model){
        List<Menu> menus = menuService.getRootMenu();
        model.addAttribute("basic", DefaultValue.getBasic());
        model.addAttribute("fieldList", DefaultValue.fieldList());
        model.addAttribute("fieldType", ToolUtil.enumToMap(FieldType.class));
        model.addAttribute("fieldQuery", ToolUtil.enumToMap(FieldQuery.class));
        model.addAttribute("fieldVerify", ToolUtil.enumToMap(FieldVerify.class));
        model.addAttribute("menus",menus);
        return "code/index2";
    }


    @RequestMapping(value = "save" ,method = RequestMethod.POST)
    @ResponseBody
    public ResultVo save(@RequestBody Generate generate){
        Map<String, String> fieldMap = new HashMap<>();
        if(generate.getTemplate().isValidator()){
            String tableName = generate.getBasic().getTablePrefix()+generate.getBasic().getTableName();
            fieldMap.put("数据库表",  createTable(generate)?"表"+tableName+"生成成功":"表"+tableName+"生成失败");
        }
        if(generate.getTemplate().isEntity()){
            fieldMap.put("实体类", EntityTemplate.generate(generate));
        }
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
        if(generate.getTemplate().isAdd()){
            fieldMap.put("添加页面", AddHtmlTemplate.generate(generate));
        }
        if(generate.getTemplate().isDetail()){
            fieldMap.put("编辑页面", UpdateHtmlTemplate.generate(generate));
        }
        return ResultVoUtil.success(fieldMap);
    }

    /**
     * 逆向生成
     * @param generate
     * @return
     */
    @RequestMapping(value = "save2" ,method = RequestMethod.POST)
    @ResponseBody
    public ResultVo save2(@RequestBody Generate generate){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            String ddl = "";
            if (StringUtils.isBlank(generate.getBasic().getDdl())){
                String sql = "show create table "+generate.getBasic().getTablePrefix()+generate.getBasic().getTableName();
                connection = dataSource.getConnection();
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);
                resultSet.next();
                ddl = resultSet.getString(2);
            }else {
                ddl = generate.getBasic().getDdl();
            }
            Map<String, Long> fieldType = CodeUtil.enumToMapFX(FieldType.class);
            ClassInfo classInfo = TableParseUtil.processTableIntoClassInfo(ddl);
            List<FieldInfo> fieldList = classInfo.getFieldList();
            List<Field> fields = new ArrayList<>();
            fieldList.forEach(fieldInfo -> {
                Field field = new Field();
                field.setName(fieldInfo.getFieldName());
                field.setTitle(fieldInfo.getFieldComment());
                field.setType(fieldType.get(fieldInfo.getFieldClass()).intValue());
                //模糊查询
                field.setQuery(2);
                field.setShow(false);
                //必填验证
                field.setVerify(Arrays.asList(1));
                fields.add(field);
            });
            generate.setFields(fields);
            ResultVo resultVo = this.save(generate);
            return  resultVo;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultVoUtil.error("生成出错了");
        }finally {
            if (resultSet!=null){
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement!=null){
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

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

    private boolean createTable(Generate generate){
        List<Field> fields = generate.getFields();
        Map<Long, String> fieldType = CodeUtil.enumToMap(FieldType.class);
        String tableName = generate.getBasic().getTablePrefix()+generate.getBasic().getTableName();
        StringBuilder sqlBuilder = new StringBuilder();
        sqlBuilder.append("CREATE TABLE `"+tableName+"` (")
                    .append("`id` bigint(20) NOT NULL AUTO_INCREMENT,");
        fields.forEach(field -> {
            String fieldName = StrUtil.toUnderlineCase(field.getName());
            String type = fieldType.get((long) field.getType());
            String isDefault = "DEFAULT";
            if (field.getVerify().size()>0){
                isDefault = "NOT";
            }
            if (!"id".equals(fieldName)){
                switch (type){
                    case "String" :
                        sqlBuilder.append("`").append(fieldName).append("` varchar(255) ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Byte" :
                        sqlBuilder.append("`").append(fieldName).append("` tinyint(1) ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Short" :
                        sqlBuilder.append("`").append(fieldName).append("` smallint(6) ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Integer" :
                        sqlBuilder.append("`").append(fieldName).append("` int(11) ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Long" :
                        sqlBuilder.append("`").append(fieldName).append("` bigint(20) ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Float" :
                        sqlBuilder.append("`").append(fieldName).append("` float ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Double" :
                        sqlBuilder.append("`").append(fieldName).append("` double ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Boolean" :
                        sqlBuilder.append("`").append(fieldName).append("` bit ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Character" :
                        sqlBuilder.append("`").append(fieldName).append("`  varchar(255) ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Text" :
                        sqlBuilder.append("`").append(fieldName).append("`  varchar(255) ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                    case "Date" :
                        sqlBuilder.append("`").append(fieldName).append("`  datetime ").append(isDefault).append(" NULL COMMENT ").append("'").append(field.getTitle()).append("',");
                        break;
                }
            }
        });
        sqlBuilder.append("PRIMARY KEY (`id`)").append(") ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;");

        Connection connection = null;
        Statement statement = null;
        try {
            connection = dataSource.getConnection();
             statement = connection.createStatement();
            statement.execute(sqlBuilder.toString());
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
            if (statement!=null){
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }
}
