<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">注意这里是项目的左侧菜单栏目管理，如果是系统自带的，我们禁止你删除，如果是你自己添加的，你可以选择可以删除还是不可以删除</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                        <!-- <span>所有会员列表</span> -->
                         <@shiro.hasPermission name="/menu/add">
                        <a id="add" class="layui-btn layui-btn-xs">
                            <i class="layui-icon"></i>
                            <span>新增</span>
                        </a>
                         </@shiro.hasPermission>
                        <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary" id="rhqvf8w5t6q8">
                            <i class="layui-icon"></i>
                        </a>
                    </div>
                    <table class="layui-table" lay-filter="kittable" >
                        <colgroup>
                            <col width="30">
                            <col width="60">
                            <col width="60">
                            <col width="200">
                            <col>
                            <col width="180">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>排序</th>
                            <th>图标</th>
                            <th>标题</th>
                            <th>链接</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if menus??>
                            <#list menus as menu>
                                <#if !menu.parentId?? &&  (menu.children?size>0)>
                                 <tr>
                                     <td>${menu.id}</td>
                                     <td>${menu.sequence}</td>
                                     <td><i class="layui-icon">${menu.icon}</i></td>
                                     <td>${menu.title}</td>
                                     <td>${menu.url}</td>
                                     <td>
                                         <#if menu.systemMenu==2>系统菜单，无法操作</#if>
                                         <#if menu.systemMenu==1>
                                             <@shiro.hasPermission name="/menu/update">
                                                 <button class="layui-btn layui-btn-sm layui-btn-normal"
                                                         onClick="update(this,'${menu.id}')"><i class="layui-icon">&#xe642;</i>
                                                     编辑
                                                 </button>
                                             </@shiro.hasPermission>
                                             <@shiro.hasPermission name="/menu/del">
                                                 <button class="layui-btn layui-btn-sm layui-btn-danger"
                                                         onClick="del(this,'${menu.id}'),'#{menu.permission.id}'"><i
                                                         class="layui-icon">&#xe640;</i> 删除
                                                 </button>
                                             </@shiro.hasPermission>
                                         </#if>
                                     </td>
                                 </tr>
                                    <#list menu.children as childern>
                                      <tr>
                                          <td>${childern.id}</td>
                                          <td>${childern.sequence}</td>
                                          <td><i class="layui-icon">${childern.icon}</i></td>
                                          <td><font
                                                  color="#e1e1e1">&nbsp;|--&nbsp;&nbsp;|--&nbsp;&nbsp;</font>${childern.title}
                                          </td>
                                          <td>${childern.url}</td>
                                          <td>
                                         <#if childern.systemMenu==2>系统菜单，无法操作</#if>
                                         <#if childern.systemMenu==1>
                                             <@shiro.hasPermission name="/menu/update">
                                                 <button class="layui-btn layui-btn-sm layui-btn-normal"
                                                         onClick="update(this,'${childern.id}')"><i class="layui-icon">&#xe642;</i>
                                                     编辑
                                                 </button>
                                             </@shiro.hasPermission>
                                             <@shiro.hasPermission name="/menu/del">
                                                 <button class="layui-btn layui-btn-sm layui-btn-danger"
                                                         onClick="del(this,'${childern.id}','#{childern.permission.id}')"><i class="layui-icon">&#xe640;</i>
                                                     删除
                                                 </button>
                                             </@shiro.hasPermission>
                                         </#if>
                                          </td>
                                      </tr>
                                    </#list>
                                </#if>
                            </#list>
                        </#if>
                        </tbody>
                    </table>
                    <!--这里写页面的代码-->
                </div>
            </div>
        </div>
    </div>
    <script>
        var formIndex;
        var currPage = 1;
        // 添加
        var table;
        layui.use(['jquery', 'layer', 'table'], function () {
            table = layui.table;
            form = layui.form;
            var layer = layui.layer;

            //让层自适应iframe
            $('#add').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/menu/goAdd',
                    area: ['800px', '500px'],
                    maxmin: true,
                    end: function () {
                        location.reload();
                    }
                });
                parent.layer.iframeAuto(index);
            });

        });

        // 修改
        function update(obj,id){
            var index = layer.open({
                type: 2,
                content: '${basePath}/menu/goUpdate?id='+id,
                area: ['800px', '600px'],
                maxmin: true,
                end: function () {
                    location.reload();
                }
            });
            parent.layer.iframeAuto(index);
        };

        // 删除
        function del(obj,id,permissionId){
            //询问框
            layer.confirm('真的要删除么？', {
                btn: ['确定','取消'], //按钮
                end: function () {
                    location.reload();
                }
            }, function(){
                console.log(permissionId);
                $.post("${basePath}/menu/del",{'id':id,"permissionId":permissionId},function(data){
                    // 获取 session
                    if(data.status!=200){
                        layer.msg(data.message, {icon: 2});
                    }
                    if(data.status==200){
                        layer.msg(data.message, {icon: 1});
                        table.reload('kittable');
                    }
                    parent.layer.iframeAuto(index);
                });
            }, function(){
            });
        };


    </script>