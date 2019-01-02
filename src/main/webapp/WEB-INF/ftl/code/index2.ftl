<link rel="stylesheet" href="${basePath}/css/code.css"></link>
<link rel="stylesheet" href="${basePath}/plugins/formSelects-v4/formSelects-v4.css"></link>
<div class="layui-card">
    <div class="layui-card-header timo-card-header">
        <span><i class="fa fa-bars"></i> 数据库逆向解析方式一</span>
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
                            <input type="text" name="tableName"   value="${(basic.tableName)!}" placeholder="请输入要生成的数据库名(去掉前缀)" autocomplete="off" class="layui-input">
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
            <div class="layui-card-header timo-card-header">
                <span><i class="fa fa-bars"></i> 数据库逆向解析方式二</span>
                <button class="layui-btn layui-btn-sm entity-save">
                    <i class="fa fa-floppy-o"></i>保存</button>
            </div>

            <textarea name="ddl" required lay-verify="required"  placeholder="请输入数据库表的DDL语句" class="layui-textarea" style="height: 200px"></textarea>
        </div>
        <div class="panel">
            <div class="panel-header">
                <div class="title">模板信息</div>
                <div class="info"><i></i>创建<i class="lose"></i>忽略</div>
                <div class="path">模块路径：<span class="bindPackagePath"></span><span class="bindGenModule"></span></div>
            </div>
            <div id="float_hash" class="panel-body panel-body-float">
                <div class="float-label active" data-name="entity">实体类：<span class="bindTableEntity"></span>Model</div>
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
              tableEntity: '',
              ddl:''
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

          // 保存按钮
          $(".entity-save").on("click", function () {
              // 检验处理基本数据
              if(!verifyBasic()){
                  return false;
              }
              //将genPMenu赋值给basic
                basic['genPMenu'] = $("select[name=\"genPMenu\"]").val();
              //将ddl赋值给basic
              basic['ddl'] = $("textarea[name=\"ddl\"]").val();
              // 封装数据
              var generate = {
                  basic: basic,
                  template: getTemplate()
              };

              $.ajax({
                  type: "POST",
                  url: "${basePath}/code/save2",
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