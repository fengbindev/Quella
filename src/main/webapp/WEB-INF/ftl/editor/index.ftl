<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">富文本集成</li>
        <li>使用说明</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">

            <div class="layui-fluid">
                <div class="layui-row">
                    <div class="layui-col-xs12">
                        <div class="layui-card">

                            <!--这里写页面的代码-->
                            <div class="layui-card-body">
                                <div id="editor1">
                                    <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
                                </div>
                                <#include "../common/editor.ftl">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="layui-tab-item">
            <blockquote class="layui-elem-quote"> 富文本调用说明</blockquote>
            <pre class="layui-code"> </pre>
            <blockquote class="layui-elem-quote"></blockquote>
            <pre class="layui-code">

            </pre>
        </div>
    </div>
</div>

    <script src="${basePath}/js/jquery.js"></script>
    <script src="${basePath}/plugins/kit-admin/layui.js"></script>
