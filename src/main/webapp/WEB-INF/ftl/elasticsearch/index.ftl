<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Quella-1.3</title>
    <!-- build:css -->
    <link rel="shortcut icon" href="${basePath}/favicon.ico"/>
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/layui.css">
    <link rel="stylesheet" href="${basePath}/plugins/kitadmin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/css/search.css">
    <!-- endbuild -->
</head>
<script src="${basePath}/js/jquery.js"></script>
<script baseUrl="${basePath}" src="${basePath}/plugins/kitadmin/layui.js"></script>

<body>
<form class="layui-form" action="/search/elasticsearch">
    <input type="hidden" name="page" value="1" />
    <input type="hidden" name="limit" value="10" />
    <ul class="layui-nav" lay-filter="">
        <li class="layui-nav-item"><a href="${basePath}/" style="font-size: 20px" >Quella 1.3</a></li>
        <li class="layui-nav-item" style="width: 30%"><input type="text" name="keyword" id="keyword" required lay-verify="required" placeholder="请输入搜索内容" autocomplete="off" class="layui-input">  </li>
        <li class="layui-nav-item"><button class="layui-btn" style="margin-left:2px " lay-submit lay-filter="*" >搜索</button></li>
    </ul>
</form>
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;

            //…
        });
    </script>

    <div class="layui-row" style="margin-top: 10px;">

        <div class="layui-col-md6 layui-col-md-offset1">
            <div class="crumb">有 ${(total)!0} 条结果符合  ${(keyword)!0} 的查询条件， 共耗时 ：${(took)!0} 毫秒 </div>
            <hr>

            <#if hits?exists && hits?size gt 0 >
                <#list hits as hit>
                    <div class="searchResults">
                        <p class="fz16 line24">
                           <a target="_blank" href="http://blog.ssrsdev.top/index.php/archives/${(hit.id)!}" style="color: #1451b4">
                               ${(hit.sourceAsMap.title?replace(keyword,"<font color='red'>"+keyword+"</font>","i"))!}
                           </a>
                        </p>
                        <p>
                            <#if hit.sourceAsMap.text?length gt 330>
                                ${hit.sourceAsMap.text?substring(0,330)}...
                            <#else>
                                ${(hit.sourceAsMap.text)!}
                            </#if>

                        </p>
                    </div>
                </#list>
            <#else>
                 <div class="searchResults">
                     <p class="fz16 line24">
                         没有搜索到相关数据
                     </p>

                 </div>
            </#if>
            <div id="test1" style="margin-top: 20px"></div>
        </div>
        <div class="layui-col-md3 layui-col-md-offset1">
            <blockquote class="layui-elem-quote">
                搜索的内容对接的是我的博客内容数据。<br>
                博客地址：http://blog.ssrsdev.top/
            </blockquote>
        </div>
    </div>
    <script>
        layui.use(['laypage','element'], function(){
            var laypage = layui.laypage;

            //执行一个laypage实例
            laypage.render({
                elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
                ,count: ${(total)!0}//数据总数，从服务端得到
                ,curr: ${curr}
                ,limit:${limit}
                ,limits:[10,20,30,40,50]
                ,layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']
                ,jump: function(obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                    console.log(obj.limit); //得到每页显示的条数
                    //首次不执行
                    if(!first){
                        location.href = "${basePath}/search/elasticsearch?page="+obj.curr+"&limit="+obj.limit+"&keyword=${keyword}";
                    }
                }
            });
        });

    </script>
</body>
</html>
