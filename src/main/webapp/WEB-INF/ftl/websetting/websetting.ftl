<style>
  #websetting_form  .layui-form-item .layui-form-label {
        width: 140px;
    }
</style>
<div  style="margin: 30px 0px 0px 30px">
    <blockquote class="layui-elem-quote">注意这里是项目的全局配置，下面的这些配置对整个网站都会起到作用！</blockquote>

    <fieldset class="layui-elem-field layui-field-title">
        <legend>系统全局配置</legend>
    </fieldset>
    <form class="layui-form layui-form-pane" action="" id="websetting_form">
        <div class="layui-form-item">
            <label class="layui-form-label">网站名称</label>
            <div class="layui-input-inline">
                <input type="text" name="webName" value="${(webSetting.webName)!}" lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input type="text" name="sigeSize"  value="${(webSetting.sigeSize)!}" lay-verify="required|number|sigeSize" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">位</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码有效期</label>
            <div class="layui-input-inline">
                <input type="text" name="signActiveTime"  value="${(webSetting.signActiveTime)!}" lay-verify="required|number|activeTime" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">分钟</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">底部信息</label>
            <div class="layui-input-inline" style="width: 80%">
                <input type="text" name="fotterInfo" value="${(webSetting.fotterInfo)!}" lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
                <button class="layui-btn" lay-submit="" lay-filter="webset_update">保存</button>
        </div>
    </form>
</div>
    <script>
        layui.use(['form', 'layedit', 'laydate'], function(){
            var form = layui.form
                    ,layer = layui.layer;

            // 非layui自带表单验证
            form.verify({
                sigeSize: function(value, item){ //value：表单的值、item：表单的DOM对象
                    if(value > 8){
                        return '验证码位数必须小于等于8';
                    }
                    if(value < 4){
                        return '验证码位数必须大于等于4';
                    }
                },

                activeTime: function(value, item){ //value：表单的值、item：表单的DOM对象
                    if(value > 30){
                        return '验证码有效期建议在5到30分钟之间';
                    }
                    if(value < 5){
                        return '验证码有效期建议在5到30分钟之间';
                    }
                }

            });


            //监听提交，发送请求
            form.on('submit(webset_update)', function(data){
                $.post("${basePath}/websetting/update",data.field,function(data){
                    // 获取 session
                    if(data.status!=200){
                        layer.alert(data.message, {offset: 't',icon: 6});
                    }
                    if(data.status==200){
                        layer.alert(data.message, {offset: 't',icon: 6});
                    }
                });
                return false;
            });
        });
    </script>