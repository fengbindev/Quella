<style>
    .layui-table-cell{
        height: auto!important;
        white-space: normal;
    }
    .laytable-cell-1-url{
        height: 100%;
        max-width: 100%;
    }
    .layui-table img {
        max-width: 100px;
    }
</style>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title" style="left: 25px">
        <li class="layui-this">友情链接</li>
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
                                      <@shiro.hasPermission name="/link/add">
                                        <a id="addLink" class="layui-btn layui-btn-xs">
                                            <i class="layui-icon"></i>
                                            <span>新增</span>
                                        </a>
                                      </@shiro.hasPermission>
                                    <span>这里是友情链接列表</span>
                                </div>
                                <table class="layui-table" id="linktable" lay-filter="linktable2"></table>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="layui-card-header">
                                     <@shiro.hasPermission name="/link/add">
                                        <a id="addChild" class="layui-btn layui-btn-xs">
                                            <i class="layui-icon"></i>
                                            <span>新增</span>
                                        </a>
                                     </@shiro.hasPermission>
                                    <span>这里是友情链接的明细列表</span>
                                </div>
                                <table class="layui-table" id="linkChildtable" lay-filter="linkChildtable2"></table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>

        <div class="layui-tab-item">
            <blockquote class="layui-elem-quote">友情链接调用说明</blockquote>
            <pre class="layui-code">
    这里使用了自定义标签调用。
    调用方式：
       < @api target="linkTag" i d="1">
           < #list outTagName as link>
                                        < a href="$ {link.url}" target="_blank">$ {link.name}< /a>
           < /#list>
       < /@api>
    target值：Spring容器的Bean的id值
    id值：为友情链接的id.
    要调用哪个友情链接，只需修改id值即可。
            </pre>
        </div>
</div>
    <input name="linkGroupId" type="hidden">
    <script type="text/html" id="barDemo">
         <@shiro.hasPermission name="/link/update">
        <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
        <@shiro.hasPermission name="/link/del">
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
        <@shiro.hasPermission name="/link/update">
        <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
        <@shiro.hasPermission name="/link/del">
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
        </@shiro.hasPermission>
    </script>
    <script src="${basePath}/js/jquery.js"></script>
    <script>

        layui.use(['form', 'layedit',  'element', 'layer','table','code'], function(){
            var form = layui.form, layer = layui.layer, element = layui.element,table = layui.table;
            var imagePlayerId;
            //让层自适应iframe
            $('#addLink').on('click', function(){
                var index = layer.open({
                    title:'请输入名称',
                    type: 2,
                    content: '${basePath}/link/goAdd',
                    area: ['400px', '200px'],
                    maxmin: true,
                    btnAlign: 'c',
                    btn: ['确认', '取消'],
                    yes: function(index, layero){
                        var body = layer.getChildFrame('body', index);
                        var name = body.find("input[name=\"name\"]").val();
                        if(!$.trim(name)){
                            layui.layer.msg("名称不能为空",{icon: 5});
                            return false;
                        }
                        $.post("${basePath}/link/add",{name:name},function (data) {
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
                        table.reload("linktable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });
            $('#addChild').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/link/goAddChild',
                    area: ['700px', '500px'],
                    maxmin: true,
                    end: function () {
                        table.reload("linkChildtable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });

            //表格渲染
            table.render({
                elem: '#linktable'
                ,url:'${basePath}/link/getLinkPage'
                ,method:'post'
                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                ,cols: [[
                    {field:'id',align:'center', width:80,  title: 'ID'}
                    ,{field:'name',  title: '名称'}
                    ,{field:'right',align:'center', width:165, toolbar: '#barDemo', title: '操作'}
                    ,{ width:1}

                ]]
            });
            //监听修改按钮
            table.on('tool(linktable2)', function(obj){
                var data = obj.data;
                 if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/link/goUpdate?id='+data.id,
                        area: ['400px', '200px'],
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
                            $.post("${basePath}/link/update",{name:name,id:id},function (data) {
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
                            table.reload("linktable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/link/del", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("linktable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }
            });

            //监听child修改按钮
            table.on('tool(linkChildtable2)', function(obj){
                var data = obj.data;
                 if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/link/goUpdateChild?id='+data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("linkChildtable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/link/delChild", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("linkChildtable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }
            });

            //监听行事件
            table.on('row(linktable2)', function(obj){
                var data = obj.data;
                linkGroupId = data.id;
                $("[name=\"linkGroupId\"]").val(linkGroupId);
                // obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
                table.render({
                    elem: '#linkChildtable'
                    ,url:'${basePath}/link/getLinkChildPage'
                    ,method:'post'
                    ,where:{linkGroupId:data.id}
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                    ,cols: [[
                         {field:'imgUrl',  width:130,  title: '图片',templet:'#imgTpl'}
                        ,{field:'name',  width:120,title: '名称'}
                        ,{field:'url',align:'center', width:180,  title: '跳转地址'}
                        ,{align:'center', width:115, style:'height:70px',toolbar: '#barDemo1', title: '操作' ,fixed:'right'}
                    ]]
                });
            });
        });
    </script>