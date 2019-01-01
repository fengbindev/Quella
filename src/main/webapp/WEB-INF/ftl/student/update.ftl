<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>student编辑</title>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/layui.css" id="layui">
</head>
<body>
<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
                <label class="layui-form-label">id</label>
                <div class="layui-input-block">
                    <input type="text" name="id" value="${(student.id)!}" id="id_hash" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" value="${(student.title)!}" id="title_hash" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <input type="text" name="remark" value="${(student.remark)!}" id="remark_hash" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">创建时间</label>
                <div class="layui-input-block">
                    <input type="text" name="createDate" value="${(student.createDate)!?datetime}" id="createDate_hash" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">更新时间</label>
                <div class="layui-input-block">
                    <input type="text" name="updateDate" value="${(student.updateDate)!?datetime}" id="updateDate_hash" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">创建者</label>
                <div class="layui-input-block">
                    <input type="text" name="createBy" value="${(student.createBy)!}" id="createBy_hash" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">更新者</label>
                <div class="layui-input-block">
                    <input type="text" name="updateBy" value="${(student.updateBy)!}" id="updateBy_hash" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">数据状态</label>
                <div class="layui-input-block">
                    <input type="text" name="status" value="${(student.status)!}" id="status_hash" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
        </div>

        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="update">提交</button>
        </div>
    </form>
    </form>
</div>
<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kitadmin/layui.js"></script>
<script>
    layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var form = layui.form;
        //执行一个laydate实例
        laydate.render({elem: '#createDate_hash',type: 'datetime'});
        laydate.render({elem: '#updateDate_hash',type: 'datetime'});
        //监听提交，发送请求
        form.on('submit(update)', function(data){

            $.post("${basePath}/student/update",data.field,function(data){
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
