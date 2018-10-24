
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Link添加</title>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/layui.css" id="layui">
    
</head>
<body>

<div class="kit-doc">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;名称</label>
            <div class="layui-input-block">
                <input name="name" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">跳转链接</label>
            <div class="layui-input-block">
                <input name="url"  autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label" style="height: 137px; line-height: 117px">上传图片</label>
            <input name="imgUrl" id="imgurl"  autocomplete="off" class="layui-input" type="hidden">
            <div class=" layui-upload-drag" id="img" >
                <i class="layui-icon">&#xe654;</i>
                <p>点击上传图片</p>
                <img id="demo1" style="position: absolute;height: 137px;width: 237px;margin: -106px auto auto -30px;display: none" />
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
       
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#img'
            , url: '${basePath}/file/commonUploadFile'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result, data) {
                    $('#demo1').css('display','block').attr('src', result); //链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.status != 200) {
                    return layer.msg('上传失败');
                }
                //上传成功
                if(res.status == 200){
                    $('#imgurl').val(res.src);
                }
            }
            , error: function () {
                layer.alert("图片上传失败！")
            }
        });

        //监听提交，发送请求
        form.on('submit(add)', function(data){
            data.field.linkGroupId =  parent.$("[name=\"linkGroupId\"]").val();
            $.post("${basePath}/link/addChild",data.field,function(data){
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
