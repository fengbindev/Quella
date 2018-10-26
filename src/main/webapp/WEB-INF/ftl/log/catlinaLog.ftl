<div id="log-container" style="width:98%;overflow-y: scroll; background: #333; color: #aaa; padding: 10px;">
    <div>

    </div>
</div>
</body>
<script src="${basePath}/js/jquery.js"></script>
<script>
    $(document).ready(function() {
        // 指定websocket路径
        $("#log-container").css("height",$(".layui-body").height()-20+'px');
        var path = "${path}catlinaLogWebsocket";
        var websocket = new WebSocket('ws://'+path);
        websocket.onmessage = function(event) {
            // 接收服务端的实时日志并添加到HTML页面中
            $("#log-container div").append(event.data);
            // 滚动条滚动到最低部
            $("#log-container").scrollTop($("#log-container div").height() - $("#log-container").height());
        };
    });
</script>
