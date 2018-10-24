
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>字典明细添加</title>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/layui.css" id="layui">
    
</head>
<body>

<div class="kit-doc">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;序号</label>
            <div class="layui-input-block">
                <input name="sequence" lay-verify="required|number" placeholder="请输入名称" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;字典文本</label>
            <div class="layui-input-block">
                <input name="text" lay-verify="required" placeholder="请输入字典文本" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;字典值</label>
            <div class="layui-input-block">
                <input name="value" lay-verify="required" placeholder="请输入字典值" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <input name="summary"  placeholder="请输描述" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="add">提交</button>
            </div>
        </div>
    </form>
    </form>
</div>

<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kitadmin/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'element', 'layer', 'upload'], function(){
        var form = layui.form,
                layer = layui.layer,
                element = layui.element,
                upload = layui.upload;


        //监听提交，发送请求
        form.on('submit(add)', function(data){
            data.field.typeId =  parent.$("[name=\"dictionaryTypeId\"]").val();
            $.post("${basePath}/dictionary/addChild",data.field,function(data){
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
