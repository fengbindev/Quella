/** kitadmin-v2.1.0 MIT License By http://kit.zhengjinfan.cn Author Van Zheng */
;"use strict";
var mods = ["element", "sidebar", "mockjs", "select", "tabs", "menu", "route", "utils", "component", "kit"];
var baseUrl = $("script[baseUrl]").attr('baseUrl');
layui.define(mods, function (e) {
    layui.element;
    var n = layui.utils, i = layui.jquery, l = (layui.lodash, layui.route), o = layui.tabs, m = layui.layer,
        t = layui.menu, s = layui.component, p = layui.kit, a = function () {
            this.config = {elem: "#app", loadType: "SPA"}, this.version = "1.0.0"
        };
    a.prototype.ready = function (e) {
        var t = this.config, a = (0, n.localStorage.getItem)("KITADMIN_SETTING_LOADTYPE");
        null !== a && void 0 !== a.loadType && (t.loadType = a.loadType), p.set({type: t.loadType}).init(), u.routeInit(t), u.menuInit(t), "TABS" === t.loadType && u.tabsInit(), "" === location.hash && n.setUrlState("主页", "#/"), layui.sidebar.render({
            elem: "#ccleft",
            title: "这是左侧打开的栗子",
            shade: !0,
            direction: "left",
            dynamicRender: !0,
            url: "views/table/teble2.html",
            width: "50%"
        }), i("#cc").on("click", function () {
            layui.sidebar.render({
                elem: this,
                title: "这是表单盒子",
                shade: !0,
                dynamicRender: !0,
                url: "/views/form/index.ftl",
                width: "50%"
            })
        }), s.on("nav(header_right)", function (e) {
            var t = e.elem.attr("kit-target");
            "setting" === t && layui.sidebar.render({
                elem: e.elem,
                title: "设置",
                shade: !0,
                dynamicRender: !0,
                url: baseUrl+"/open/setting"
            }), "help" === t && m.open({
                title: false,
                type: 1,
                content: '<img src='+baseUrl+'"/images/play.png" />',
                area: ['500px', '604px'],
                shadeClose: true
            });
        }), layui.mockjs.inject(APIs), "SPA" === t.loadType && l.render(), "function" == typeof e && e()
    };

    var routes = [];
    $.ajax({
        async:false,
        type:"GET",
        url:"/menu/buildMenuUrl",
        dataType:"json",
        success:function (data) {
            routes = data;
        }
    });

    //主页
    routes.push({path: "/", component: "/open/app", name: "主页"})
    //个人中心
    routes.push({path: "/user/my", component: baseUrl+"/user/my", name: "个人中心"})
    var u = {
        routeInit: function (e) {
            var t = this, a = {
                routes : routes
            };
            return "TABS" === e.loadType && (a.onChanged = function () {
                o.existsByPath(location.hash) ? o.switchByPath(location.hash) : t.addTab(location.hash, (new Date).getTime())
            }), l.setRoutes(a), this
        }, addTab: function (e, t) {
            var a = l.getRoute(e);
            a && o.add({id: t, title: a.name, path: e, component: a.component, rendered: !1, icon: "&#xe62e;"})
        }, menuInit: function (i) {
            var l = this;
            return t.set({
                dynamicRender: !1, isJump: "SPA" === i.loadType, onClicked: function (e) {
                    if ("TABS" === i.loadType && !e.hasChild) {
                        var t = e.data, a = t.href, n = t.layid;
                        l.addTab(a, n)
                    }
                }, elem: "#menu-box", remote: {url: "/api/getmenus", method: "post"}, cached: !1
            }).render(), l
        }, tabsInit: function () {
            o.set({
                onChanged: function (e) {
                }
            }).render(function (e) {
                e.isIndex && l.render("#/")
            })
        }
    };
    (new a).ready(function () {
        console.log("Init successed.")
    }), e("admin", {})
});
//# sourceMappingURL=admin.js.map
