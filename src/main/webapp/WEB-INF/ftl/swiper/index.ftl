<style>
    .layui-table-cell{
        height: auto!important;
        white-space: normal;
    }
    .laytable-cell-1-url{
        height: 100%;
        max-width: 100%;
    }
    .layui-table img {
        max-width: 200px;
    }
</style>
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title" style="left: 25px">
        <li class="layui-this">图片播放器</li>
        <li>使用说明</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">
            <div class="layui-fluid">
                <div class="layui-row layui-col-space25">
                    <div class="layui-col-xs6">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="layui-card-header">
                                      <@shiro.hasPermission name="/swiper/add">
                                        <a id="add" class="layui-btn layui-btn-xs">
                                            <i class="layui-icon"></i>
                                            <span>新增</span>
                                        </a>
                                      </@shiro.hasPermission>
                                    <span>这里是图片播放器列表</span>
                                </div>
                                <table class="layui-table" id="swipertable" lay-filter="swipertable2"></table>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="layui-card-header">
                                     <@shiro.hasPermission name="/swiper/add">
                                        <a id="addChild" class="layui-btn layui-btn-xs">
                                            <i class="layui-icon"></i>
                                            <span>新增</span>
                                        </a>
                                     </@shiro.hasPermission>
                                    <span>这里是图片播放器的图片列表</span>
                                </div>
                                <table class="layui-table" id="swiperChildtable" lay-filter="swiperChildtable2"></table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>

        <div class="layui-tab-item">
            <blockquote class="layui-elem-quote">图片播放器调用说明</blockquote>
            <pre class="layui-code">
    这里使用了自定义标签调用,内置了6种基本图片播放器样式.
    调用方式：
       < @api target="imagePlayerTag" i d="1">
          $ {outTagName}
       < /@api>
    target值：Spring容器的Bean的id值
    id值：为图片播放器的id.
    要调用那个图片播放器，只需修改id值即可。

    <b>图片播放器是基于swiper4.0做的，如果不能满足你的要求，可以自己引入相应的swiper的css,js
    参照swiper的官方文档自定义样式。
    swiper官网：https://www.swiper.com.cn/
    </b>
            </pre>
        </div>
</div>
    <input name="imagePlayerId" type="hidden">
    <script type="text/html" id="barDemo">
        <button class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">详情</button>
         <@shiro.hasPermission name="/swiper/update">
        <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
        <@shiro.hasPermission name="/swiper/del">
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
       </@shiro.hasPermission>
    </script>
    <script type="text/html" id="kaiguan">
        <input type="checkbox" value="{{ d.id }}" {{#  if(d.type == 1){ }} checked="" {{#  } }}  name="open" lay-skin="switch" lay-filter="ahType1" lay-text="开|关">
    </script>
    <script type="text/html" id="imgTpl">
        <img src="{{d.img}}" width="200px" height="100px" />
    </script>
    <script type="text/html" id="barDemo1">
        <@shiro.hasPermission name="/swiper/update">
        <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
        <@shiro.hasPermission name="/swiper/del">
        <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
        </@shiro.hasPermission>
    </script>
    <script src="${basePath}/js/jquery.js"></script>
    <script>

        layui.use(['form', 'layedit',  'element', 'layer','table','code'], function(){
            var form = layui.form, layer = layui.layer, element = layui.element,table = layui.table;
            var imagePlayerId;
            //让层自适应iframe
            $('#add').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/swiper/goAdd',
                    area: ['700px', '500px'],
                    maxmin: true,
                    end: function () {
                        table.reload("swipertable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });
            $('#addChild').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/swiper/goAddChild',
                    area: ['700px', '500px'],
                    maxmin: true,
                    end: function () {
                        table.reload("swiperChildtable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });

            //表格渲染
            table.render({
                elem: '#swipertable'
                ,url:'${basePath}/swiper/getSwiperPage'
                ,method:'post'
                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                ,cols: [[
                    {field:'id',align:'center', width:70,  title: 'ID'}
                    ,{field:'name',  title: '名称'}
                    ,{field:'swiperType',  title: '播放器样式',templet:function (d) {
                            switch (d.swiperType){
                                case 1:return "普通切换";break;
                                case 2:return "普通切换带按钮";break;
                                case 3:return "圆点分页器";break;
                                case 4:return "数字分页器";break;
                                case 5:return "渐变切换";break;
                                case 6: return "垂直切换";break;
                            }
                        }}
                    ,{field:'right',align:'center', width:165, toolbar: '#barDemo', title: '操作'}
                    ,{ width:1}

                ]]
            });
            //监听修改按钮
            table.on('tool(swipertable2)', function(obj){
                var data = obj.data;
                if(obj.event === 'detail'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/swiper/goDetail?id='+data.id,
                        area: ['500px', '500px'],
                        maxmin: true
                    });
                    parent.layer.iframeAuto(index);

                }else if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/swiper/goUpdate?id='+data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("swipertable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/swiper/del", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("swipertable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }
            });

            //监听child修改按钮
            table.on('tool(swiperChildtable2)', function(obj){
                var data = obj.data;
                 if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/swiper/goUpdateChild?id='+data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("swiperChildtable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/swiper/delChild", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("swiperChildtable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }
            });

            //监听行事件
            table.on('row(swipertable2)', function(obj){
                var data = obj.data;
                imagePlayerId = data.id;
                $("[name=\"imagePlayerId\"]").val(imagePlayerId);
                console.log( $("[name=\"imagePlayerId\"]").val());
                // obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
                table.render({
                    elem: '#swiperChildtable'
                    ,url:'${basePath}/swiper/getSwiperChildPage'
                    ,method:'post'
                    ,where:{imagePlayerId:data.id}
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                    ,cols: [[
                        {field:'sequence', width:70, align:'center', title: '排序'}
                        ,{field:'title',  width:120,title: '标题'}
                        ,{field:'url',  width:237, style:'height:100px', title: '图片',templet:'#imgTpl'}
                        ,{field:'type',align:'center', width:80, toolbar: '#kaiguan', title: '开关'}
                        ,{align:'center', width:120, style:'height:120px',toolbar: '#barDemo1', title: '操作' ,fixed:'right'}
                    ]]
                });
            });
        });
    </script>