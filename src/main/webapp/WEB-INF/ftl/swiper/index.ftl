<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title" style="left: 25px">
        <li class="layui-this">图片播放器</li>

    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">
            <div class="layui-fluid">
                <div class="layui-row layui-col-space25">
                    <div class="layui-col-xs6">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="layui-card-header">

                                    <a id="add" class="layui-btn layui-btn-xs">
                                        <i class="layui-icon"></i>
                                        <span>新增</span>
                                    </a>
                                    <a id="add" class="layui-btn layui-btn-xs">
                                        <i class="layui-icon">&#xe642;</i>
                                        <span>编辑</span>
                                    </a>
                                    <a id="add" class="layui-btn layui-btn-xs">
                                        <i class="layui-icon">&#xe640;</i>
                                        <span>删除</span>
                                    </a>
                                    <a id="add" class="layui-btn layui-btn-xs">
                                        <i class="layui-icon"></i>
                                        <span>预览</span>
                                    </a>

                                    <#--<a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary" id="rhqvf8w5t6q8">-->
                                        <#--<i class="layui-icon"></i>-->
                                    <#--</a>-->
                                </div>
                                <table class="layui-table" id="permissiontable" lay-filter="permissiontable2"></table>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <table class="layui-table" id="permissiontable" lay-filter="permissiontable2"></table>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

    </div>
</div>
    <script src="${basePath}/js/jquery.js"></script>
    <script>
        layui.use(['form', 'layedit',  'element', 'layer'], function(){
            var form = layui.form, layer = layui.layer, element = layui.element;

        });
    </script>