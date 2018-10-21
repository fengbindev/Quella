
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>图片播放器编辑</title>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/layui.css" id="layui">
    
</head>
<body>

<div class="kit-doc">
    <form class="layui-form" action="">
        <input type="hidden" name="id" value="${ipr.id}" >
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;标题</label>
            <div class="layui-input-block">
                <input name="title" lay-verify="required" value="${ipr.title}" placeholder="请输入标题" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
                <textarea  name="summary" placeholder="请输入描述" class="layui-textarea">${ipr.summary}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;排序</label>
            <div class="layui-input-block">
                <input name="sequence" lay-verify="" value="${ipr.sequence}" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label" style="height: 137px; line-height: 117px"><span class="layui-badge-dot"></span> &nbsp;上传图片</label>
            <input name="img" id="imgurl" lay-verify="required" value="${ipr.img}" autocomplete="off" class="layui-input" type="hidden">
            <div class=" layui-upload-drag" id="img" >
                <i class="layui-icon">&#xe654;</i>
                <p>点击上传图片</p>
                <img id="demo1" src="${ipr.img}" style="position: absolute;height: 137px;width: 237px;margin: -106px auto auto -73px;" />
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">链接地址</label>
            <div class="layui-input-block">
                <input name="url" lay-verify="" value="${ipr.url}" placeholder="请输入图片链接地址" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;起止日期</label>
            <div class="layui-input-block">
                <input type="text" name="startAndEndTime"  value="${ipr.startTime?string('yyyy-MM-dd HH:mm:ss')} - ${ipr.endTime?string('yyyy-MM-dd HH:mm:ss')}" class="layui-input" id="test10" placeholder=" - ">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;是否开启</label>
            <div class="layui-input-block">
                <input type="checkbox" name="type" lay-skin="switch" <#if ipr.type==1>checked</#if> lay-text="开启|关闭">
            </div>
        </div>

        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="update">提交</button>
        </div>
    </form>
    </form>

    <!--这里写页面的代码-->
</div>

<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kitadmin/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'element', 'layer', 'upload'], function(){
        var form = layui.form,
                layer = layui.layer,
                element = layui.element,
                upload = layui.upload;
        laydate = layui.laydate;

        //日期时间范围
        laydate.render({
            elem: '#test10'
            ,type: 'datetime'
            ,range: true
        });

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
        form.on('submit(update)', function(data){
            $.post("${basePath}/swiper/updateChild",data.field,function(data){
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
