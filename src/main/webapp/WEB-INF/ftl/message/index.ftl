<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">阿里大鱼</li>
        <li>短信测试</li>
        <li>使用说明</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-form-pane" action="">

                <div class="layui-form-item">
                    <label class="layui-form-label">KeyId</label>
                    <div class="layui-input-block">
                        <input name="keyId" lay-verify="required" value="${(alidayu.keyId)!}" placeholder="请输入你在阿里大鱼后台的AccessKeyId" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">KeySecret</label>
                    <div class="layui-input-block">
                        <input name="keySecret" lay-verify="required" value="${(alidayu.keySecret)!}" placeholder="请输入你在阿里大鱼后台的AccessKeySecret" autocomplete="off" class="layui-input" type="password">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">短信签名</label>
                    <div class="layui-input-block">
                        <input name="signName" lay-verify="required" value="${(alidayu.signName)!}" placeholder="请输入你在阿里大鱼认证通过的短信签名" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">短信模板</label>
                    <div class="layui-input-block">
                        <input name="template" lay-verify="required" value="${(alidayu.template)!}" placeholder="请输入设置验证码的短信模板" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">验证码长度</label>
                    <div class="layui-input-block">
                        <input name="signSize"  value="${(alidayu.signSize)!}" placeholder="使用通用验证码接口时验证码长度(没使用到这个接口可不填)" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="required" lay-filter="alidayuUpdate">提交</button>
                </div>
            </form>

        </div>

        <div class="layui-tab-item">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input name="phone" lay-verify="required|phone" placeholder="请输入接收短信的手机号码" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">验证码</label>
                    <div class="layui-input-block">
                        <input name="code" lay-verify="required" placeholder="如果模板中存在多个参数请按照下面的格式书写：key,value,key,value" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>


                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="" lay-filter="test">提交</button>
                </div>
            </form>
        </div>

        <div class="layui-tab-item">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>使用说明</legend>
            </fieldset>

            <blockquote class="layui-elem-quote">后台调用短信发送</blockquote>
            <pre class="layui-code">
 @Autowired
 private IAlidayuService alidayuService;
alidayuService.send(phone,code);//code 为key,value格式

            </pre>

            <blockquote class="layui-elem-quote">通用短信验证码发送接口说明</blockquote>
            <pre class="layui-code">
发送短信验证码接口地址：/alidayu/commonSendSign
所需参数：phone(手机号码)

验证码验证接口地址：/alidayu/isSignOk
所需参数：phone(手机号) kst(验证码token) code(验证码)

这两个接口配合使用可快速实现短信验证功能，具体实现请看源码
            </pre>
        </div>
    </div>
</div>
    <script src="${basePath}/js/jquery.js"></script>
    <script>
        layui.use(['form', 'layedit', 'element', 'layer'], function(){
            var form = layui.form,
                    layer = layui.layer,
                    element = layui.element;

            //监听提交，发送请求
            form.on('submit(alidayuUpdate)', function(data){

                $.post("${basePath}/alidayu/update",data.field,function(d){

                    // 获取 session
                    if(d.status!=200){
                        layer.alert(d.message, {offset: 't',icon: 5});
                    }
                    if(d.status==200){
                        layer.alert(d.message, {offset: 't',icon: 6});
                    }
                });
                return false;
            });

            //监听提交，发送请求
            form.on('submit(test)', function(data){

                $.post("${basePath}/alidayu/messageTest",data.field,function(d){
                    // 获取 session
                    if(d.status!=200){
                        layer.alert(d.message, {offset: 't',icon: 5});
                    }
                    if(d.status==200){
                        layer.alert(d.message, {offset: 't',icon: 6});
                    }
                });
                return false;
            });

        });
    </script>