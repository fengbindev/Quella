
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>图片播放器添加</title>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/layui.css" id="layui">
    <link rel="stylesheet" href="${basePath}/plugins/swiper/css/swiper.min.css" />
    <style>
        .swiper-container {
            width: 350px;
            height: 175px;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }

        .swiper-slide.blue-slide{
            background: #4390EE;
            color: #fff;
        }
        .swiper-slide.red-slide{
            background: #CA4040;
            color: #fff;
        }
        .swiper-slide.orange-slide{
            background: #FF8604;
            color: #fff;
        }

    </style>
</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">
        <input type="hidden" name="id" value="${img.id}">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" value="${img.name}" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">播放器样式</label>
                <div class="layui-input-inline">
                    <select name="swiperType" lay-verify="required">
                        <@api target="dictionaryTag" id="1">
                            <#list outTagName as dic>
                                      <option value="${dic.value}" <#if img.swiperType == dic.value?number >selected</#if> >${dic.text}</option>
                            </#list>
                        </@api>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">显示宽度</label>
                <div class="layui-input-inline">
                    <input type="text" name="width" value="${img.width}" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">最大显示数</label>
                <div class="layui-input-inline">
                    <input type="text" name="displayCount" value="${img.displayCount}" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">显示高度</label>
                <div class="layui-input-inline">
                    <input type="text" name="height" value="${img.height}" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否逆序</label>
                <div class="layui-input-inline">
                    <input type="checkbox" name="displayDesc" <#if img.displayDesc == 'Y'> checked </#if> lay-skin="switch" lay-text="ON|OFF">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center">
            <#--<img src="${basePath}/images/thumbIMG.jpg" width="350px">-->
                <!-- Swiper -->
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide blue-slide">Slide 1</div>
                        <div class="swiper-slide red-slide">Slide 2</div>
                        <div class="swiper-slide orange-slide">Slide 3</div>
                    </div>
                </div>
        </div>
        <div class="layui-form-item" style="text-align: center">
                <button class="layui-btn" lay-submit="" lay-filter="add">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
    </form>

    <!--这里写页面的代码-->
</div>
<script src="${basePath}/plugins/swiper/js/swiper.min.js"></script>
<script>
    var swiper = new Swiper('.swiper-container',{
        loop : true,
        autoplay:true,
    });
</script>
<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kitadmin/layui.js"></script>
<script>
    layui.use(['form', 'layedit','table'], function(){
        var form = layui.form ,layer = layui.layer;
        var table = layui.table;

        //监听提交，发送请求
        form.on('submit(add)', function(data){
            if (data.field.displayDesc && data.field.displayDesc=="on"){
                data.field.displayDesc = "Y";
            }else {
                data.field.displayDesc = "N";
            }
            $.post("${basePath}/swiper/update",data.field,function(data){
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
