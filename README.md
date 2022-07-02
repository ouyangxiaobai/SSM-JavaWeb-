# 项目名称

SSM框架基于JavaWeb在线投票系统的设计与实现源码+论文+ppt+代码讲解视频+安装视频（包安装）

# 系统介绍
根据系统分析，将在线投票管理系统分为前台功能模块和后台功能模块。其中系统前台功能实现用户注册、用户登录、浏览、投票、投票中心和投票历史等功能。系统前台功能如图5-2所示：

图5-2 系统前台功能模块结构图

用户注册：用户填写用户名、密码和性别，点击注册按钮进行注册。

用户登录：用户填写已经注册的用户名和密码，点击登录按钮进行登录。

浏览：用户可以浏览在线投票管理系统中公共开放内容。

投票：用户选择自己需要的投票，针对主题，勾选选项，进行投票操作。投票方式支持单选只能投一次、单选一天只能投一次、多选只能投一次、多选一天只能投一次等四种方式。

投票中心：在线投票管理系统展示所有投票主题供用户选择。

投票历史：存储用户已经投票的历史内容，用户登陆后方可查看。

系统后台功能实现以下功能，投票信息管理、详细投票查看、用户信息管理、投票信息统计和管理员登录等功能。系统后台功能如图5-3所示：

图5-3 系统后台功能模块结构图

投票信息管理：管理员进行投票信息管理，可以管理投票主题和投票选项。针对投票主题，可以添加投票主题（需要填写主题名称、主题类型、开始时间、结束时间和主题简介）、查看主题、修改主题和删除主题；针对投票选项管理，可以添加选项（需要填写选项名称和选择所属主题）、查看选项、修改选项和删除选项。

详细投票查看：管理员查看投票的详细信息，以列表形式显示，每条投票详细信息包括：投票ID、用户名、投票主题、投票选项、总投票数和投票时间等信息。

用户信息管理：管理员进行用户信息管理，可以添加用户（需要填写用户名、密码、性别和状态）、查看用户信息、修改用户信息和删除用户。

投票信息统计：管理员进行投票信息统计，默认显示所有的投票主题统计，输入搜索主题名称后显示单个主题的投票统计。

管理员登录：管理员输入用户名、密码和验证码，点击登录按钮，进行登录操作。

# 环境需要

1.运行环境：最好是java jdk 1.8，我们在这个平台上运行的。其他版本理论上也可以。\
2.IDE环境：IDEA，Eclipse,Myeclipse都可以。推荐IDEA;\
3.tomcat环境：Tomcat 7.x,8.x,9.x版本均可\
4.硬件环境：windows 7/8/10 1G内存以上；或者 Mac OS； \
5.数据库：MySql 5.7版本；\
6.是否Maven项目：否；

# 技术栈

1. 后端：Spring+SpringMVC+Mybatis\
2. 前端：JSP+CSS+JavaScript+jQuery

# 使用说明

1. 使用Navicat或者其它工具，在mysql中创建对应名称的数据库，并导入项目的sql文件；\
2. 使用IDEA/Eclipse/MyEclipse导入项目，Eclipse/MyEclipse导入时，若为maven项目请选择maven;\
若为maven项目，导入成功后请执行maven clean;maven install命令，然后运行；\
3. 将项目中springmvc-servlet.xml配置文件中的数据库配置改为自己的配置;\
4. 运行项目，在浏览器中输入http://localhost:8080/ 登录

# 高清视频演示

https://www.bilibili.com/video/BV1YY4y1E7iW/


> # **数据库及资料获取：QQ:3484724101**
​