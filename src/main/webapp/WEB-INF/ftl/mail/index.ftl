<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">邮件发送</li>
        <li>邮件测试</li>
        <li>使用说明</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-form-pane" action="">

                <div class="layui-form-item">
                    <label class="layui-form-label">SMTP地址</label>
                    <div class="layui-input-block">
                        <input name="host" lay-verify="required" value="${(mail.host)!}" placeholder="请输入邮件服务器的SMTP地址" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">SMTP端口</label>
                    <div class="layui-input-block">
                        <input name="port" lay-verify="required" value="${(mail.port)!}" placeholder="请输入邮件服务器的SMTP端口" autocomplete="off" class="layui-input" type="password">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">发件人</label>
                    <div class="layui-input-block">
                        <input name="from" lay-verify="required" value="${(mail.from)!}" placeholder="发件人（必须正确，否则发送失败）" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input name="user" lay-verify="required" value="${(mail.user)!}" placeholder="请输入用户名" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input name="pass"  lay-verify="required" value="${(mail.pass)!}" placeholder="密码（注意，某些邮箱需要为SMTP服务单独设置密码）" autocomplete="off" class="layui-input" type="password">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">开启ssl发送</label>
                    <div class="layui-input-block">
                        <input type="checkbox"  name="startttlsEnable" <#if (mail.startttlsEnable)!false >checked=""</#if> lay-skin="switch" lay-text="开启|关闭">
                    </div>
                </div>


                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="required" lay-filter="sendMail">提交</button>
                </div>
            </form>

        </div>

        <div class="layui-tab-item">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input name="email" lay-verify="required|email" placeholder="请输入接收邮件的邮箱" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱标题</label>
                    <div class="layui-input-block">
                        <input name="title" lay-verify="required" placeholder="请输入接收邮件的标题" autocomplete="off" class="layui-input" type="text">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">邮件内容</label>
                    <div class="layui-input-block">
                        <textarea name="content" lay-verify="required" placeholder="请输入内容(可以为html内容)" class="layui-textarea"></textarea>
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
            <blockquote class="layui-elem-quote"> 邮箱参数设置说明</blockquote>
            <pre class="layui-code"> 发件人格式说明：name<xxxxx@xx.com> 其中name:邮件发件人名称 xxxx@xx.com : 发件人邮箱地址用户名：登录邮箱客户端时的账号密码： 登录邮箱客户端时的密码</pre>
            <blockquote class="layui-elem-quote">后台调用发送邮箱功能</blockquote>
            <pre class="layui-code">
    @Autowired
    private IMailService mailService;
    mailService.sendHtmlMail(email, title, content);//发送失败抛出 throw new RuntimeException("邮件发送失败");

    具体实现请看源码
            </pre>
        </div>
    </div>
</div>
    <script src="${basePath}/js/jquery.js"></script>
    <script>
        layui.use(['form', 'layedit',  'element', 'layer'], function(){
            var form = layui.form,
                    layer = layui.layer,
                    element = layui.element;
            form.render(); //更新全部
            //监听提交，发送请求
            form.on('submit(sendMail)', function(data){

                if (data.field.startttlsEnable && data.field.startttlsEnable=="on"){
                    data.field.startttlsEnable = true;
                }else {
                    data.field.startttlsEnable = false;
                }
                $.post("${basePath}/mail/update",data.field,function(d){

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

                $.post("${basePath}/mail/emailTest",data.field,function(d){
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