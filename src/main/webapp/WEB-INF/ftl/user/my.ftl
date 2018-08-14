<div class="kit-doc">
    <!--这里写页面的代码-->
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <ul class="layui-tab-title">
            <li class="layui-this">个人资料</li>
            <li>密码修改</li>
        </ul>
        <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item layui-show">
                <form class="layui-form layui-form-pane" action="">
                    <input name="id" value="${token.id}" hidden="hidden">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户昵称</label>
                        <div class="layui-input-block">
                            <input name="nickname" value="${token.nickname}" lay-verify="required"  placeholder="请输入用户昵称" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱</label>
                        <div class="layui-input-block">
                            <input name="email" value="${token.email}" disabled="disabled" lay-verify="required" placeholder="不准修改" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit="required" lay-filter="personInfo">提交</button>
                    </div>
                </form>

            </div>
            <div class="layui-tab-item">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">原始密码</label>
                        <div class="layui-input-block">
                            <input name="pswd" lay-verify="required" value="" placeholder="请输入原始密码" autocomplete="off" class="layui-input" type="password">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-block">
                            <input name="newPswd" lay-verify="required" value="" placeholder="请输入新密码" autocomplete="off" class="layui-input" type="password">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <input name="isNewPswd" lay-verify="required" value="" placeholder="请再次输入新密码" autocomplete="off" class="layui-input" type="password">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit="" lay-filter="updatePswdSubmit">提交</button>
                    </div>
                </form>
            </div>

            </div>
        </div>
    </div>



    <!--这里写页面的代码-->
<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kit-admin/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'element', 'layer'], function(){
        var form = layui.form,
                layer = layui.layer,
                element = layui.element;

        //监听提交，发送请求
        form.on('submit(personInfo)', function(data){
            $.post("${basePath}/user/updateSelf",data.field,function(d){
                // 获取 session
                if(d.status!=200){
                    layer.alert(d.message, {offset: 't',icon: 5});
                }
                if(d.status==200){
                    layer.alert(d.message, {offset: 't',icon: 6},function (data) {
                        location.reload();
                    });
                }
            });
            return false;
        });

        //监听提交，发送请求
        form.on('submit(updatePswdSubmit)', function(data){
            if ($("#newPswd").val() != $("#isNewPswd").val()){
                layer.msg("输入的密码不一致！", {icon: 2,time: 1000});
                return false;
            }
            $.post("${basePath}/user/updatePswd",data.field,function(d){
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

