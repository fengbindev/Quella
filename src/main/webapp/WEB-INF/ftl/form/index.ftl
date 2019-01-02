<link rel="stylesheet" href="${basePath}/css/build.css"></link>
<div class="layui-fluid">
<body class="timo-layout-page">
    <div class="layui-row layui-col-space20">
        <div class="layui-col-md5">
            <div class="layui-card">
                <div class="layui-card-header timo-card-header">
                    <span><i class="fa fa-bars"></i> 表单元素</span>
                </div>
                <div class="layui-card-body">
                    <blockquote class="layui-elem-quote layui-quote-nm">
                        将表单元素拖拽到构建面板中即可生成表单块
                    </blockquote>
                    <div class="layui-form timo-compile element-panel">
<div class="layui-form-item">
    <label class="layui-form-label">输入框</label>
    <div class="layui-input-inline">
        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">密码框</label>
    <div class="layui-input-inline">
        <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">选择框</label>
    <div class="layui-input-inline">
        <select name="interest" lay-filter="aihao">
            <option value=""></option>
            <option value="0">写作</option>
            <option value="1">阅读</option>
            <option value="2">游戏</option>
            <option value="3">音乐</option>
            <option value="4">旅行</option>
        </select>
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">上传图片</label>
    <div class="layui-input-inline">
        <button type="button" class="layui-btn upload-image" name="image[]"
                th:attr="up-url=@{/upload/image}" up-field="path">
            <i class="layui-icon">&#xe67c;</i>上传图片
        </button>
    </div>
    <div class="upload-show"></div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">时间选择</label>
    <div class="layui-input-inline">
        <input type="text" class="layui-input" placeholder="yyyy-MM-dd">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">复选框</label>
    <div class="layui-input-block">
        <input type="checkbox" name="like[write]" title="写作">
        <input type="checkbox" name="like[read]" title="阅读" checked="">
        <input type="checkbox" name="like[game]" title="游戏">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">开关</label>
    <div class="layui-input-block">
        <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
    </div>
</div>

<div class="layui-form-item">
    <label class="layui-form-label">单选框</label>
    <div class="layui-input-block">
        <input type="radio" name="sex" value="男" title="男" checked="">
        <input type="radio" name="sex" value="女" title="女">
    </div>
</div>
<div class="layui-form-item layui-form-text">
    <label class="layui-form-label">文本域</label>
    <div class="layui-input-block">
        <textarea placeholder="请输入内容" class="layui-textarea" name="desc"></textarea>
    </div>
</div>
<div class="layui-form-item timo-finally">
    <button class="layui-btn ajax-submit"><i class="fa fa-check-circle"></i> 保存</button>
    <button class="layui-btn btn-secondary close-popup"><i class="fa fa-times-circle"></i> 关闭</button>
</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-col-md7">
            <div class="layui-card build-card">
                <div class="layui-card-header timo-card-header">
                    <span><i class="fa fa-bars"></i> 构建面板</span>
                    <button class="layui-btn layui-btn-primary layui-btn-sm build-generate">生成HTML</button>
                </div>
                <div class="layui-card-body layui-form timo-compile build-panel"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${basePath}/js/jquery.js"></script>
