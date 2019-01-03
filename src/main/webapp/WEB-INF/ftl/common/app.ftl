<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-row layui-col-space15">
        <div class="layui-col-md3">
          <div class="layui-card">
            <div class="layui-card-body">
              今日IP：<span class="layui-badge layui-bg-green">${(ipCount)!0}</span>
            </div>
          </div>
        </div>
        <div class="layui-col-md3">
          <div class="layui-card">
            <div class="layui-card-body">
                今日PV：<span class="layui-badge layui-bg-green">${(pvCount)!0}</span>
            </div>
          </div>
        </div>
        <div class="layui-col-md3">
          <div class="layui-card">
            <div class="layui-card-body">
              近七日IP：<span class="layui-badge layui-bg-green">${(weekWebVisitCount.ipCount)!0}</span>
            </div>
          </div>
        </div>
        <div class="layui-col-md3">
          <div class="layui-card">
            <div class="layui-card-body">
              近七日PV：<span class="layui-badge layui-bg-green">${(weekWebVisitCount.pvCount)!0}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="layui-col-md12">
      <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">
          <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
              <div class="layui-card">
                <div class="layui-card-header">源码地址</div>
                <div class="layui-card-body">
                  <p style="margin-bottom: 5px;">QQ交流群：891137268</p>
                    <p style="margin-bottom: 5px;">开发文档：<a href="https://fengbindev.github.io/Quella-docs/" target="_blank" style="color: #01AAED">https://fengbindev.github.io/Quella-docs/</a></p>
                  <p style="margin-bottom: 5px;">源码下载:
                    <a href='https://gitee.com/quella01/Quella/' target="_blank">
                      <img src='https://gitee.com/quella01/Quella/badge/star.svg?theme=white' alt='star' width="100px" height="25px"></img>
                    </a>
                    (项目源码)
                  </p>
                    <p style="margin-left: 65px">
                        <a href='https://github.com/fengbindev/Quella/' target="_blank">
                                <iframe src="https://ghbtns.com/github-btn.html?user=fengbindev&repo=Quella&type=star&count=true&size=large" frameborder="0" scrolling="0" width="170px" height="30px"></iframe>
                        </a>
                    </p>
                    <p style="margin-bottom: 5px;">希望大家在Fork项目或下载拉取项目的时候能给我一个Star,谢谢大家，也欢迎大家参与提交代码哦</p>
                    <p style="margin-bottom: 5px;">后续有时间我会提供此项目的开发文档，也会就此项目所用到的技术写博客教程</p>
                </div>
              </div>
            </div>
            <div class="layui-col-md6">
              <div class="layui-card">
                <div class="layui-card-header">ECharts</div>
                <div class="layui-card-body">
                  <div id="container1" style="height:350px;"></div>
                </div>
              </div>
            </div>
            <div class="layui-col-md6">
              <div class="layui-card">
                <div class="layui-card-header">ECharts</div>
                <div class="layui-card-body">
                  <div id="main" style="height:350px;"></div>
                </div>
              </div>
            </div>
            <div class="layui-col-md12">
              <div class="layui-card">
                <div class="layui-card-header">ECharts</div>
                <div class="layui-card-body">
                  <div id="main1" style="height:350px;"></div>
                </div>
              </div>
            </div>
            <div class="layui-col-md12">
              <div class="layui-card">
                <div class="layui-card-header">图片播放器</div>
                <div class="layui-card-body">
                  <@api target="imagePlayerTag" id="1">
                      ${outTagName}
                  </@api>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="layui-col-md4">
          <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
              <div class="layui-card">
                <div class="layui-card-header">快捷入口</div>
                <div class="layui-card-body">
                  <div class="layui-row layui-col-space5">

                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md4">
                      <div style="height:75px;  background-color:#ccc;"></div>
                    </div>
                    <div class="layui-col-xs6 layui-col-sm6 layui-col-md4">
                      <div style="height:75px;  background-color:#ccc;"></div>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm12 layui-col-md4">
                      <div style="height:75px;  background-color:#ccc;"></div>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm7 layui-col-md8">
                      <div style="height:75px;  background-color:#ccc;"></div>
                    </div>
                    <div class="layui-col-xs4 layui-col-sm5 layui-col-md4">
                      <div style="height:75px;  background-color:#ccc;"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="layui-col-md12">
              <div class="layui-card">
                <div class="layui-card-header">项目信息</div>
                <div class="layui-card-body">
                  <table class="layui-table">
                    <colgroup>
                      <col width="150">
                      <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>名称</td>
                        <td>Quella</td>
                    </tr>
                      <tr>
                        <td>版本号</td>
                        <td>v1.5</td>
                      </tr>
                      <tr>
                        <td>作者</td>
                        <td>上善若水</td>
                      </tr>
                      <tr>
                        <td>邮箱</td>
                        <td>947164239@qq.com</td>
                      </tr>
                      <tr>
                        <td>交流群</td>
                        <td>891137268</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="layui-col-md12">
              <div class="layui-card">
                <div class="layui-card-header">关于Quella</div>
                <div class="layui-card-body">
                    <ul class="layui-timeline">

                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">特别感谢以下开源项目：</h3>
                                <p>
                                <ul>
                                    <li>前端框架：基于layui的<a href="https://gitee.com/kitteam/kit_admin_scaffold/" target="_blank" style="color: #01AAED">kit-admin</a></li>
                                <li> Mybatis 的增强工具：<a href="http://mp.baomidou.com/" target="_blank" style="color: #01AAED">mybatisPlus</a></li>
                                <li>Java工具包：<a href="http://www.hutool.cn/" target="_blank" style="color: #01AAED">Hutool</a></li>
                                    <li>第三方sdk工具包：<a href="http://www.openkit.cc/docs/openkit/#/" target="_blank" style="color: #01AAED">openkit</a></li>
                                    <li>后台脚手架：<a href="http://www.openkit.cc/docs/kitadmin/#/" target="_blank" style="color: #01AAED">kitAdmin</a></li>
                                <li>sojson：<a href="https://www.sojson.com/shiro" target="_blank" style="color: #01AAED">ShiroDemo</a></li>
                                </ul>
                                </p>
                            </div>
                        </li>

                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2018年8月20日 (v1.0)</h3>
                                <p>
                                    <b>#完成了后台基本搭建,暂没集成任何第三方</b>
                                    <ul>
                                        <li>主要框架：SSM+Shiro+Redis</li>
                                        <li>页面模板：采用FreeMaker 与 Jsp 双视图</li>
                                        <li>权限管理：采用的是RBAC思想</li>
                                        <li>密码加密：采用MD5加盐加密</li>
                                        <li>定时任务：使用Quartz做定时任务(暂时还没做分布式)</li>
                                    </ul>
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2018年9月21日 (v1.1)</h3>
                                <p>
                                    <b>#集成一些基本的第三方服务</b>
                                <ul>
                                    <li>支付宝PC段支付与H5支付</li>
                                    <li>七牛云存储</li>
                                    <li>富文本</li>
                                    <li>邮件发送</li>
                                    <li>阿里云短信服务</li>
                                </ul>
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2018年10月10日 (v1.2)</h3>
                                <p>

                                <ul>
                                    <li>整合ElasticSearch作为全文检索方案</li>
                                    <li>日志框架log4j升级为log4j2</li>
                                    <li>修复在线用户显示问题</li>
                                </ul>
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2018年10月26日 (v1.3)</h3>
                                <p>
                                    <b>#完成一些功能组件并可以使用标签调用</b>
                                <ul>
                                    <li>图片播放器标签</li>
                                    <li>友情链接标签</li>
                                    <li>数据字典标签</li>
                                    <li>站点IP、PV统计</li>
                                    <li>实时控制台日志</li>
                                </ul>
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2018年12月8日 (v1.4)</h3>
                                <p>
                                    <b>#主要是对系统性能和安全做优化</b>
                                <ul>
                                    <li>使用Redis作为mybatis的二级缓存</li>
                                    <li>使用SpringAOP和自定义注解完成Redis缓存</li>
                                    <li>XSS攻击安全过滤</li>
                                    <li>定时任务可视化控制</li>
                                    <li>富文本可直接嵌入表单</li>
                                    <li>增加系统全局设置页面</li>
                                    <li>修复一些BUG</li>
                                </ul>
                                </p>
                            </div>
                        </li>
                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                <h3 class="layui-timeline-title">2019年1月2日 (v1.5)</h3>
                                <p>
                                    <b>#主要是提高开发速度，进行了高度灵活的代码的生成</b>
                                <ul>
                                    <li>代码在线生成</li>
                                    <li>代码逆向解析生成</li>
                                    <li>表单在线构建</li>
                                </ul>
                                </p>
                            </div>
                        </li>

                        <li class="layui-timeline-item">
                            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                            <div class="layui-timeline-content layui-text">
                                更新说明
                            </div>
                        </li>

                    </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  layui.config({
    base: '/src/js/'
  }).use(['jquery', 'mockjs', 'table'], function() {
    var $ = layui.jquery,
      layer = layui.layer,
      table = layui.table;

    var intervalIndex = setInterval(function() {
      if (echarts === undefined) {
        return;
      }
      // 如果eacharts加载完成，则清除循环
      clearInterval(intervalIndex);
      //echarts
      // 基于准备好的dom，初始化echarts实例
      var myChart = echarts.init(document.getElementById('main'));
      // 指定图表的配置项和数据
      var option = {
        title: {
          text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
          data: ['销量']
        },
        xAxis: {
          data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
        },
        yAxis: {},
        series: [{
          name: '销量',
          type: 'bar',
          data: [5, 20, 36, 10, 10, 20]
        }]
      };
      // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option);

      // echarts 1
      var myChart1 = echarts.init(document.getElementById("container1"));
      var app1 = {};
      option1 = null;
      app1.title = '极坐标系下的堆叠柱状图';

      option1 = {
        title: {
          text: '某站点用户访问来源',
          subtext: '纯属虚构',
          x: 'center'
        },
        tooltip: {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
        },
        series: [{
          name: '访问来源',
          type: 'pie',
          radius: '55%',
          center: ['50%', '60%'],
          data: [{
            value: 335,
            name: '直接访问'
          }, {
            value: 310,
            name: '邮件营销'
          }, {
            value: 234,
            name: '联盟广告'
          }, {
            value: 135,
            name: '视频广告'
          }, {
            value: 1548,
            name: '搜索引擎'
          }],
          itemStyle: {
            emphasis: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }]
      };
      if (option1 && typeof option1 === "object") {
        myChart1.setOption(option1, true);
      }

      // echart2
      var myChart2 = echarts.init(document.getElementById("main1"));
      var app2 = {};
      option2 = null;
      option2 = {
        title: {
          text: '堆叠区域图'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross',
            label: {
              backgroundColor: '#6a7985'
            }
          }
        },
        legend: {
          data: ['邮件营销', '联盟广告', '视频广告', '直接访问', '搜索引擎']
        },
        toolbox: {
          feature: {
            saveAsImage: {}
          }
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: [{
          type: 'category',
          boundaryGap: false,
          data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        }],
        yAxis: [{
          type: 'value'
        }],
        series: [{
          name: '邮件营销',
          type: 'line',
          stack: '总量',
          areaStyle: {
            normal: {}
          },
          data: [120, 132, 101, 134, 90, 230, 210]
        }, {
          name: '联盟广告',
          type: 'line',
          stack: '总量',
          areaStyle: {
            normal: {}
          },
          data: [220, 182, 191, 234, 290, 330, 310]
        }, {
          name: '视频广告',
          type: 'line',
          stack: '总量',
          areaStyle: {
            normal: {}
          },
          data: [150, 232, 201, 154, 190, 330, 410]
        }, {
          name: '直接访问',
          type: 'line',
          stack: '总量',
          areaStyle: {
            normal: {}
          },
          data: [320, 332, 301, 334, 390, 330, 320]
        }, {
          name: '搜索引擎',
          type: 'line',
          stack: '总量',
          label: {
            normal: {
              show: true,
              position: 'top'
            }
          },
          areaStyle: {
            normal: {}
          },
          data: [820, 932, 901, 934, 1290, 1330, 1320]
        }]
      };;
      if (option2 && typeof option2 === "object") {
        myChart2.setOption(option2, true);
      }

      $(window).on('resize', function() {
        myChart.resize();
        myChart1.resize();
        myChart2.resize();
      });
    }, 50);

    // 注入mock
    layui.mockjs.inject({
      'POST /demo/table/user': {
        code: 0,
        msg: "xxx",
        count: 1000,
        'data|20': [{
          'id|+1': 1,
          username: '@name',
          sex: '@boolean',
          city: '@city',
          sign: '@csentence',
          experience: '@integer',
          score: '@integer',
          classify: '@word',
          wealth: '@integer',
          auth: '@boolean'
        }]
      }
    });

  });
</script>
<style scoped>

</style>