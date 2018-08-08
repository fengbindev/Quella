<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>员工登陆</title>
    <link rel="stylesheet" href="<%=basePath%>/css/login.css"/>
</head>
<body>
<!-- begin -->

<div id="login">
    <div class="wrapper">
        <div class="login" style="background: #fff;">
            <form  class="container offset1 loginform" id="logoFrom">
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad">
                    <div class="control-group">
                        <div class="controls">
                            <label for="userName" class="control-label fa fa-envelope"></label>
                            <input id="userName" type="text" name="email"  tabindex="1" autofocus="autofocus" class="form-control input-medium" required/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password" class="control-label fa fa-asterisk"></label>
                            <input id="password" type="password" name="pswd"  tabindex="2" class="form-control input-medium" required/>
                        </div>
                    </div>
                </div>
                <div class="form-actions"><a href="#" tabindex="5" class="btn pull-left btn-link text-muted">Forgot password?</a><a href="/signUp.html" tabindex="6" id="SignUp" class="btn btn-link text-muted">Sign Up</a>
                    <button type="button" tabindex="4" class="btn btn-primary" onclick="login();">Login</button>
                </div>
            </form>
        </div>
    </div>
    <%=basePath%>
    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/layui-v2.3.0-rc1/layui.js"></script>
    <script src="<%=basePath%>/js/login.js"></script>
    <script>
        layui.use(['jquery', 'layer'], function () {
            var msg = '${msg}';
            if(msg!=""){
                layui.layer.msg(msg, {offset: 70, shift: 0});
            }
        });

        function login() {
            $.post("<%=basePath%>/u/submitLogin",$("#logoFrom").serialize(),function(data){
                if (data.status == 200){
                    //登录返回
                    window.location.href = data.back_url;
                }else{
                    layui.layer.msg(data.message, {offset: 70, shift: 0});
                }
            },"json");
        }

    </script>
</div>
<!-- end -->
</body>
</html>
<%
    request.getSession().removeAttribute("msg");
%>