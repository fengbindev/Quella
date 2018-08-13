
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员编辑</title>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/layui.css" id="layui">
    <link rel="stylesheet" href="${basePath}/plugins/layui-treeselect/src/css/ztree/metro/ztree.css" media="all"/>
    <link rel="stylesheet" href="${basePath}/plugins/layui-treeselect/src/css/treeselect.css" media="all"/>


</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">
        <input type="hidden" name="id" value="${user.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input name="nickname" value="${user.nickname}" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input name="email" value="${user.email}" lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input name="pswd"  placeholder="留空表示不修改密码" autocomplete="off" class="layui-input" type="password">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">添加角色</label>
            <div class="layui-input-block layui-input-treeselect" >
                <input type="text" name="rids" value="${selectvalue}" id="treeselect1" required lay-verify="required" autocomplete="off" placeholder="请选择角色"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="update">提交</button>
        </div>

    </form>

    <!--这里写页面的代码-->
</div>

<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kit-admin/layui.js"></script>
<script>
    layui.use(['form', 'layedit','table','laydate'], function(){
        var form = layui.form ,layer = layui.layer;
        var table = layui.table;

        //监听提交，发送请求
        form.on('submit(update)', function(data){
            console.log(data.field);
            if(!data.field.pswd){
            delete data.field.pswd;
        }
            $.post("${basePath}/user/update",data.field,function(data){
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
<script>
    layui.config({
        base: '/plugins/layui-treeselect/src/js/' //自定义组件的目录--相对路径
    }).use(['form', 'treeselect'], function () {
        var form = layui.form, treeselect = layui.treeselect;

        var data = [];
        $.ajax({
            async:false,
            type:"GET",
            url:"/role/getAllRole",
            dataType:"json",
            success:function (resule) {
                data = resule;
            }
        });

        //通过调用render方法进行渲染 [render支持链式调用]
        treeselect.render({ //渲染第一个
            elem: '#treeselect1', //这个设置必要为id属性且必须加上#号
            data: data
        });

    });
</script>
</body>
</html>
