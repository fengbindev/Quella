<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">在线用户管理</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                        这里是在线已经登录的有效Session，不能等同于当前在线用户，来源于Redis。
                    </div>
                    <#--<table class="layui-table" id="usertable" lay-filter="usertable2"></table>-->
                    <table class="layui-table" lay-filter="kittable" >

                        <thead>
                        <tr>
                            <th>SessionID</th>
                            <th>昵称</th>
                            <th>Email/帐号</th>
                            <th>创建回话</th>
                            <th>回话最后活动</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if list?exists && list?size gt 0 >
							<#list list as it>
								<tr>
                                    <td>${it.sessionId?default('未设置')}</td>
                                    <td>${it.nickname?default('未设置')}</td>
                                    <td>${it.email?default('未设置')}</td>
                                    <td>${it.startTime?string('HH:mm:ss yy-MM-dd')}</td>
                                    <td>${it.lastAccess?string('HH:mm:ss yy-MM-dd')}</td>
                                    <td>${(it.sessionStatus)?string('有效','已踢出')}</td>
                                    <td>
                                        <a href="javascript:;" onclick="onlineDetails('${it.sessionId}')">详情</a>
										<@shiro.hasPermission name="/member/changeSessionStatus">
											<a v="onlineDetails"href="javascript:void(0);" sessionId="${it.sessionId}" status="${(it.sessionStatus)?string(1,0)}">${(it.sessionStatus)?string('踢出','激活')}</a>
                                        </@shiro.hasPermission>
                                    </td>
                                </tr>
                            </#list>
                        <#else>
							<tr>
                                <td align="center" colspan="6">没有用户</td>
                            </tr>
                        </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script >

        layui.use(['jquery', 'layer', 'table', 'laydate'], function () {
            var layer = layui.layer;
        });
        // 修改
        function onlineDetails(sessionId){
            var index = layer.open({
                type: 2,
                content: '${basePath}/member/onlineDetails?sessionId='+sessionId,
                area: ['800px', '600px'],
                maxmin: true
            });
            parent.layer.iframeAuto(index);
        };

        <@shiro.hasPermission name="/member/changeSessionStatus">
			$(function(){
                $("a[v=onlineDetails]").on('click',function(){
                    var self = $(this);
                    var text = $.trim(self.text());
                    var index = layer.confirm("确定"+ text +"？",function(){
                        changeSessionStatus(self.attr('sessionId'),self.attr('status'),self);
                        layer.close(index);
                    });
                });
            });
			//改变状态
			function changeSessionStatus(sessionIds,status,self){
                status = !parseInt(status);
                //loading
                var load = layer.load();
                $.post("${basePath}/member/changeSessionStatus",{status:status,sessionIds:sessionIds},function(result){
                    layer.close(load);
                    if(result && result.status == 200){
                        return self.text(result.sessionStatusText),
                                self.attr('status',result.sessionStatus),
                                self.parent().prev().text(result.sessionStatusTextTd);
                        layer.msg('操作成功'),!1;
                    }else{
                        return layer.msg(result.message,function(){}),!1;
                    }
                },'json');
            }
        </@shiro.hasPermission>

    </script>


