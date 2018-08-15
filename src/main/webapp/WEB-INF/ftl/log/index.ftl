<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">系统日志</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                        <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary" id="rhqvf8w5t6q8">
                            <i class="layui-icon"></i>
                        </a>
                    </div>
                    <table class="layui-table" id="systemLogtable" lay-filter="systemLogtable2"></table>
                </div>
            </div>
        </div>
    </div>

    <script>
        layui.use(['jquery', 'layer', 'table'], function () {
          var layer = layui.layer,table = layui.table;
            //让层自适应iframe
            $('#add').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/systemLog/goAdd',
                    area: ['800px', '500px'],
                    maxmin: true,
                    end: function () {
                        table.reload("systemLogtable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });
          //表格渲染
            table.render({
                elem: '#systemLogtable'
                ,url:'${basePath}/systemLog/getSystemLogPage'
                ,method:'post'
                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                  {field:'clientIp',  title: '客户端IP'}
                    ,{field:'uri',  title: '请求地址'}
                    ,{field:'type',  title: '请求类型'}
                    ,{field:'method',  title: '请求方法'}
                    ,{field:'paramDara',  title: '请求参数'}
                    ,{field:'sessionId',  title: 'sessionId'}
                    ,{field:'time',  title: '请求发送时间'}
                    ,{field:'returnTime',  title: '请求结束时间'}
                    ,{field:'returnData',  title: '返回数据'}
                    ,{field:'httpStatusCode',  title: '状态码'}
                    ,{field:'timeConsuming',  title: '消耗时间(毫米)'}

                ]]
            });

            //监听修改按钮
            table.on('tool(systemLogtable2)', function(obj){
                var data = obj.data;
                if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/systemLog/goUpdate?id='+data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("systemLogtable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/systemLog/del", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("systemLogtable",{});
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