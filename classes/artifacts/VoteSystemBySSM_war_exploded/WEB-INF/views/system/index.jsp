<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>投票管理系统 管理员后台</title>
    <link rel="shortcut icon" href="favicon.ico"/>
	<link rel="bookmark" href="favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="../easyui/css/default.css" />
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css" />
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src='../easyui/js/outlook2.js'> </script>
    <script type="text/javascript">
	 var _menus = {"menus":[
						
						{"menuid":"2","icon":"","menuname":"投票信息管理",
							"menus":[
									{"menuid":"21","menuname":"主题列表","icon":"icon-user-student","url":"../admin/subject/list"},
									{"menuid":"22","menuname":"选项列表","icon":"icon-user-student","url":"../admin/subject_item/list"},
								]
						},
						{"menuid":"4","icon":"","menuname":"详细投票查看",
							"menus":[
									{"menuid":"42","menuname":"详细投票列表","icon":"icon-house","url":"../admin/vote/list"}
								]
						},
						{"menuid":"3","icon":"","menuname":"用户信息管理",
							"menus":[
									{"menuid":"31","menuname":"用户列表","icon":"icon-user-teacher","url":"../admin/user/list"},
								]
						},
						{"menuid":"6","icon":"","menuname":"投票信息统计",
							"menus":[
									{"menuid":"61","menuname":"投票统计","icon":"icon-book-open","url":"../admin/vote_stats/list"},
								]
						},
				]};


    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
	<noscript>
		<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
		    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
		</div>
	</noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 60px;
        background: url(images/layout-browser-hd-bg.gif) #00154e repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;display: block;padding-top: 25px;font-size: 16px" class="head">
        <span style="color:red; font-weight:bold;font-size: 16px">${user.name}&nbsp;</span>您好&nbsp;&nbsp;&nbsp;
        <a href="../system/login_out" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 26px; display: block;padding-top: 20px ">基于JavaWeb在线投票系统</span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #00154e; color: white;">
        <div class="footer">Copyright &copy; By 【基于JavaWeb在线投票系统】</div>
    </div>
    <div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
	<div id="nav" class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
	</div>
	
    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<jsp:include page="welcome.jsp" />
		</div>
    </div>
	
</body>
</html>