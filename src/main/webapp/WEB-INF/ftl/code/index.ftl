<link rel="stylesheet" href="${basePath}/css/code.css"></link>
<link rel="stylesheet" href="${basePath}/plugins/formSelects-v4/formSelects-v4.css"></link>
<div class="layui-fluid">
<div class="layui-card">
    <div class="layui-card-header timo-card-header">
        <span><i class="fa fa-bars"></i> 代码生成</span>
        <i class="layui-icon layui-icon-refresh refresh-btn" style="left:92px"></i>
        <button class="layui-btn layui-btn-sm entity-save">
            <i class="fa fa-floppy-o"></i>保存</button>
    </div>
    <div class="layui-card-body">
        <fieldset id="basic_hash" class="layui-elem-field">
            <legend class="code-legend">基本信息</legend>
            <div class="layui-field-box">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">项目路径</label>
                        <div class="layui-input-inline">
                            <input type="text" name="projectPath" value="${(basic.projectPath)!}"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">项目包名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="packagePath" value="${(basic.packagePath)!}"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">作者名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="author" value="${(basic.author)!}"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>

                <div class="layui-form layui-form-item layui-inline">
                        <label class="layui-form-label">上级类目</label>
                        <div class="layui-input-inline">
                            <select name="genPMenu">
                                <#list menus as menu>
                                    <option value="${menu.id}">${menu.title}</option>
                                </#list>
                            </select>
                        </div>
                    <#--<div class="layui-inline">-->
                        <#--<label class="layui-form-label">模块名称</label>-->
                        <#--<div class="layui-input-inline">-->
                            <#--<input type="text" name="genModule" value="${(basic.genModule)!}"  autocomplete="off" class="layui-input">-->
                        <#--</div>-->
                    <#--</div>-->
                    <div class="layui-inline">
                        <label class="layui-form-label">业务名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="genTitle"  value="${(basic.genTitle)!}" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">表前缀</label>
                        <div class="layui-input-inline">
                            <input type="tel" name="tablePrefix" value="${(basic.tablePrefix)!}" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">表名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="tableName"  value="${(basic.tableName)!}" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">实体类</label>
                        <div class="layui-input-inline">
                            <input type="text" name="tableEntity" value="${(basic.tableEntity)!}" autocomplete="off" class="layui-input bindTableEntity">
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <div class="panel">
            <div class="panel-header">
                <div class="title">实体类</div>
                <div class="control">
                    <button class="field-add layui-btn layui-btn-primary layui-btn-xs">
                        <i class="fa layui-icon layui-icon-add-circle-fine"></i>添加
                    </button>
                    <button class="field-del layui-btn layui-btn-primary layui-btn-xs">
                        <i class="fa layui-icon layui-icon-close"></i>删除
                    </button>
                    <button class="field-up layui-btn layui-btn-primary layui-btn-xs">
                        <i class="fa layui-icon layui-icon-up"></i>向上
                    </button>
                    <button class="field-down layui-btn layui-btn-primary layui-btn-xs">
                        <i class="fa layui-icon layui-icon-down"></i>向下
                    </button>
                </div>
                <div class="entity"><span class="bindTableEntity"></span>(<span class="bindTablePrefix"></span><span class="bindTableName"></span>)</div>
            </div>
            <div class="panel-body panel-body-entity">
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th width="20">#</th>
                        <th width="100">字段名称</th>
                        <th width="100">字段标题</th>
                        <th width="100">数据类型</th>
                        <th width="100">查询（可选）</th>
                        <th width="100">列表显示</th>
                        <th>字段验证（可选）</th>
                    </tr>
                    </thead>
                    <tbody id="entity_hash">
                    <#list  fieldList as field >
                    <tr>
                        <td class="entity-number">${field_index+1}</td>
                        <td class="entity-name"><input type="text" value="${field.name}" name="name" /></td>
                        <td class="entity-title"><input type="text" value="${field.title}"  name="title" /></td>
                        <td class="layui-form">
                            <select name="type" lay-verify="required">
                               <#list fieldType?keys  as key>
                                   <option value="${key}"  <#if key?number == field.type > selected </#if> >${fieldType[key]}</option>
                               </#list>
                            </select>
                        </td>
                        <td class="layui-form">
                            <select name="query">
                                <option value="">请选择</option>
                                 <#list fieldQuery?keys  as key>
                                     <option value="${key}" <#if key?number == field.query > selected </#if>>${fieldQuery[key]}</option>
                                 </#list>
                            </select>
                        </td>
                        <td class="layui-form entity-show">
                            <input name="show" type="checkbox" lay-text="是|否" <#if field.show > checked </#if> lay-skin="switch">
                        </td>
                        <td class="layui-form entity-verify">
                            <select name="verify" xm-select='entity-verify${field.name}'>
                                <option value=""></option>
                                 <#list fieldVerify?keys  as key>
                                     <option value="${key}">${fieldVerify[key]}</option>
                                 </#list>
                            </select>
                        </td>
                    </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="panel">
            <div class="panel-header">
                <div class="title">模板信息</div>
                <div class="info"><i></i>创建<i class="lose"></i>忽略</div>
                <div class="path">模块路径：<span class="bindPackagePath"></span><span class="bindGenModule"></span></div>
            </div>
            <div id="float_hash" class="panel-body panel-body-float">
                <div class="float-label active" data-name="validator">数据库表：<span class="bindTableEntity"></span>Table</div>
                <div class="float-label active" data-name="entity">实体类：<span class="bindTableEntity"></span></div>
                <div class="float-label active" data-name="controller">控制器：<span class="bindTableEntity"></span>Controller</div>
                <div class="float-label active" data-name="service">服务层：<span class="bindTableEntity"></span>Service</div>
                <div class="float-label active" data-name="repository">dao层：<span class="bindTableEntity"></span>Mapper</div>
                <div class="float-label active" data-name="index">列表页面：<span class="bindTableEntity"></span>/index.ftl</div>
                <div class="float-label active" data-name="add">添加页面：<span class="bindTableEntity"></span>/add.ftl</div>
                <div class="float-label active" data-name="detail">编辑页面：<span class="bindTableEntity"></span>/update.ftl</div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="${basePath}/js/jquery.js"></script>
  <script>
      // 验证下拉选择器
      layui.config({
          base: '${basePath}/plugins/formSelects-v4/'
      }).extend({
          formSelects: 'formSelects-v4.min'
      });
      layui.use(['form', 'layedit',  'element', 'layer','formSelects'], function(){
          var form = layui.form,
                  layer = layui.layer,
                  element = layui.element,
                  formSelects = layui.formSelects;
          formSelects.render();
          form.render(); //更新全部

          // 定义Basic基本信息类
          var basic = {
              projectPath: '',
              packagePath: '',
              author: '',
              genTitle: '',
              genModule: '',
              genPMenu: '',
              tablePrefix: '',
              tableName: '',
              tableEntity: ''
          };
          // 监听表单数据变动
          $('#basic_hash').on('input propertychange', function(e) {
              var $this = $(e.target);
              var name = $this.attr("name");
              basic[name] = $this.val();
              if(name === "tableName"){
                  if($this.val().length > 0){
                      $(".panel-header .entity").css("display", "block");
                  }else{
                      $(".panel-header .entity").css("display", "none");
                  }
              }
          });

          // 数据监听Basic数据变动
          var defaults = {};
          Object.defineProperty(basic, "packagePath", {
              get: function () { return defaults.packagePath},
              set: function(value) {
                  $(".bindPackagePath").text(value);
                  defaults.packagePath = value;
              }
          });
          Object.defineProperty(basic, "genModule", {
              get: function () { return defaults.genModule},
              set: function(value) {
                  $(".bindGenModule").text(value);
                  defaults.genModule = value;
              }
          });
          Object.defineProperty(basic, "tablePrefix", {
              get: function () { return defaults.tablePrefix},
              set: function(value) {
                  $(".bindTablePrefix").text(value);
                  defaults.tablePrefix = value;
              }
          });
          Object.defineProperty(basic, "tableName", {
              get: function () { return defaults.tableName},
              set: function(value) {
                  $(".bindTableName").text(value);
                  defaults.tableName = value;

                  var split = value.split("_"), newValue = '';
                  split.forEach(function (val) {
                      newValue += val.substring(0,1).toUpperCase()+val.substring(1);
                  });
                  var $bindTableEntity = $(".bindTableEntity");
                  basic.tableEntity = newValue;
                  $bindTableEntity.val(newValue);
                  $bindTableEntity.text(newValue);
              }
          });
          Object.defineProperty(basic, "tableEntity", {
              get: function () { return defaults.tableEntity},
              set: function(value) {
                  $(".bindTableEntity").text(value);
                  defaults.tableEntity = value;
              }
          });

          // 初始化basic数据
          $('#basic_hash input').each(function (key, val) {
              var name = $(val).attr("name");
              if(name !== undefined){
                  basic[name] = $(val).val();
              }
          });

          /* 实体模型操作 */
          var entity = $("#entity_hash");
          var field = null;
          // 选中字段
          entity.on("click", ".entity-number", function () {
              if(field !== null){
                  $(field).css("background-color", "#FFFFFF");
                  $(field).css("color", "#666666");
              }
              if(field !== this){
                  $(this).css("background-color", "#5FB878");
                  $(this).css("color", "#FFFFFF");
                  field = this;
              }else{
                  field = null;
              }
          });

          // 添加字段
          $(".field-add").on("click", function () {
              var element = entity.children("tr:last-child").clone();
              element.find("input, select").val("");
              element.find("[name='type']").val("1");
              var random = Math.random()*10000;
              element.find("[xm-select]").attr("xm-select", random);
              if(field == null){
                  entity.append(element);
              }else {
                  $(field).parent().after(element);
              }
              element.children(".entity-number").click();
              form.render();
              formSelects.render(random);
              resetNumber();
          });
          // 删除字段
          $(".field-del").on("click", function () {
              if(field != null){
                  $(field).parent().remove();
                  resetNumber();
              }
          });
          // 上移字段
          $(".field-up").on("click", function () {
              if(field != null){
                  var parent = $(field).parent();
                  if(parent.prev().length === 1){
                      parent.insertBefore(parent.prev());
                      resetNumber();
                  }
              }
          });
          // 下移字段
          $(".field-down").on("click", function () {
              if(field != null){
                  var parent = $(field).parent();
                  if(parent.next().length === 1){
                      parent.insertAfter(parent.next());
                      resetNumber();
                  }
              }
          });

          // 重置字段编号
          var resetNumber = function(){
              entity.children().each(function (key, val) {
                  $(val).children(".entity-number").text(key + 1);
              });
          };

          // 模块悬浮标签
          $(".float-label").on("click", function(){
              $(this).toggleClass("active");
          });


          /***************************************下面是提交时的数据封装*******************************************/

                  // 认证基本信息
          var verifyBasic = function(){
                      var result = true;
                      $('#basic_hash').find("input[name]").each(function (key, item) {
                          if($(item).val().replace(/(^\s*)|(\s*$)/g, "") === ""){
                              var title = $(item).parent().prev().text();
                              layer.msg(title + "不能为空！", {offset: '15px', time: 3000, icon: 2});
                              return result = false;
                          }
                          basic[$(item).attr('name')] = $(item).val();
                      });
                      return result;
                  };
          // 提取模板数据
          var getTemplate = function(){
              var template = {};
              $("#float_hash").children(".float-label").each(function (key, item) {
                  var name = $(item).data("name");
                  template[name] = $(item).hasClass("active");
              });
              return template;
          };
          // 提取实体类数据
          var getEntity = function(){
              var fieldList = [];
              entity.children().each(function (key, trNode) {
                  var field = {};
                  field.name = $(trNode).find("[name='name']").val();
                  field.title = $(trNode).find("[name='title']").val();
                  field.type = $(trNode).find("[name='type']").val();
                  field.query = $(trNode).find("[name='query']").val();
                  if (!field.query){
                      field.query = 0;
                  }
                  field.show = $(trNode).find("[name='show']").is(':checked');
                  var xmId = $(trNode).find(".entity-verify select").attr("xm-select");
                  field.verify = formSelects.value(xmId, 'val');
                  fieldList[key] = field;
              });
              return fieldList;
          };

          // 保存按钮
          $(".entity-save").on("click", function () {
              // 检验处理基本数据
              if(!verifyBasic()){
                  return false;
              }
              //将genPMenu赋值给basic
                basic['genPMenu'] = $("select[name=\"genPMenu\"]").val();
              // 封装数据
              var generate = {
                  basic: basic,
                  fields: getEntity(),
                  template: getTemplate()
              };

              $.ajax({
                  type: "POST",
                  url: "${basePath}/code/save",
                  contentType: "application/json; charset=utf-8",
                  data: JSON.stringify(generate),
                  dataType: "json",
                  success: function (result) {
                      if(result.code === 200){
                          genDetail(result.data);
                          // basicHistory(basic);
                      }else{
                          layer.msg(result.msg, {offset: '15px', time: 3000, icon: 2});
                      }
                  },
                  error: function (message) {
                      layer.msg("保存失败！", {offset: '15px', time: 3000, icon: 2});
                  }
              });

              //生成文件信息详细页面
              function genDetail(list){
                  var panel = '';
                  for(var p in list){
                      var path = list[p];
                      panel += "<div class='item'><span class='title'>" + p + "</span>：";
                      if(path.indexOf("exist:") === 0){
                          panel += "<span class='info-e'><i class='fa fa-times-circle-o'></i> 生成失败，文件已存在</span>";
                          path = path.substring("exist:".length, path.length);
                      }else {
                          panel += "<span class='info-s'><i class='fa fa-check-circle-o'></i> 生成成功</span>";
                      }
                      panel += "<div class='path'>" + path + "</div>";
                      panel += "</div>";
                  }
                  layer.open({
                      type: 1,
                      title: '生成文件信息',
                      shadeClose: true,
                      skin: 'layui-layer-rim',
                      area: ['800px', '540px'],
                      content: "<div class='save-detail'>" + panel + "</div>"
                  });
              }
          });

      });

  </script>