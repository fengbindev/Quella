<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title" style="left: 25px">
        <li class="layui-this">数据字典</li>
        <li>使用说明</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">
            <div class="layui-fluid">
                <div class="layui-row layui-col-space25">
                    <div class="layui-col-xs6">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="layui-card-header">
                                      <@shiro.hasPermission name="/dictionary/add">
                                        <a id="addDictionary" class="layui-btn layui-btn-xs">
                                            <i class="layui-icon"></i>
                                            <span>新增</span>
                                        </a>
                                      </@shiro.hasPermission>
                                    <span>这里是数据字典列表</span>
                                </div>
                                <table class="layui-table" id="dictionarytable" lay-filter="dictionarytable2"></table>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="layui-card-header">
                                     <@shiro.hasPermission name="/dictionary/add">
                                        <a id="addChild" class="layui-btn layui-btn-xs">
                                            <i class="layui-icon"></i>
                                            <span>新增</span>
                                        </a>
                                     </@shiro.hasPermission>
                                    <span>这里是数据字典的明细列表</span>
                                </div>
                                <table class="layui-table" id="dictionaryChildtable" lay-filter="dictionaryChildtable2"></table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>

        <div class="layui-tab-item">
            <blockquote class="layui-elem-quote">数据字典调用说明</blockquote>
            <pre class="layui-code">
    这里使用了自定义标签调用。
    调用方式：
      < @api target="dictionaryTag" i d="1">
          < #list outTagName as dic>
               < option value="$ {dic.value}" < #if img.swiperType == dic.value?number >selected< /#if> >$ {dic.text}< /option>
          < /#list>
      < /@api>
    target值：Spring容器的Bean的id值
    id值：为数据字典的id.
    要调用哪个数据字典，只需修改id值即可。
            </pre>
        </div>
</div>
    <input name="dictionaryTypeId" type="hidden">
    <script type="text/html" id="barDemo">
         <@shiro.hasPermission name="/dictionary/update">
        <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
        <@shiro.hasPermission name="/dictionary/del">
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
       </@shiro.hasPermission>
    </script>
    <script type="text/html" id="kaiguan">
        <input type="checkbox" value="{{ d.id }}" {{#  if(d.type == 1){ }} checked="" {{#  } }}  name="open" lay-skin="switch" lay-filter="ahType1" lay-text="开|关">
    </script>
    <script type="text/html" id="imgTpl">
        <img src="{{d.imgUrl}}" width="100px" height="50px" />
    </script>
    <script type="text/html" id="barDemo1">
        <@shiro.hasPermission name="/dictionary/update">
        <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
        <@shiro.hasPermission name="/dictionary/del">
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
        </@shiro.hasPermission>
    </script>
    <script src="${basePath}/js/jquery.js"></script>
    <script>

        layui.use(['form', 'layedit',  'element', 'layer','table','code'], function(){
            var form = layui.form, layer = layui.layer, element = layui.element,table = layui.table;
            var imagePlayerId;
            //让层自适应iframe
            $('#addDictionary').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/dictionary/goAdd',
                    area: ['400px', '300px'],
                    maxmin: true,
                    btnAlign: 'c',
                    btn: ['确认', '取消'],
                    yes: function(index, layero){
                        var body = layer.getChildFrame('body', index);
                        var name = body.find("input[name=\"name\"]").val();
                        var code = body.find("input[name=\"code\"]").val();
                        if(!$.trim(name)){
                            layui.layer.msg("名称不能为空",{icon: 5});
                            return false;
                        }
                        if(!$.trim(code)){
                            layui.layer.msg("编码不能为空",{icon: 5});
                            return false;
                        }
                        $.post("${basePath}/dictionary/add",{name:name,code:code},function (data) {
                            if(data.status!=200){
                                layer.alert(data.message, {icon: 2});
                            }
                            if(data.status==200){
                                layer.alert(data.message, {icon: 1},function (index) {
                                    layer.closeAll();
                                });

                            }
                        });

                    },
                    end: function () {
                        table.reload("dictionarytable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });
            $('#addChild').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/dictionary/goAddChild',
                    area: ['500px', '400px'],
                    maxmin: true,
                    end: function () {
                        table.reload("dictionaryChildtable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });

            //表格渲染
            table.render({
                elem: '#dictionarytable'
                ,url:'${basePath}/dictionary/getDictionaryPage'
                ,method:'post'
                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                ,cols: [[
                    {field:'id',align:'center', width:80,  title: 'ID'}
                    ,{field:'name',  title: '名称'}
                    ,{field:'code',  title: '编码'}
                    ,{field:'right',align:'center', width:165, toolbar: '#barDemo', title: '操作'}
                    ,{ width:1}

                ]]
            });
            //监听修改按钮
            table.on('tool(dictionarytable2)', function(obj){
                var data = obj.data;
                 if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/dictionary/goUpdate?id='+data.id,
                        area: ['400px', '300px'],
                        maxmin: true,
                        btnAlign: 'c',
                        btn: ['确认', '取消'],
                        yes: function(index, layero){
                            var body = layer.getChildFrame('body', index);
                            var name = body.find("input[name=\"name\"]").val();
                            var id = body.find("input[name=\"id\"]").val();
                            if(!$.trim(name)){
                                layui.layer.msg("名称不能为空",{icon: 5});
                                return false;
                            }
                            $.post("${basePath}/dictionary/update",{name:name,id:id},function (data) {
                                if(data.status!=200){
                                    layer.alert(data.message, {icon: 2});
                                }
                                if(data.status==200){
                                    layer.alert(data.message, {icon: 1},function (index) {
                                        layer.closeAll();
                                    });

                                }
                            });

                        },
                        end: function () {
                            table.reload("dictionarytable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/dictionary/del", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("dictionarytable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }
            });

            //监听child修改按钮
            table.on('tool(dictionaryChildtable2)', function(obj){
                var data = obj.data;
                 if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/dictionary/goUpdateChild?id='+data.id,
                        area: ['500px', '400px'],
                        maxmin: true,
                        end: function () {
                            table.reload("dictionaryChildtable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/dictionary/delChild", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("dictionaryChildtable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }
            });

            //监听行事件
            table.on('row(dictionarytable2)', function(obj){
                var data = obj.data;
                dictionaryTypeId = data.id;
                $("[name=\"dictionaryTypeId\"]").val(dictionaryTypeId);
                // obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
                table.render({
                    elem: '#dictionaryChildtable'
                    ,url:'${basePath}/dictionary/getDictionaryChildPage'
                    ,method:'post'
                    ,where:{dictionaryTypeId:data.id}
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                    ,cols: [[
                         {field:'sequence',  width:80,  title: '序号'}
                        ,{field:'text', title: '字典文本'}
                        ,{field:'value', title: '字典值'}
                        ,{field:'summary', title: '描述'}
                        ,{align:'center', width:120,toolbar: '#barDemo1', title: '操作' ,fixed:'right'}
                    ]]
                });
            });
        });
    </script>