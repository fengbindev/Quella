<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">student</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                         <@shiro.hasPermission name="/student/add">
                        <a id="add" class="layui-btn layui-btn-xs">
                            <i class="layui-icon"></i>
                            <span>新增</span>
                        </a>
                         </@shiro.hasPermission>
                        <div class="layui-inline" style="float: right">
                            <div class="layui-input-inline" id="search__from_hash">
                                <input name="id"  placeholder="请输入id"  autocomplete="off" class="layui-input" type="text">
                            </div>
                                <input name="title"  placeholder="请输入标题"  autocomplete="off" class="layui-input" type="text">
                            </div>
                                <input name="remark"  placeholder="请输入备注"  autocomplete="off" class="layui-input" type="text">
                            </div>
                                <input name="createDate"  placeholder="请输入创建时间"  autocomplete="off" class="layui-input" type="text">
                            </div>
                                <input name="updateDate"  placeholder="请输入更新时间"  autocomplete="off" class="layui-input" type="text">
                            </div>
                                <input name="createBy"  placeholder="请输入创建者"  autocomplete="off" class="layui-input" type="text">
                            </div>
                                <input name="updateBy"  placeholder="请输入更新者"  autocomplete="off" class="layui-input" type="text">
                            </div>
                                <input name="status"  placeholder="请输入数据状态"  autocomplete="off" class="layui-input" type="text">
                            </div>
                            <button class="layui-btn layui-btn-primary" onclick="search()">搜索</button>
                        </div>
                    </div>
                    <table class="layui-table" id="studenttable" lay-filter="studenttable2"></table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="indexTpl">
        {{d.LAY_TABLE_INDEX+1}}
    </script>
    <script type="text/html" id="barDemo">
        <@shiro.hasPermission name="/student/update">
       <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
       <@shiro.hasPermission name="/student/del">
       <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
       </@shiro.hasPermission>
    </script>
    <script>
        layui.use(['jquery', 'layer', 'table'], function () {
          var layer = layui.layer,table = layui.table;
            //让层自适应iframe
            $('#add').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/student/goAdd',
                    area: ['600px', '600px'],
                    maxmin: true,
                    end: function () {
                        table.reload("studenttable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });
            //表格渲染
            table.render({
                elem: '#studenttable'
                ,url:'${basePath}/student/getStudentPage'
                ,method:'post'
                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'',align:'center', width:70,  title: '序号', toolbar: '#indexTpl'}
                    ,{field:'right',align:'center', width:150, toolbar: '#barDemo', title: '操作'}
                ]]
            });

            //监听修改按钮
            table.on('tool(studenttable2)', function(obj){
                var data = obj.data;
                if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/student/goUpdate?id='+data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("studenttable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/student/del", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("studenttable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }
            });
        });

        //监听搜索按钮点击事件
        function search(){
        var search = {};
        $('#search__from_hash').find("input[name]").each(function (key, item) {
             search[$(item).attr('name')] = $(item).val();
        })
            var table = layui.table;
            table.reload('studenttable', {
                where: search
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        }
    </script>
