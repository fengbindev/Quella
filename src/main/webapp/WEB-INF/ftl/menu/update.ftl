
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>菜单编辑</title>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/layui.css" id="layui">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>


</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">
        <input name="id" value="${menu.id}" hidden="hidden"/>
        <input name="permission.id" value="${menu.permission.id}" hidden="hidden"/>
        <div class="layui-form-item">
            <label class="layui-form-label">链接标题</label>
            <div class="layui-input-block">
                <input name="title" value="${menu.title}" lay-verify="required" placeholder="请输入菜单标题" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-block">
                <input onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="4" size="4"  name="sequence" value="${menu.sequence}" lay-verify="required" placeholder="请输入序号，越大越靠前" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item" pane="">
            <label class="layui-form-label">是否顶级</label>
            <div class="layui-input-block">
                <input name="isFu" value="1" lay-filter="isFu" title="是" disabled="" <#if !menu.parentId??>checked="" </#if> type="radio">
                <input name="isFu" value="2" lay-filter="isFu" title="否" disabled="" <#if menu.parentId??>checked="" </#if> type="radio">
            </div>
        </div>

        <#if menu.parentId??>
        <div class="layui-form-item" id="isFu">
            <label class="layui-form-label">上级类目</label>
            <div class="layui-input-block">
                <select name="parentId" lay-filter="aihao">
                    <#list menus as m>
                        <option value="${m.id}" <#if m.id==menu.parentId> selected="" </#if>>${m.title}</option>
                    </#list>
                </select>
            </div>
        </div>
        </#if>
        <div class="layui-form-item">
            <label class="layui-form-label" >菜单权限名称</label>
            <div class="layui-input-inline">
                <input name="permission.name" value="${menu.permission.name}" lay-verify="required" placeholder="请输入权限名称" autocomplete="off" class="layui-input" type="text">
            </div>
            <div class="layui-form-mid layui-word-aux">添加菜单时，也必须添加菜单权限</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">链接地址</label>
            <div class="layui-input-block">
                <input name="url" value="${menu.url}" lay-verify="required" placeholder="请输入 Action 地址" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <style>
            .tubiao{font-size: 20px;margin-left:-20px;height: 34px;line-height: 34px;position: absolute;margin-top: 3px}
        </style>
        <!--这里写页面的代码-->
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">图标</label>
            <div class="layui-input-block">
                <input name="icon" value="xe68e" <#if menu.icon == "&#xe68e;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe68e;</i>
                <input name="icon" value="xe6c6" <#if menu.icon == "&#xe6c6;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe6c6;</i>
                <input name="icon" value="xe6c5" <#if menu.icon == "&#xe6c5;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe6c5;</i>
                <input name="icon" value="xe662" <#if menu.icon == "&#xe662;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe662;</i>
                <input name="icon" value="xe661" <#if menu.icon == "&#xe661;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe661;</i>
                <input name="icon" value="xe660" <#if menu.icon == "&#xe660;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe660;</i>
                <input name="icon" value="xe65d" <#if menu.icon == "&#xe65d;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe65d;</i>

                <input name="icon" value="xe65f" <#if menu.icon == "&#xe65f;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe65f;</i>
                <input name="icon" value="xe671" <#if menu.icon == "&#xe671;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe671;</i>
                <input name="icon" value="xe65c" <#if menu.icon == "&#xe65c;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe65c;</i>
                <input name="icon" value="xe756" <#if menu.icon == "&#xe756;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe756;</i>
                <input name="icon" value="xe735" <#if menu.icon == "&#xe735;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe735;</i>
                <input name="icon" value="xe65e" <#if menu.icon == "&#xe65e;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe65e;</i>
                <input name="icon" value="xe659" <#if menu.icon == "&#xe659;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe659;</i>

                <input name="icon" value="xe715" <#if menu.icon == "&#xe715;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe715;</i>
                <input name="icon" value="xe705" <#if menu.icon == "&#xe705;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe705;</i>
                <input name="icon" value="xe6b2" <#if menu.icon == "&#xe6b2;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe6b2;</i>
                <input name="icon" value="xe6af" <#if menu.icon == "&#xe6af;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe6af;</i>
                <input name="icon" value="xe69c" <#if menu.icon == "&#xe69c;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe69c;</i>
                <input name="icon" value="xe698" <#if menu.icon == "&#xe698;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe698;</i>
                <input name="icon" value="xe657" <#if menu.icon == "&#xe657;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe657;</i>

                <input name="icon" value="xe658" <#if menu.icon == "&#xe658;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe658;</i>
                <input name="icon" value="xe65a" <#if menu.icon == "&#xe65a;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe65a;</i>
                <input name="icon" value="xe65b" <#if menu.icon == "&#xe65b;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe65b;</i>
                <input name="icon" value="xe681" <#if menu.icon == "&#xe681;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe681;</i>
                <input name="icon" value="xe67c" <#if menu.icon == "&#xe67c;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe67c;</i>
                <input name="icon" value="xe7a0" <#if menu.icon == "&#xe7a0;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe7a0;</i>
                <input name="icon" value="xe857" <#if menu.icon == "&#xe857;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe857;</i>

                <input name="icon" value="xe652" <#if menu.icon == "&#xe652;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe652;</i>
                <input name="icon" value="xe651" <#if menu.icon == "&#xe651;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe651;</i>
                <input name="icon" value="xe6fc" <#if menu.icon == "&#xe6fc;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe6fc;</i>
                <input name="icon" value="xe6ed" <#if menu.icon == "&#xe6ed;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe6ed;</i>
                <input name="icon" value="xe688" <#if menu.icon == "&#xe688;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe688;</i>
                <input name="icon" value="xe645" <#if menu.icon == "&#xe645;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe645;</i>
                <input name="icon" value="xe611" <#if menu.icon == "&#xe611;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe611;</i>

                <input name="icon" value="xe614" <#if menu.icon == "&#xe614;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe614;</i>
                <input name="icon" value="xe60f" <#if menu.icon == "&#xe60f;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe60f;</i>
                <input name="icon" value="xe615" <#if menu.icon == "&#xe615;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe615;</i>
                <input name="icon" value="xe641" <#if menu.icon == "&#xe641;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe641;</i>

                <input name="icon" value="xe620" <#if menu.icon == "&#xe620;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe620;</i>
                <input name="icon" value="xe628" <#if menu.icon == "&#xe628;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe628;</i>
                <input name="icon" value="x1006" <#if menu.icon == "&#x1006;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#x1006;</i>
                <input name="icon" value="x1007" <#if menu.icon == "&#x1007;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#x1007;</i>
                <input name="icon" value="xe629" <#if menu.icon == "&#xe629;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe629;</i>
                <input name="icon" value="xe600" <#if menu.icon == "&#xe600;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe600;</i>
                <input name="icon" value="xe617" <#if menu.icon == "&#xe617;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe617;</i>

                <input name="icon" value="xe606" <#if menu.icon == "&#xe606;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe606;</i>
                <input name="icon" value="xe609" <#if menu.icon == "&#xe609;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe609;</i>
                <input name="icon" value="xe60a" <#if menu.icon == "&#xe60a;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe60a;</i>
                <input name="icon" value="xe62c" <#if menu.icon == "&#xe62c;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe62c;</i>
                <input name="icon" value="x1005" <#if menu.icon == "&#x1005;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#x1005;</i>
                <input name="icon" value="xe61b" <#if menu.icon == "&#xe61b;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe61b;</i>
                <input name="icon" value="xe610" <#if menu.icon == "&#xe610;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe610;</i>

                <input name="icon" value="xe602" <#if menu.icon == "&#xe602;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe602;</i>
                <input name="icon" value="xe603" <#if menu.icon == "&#xe603;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe603;</i>
                <input name="icon" value="xe62d" <#if menu.icon == "&#xe62d;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe62d;</i>
                <input name="icon" value="xe62e" <#if menu.icon == "&#xe62e;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe62e;</i>
                <input name="icon" value="xe62f" <#if menu.icon == "&#xe62f;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe62f;</i>
                <input name="icon" value="xe61f" <#if menu.icon == "&#xe61f;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe61f;</i>
                <input name="icon" value="xe601" <#if menu.icon == "&#xe601;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe601;</i>

                <input name="icon" value="xe630" <#if menu.icon == "&#xe630;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe630;</i>
                <input name="icon" value="xe631" <#if menu.icon == "&#xe631;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe631;</i>
                <input name="icon" value="xe654" <#if menu.icon == "&#xe654;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe654;</i>
                <input name="icon" value="xe642" <#if menu.icon == "&#xe642;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe642;</i>
                <input name="icon" value="xe640" <#if menu.icon == "&#xe640;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe640;</i>
                <input name="icon" value="xe61a" <#if menu.icon == "&#xe61a;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe61a;</i>
                <input name="icon" value="xe621" <#if menu.icon == "&#xe621;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe621;</i>

                <input name="icon" value="xe632" <#if menu.icon == "&#xe632;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe632;</i>
                <input name="icon" value="xe618" <#if menu.icon == "&#xe618;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe618;</i>
                <input name="icon" value="xe608" <#if menu.icon == "&#xe608;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe608;</i>
                <input name="icon" value="xe633" <#if menu.icon == "&#xe633;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe633;</i>
                <input name="icon" value="xe61c" <#if menu.icon == "&#xe61c;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe61c;</i>
                <input name="icon" value="xe634" <#if menu.icon == "&#xe634;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe634;</i>
                <input name="icon" value="xe607" <#if menu.icon == "&#xe607;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe607;</i>

                <input name="icon" value="xe635" <#if menu.icon == "&#xe635;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe635;</i>
                <input name="icon" value="xe636" <#if menu.icon == "&#xe616;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe616;</i>
                <input name="icon" value="xe60b" <#if menu.icon == "&#xe60b;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe60b;</i>
                <input name="icon" value="xe619" <#if menu.icon == "&#xe619;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe619;</i>
                <input name="icon" value="xe637" <#if menu.icon == "&#xe637;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe637;</i>
                <input name="icon" value="xe61d" <#if menu.icon == "&#xe61d;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe61d;</i>
                <input name="icon" value="xe604" <#if menu.icon == "&#xe604;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe604;</i>

                <input name="icon" value="xe612" <#if menu.icon == "&#xe612;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe612;</i>
                <input name="icon" value="xe605" <#if menu.icon == "&#xe605;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe605;</i>
                <input name="icon" value="xe638" <#if menu.icon == "&#xe638;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe638;</i>
                <input name="icon" value="xe60c" <#if menu.icon == "&#xe60c;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe60c;</i>
                <input name="icon" value="xe616" <#if menu.icon == "&#xe616;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe616;</i>
                <input name="icon" value="xe613" <#if menu.icon == "&#xe613;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe613;</i>
                <input name="icon" value="xe61e" <#if menu.icon == "&#xe61e;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe61e;</i>

                <input name="icon" value="xe60d" <#if menu.icon == "&#xe60d;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe60d;</i>
                <input name="icon" value="xe64c" <#if menu.icon == "&#xe64c;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe64c;</i>
                <input name="icon" value="xe60e" <#if menu.icon == "&#xe60e">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe60e;</i>
                <input name="icon" value="xe622" <#if menu.icon == "&#xe622;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe622;</i>
                <input name="icon" value="xe64f" <#if menu.icon == "&#xe64f;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe64f;</i>
                <input name="icon" value="xe64d" <#if menu.icon == "&#xe64d;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe64d;</i>
                <input name="icon" value="xe639" <#if menu.icon == "&#xe639;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe639;</i>

                <input name="icon" value="xe623" <#if menu.icon == "&#xe623;">checked</#if>t itle=" " type="radio"><i class="layui-icon tubiao">&#xe623;</i>
                <input name="icon" value="xe63f" <#if menu.icon == "&#xe63f;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe63f;</i>
                <input name="icon" value="xe643" <#if menu.icon == "&#xe643;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe643;</i>
                <input name="icon" value="xe647" <#if menu.icon == "&#xe647;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe647;</i>
                <input name="icon" value="xe648" <#if menu.icon == "&#xe648;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe648;</i>
                <input name="icon" value="xe649" <#if menu.icon == "&#xe649;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe649;</i>
                <input name="icon" value="xe626" <#if menu.icon == "&#xe626;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe626;</i>

                <input name="icon" value="xe627" <#if menu.icon == "&#xe627;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe627;</i>
                <input name="icon" value="xe62b" <#if menu.icon == "&#xe62b;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe62b;</i>
                <input name="icon" value="xe63a" <#if menu.icon == "&#xe63a;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe63a;</i>
                <input name="icon" value="xe624" <#if menu.icon == "&#xe624;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe624;</i>
                <input name="icon" value="xe63b" <#if menu.icon == "&#xe63b;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe63b;</i>
                <input name="icon" value="xe650" <#if menu.icon == "&#xe650;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe650;</i>
                <input name="icon" value="xe64b" <#if menu.icon == "&#xe64b;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe64b;</i>

                <input name="icon" value="xe63c" <#if menu.icon == "&#xe63c;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe63c;</i>
                <input name="icon" value="xe62a" <#if menu.icon == "&#xe62a;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe62a;</i>
                <input name="icon" value="xe64e" <#if menu.icon == "&#xe64e;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe64e;</i>
                <input name="icon" value="xe646" <#if menu.icon == "&#xe646;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe646;</i>
                <input name="icon" value="xe625" <#if menu.icon == "&#xe625;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe625;</i>
                <input name="icon" value="xe64a" <#if menu.icon == "&#xe64a;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe64a;</i>
                <input name="icon" value="xe644" <#if menu.icon == "&#xe644;">checked</#if> title=" " type="radio"><i class="layui-icon tubiao">&#xe644;</i>

            </div>
        </div>

        <div class="layui-form-item" pane="">
            <label class="layui-form-label">允许修改</label>
            <div class="layui-input-block">
                <input name="systemMenu" value="1" title="允许" <#if menu.systemMenu==1>checked="" </#if> type="radio">
                <input name="systemMenu" value="2" title="不允许" <#if menu.systemMenu==2>checked="" </#if> type="radio">
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
        form.on('submit(update)', function(data){
            $.post("${basePath}/menu/update",data.field,function(data){
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
