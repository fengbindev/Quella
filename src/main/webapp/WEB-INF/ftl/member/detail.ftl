
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>在线用户详情</title>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/layui.css" id="layui">
</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">

        <div class="layui-form-item">
            <label class="layui-form-label">SessionId</label>
            <div class="layui-input-block">
                <input disabled value="${bo.sessionId}" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">创建时间</label>
            <div class="layui-input-block">
                <input  disabled  value="${bo.startTime?string('HH:mm:ss yy-MM-dd')}" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">最后交互时间</label>
            <div class="layui-input-block">
                <input disabled value="${bo.lastAccess?string('HH:mm:ss yy-MM-dd')}"  autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input disabled value="${(bo.sessionStatus)?string('有效','已踢出')}"  autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">session host</label>
            <div class="layui-input-block">
                <input disabled value="${bo.host}"  autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input disabled value="${bo.nickname}"  autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">Email</label>
            <div class="layui-input-block">
                <input disabled value="${bo.email}"  autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">最后登录时间</label>
            <div class="layui-input-block">
                <input disabled value="${bo.lastLoginTime?string('HH:mm:ss yy-MM-dd')}"  autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

    </form>

    <!--这里写页面的代码-->
</div>
</body>
</html>
