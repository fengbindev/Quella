<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>系统登陆</title>
    <link rel="stylesheet" href="<%=basePath%>css/login.css"/>
    <link rel="shortcut icon" href="<%=basePath%>favicon.ico"/>
</head>
<body>
<!-- begin -->
<div id="login">
    <div class="wrapper">
        <div class="login" style="background: #fff;">
            <form class="container offset1 loginform" id="logoFrom">
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
                            <input id="userName" value="ssrs@qq.com" type="text" name="email" tabindex="1" autofocus="autofocus"
                                   class="form-control input-medium" required/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password" class="control-label fa fa-asterisk"></label>
                            <input id="password" type="password" name="pswd" tabindex="2"
                                   class="form-control input-medium" required/>
                        </div>
                    </div>
                </div>
                <div class="form-actions"><a href="#" tabindex="5" class="btn pull-left btn-link text-muted">Forgot
                    password?</a><a href="/signUp.html" tabindex="6" id="SignUp" class="btn btn-link text-muted">Sign
                    Up</a>
                    <button type="button" tabindex="4" class="btn btn-primary" onclick="login();">Login</button>
                </div>
            </form>
        </div>
    </div>

    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/plugins/kit-admin/layui.js"></script>
    <script src="<%=basePath%>/js/login2.js"></script>
    <script src="<%=basePath%>/js/MD5.js"></script>
    <script>

        layui.use(['jquery', 'layer'], function () {
            var layer = layui.layer;
            jQuery(document).ready(function () {
                try {
                    var _href = window.location.href + "";
                    if (_href && _href.indexOf('?kickout') != -1) {
                        layer.alert('您已经被踢出，请重新登录！');
                    }
                } catch (e) {

                }
                ;
            });
            //回车事件绑定
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) {
                    login();
                }
            };
        });

        function login() {
            var email = $("#userName").val();
            var pswd = MD5(email+"#"+$("#password").val());
            $.post("<%=basePath%>/u/submitLogin",{email:email,pswd:pswd}, function (data) {
                if (data.status == 200) {
                    //登录返回
                    window.location.href = "<%=basePath%>user/index";
                } else {
                    layui.layer.msg(data.message, {offset: 70, shift: 0});
                }
            }, "json");
        }

    </script>
</div>
<!-- end -->
</body>
</html>
