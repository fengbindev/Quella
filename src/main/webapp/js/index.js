var mods = [
  'element', 'sidebar', 'mockjs', 'select',
  'tabs', 'menu', 'route', 'utils', 'component', 'kit', 'echarts'
];
var baseUrl = $("script[baseUrl]").attr('baseUrl');
layui.define(mods, function(exports) {
  var element = layui.element,
    utils = layui.utils,
    $ = layui.jquery,
    _ = layui.lodash,
    route = layui.route,
    tabs = layui.tabs,
    layer = layui.layer,
    menu = layui.menu,
    component = layui.component,
    kit = layui.kit;


  var Admin = function() {
    this.config = {
      elem: '#app',
      loadType: 'SPA'
    };
    this.version = '1.0.0';
  };

  Admin.prototype.ready = function(callback) {
    var that = this,
      config = that.config;

    // 初始化加载方式
    var getItem = utils.localStorage.getItem;
    var setting = getItem("KITADMIN_SETTING_LOADTYPE");
    if (setting !== null && setting.loadType !== undefined) {
      config.loadType = setting.loadType;
    }

    kit.set({
      type: config.loadType
    }).init();

    // 初始化路由
    _private.routeInit(config);
      // 初始化选项卡
      if (config.loadType === 'TABS') {
          _private.tabsInit();
      }
    // 初始化左侧菜单
    _private.menuInit(config);

    // 跳转至首页
    if (location.hash === '') {
      utils.setUrlState('主页', '#/');
    }

    // // 处理 sidebar
    // layui.sidebar.render({
    //   elem: '#ccleft',
    //   //content:'', 
    //   title: '这是左侧打开的栗子',
    //   shade: true,
    //   // shadeClose:false,
    //   direction: 'left',
    //   dynamicRender: true,
    //   url: 'components/table/teble2.html',
    //   width: '50%', //可以设置百分比和px
    // });

    // $('#cc').on('click', function() {
    //   var that = this;
    //   layui.sidebar.render({
    //     elem: that,
    //     //content:'', 
    //     title: '这是表单盒子',
    //     shade: true,
    //     // shadeClose:false,
    //     // direction: 'left'
    //     dynamicRender: true,
    //     url: 'components/form/index.html',
    //     width: '50%', //可以设置百分比和px
    //   });
    // });
    // 监听头部右侧 nav
    component.on('nav(header_right)', function(_that) {
      var target = _that.elem.attr('kit-target');
      if (target === 'setting') {
        // 绑定sidebar
        layui.sidebar.render({
          elem: _that.elem,
          //content:'', 
          title: '设置',
          shade: true,
          // shadeClose:false,
          // direction: 'left'
          dynamicRender: true,
          url: baseUrl+'/open/setting',
          // width: '50%', //可以设置百分比和px
        });
      }
      if (target === 'help') {
          layer.open({
              title: false,
              type: 1,
              content: '<img src="'+baseUrl+'/images/play.png" />',
              area: ['500px', '604px'],
              shadeClose: true
          });
      }
    });

    // 注入mock
    layui.mockjs.inject(APIs);

    // 初始化渲染
    if (config.loadType === 'SPA') {
      route.render();
    }
    that.render();

    // 执行回调函数
    typeof callback === 'function' && callback();
  }
  Admin.prototype.render = function() {
    var that = this;
    return that;
  }

  var _private = {
    routeInit: function(config) {
      var that = this;
      // route.set({
      //   beforeRender: function (route) {
      //     if (!utils.oneOf(route.path, ['/user/table', '/user/table2', '/'])) {
      //       return {
      //         id: new Date().getTime(),
      //         name: 'Unauthorized',
      //         path: '/exception/403',
      //         component: 'components/exception/403.html'
      //       };
      //     }
      //     return route;
      //   }
      // });
      // 配置路由
          var routes = [];
          $.ajax({
              async:false,
              type:"GET",
              url:baseUrl+"/menu/buildMenuUrl",
              dataType:"json",
              success:function (data) {
                for (var i=0;i<data.length;i++){
                  data[i].component=baseUrl+data[i].component;
                }
                  routes = data;
              }
          });

          //主页
        routes.push({path: "/", component: baseUrl+"/open/app", name: "主页"});
          //个人中心
        routes.push({path: "/user/my", component: baseUrl+"/user/my", name: "个人中心"});
        routes.push({path: "/esSearch", component: baseUrl+"/user/my", name: "搜索"});
      var routeOpts = {
        routes: routes
      };

      if (config.loadType === 'TABS') {
        routeOpts.onChanged = function() {
          // 如果当前hash不存在选项卡列表中
          if (!tabs.existsByPath(location.hash)) {
            // 新增一个选项卡
            that.addTab(location.hash, new Date().getTime());
          } else {
            // 切换到已存在的选项卡
            tabs.switchByPath(location.hash);
          }
        }
      }
      // 设置路由
      route.setRoutes(routeOpts);
      return this;
    },
    addTab: function(href, layid) {
      var r = route.getRoute(href);
      if (r) {
        tabs.add({
          id: layid,
          title: r.name,
          path: href,
          component: r.component,
          rendered: false,
          icon: '&#xe62e;'
        });
      }
    },
    menuInit: function(config) {
      var that = this;
      // 配置menu
      menu.set({
        dynamicRender: false,
        isJump: config.loadType === 'SPA',
        onClicked: function(obj) {
          if (config.loadType === 'TABS') {
            if (!obj.hasChild) {
              var data = obj.data;
              var href = data.href;
              var layid = data.layid;
              that.addTab(href, layid);
            }
          }
        },
        elem: '#menu-box',
        remote: {
          url: '/api/getmenus',
          method: 'post'
        },
        cached: false
      }).render();
      return this;
    },
    tabsInit: function() {
      tabs.set({
        onChanged: function(layid) {
          // var tab = tabs.get(layid);
          // if (tab !== null) {
          //   utils.setUrlState(tab.title, tab.path);
          // }
        }
      }).render(function(obj) {
        // 如果只有首页的选项卡
        if (obj.isIndex) {
          route.render('#/');
        }
      });
    }
  }

  var admin = new Admin();
  admin.ready(function() {
    console.log('Init successed.');
  });

  //输出admin接口
  exports('index', {});
});