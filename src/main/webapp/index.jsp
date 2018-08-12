<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>角色编辑</title>
    <link rel="stylesheet" href="<%=basePath%>/plugins/layui-treeselect/plugins/layui/css/layui.css" id="layui">
    <link rel="stylesheet" href="<%=basePath%>/plugins/layui-treeselect/src/css/ztree/metro/ztree.css" media="all"/>
    <link rel="stylesheet" href="<%=basePath%>/plugins/layui-treeselect/src/css/treeselect.css" media="all"/>

</head>
<body>
<form class="layui-form layui-form-pane" action="">
    <input name="id" hidden="hidden"/>
    <div class="layui-form-item">
        <label class="layui-form-label">角色名称</label>
        <div class="layui-input-block">
            <input name="name" lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input"
                   type="text">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color:red;">多选下拉1</label>
        <div class="layui-input-block layui-input-treeselect">
            <input type="text" name="t1" id="treeselect1" required lay-verify="required" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
</form>
</body>
<script src="<%=basePath%>/js/jquery.js"></script>
<script src="<%=basePath%>/plugins/layui-treeselect/plugins/layui/layui.js"></script>
<script>
    layui.config({
        base: '/plugins/layui-treeselect/src/js/' //自定义组件的目录--相对路径
    }).use(['form', 'treeselect'], function () {
        var form = layui.form,
            treeselect = layui.treeselect;
        //通过调用render方法进行渲染 [render支持链式调用]
        treeselect.render({ //渲染第一个
            elem: '#treeselect1', //这个设置必要为id属性且必须加上#号
            data: [{
                id: 1,
                name: '父节点一'
            }, {
                id: 2,
                name: '父节点二',
                open: true, //是否默认打开
                isParent: true, //是否为父节点
                children: [{
                    id: 3,
                    name: '子节点一'
                }, {
                    id: 4,
                    name: '子节点二',
                    isParent: true,
                    children: [{
                        id: 5,
                        name: '子节点2.1'
                    }]
                }]
            }]
        });

    });
</script>
</html>
