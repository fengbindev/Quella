# Quella

#### 项目介绍

因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率
也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。

这里说明一下，因为Quella的设计是 **面向分布式集群部署** 的，所以在框架的选择上都是可以分布式部署的。


"Quella"中译英为"杀手"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy  :)

#### 项目演示地址
http://www.ssrsdev.top/
账号：ssrs@qq.com
密码：admin

#### 开发文档地址
https://fengbindev.github.io/Quella-docs/

#### 项目交流QQ群
891137268

#### 项目演示图片
![后台登录页面](https://images.gitee.com/uploads/images/2018/0924/154933_7976bedb_1783183.png "微信截图_20180924154342.png")
![后台首页](https://images.gitee.com/uploads/images/2018/0924/155004_fa46045f_1783183.png "微信截图_20180924154221.png")
![系统日志](https://images.gitee.com/uploads/images/2018/0924/155023_4a36b7f7_1783183.png "微信截图_20180924154327.png")
![权限管理](https://images.gitee.com/uploads/images/2018/0924/155049_c094a3ed_1783183.png "微信截图_20180924154309.png")
![搜索页面](https://images.gitee.com/uploads/images/2018/1010/162312_a8ed3ad3_1783183.png "TIM截图20181010160537.png")
#### 软件架构
软件架构说明

- 前端框架：基于layui的kit-admin

- 页面模板：采用FreeMaker 与 Jsp 双视图

- 后端主要框架：SpringMVC+Spring+MybatisPlus+Shiro+Redis 

- 后端使用Redis做分布式session 与 分布式缓存

- 使用 Quartz作为任务调度方案

- 使用ElasticSearch作为全文检索与数据分析方案

#### 使用环境说明

1. JDK 1.8
2. Tomcat 7
3. mysql 5.7
4. redis 3.0
5. ElasticSearch 6.4.2 
6. 开发工具IDEA（需要安装lombok插件）

### 搭建说明

1. 将下载的项目导入到IDEA 
2. 修改 spring-cache.xml 文件，配置自己的redis链接
3. 修改 jdbc.properties 文件，配置自己的mysql数据库链接
4. 修改 spring-elasticsearch 文件，配置自己的ElasticSearch集群设置
5. 如果需要自定义一些配置可以修改 spring-mybatis.xml 文件
6. 代码生成在Test的com.ssrs.mp.TestGenerator 按照注释修改配置即可。

需要注意的是我用的ElasticSearch为6.4.2 版本，es6.x版本使用的log4j2的2.11.1版本，而log4j2-2.11.1需要jdk9,但是我的环境是jdk1.8,所以tomcat启动会报

```
Unable to process Jar entry [META-INF/versions/9/module-info.class] from Jar [jar:file:/D:/IdeaProjects/quella/target/quella/WEB-INF/lib/log4j-api-2.11.1.jar!/] for annotations
org.apache.tomcat.util.bcel.classfile.ClassFormatException: Invalid byte tag in constant pool: 19

```
但是不会影响使用。
解决方法：1.降低es版本，2.提高jdk版本，3.在pom文件排除es的log4j2依赖，自己引入2.11一下版本

#### 2018年8月20日 (v1.0)

> *完成了后台基本搭建,暂没集成任何第三方*

- 主要框架SSM+Shiro+Redis 
- 权限管理采用的是RBAC思想
- 密码采用MD5加盐加密
- 使用Quartz做定时任务(暂时还没做分布式)
 

#### 2018年9月21日 (v1.1)

> *集成一些基本的第三方服务*

- 支付宝PC段支付与H5支付 
- 七牛云存储
- 富文本
- 邮件发送
- 阿里云短信服务

#### 2018年10月10日 (v1.2)

> *引入ElasticSearch*

- 整合ElasticSearch作为全文检索方案 
- 日志框架log4j升级为log4j2
- 修复在线用户显示问题

#### 2018年10月26日 (v1.3)

> *完成一些功能组件并可以使用标签调用*

- 图片播放器标签 
- 友情链接标签
- 数据字典标签
- 站点IP、PV统计
- 实时控制台日志

