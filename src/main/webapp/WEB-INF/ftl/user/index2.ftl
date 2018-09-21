<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>Quella</title>
    <link   rel="shortcut icon" href="${basePath}/favicon.ico" />
  <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/layui.css" id="layui">
  <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/theme/default.css" id="theme">
  <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/kitadmin.css" id="kitadmin">
</head>

<body class="layui-layout-body kit-theme-default">
  <div class="layui-layout layui-layout-admin">
    <!-- header -->
    <div class="layui-header">
      <div class="layui-logo">
        <div class="layui-logo-toggle" kit-toggle="side" data-toggle="on">
          <i class="layui-icon">&#xe65a;</i>
        </div>
        <div class="layui-logo-brand">
          <a href="#/">QUELLA 1.0</a>
        </div>
      </div>
      <div class="layui-layout-left">
        <!-- <div class="kit-search">
          <form action="/">
            <input type="text" name="keyword" class="kit-search-input" placeholder="关键字..." />
            <button class="kit-search-btn" title="搜索" type="submit">
              <i class="layui-icon">&#xe615;</i>
            </button>
          </form>
        </div> -->
      </div>
      <div class="layui-layout-right">
        <ul class="kit-nav" lay-filter="header_right">
          <li class="kit-item" kit-target="help">
            <a href="javascript:;" id="pay">
              <i class="layui-icon">&#xe65e;</i>
              <span>捐赠我</span>
            </a>
          </li>
          <li class="kit-item" id="ccleft">
            <a href="javascript:;">
              <i class="layui-icon">&#xe60e;</i>
            </a>
          </li>
          <li class="kit-item" id="cc">
            <a href="javascript:;">
              <i class="layui-icon">&#xe64c;</i>
            </a>
          </li>
          <li class="kit-item">
            <a href="javascript:;">
              <span>
                <#--<img src="http://m.zhengjinfan.cn/images/0.jpg" class="layui-nav-img">-->
                ${token.nickname}
              </span>
            </a>
            <ul class="kit-nav-child kit-nav-right">
              <li class="kit-item">
                <a href="#/user/my">
                  <i class="layui-icon">&#xe612;</i>
                  <span>个人中心</span>
                </a>
              </li>
              <li class="kit-item" kit-target="setting">
                <a href="javascript:;">
                  <i class="layui-icon">&#xe614;</i>
                  <span>设置</span>
                </a>
              </li>
              <li class="kit-nav-line"></li>
              <li class="kit-item">
                <a href="javascript:;" onclick="logout()">
                  <i class="layui-icon">&#x1006;</i>
                  <span>注销</span>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    <!-- silds -->
    <div class="layui-side" kit-side="true">
      <div class="layui-side-scroll">
        <div id="menu-box">
          <ul class="kit-menu">
            <li class="kit-menu-item">
              <a href="#/">
                <i class="layui-icon"></i>
                <span>首页</span>
              </a>
            </li>
            <#if menus??>
            <#list menus as menu>
            <#if !menu.parentId?? &&  (menu.children?size>0)>
                <li class="kit-menu-item">
                    <a href="javascript:;">
                        <i class="layui-icon">${menu.icon}</i>
                        <span>${menu.title}</span>
                    </a>
                     <ul class="kit-menu-child layui-anim layui-anim-upbit">


            <#list menu.children as childern>
                <li class="kit-menu-item">
                    <a href="#${childern.url}">
                        <i class="layui-icon">${childern.icon}</i>
                        <span>${childern.title}</span>
                    </a>
                </li>
            </#list>
            </li></ul>

            </#if>
            </#list>
            </#if>

          </ul>
        </div>
      </div>
    </div>
    <!-- main -->
    <div class="layui-body" kit-body="true">
      <router-view></router-view>
    </div>
    <!-- footer -->
    <div class="layui-footer" kit-footer="true">
      2017 © kit.zhengjinfan.cn MIT license
      <div style="width:400px; height:400px;" class="load-container load1">
        <div class="loader">Loading...</div>
      </div>
    </div>
  </div>

  <script src="${basePath}/js/jquery.js"></script>
  <script>
      var themeKey = 'KITADMIN_SETTING_THEME';
      var theme = localStorage.getItem(themeKey);
      var themeName = $.parseJSON(theme).theme;
      var str = $('#theme').attr('href');
      var _themeUrl = str.substr(0, str.lastIndexOf('/') + 1);
      $('#theme').attr('href', _themeUrl + themeName + '.css');
      var _body = $('body');
      if (!_body.hasClass('kit-theme-' + themeName)) {
          _body.addClass('kit-theme-' + themeName);
      }
  </script>
  <script baseUrl="${basePath}" src="${basePath}/plugins/kitadmin/layui.js"></script>
  <script src="${basePath}/plugins/kitadmin/polyfill.min.js"></script>
  <script baseUrl="${basePath}" src="${basePath}/plugins/kitadmin/kitadmin.js"></script>
  <script src="${basePath}/plugins/kitadmin/mockjs-config.js"></script>
  <script src="https://cdn.bootcss.com/echarts/4.1.0.rc2/echarts.min.js"></script>
  <script>layui.use("admin");</script>
<script>
    function logout() {
        $.get("${basePath}/u/logout",{},function (data) {
            if (data.status==200){
                location.href="${basePath}/u/login";
            }else{
                layer.msg("退出失败！", {icon: 0, time: 1000});
            }
        },"json");
    }
</script>

</body>

</html>