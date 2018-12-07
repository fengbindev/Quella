
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>定时任务添加</title>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/layui.css" id="layui">
</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">任务组</label>
            <div class="layui-input-block">
                <input name="groupName" lay-verify="required" placeholder="请输入任务组" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">任务名称</label>
            <div class="layui-input-block">
                <input name="name" lay-verify="required" placeholder="请输入任务名称" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">任务描述</label>
            <div class="layui-input-block">
                <input name="description" lay-verify="required" placeholder="请输入任务描述" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">cron</label>
            <div class="layui-input-block">
                <input name="cron" lay-verify="required" placeholder="请输入cron表达式" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">bean实例</label>
            <div class="layui-input-block">
                <input name="beanName" lay-verify="required" placeholder="请输入bean实例" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">方法名</label>
            <div class="layui-input-block">
                <input name="methodName" lay-verify="required" placeholder="请输入方法名" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-block">
                <input type="text" id="test1" name="startTime" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-block">
                <input type="text" id="test2" name="endTime" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="add">提交</button>
        </div>

    </form>

    <!--这里写页面的代码-->
</div>

<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kitadmin/layui.js"></script>
<script>
    layui.use(['form', 'layedit','table','laydate'], function(){
        var laydate = layui.laydate;
        var form = layui.form ,layer = layui.layer;
        var table = layui.table;
        laydate.render({
            elem: '#test1' //指定元素
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#test2' //指定元素
            ,type: 'datetime'
        });
        //监听提交，发送请求
        form.on('submit(add)', function(data){
            $.post("${basePath}/timetask/add",data.field,function(data){
                // 获取 session
                if(data.status!=200){
                    layer.alert(data.message, {offset: 't',icon: 2});
                }
                if(data.status==200){
                    layer.alert(data.message, {offset: 't',icon: 1},function (index) {
                       layer.close(index);
                        var index2 = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index2);
                    });

                }
            });
            return false;
        });

    });
</script>
</body>
</html>
