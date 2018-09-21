<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="ZH-cn">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Quella-登录</title>
  <link rel="stylesheet" href="<%=basePath%>/plugins/kitadmin/css/layui.css" id="layui">
  <link rel="stylesheet" href="<%=basePath%>/plugins/kitadmin/css/login.css">
</head>

<body>
  <div class="kit-login">
    <div class="kit-login-bg"></div>
    <div class="kit-login-wapper">
      <h2 class="kit-login-slogan">欢迎使用 <br> Quella 1.1 后台管理系统</h2>
      <div class="kit-login-form">
        <h4 class="kit-login-title">登录</h4>
        <form class="layui-form" action="">
          <div class="kit-login-row">
            <div class="kit-login-col">
              <i class="layui-icon">&#xe612;</i>
              <span class="kit-login-input">
                            <input type="text" id="loginName" name="loginName" value="ssrs@qq.com" lay-verify="required" placeholder="邮箱" />
                        </span>
            </div>
            <div class="kit-login-col"></div>
          </div>
          <div class="kit-login-row">
            <div class="kit-login-col">
              <i class="layui-icon">&#xe64c;</i>
              <span class="kit-login-input">
                            <input type="password" id="password" name="pswd" lay-verify="required" placeholder="密码" />
                        </span>
            </div>
            <div class="kit-login-col"></div>
          </div>
          <div class="kit-login-row">
            <div class="kit-login-col">
              <input type="checkbox" name="remeberMe" id="remeberMe"  value="true" title="记住帐号" lay-skin="primary">
            </div>
          </div>
          <div class="kit-login-row">
            <button class="layui-btn kit-login-btn" lay-submit="submit" lay-filter="login_hash">登录</button>
          </div>
          <%--<div class="kit-login-row" style="margin-bottom:0;">--%>
            <%--<a href="javascript:;" style="color: rgb(153, 153, 153); text-decoration: none; font-size: 13px;" id="forgot">忘记密码</a>--%>
          <%--</div>--%>
        </form>
      </div>
    </div>
  </div>
  <script src="<%=basePath%>/js/jquery.js"></script>
  <script src="<%=basePath%>/js/MD5.js"></script>
  <script src="<%=basePath%>/plugins/kitadmin/layui.js"></script>
  <script>

      layui.use(['jquery', 'layer','form'], function () {
          var layer = layui.layer, form = layui.form;
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

          form.on('submit(login_hash)', function(data) {
              login();
              return false;
          });
      });

      function login() {
          var email = $("#loginName").val();
          var pswd = MD5(email+"#"+$("#password").val());
          var load = layer.load();
          $.ajax({
              url:"<%=basePath%>/u/submitLogin",
              data:{email:email,pswd:pswd,remeberMe:$("#remeberMe").is(':checked')},
              type:"post",
              dataType:"json",
              beforeSend:function(){
                  layer.msg('开始登录，请注意后台控制台。');
              },
              success:function(result){
                  layer.close(load);
                  if(result && result.status != 200){
                      layer.msg(result.message);
                      $('#password').val('');
                      return;
                  }else{
                      layer.msg('登录成功！');
                      setTimeout(function(){
                          //登录返回
                          window.location.href = "<%=basePath%>user/index";
                      },1000)
                  }
              },
              error:function(e){
                  console.log(e,e.message);
                  layer.msg('请看后台Java控制台，是否报错，确定已经配置数据库和Redis',new Function());
              }
          });
      }
  </script>
</body>
</html>