<script>
    layui.use(['element', 'laydate', 'form'], function () {
        var form = layui.form;
        var laydate = layui.laydate;
        form.render();

        var build = $(".build-panel");

        //初始化laydate实例
        laydate.render({
            elem: '#laydate'
        });

        // 禁止选择网页文本
        $(document).on('selectstart', '.layui-card', function(){
            return false;
        });

        // 移动操作
        var downPosi, target = null, dragDom = null, timer = null;
        var areaPosi;
        $(document).on("mousedown", ".layui-form-item", function (e) {
            $this = $(this);
            timer = setTimeout(function () {
                downPosi = {'left': e.clientX - $this.offset().left,
                    'top': e.clientY - $this.offset().top + 10};
                areaPosi = {'ltX': build.offset().left, 'ltY': build.offset().top,
                    'rbX': build.offset().left + build.width(),
                    'rbY': build.offset().top + build.height()};
                target = $this;
            }, 200);
        });
        $(document).on("mousemove", function (e) {
            if(dragDom == null && target != null){
                dragDom = $("<div class='layui-form timo-compile element-panel'></div>");
                dragDom.append(target.clone());
                dragDom.addClass("drag-box");
                dragDom.css("width", target.width());
                $("body").append(dragDom);
                var buildItem = target.parent('.build-item');
                if(buildItem.length > 0){
                    buildItem.remove();
                }
            }
            if(dragDom != null){
                dragDom.css("left", e.clientX - downPosi.left);
                dragDom.css("top", e.clientY - downPosi.top);
            }
            if(dragDom != null){
                if(e.clientX > areaPosi.ltX && e.clientY > areaPosi.ltY
                        && e.clientX < areaPosi.rbX && e.clientY < areaPosi.rbY){
                    build.addClass("active");
                    buildItemPosi(e.clientY);
                }else{
                    build.removeClass("active");
                    shellItem.remove();
                }
            }
        });
        $(document).on("mouseup", function (e) {
            if(dragDom != null){
                if(build.hasClass("active")){
                    buildAdd(dragDom);
                }
                dragDom.remove();
                dragDom = null;
                target = null;
                build.removeClass("active");
                shellItem.remove();
            }
            if(timer != null){
                clearTimeout(timer);
                timer = null;
            }
        });

        // 构建项位置
        var shellItem = $("<div id='shell-item'></div>");
        var buildItemPosi = function(clientY){
            build.children('.build-item').each(function(key, val){
                var $this = $(val);
                var ty = $this.offset().top;
                var by = $this.offset().top + $this.height();
                if(clientY > ty &&  clientY < by ){
                    if(clientY < (ty + by) / 2){
                        $this.before(shellItem);
                    }else{
                        $this.after(shellItem);
                    }
                }
            });
            shellItem.css('height', dragDom.height());
            if($('#shell-item').length == 0){
                build.append(shellItem);
            }
        };

        // 加入构建面板
        var buildAdd = function(dragDom){
            var elem = dragDom.children(".layui-form-item").clone();
            elem.children('div').children('div').remove();
            elem.removeAttr('style');
            elem.removeClass('drag-box');
            var item = $("<div class='build-item'>" +
                    "<div class='control'><a class='edit'>编辑HTML</a> | " +
                    "<a class='remove'>删除</a></div>" +
                    "</div>");
            shellItem.after(item.append(elem));

            form.render();
        };

        // 编辑构建项
        var buildItem, index;
        build.on('click', '.edit', function(){
            buildItem = $(this).parents('.build-item');
            var elem = buildItem.children('.layui-form-item').clone();
            elem.children('div').children('div').remove();
            elem.find('.layui-upload-file').remove();

            var box = $("<div class='build-edit-box'></div>");
            var edit = $("<textarea class='build-edit'></textarea>").text(elem.prop('outerHTML'));
            box.append(edit).append("<button class='build-edit-btn'>更新</button></div>");

            index = layer.open({
                title: '编辑HTML',
                type: 1,
                skin: 'build-item-edit', //样式类名
                shadeClose: true, //开启遮罩关闭
                area: ['500px', '360px'],
                content: box.prop('outerHTML')
            });
        });

        // 更新HTML
        $(document).on('click', '.build-edit-btn', function(){
            var val = $(this).parent().children('textarea').val();
            buildItem.children('.layui-form-item').remove();
            buildItem.append($(val));
            form.render();
            layer.close(index);
        });

        // 删除构建项
        build.on('click', '.remove', function(){
            $(this).parents('.build-item').remove();
        });

        // 生成代码
        $( '.build-generate').on('click', function(){
            var genHtml = '';
            build.find(".layui-form-item").each(function (key, val) {
                var item = $(val).clone();
                item.children('div').children('div').remove();
                item.find('.layui-upload-file').remove();
                genHtml += item.prop('outerHTML') + "\n";
            });
            var box = $("<div class='build-edit-box'></div>");
            var edit = $("<textarea class='build-edit'></textarea>").text(genHtml);
            box.append(edit);

            index = layer.open({
                title: '复制HTML代码',
                type: 1,
                skin: 'build-item-edit', //样式类名
                shadeClose: true, //开启遮罩关闭
                area: ['500px', '360px'],
                content: box.prop('outerHTML')
            });
            $('.build-edit').focus().select();
        });

    });
</script>
