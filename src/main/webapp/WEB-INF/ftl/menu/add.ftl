
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>菜单添加</title>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/layui.css" id="layui">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css">

</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">

        <div class="layui-form-item">
            <label class="layui-form-label">链接标题</label>
            <div class="layui-input-block">
                <input name="title" lay-verify="required" placeholder="请输入菜单标题" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-block">
                <input onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="4" size="4"  name="sequence" lay-verify="required" placeholder="请输入序号，越大越靠前" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item" pane="">
            <label class="layui-form-label">是否顶级</label>
            <div class="layui-input-block">
                <input name="isFu" value="1" lay-filter="isFu" title="是" checked="" type="radio">
                <input name="isFu" value="2" lay-filter="isFu" title="否" type="radio">
            </div>
        </div>

        <div class="layui-form-item" id="isFu" style="display: none">
            <label class="layui-form-label">上级类目</label>
            <div class="layui-input-block">
                <select name="parentId" lay-filter="aihao">
                    <#list menus as menu>
                        <option value="${menu.id}">${menu.title}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" >菜单权限名称</label>
            <div class="layui-input-inline">
                <input name="permission.name" lay-verify="required" placeholder="请输入权限名称" autocomplete="off" class="layui-input" type="text">
            </div>
            <div class="layui-form-mid layui-word-aux">添加菜单时，也必须添加菜单权限</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">链接地址</label>
            <div class="layui-input-block">
                <input name="url" lay-verify="required" placeholder="请输入 Action 地址" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <style>
            .tubiao{font-size: 20px;margin-left:-20px;height: 34px;line-height: 34px;position: absolute;margin-top: 3px}
        </style>
        <!--这里写页面的代码-->
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">图标</label>
            <div class="layui-input-block">
                <input name="icon" value="xe68e" checked title=" " type="radio"><i class="layui-icon tubiao">&#xe68e;</i>
                <input name="icon" value="xe6c6" title=" " type="radio"><i class="layui-icon tubiao">&#xe6c6;</i>
                <input name="icon" value="xe6c5" title=" " type="radio"><i class="layui-icon tubiao">&#xe6c5;</i>
                <input name="icon" value="xe662" title=" " type="radio"><i class="layui-icon tubiao">&#xe662;</i>
                <input name="icon" value="xe661" title=" " type="radio"><i class="layui-icon tubiao">&#xe661;</i>
                <input name="icon" value="xe660" title=" " type="radio"><i class="layui-icon tubiao">&#xe660;</i>
                <input name="icon" value="xe65d" title=" " type="radio"><i class="layui-icon tubiao">&#xe65d;</i>

                <input name="icon" value="xe65f" title=" " type="radio"><i class="layui-icon tubiao">&#xe65f;</i>
                <input name="icon" value="xe671" title=" " type="radio"><i class="layui-icon tubiao">&#xe671;</i>
                <input name="icon" value="xe65c" title=" " type="radio"><i class="layui-icon tubiao">&#xe65c;</i>
                <input name="icon" value="xe756" title=" " type="radio"><i class="layui-icon tubiao">&#xe756;</i>
                <input name="icon" value="xe735" title=" " type="radio"><i class="layui-icon tubiao">&#xe735;</i>
                <input name="icon" value="xe65e" title=" " type="radio"><i class="layui-icon tubiao">&#xe65e;</i>
                <input name="icon" value="xe659" title=" " type="radio"><i class="layui-icon tubiao">&#xe659;</i>

                <input name="icon" value="xe715" title=" " type="radio"><i class="layui-icon tubiao">&#xe715;</i>
                <input name="icon" value="xe705" title=" " type="radio"><i class="layui-icon tubiao">&#xe705;</i>
                <input name="icon" value="xe6b2" title=" " type="radio"><i class="layui-icon tubiao">&#xe6b2;</i>
                <input name="icon" value="xe6af" title=" " type="radio"><i class="layui-icon tubiao">&#xe6af;</i>
                <input name="icon" value="xe69c" title=" " type="radio"><i class="layui-icon tubiao">&#xe69c;</i>
                <input name="icon" value="xe698" title=" " type="radio"><i class="layui-icon tubiao">&#xe698;</i>
                <input name="icon" value="xe657" title=" " type="radio"><i class="layui-icon tubiao">&#xe657;</i>

                <input name="icon" value="xe658" title=" " type="radio"><i class="layui-icon tubiao">&#xe658;</i>
                <input name="icon" value="xe65a" title=" " type="radio"><i class="layui-icon tubiao">&#xe65a;</i>
                <input name="icon" value="xe65b" title=" " type="radio"><i class="layui-icon tubiao">&#xe65b;</i>
                <input name="icon" value="xe681" title=" " type="radio"><i class="layui-icon tubiao">&#xe681;</i>
                <input name="icon" value="xe67c" title=" " type="radio"><i class="layui-icon tubiao">&#xe67c;</i>
                <input name="icon" value="xe7a0" title=" " type="radio"><i class="layui-icon tubiao">&#xe7a0;</i>
                <input name="icon" value="xe857" title=" " type="radio"><i class="layui-icon tubiao">&#xe857;</i>

                <input name="icon" value="xe652" title=" " type="radio"><i class="layui-icon tubiao">&#xe652;</i>
                <input name="icon" value="xe651" title=" " type="radio"><i class="layui-icon tubiao">&#xe651;</i>
                <input name="icon" value="xe6fc" title=" " type="radio"><i class="layui-icon tubiao">&#xe6fc;</i>
                <input name="icon" value="xe6ed" title=" " type="radio"><i class="layui-icon tubiao">&#xe6ed;</i>
                <input name="icon" value="xe688" title=" " type="radio"><i class="layui-icon tubiao">&#xe688;</i>
                <input name="icon" value="xe645" title=" " type="radio"><i class="layui-icon tubiao">&#xe645;</i>
                <input name="icon" value="xe611" title=" " type="radio"><i class="layui-icon tubiao">&#xe611;</i>

                <input name="icon" value="xe614" title=" " type="radio"><i class="layui-icon tubiao">&#xe614;</i>
                <input name="icon" value="xe60f" title=" " type="radio"><i class="layui-icon tubiao">&#xe60f;</i>
                <input name="icon" value="xe615" title=" " type="radio"><i class="layui-icon tubiao">&#xe615;</i>
                <input name="icon" value="xe641" title=" " type="radio"><i class="layui-icon tubiao">&#xe641;</i>

                <input name="icon" value="xe620" title=" " type="radio"><i class="layui-icon tubiao">&#xe620;</i>
                <input name="icon" value="xe628" title=" " type="radio"><i class="layui-icon tubiao">&#xe628;</i>
                <input name="icon" value="x1006" title=" " type="radio"><i class="layui-icon tubiao">&#x1006;</i>
                <input name="icon" value="x1007" title=" " type="radio"><i class="layui-icon tubiao">&#x1007;</i>
                <input name="icon" value="xe629" title=" " type="radio"><i class="layui-icon tubiao">&#xe629;</i>
                <input name="icon" value="xe600" title=" " type="radio"><i class="layui-icon tubiao">&#xe600;</i>
                <input name="icon" value="xe617" title=" " type="radio"><i class="layui-icon tubiao">&#xe617;</i>

                <input name="icon" value="xe606" title=" " type="radio"><i class="layui-icon tubiao">&#xe606;</i>
                <input name="icon" value="xe609" title=" " type="radio"><i class="layui-icon tubiao">&#xe609;</i>
                <input name="icon" value="xe60a" title=" " type="radio"><i class="layui-icon tubiao">&#xe60a;</i>
                <input name="icon" value="xe62c" title=" " type="radio"><i class="layui-icon tubiao">&#xe62c;</i>
                <input name="icon" value="x1005" title=" " type="radio"><i class="layui-icon tubiao">&#x1005;</i>
                <input name="icon" value="xe61b" title=" " type="radio"><i class="layui-icon tubiao">&#xe61b;</i>
                <input name="icon" value="xe610" title=" " type="radio"><i class="layui-icon tubiao">&#xe610;</i>

                <input name="icon" value="xe602" title=" " type="radio"><i class="layui-icon tubiao">&#xe602;</i>
                <input name="icon" value="xe603" title=" " type="radio"><i class="layui-icon tubiao">&#xe603;</i>
                <input name="icon" value="xe62d" title=" " type="radio"><i class="layui-icon tubiao">&#xe62d;</i>
                <input name="icon" value="xe62e" title=" " type="radio"><i class="layui-icon tubiao">&#xe62e;</i>
                <input name="icon" value="xe62f" title=" " type="radio"><i class="layui-icon tubiao">&#xe62f;</i>
                <input name="icon" value="xe61f" title=" " type="radio"><i class="layui-icon tubiao">&#xe61f;</i>
                <input name="icon" value="xe601" title=" " type="radio"><i class="layui-icon tubiao">&#xe601;</i>

                <input name="icon" value="xe630" title=" " type="radio"><i class="layui-icon tubiao">&#xe630;</i>
                <input name="icon" value="xe631" title=" " type="radio"><i class="layui-icon tubiao">&#xe631;</i>
                <input name="icon" value="xe654" title=" " type="radio"><i class="layui-icon tubiao">&#xe654;</i>
                <input name="icon" value="xe642" title=" " type="radio"><i class="layui-icon tubiao">&#xe642;</i>
                <input name="icon" value="xe640" title=" " type="radio"><i class="layui-icon tubiao">&#xe640;</i>
                <input name="icon" value="xe61a" title=" " type="radio"><i class="layui-icon tubiao">&#xe61a;</i>
                <input name="icon" value="xe621" title=" " type="radio"><i class="layui-icon tubiao">&#xe621;</i>

                <input name="icon" value="xe632" title=" " type="radio"><i class="layui-icon tubiao">&#xe632;</i>
                <input name="icon" value="xe618" title=" " type="radio"><i class="layui-icon tubiao">&#xe618;</i>
                <input name="icon" value="xe608" title=" " type="radio"><i class="layui-icon tubiao">&#xe608;</i>
                <input name="icon" value="xe633" title=" " type="radio"><i class="layui-icon tubiao">&#xe633;</i>
                <input name="icon" value="xe61c" title=" " type="radio"><i class="layui-icon tubiao">&#xe61c;</i>
                <input name="icon" value="xe634" title=" " type="radio"><i class="layui-icon tubiao">&#xe634;</i>
                <input name="icon" value="xe607" title=" " type="radio"><i class="layui-icon tubiao">&#xe607;</i>

                <input name="icon" value="xe635" title=" " type="radio"><i class="layui-icon tubiao">&#xe635;</i>
                <input name="icon" value="xe636" title=" " type="radio"><i class="layui-icon tubiao">&#xe616;</i>
                <input name="icon" value="xe60b" title=" " type="radio"><i class="layui-icon tubiao">&#xe60b;</i>
                <input name="icon" value="xe619" title=" " type="radio"><i class="layui-icon tubiao">&#xe619;</i>
                <input name="icon" value="xe637" title=" " type="radio"><i class="layui-icon tubiao">&#xe637;</i>
                <input name="icon" value="xe61d" title=" " type="radio"><i class="layui-icon tubiao">&#xe61d;</i>
                <input name="icon" value="xe604" title=" " type="radio"><i class="layui-icon tubiao">&#xe604;</i>

                <input name="icon" value="xe612" title=" " type="radio"><i class="layui-icon tubiao">&#xe612;</i>
                <input name="icon" value="xe605" title=" " type="radio"><i class="layui-icon tubiao">&#xe605;</i>
                <input name="icon" value="xe638" title=" " type="radio"><i class="layui-icon tubiao">&#xe638;</i>
                <input name="icon" value="xe60c" title=" " type="radio"><i class="layui-icon tubiao">&#xe60c;</i>
                <input name="icon" value="xe616" title=" " type="radio"><i class="layui-icon tubiao">&#xe616;</i>
                <input name="icon" value="xe613" title=" " type="radio"><i class="layui-icon tubiao">&#xe613;</i>
                <input name="icon" value="xe61e" title=" " type="radio"><i class="layui-icon tubiao">&#xe61e;</i>

                <input name="icon" value="xe60d" title=" " type="radio"><i class="layui-icon tubiao">&#xe60d;</i>
                <input name="icon" value="xe64c" title=" " type="radio"><i class="layui-icon tubiao">&#xe64c;</i>
                <input name="icon" value="xe60e" title=" " type="radio"><i class="layui-icon tubiao">&#xe60e;</i>
                <input name="icon" value="xe622" title=" " type="radio"><i class="layui-icon tubiao">&#xe622;</i>
                <input name="icon" value="xe64f" title=" " type="radio"><i class="layui-icon tubiao">&#xe64f;</i>
                <input name="icon" value="xe64d" title=" " type="radio"><i class="layui-icon tubiao">&#xe64d;</i>
                <input name="icon" value="xe639" title=" " type="radio"><i class="layui-icon tubiao">&#xe639;</i>

                <input name="icon" value="xe623" title=" " type="radio"><i class="layui-icon tubiao">&#xe623;</i>
                <input name="icon" value="xe63f" title=" " type="radio"><i class="layui-icon tubiao">&#xe63f;</i>
                <input name="icon" value="xe643" title=" " type="radio"><i class="layui-icon tubiao">&#xe643;</i>
                <input name="icon" value="xe647" title=" " type="radio"><i class="layui-icon tubiao">&#xe647;</i>
                <input name="icon" value="xe648" title=" " type="radio"><i class="layui-icon tubiao">&#xe648;</i>
                <input name="icon" value="xe649" title=" " type="radio"><i class="layui-icon tubiao">&#xe649;</i>
                <input name="icon" value="xe626" title=" " type="radio"><i class="layui-icon tubiao">&#xe626;</i>

                <input name="icon" value="xe627" title=" " type="radio"><i class="layui-icon tubiao">&#xe627;</i>
                <input name="icon" value="xe62b" title=" " type="radio"><i class="layui-icon tubiao">&#xe62b;</i>
                <input name="icon" value="xe63a" title=" " type="radio"><i class="layui-icon tubiao">&#xe63a;</i>
                <input name="icon" value="xe624" title=" " type="radio"><i class="layui-icon tubiao">&#xe624;</i>
                <input name="icon" value="xe63b" title=" " type="radio"><i class="layui-icon tubiao">&#xe63b;</i>
                <input name="icon" value="xe650" title=" " type="radio"><i class="layui-icon tubiao">&#xe650;</i>
                <input name="icon" value="xe64b" title=" " type="radio"><i class="layui-icon tubiao">&#xe64b;</i>

                <input name="icon" value="xe63c" title=" " type="radio"><i class="layui-icon tubiao">&#xe63c;</i>
                <input name="icon" value="xe62a" title=" " type="radio"><i class="layui-icon tubiao">&#xe62a;</i>
                <input name="icon" value="xe64e" title=" " type="radio"><i class="layui-icon tubiao">&#xe64e;</i>
                <input name="icon" value="xe646" title=" " type="radio"><i class="layui-icon tubiao">&#xe646;</i>
                <input name="icon" value="xe625" title=" " type="radio"><i class="layui-icon tubiao">&#xe625;</i>
                <input name="icon" value="xe64a" title=" " type="radio"><i class="layui-icon tubiao">&#xe64a;</i>
                <input name="icon" value="xe644" title=" " type="radio"><i class="layui-icon tubiao">&#xe644;</i>

            </div>
        </div>

        <div class="layui-form-item" pane="">
            <label class="layui-form-label">允许修改</label>
            <div class="layui-input-block">
                <input name="systemMenu" value="1" title="允许" checked="" type="radio">
                <input name="systemMenu" value="2" title="不允许" type="radio">
            </div>
        </div>

        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="add">提交</button>
        </div>

    </form>

    <!--这里写页面的代码-->
</div>

<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kit-admin/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        // 监听是不是父级元素
        form.on('radio(isFu)', function(data){
            if(data.value==1){
                $('#isFu').css('display','none');
            }else{
                $('#isFu').css('display','block');
            }
            return false;
        });

        //监听提交，发送请求
        form.on('submit(add)', function(data){
            if (data.field.isFu == 1){
                data.field.parentId=null;
            }
            $.post("${basePath}/menu/add",data.field,function(data){
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
