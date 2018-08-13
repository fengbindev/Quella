<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">管理员管理</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                         <@shiro.hasPermission name="/user/add">
                        <a id="add" class="layui-btn layui-btn-xs">
                            <i class="layui-icon"></i>
                            <span>新增</span>
                        </a>
                         </@shiro.hasPermission>
                        <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary" id="rhqvf8w5t6q8">
                            <i class="layui-icon"></i>
                        </a>
                    </div>
                    <table class="layui-table" id="usertable" lay-filter="usertable2"></table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="indexTpl">
        {{d.LAY_TABLE_INDEX+1}}
    </script>
    <script type="text/html" id="kaiguan">
        <input type="checkbox" value="{{ d.id }}" {{# if(d.status== 1){ }} checked="" {{# } }} name="open"
               lay-skin="switch" lay-filter="ahType" lay-text="开|关">
    </script>
    <script type="text/html" id="barDemo">
        <@shiro.hasPermission name="/user/update">
       <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
       <@shiro.hasPermission name="/user/del">
       <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
       </@shiro.hasPermission>
    </script>
    <script>
        layui.use(['jquery','form','layer', 'table'], function () {
            var layer = layui.layer,table = layui.table,form = layui.form;
            //让层自适应iframe
            $('#add').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/user/goAdd',
                    area: ['500px', '500px'],
                    maxmin: true,
                    end: function () {
                        table.reload("usertable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });
            //表格渲染
            table.render({
                elem: '#usertable'
                ,url:'${basePath}/user/getUserPage'
                ,method:'post'
                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'',align:'center', width:70,  title: '序号', toolbar: '#indexTpl'}
                    ,{field:'nickname',  title: '用户昵称'}
                    ,{field:'email',  title: '邮箱'}
                    ,{field:'createTime',  title: '创建时间'}
                    ,{field:'lastLoginTime',  title: '最近登录'}
                    , {field: 'ahType', align: 'center', width: 120, toolbar: '#kaiguan', title: '是否允许登录'}
                    ,{field:'right',align:'center', width:150, toolbar: '#barDemo', title: '操作'}
                ]]
            });

            // 监听开关事件
            form.on('switch(ahType)', function (data) {
                var a = data.elem.checked;
                var b = 0;
                var id = data.value;
                if (a) {
                    b = 1;
                } else {
                    b = 2;
                }
                // 开关方法
                $.post("${basePath}/user/updateType", {"id": id, "status": b}, function (data) {
                    if (data.status == 200) {
                        layer.msg(data.message, {icon: 1, time: 1000});
                    } else {
                        layer.msg(data.message, {icon: 0, time: 1000});
                    }
                });

            });
            //监听修改按钮
            table.on('tool(usertable2)', function(obj){
                var data = obj.data;
                if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/user/goUpdate?id='+data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("usertable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/user/del", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("usertable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }
            });
        });
    </script>