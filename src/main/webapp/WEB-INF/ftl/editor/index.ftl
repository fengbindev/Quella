<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">富文本集成</li>
        <li>使用说明</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">

            <div class="layui-fluid">
                <div class="layui-row">
                    <div class="layui-col-xs12">
                        <div class="layui-card">

                            <!--这里写页面的代码-->
                            <div class="layui-card-body">
                                <div id="editor1">
                                    <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="layui-tab-item">
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


    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="${basePath}/plugins/wangEditor/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#editor1');
        //  var editor = new E( document.getElementById('editor1') );
        editor.create()
    </script>