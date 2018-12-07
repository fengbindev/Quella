<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">定时任务管理</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                        <!-- <span>所有会员列表</span> -->
                         <@shiro.hasPermission name="/timetask/add">
                        <a id="add_hash" class="layui-btn layui-btn-xs">
                            <i class="layui-icon"></i>
                            <span>新增</span>
                        </a>
                         </@shiro.hasPermission>
                        <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary" id="rhqvf8w5t6q8">
                            <i class="layui-icon"></i>
                        </a>
                    </div>
                    <table class="layui-table" id="timetasktable" lay-filter="timetasktable2"></table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="barDemo">
        <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        {{#  if(d.jobStatus == 0){ }}
        <button class="layui-btn layui-btn-xs" lay-event="publish">发布</button>
        {{#  } }}

        {{#  if(d.jobStatus == 1){ }}
        {{#  if(d.planStatus == 'NONE'){ }}
        <button class="layui-btn layui-btn-xs" lay-event="plan">计划</button>
        {{#  } }}

        {{#  if(d.planStatus == 'NORMAL'){ }}
        <button class="layui-btn layui-btn-xs" lay-event="runAJobNow">立即执行</button>
        <button class="layui-btn layui-btn-xs" lay-event="pauseJob">暂停</button>
        <button class="layui-btn layui-btn-xs layui-btn-danger" lay-event="deleteJob">移除</button>
        {{#  } }}

        {{#  if(d.planStatus == 'PAUSED'){ }}
        <button class="layui-btn layui-btn-xs" lay-event="runAJobNow">立即执行</button>
        <button class="layui-btn layui-btn-xs" lay-event="resumeJob">恢复</button>
        <button class="layui-btn layui-btn-xs layui-btn-danger" lay-event="deleteJob">移除</button>
        {{#  } }}

        {{#  if(d.planStatus == 'COMPLETE'){ }}
        <button class="layui-btn layui-btn-xs" lay-event="runAJobNow">立即执行</button>
        {{#  } }}

        {{#  if(d.planStatus == 'BLOCKED'){ }}
        <button class="layui-btn layui-btn-xs" lay-event="runAJobNow">立即执行</button>
        {{#  } }}

        {{#  } }}
    </script>
    <script>
        layui.use(['jquery', 'layer', 'table'], function () {
            var layer = layui.layer, table = layui.table;
            //让层自适应iframe
            $('#add_hash').on('click', function () {
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/timetask/goAdd',
                    area: ['800px', '500px'],
                    maxmin: true,
                    end: function () {
                        table.reload("timetasktable", {});
                    }
                });
                parent.layer.iframeAuto(index);
            });
            //表格渲染
            table.render({
                elem: '#timetasktable'
                , url: '${basePath}/timetask/getTimeTaskPageInfo'
                , method: 'post'
                , page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                , cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                , cols: [[
                    {field: 'name',width:120, title: '任务名'}
                    , {field: 'groupName',width:80, title: '任务组'}
                    , {field: 'cron', title: 'cron表达式'}
                    , {
                        field: 'jobStatus', title: '任务状态', templet: function (d) {
                            if (d.jobStatus == 1) return "<span class=\"layui-badge layui-bg-green\">已发布</span>";
                            else return "<span class=\"layui-badge\">未发布</span>";
                        }
                    }
                    , {field: 'planStatus', title: '计划状态',templet: function (d) {
                            if (d.planStatus == "NONE") return "<span class=\"layui-badge\">未计划</span>";
                            if (d.planStatus == "NORMAL") return "<span class=\"layui-badge layui-bg-green\">正常运行</span>";
                            if (d.planStatus == "PAUSED") return "<span class=\"layui-badge layui-bg-gray\">已暂停</span>";
                            if (d.planStatus == "COMPLETE") return "<span class=\"layui-badge layui-bg-orange\">任务执行中</span>";
                            if (d.planStatus == "BLOCKED") return "<span class=\"layui-badge layui-bg-black\">线程堵塞</span>";
                            if (d.planStatus == "ERROR") return "<span class=\"layui-badge\">错误</span>";
                            else return "<span class=\"layui-badge\">未计划</span>";

                        }
                    }
                    , {field: 'methodName', title: '执行方法'}
                    , {field: 'beanName', width: 200, title: 'bean实例'}
                    , {field: 'right', align: 'center', width: 250, toolbar: '#barDemo', title: '操作'}
                ]]
            });

            //监听修改按钮
            table.on('tool(timetasktable2)', function (obj) {
                var data = obj.data;
                if (obj.event === 'edit') {
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/timetask/goUpdate?id=' + data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("timetasktable", {});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if (obj.event === 'del') {  //删除
                    layer.confirm('真的要删除么？', function (index) {
                        // 写删除方法
                        $.post("${basePath}/timetask/del", {"id": data.id}, function (data) {
                            resultMessage(data);
                        });
                    });
                }else if(obj.event === 'publish'){
                    $.post("${basePath}/timetask/publishJob",{"id": data.id},function (data) {
                        resultMessage(data);
                    });
                } else if (obj.event === 'plan'){ // 添加计划
                    $.post("${basePath}/timetask/addTtask2job",{"id": data.id},function (data) {
                        resultMessage(data);
                    });
                }else if (obj.event === 'runAJobNow'){ // 立即执行
                    $.post("${basePath}/timetask/runAJobNow",{"id": data.id},function (data) {
                        resultMessage(data);
                    });
                } else if (obj.event === 'pauseJob'){ // 暂停
                    $.post("${basePath}/timetask/pauseJob",{"id": data.id},function (data) {
                        resultMessage(data);
                    });
                } else if (obj.event === 'resumeJob'){ // 恢复
                    $.post("${basePath}/timetask/resumeJob",{"id": data.id},function (data) {
                        resultMessage(data);
                    });
                }else if (obj.event === 'deleteJob'){ // 移除
                    $.post("${basePath}/timetask/deleteJob",{"id": data.id},function (data) {
                        resultMessage(data);
                    });
                }
            });

        });
        function resultMessage(data) {
            var table = layui.table;
            if (data.status == 200) {
                table.reload("timetasktable", {});
                layer.msg(data.message, {icon: 1, time: 1000});
                // 前端修改
                layer.close(index);
            } else {
                layer.msg(data.message, {icon: 0, time: 1000});
                layer.close(index);
            }
        }

    </script>