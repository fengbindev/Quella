# Quella

#### 项目介绍

因为自己做项目总是得从头搭建项目，做一些繁琐无聊的工作，浪费时间，为提升开发效率
也为了将自己学到的东西融会贯通，所以在学习了几个开源项目后准备搭建一个自己后台通用脚手架。

"Quella"中译英为"杀手"的意思,亦有“杀人红尘中，脱身白刃里”的感觉，正符合这个项目的意境----为一个好的项目名而兴奋的boy  :)

#### 项目演示地址
http://www.ssrsdev.top/
账号：ssrs@qq.com
密码：admin

#### spring boot+shiro+redis 版移步
[https://gitee.com/hgpt/Aurora](https://gitee.com/hgpt/Aurora)

#### 项目演示图片
![后台登录页面](https://images.gitee.com/uploads/images/2018/0924/154933_7976bedb_1783183.png "微信截图_20180924154342.png")
![后台首页](https://images.gitee.com/uploads/images/2018/0924/155004_fa46045f_1783183.png "微信截图_20180924154221.png")
![系统日志](https://images.gitee.com/uploads/images/2018/0924/155023_4a36b7f7_1783183.png "微信截图_20180924154327.png")
![权限管理](https://images.gitee.com/uploads/images/2018/0924/155049_c094a3ed_1783183.png "微信截图_20180924154309.png")
#### 软件架构
软件架构说明

前端框架：基于layui的kit-admin

页面模板：采用FreeMaker 与 Jsp 双视图

后端主要框架：SpringMVC+Spring+MybatisPlus+Shiro+Redis 

后端做分布式session 与 分布式缓存


#### 使用环境说明

1. JDK 1.8
2. Tomcat 7
3. mysql 5.7
4. redis 3.0
5. 开发工具IDEA

### 搭建说明

1. 将下载的项目导入到IDEA 
2. 修改 spring-cache.xml 文件，配置自己的redis链接
3. 修改 jdbc.properties 文件，配置自己的mysql数据库链接
4. 如果需要自定义一些配置可以修改 spring-mybatis.xml 文件
5. 代码生成在Test的com.ssrs.mp.TestGenerator 按照注释修改配置即可。


#### 2018年8月20日 (v1.0)

> *完成了后台基本搭建,暂没集成任何第三方*

- 主要框架SSM+Shiro+Redis 
- 权限管理采用的是RBAC思想
- 密码采用MD5加盐加密
- 使用Quartz做定时任务(暂时还没做分布式)
 

#### 2018年9月21日 (v1.0)

> *集成一些基本的第三方服务*

- 支付宝PC段支付与H5支付 
- 七牛云存储
- 富文本
- 邮件发送
- 阿里云短信服务


