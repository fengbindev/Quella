<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">支付宝支付</li>
        <li>支付测试</li>
        <li>使用说明</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;AppId</label>
                    <div class="layui-input-inline" style="width: 40%">
                        <input type="text" name="psaAppId" lay-verify="required" value="${(psa.psaAppId)!}" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">支付宝开发者后台提供的AppId</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;密钥</label>
                    <div class="layui-input-inline" style="width: 40%" >
                        <input type="password" name="psaPrivateKey" value="${(psa.psaPrivateKey)!}" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">支付宝开发者后台提供的密钥</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;公钥</label>
                    <div class="layui-input-inline" style="width: 40%" >
                        <input type="text" name="psaPublicKey" value="${(psa.psaPublicKey)!}" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">支付宝开发者后台提供的公钥</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;接口地址</label>
                    <div class="layui-input-inline" style="width: 40%">
                        <input type="text" name="psaServerUrl" value="${(psa.psaServerUrl)!}" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">支付宝提供的接口地址</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;回调前缀</label>
                    <div class="layui-input-inline" style="width: 40%">
                        <input type="text" name="psaDoMain" value="${(psa.psaDoMain)!}" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">设置支付宝的回调地址前缀</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label"><span class="layui-badge-dot"></span> &nbsp;异步通知</label>
                    <div class="layui-input-inline" style="width: 40%">
                        <input type="text" name="psaNotifyUrl" value="${(psa.psaNotifyUrl)!}" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">设置支付宝的异步通知地址</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">编码格式</label>
                    <div class="layui-input-inline" >
                        <input type="text" name="psaCharset" value="${(psa.psaCharset)!}" lay-verify="required" value="UTF-8" placeholder="" autocomplete="off" class="layui-input" disabled="">
                    </div>
                    <div class="layui-form-mid layui-word-aux">编码格式默认 UTF8 不能修改，不可以修改</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">参数设置</label>
                    <div class="layui-input-inline">
                        <input type="text" name="psaFormat" value="${(psa.psaFormat)!}" lay-verify="required" value="JSON" placeholder="" autocomplete="off" class="layui-input" disabled="">
                    </div>
                    <div class="layui-form-mid layui-word-aux">仅仅支持 JSON，不可以修改</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">符号类型</label>
                    <div class="layui-input-inline">
                        <input type="text" name="psaSignType" value="${(psa.psaSignType)!}" lay-verify="required" value="RSA2" placeholder="" autocomplete="off" class="layui-input" disabled="">
                    </div>
                    <div class="layui-form-mid layui-word-aux">仅仅支持 RSA2，不可以修改</div>
                </div>

                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="required" lay-filter="alipay">提交</button>
                </div>
            </form>

        </div>

        <div class="layui-tab-item">
            支付宝支付测试
        </div>

        <div class="layui-tab-item">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>使用说明</legend>
            </fieldset>

            <blockquote class="layui-elem-quote">后台调用短信发送</blockquote>
            <pre class="layui-code">
这个版本给大家继承了支付宝的PC支付接口和H5支付接口,只需要传过去 Trade类 的实例即可：
PC: /aliPay/toPayAsPC
H5: /aliPay/toPayAsWeb

下个版本可能会集成APP支付。

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
            form.on('submit(alipay)', function(data){

                $.post("${basePath}/aliPaySetting/update",data.field,function(d){

                    // 获取 session
                    if(d.status!=200){
                        layer.alert(d.message, {offset: 't',icon: 5});
                    }
                    if(d.status==200){
                        console.log(111);
                        layer.alert(d.message, {offset: 't',icon: 6});
                    }
                });
                return false;
            });



        });
    </script>