<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>基于JavaWeb在线投票系统</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="path" value="<%=basePath%>"></c:set>
<link href='${path }/home-resources/images/reception/index.png' rel='shortcut icon' type='image/x-icon'>
<link href="${path }/home-resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${path }/home-resources/js/zeroModal/zeroModal.css" />
</head>
<body style="background-color: #EEEEEE;">

	<div style="width: 100%; height: 100%;">
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
						<div class="navbar-header">
							 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							 <span class="sr-only">Toggle navigation</span>
							 <span class="icon-bar"></span>
							 <span class="icon-bar"></span>
							 <span class="icon-bar"></span>
							 </button>
							 <a class="navbar-brand" href="index.jsp">基于JavaWeb在线投票系统</a>
						</div>
						
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li>
									 <a href="">首页</a>
								</li>
								<li>
									 <a  target="home" style="cursor: pointer;" href="home/vote_list">投票中心</a>
								</li>
								<li>
									 <a id="mineCenter-link" userId="${user.id}" target="home" style="cursor: pointer;" href="home/vote_history_list">投票历史</a>
								</li>
							</ul>
							<ul class="nav navbar-nav navbar-right" style="margin-right: 10px;">
								<li class="dropdown">
									 <c:if test="${user != null }">
									 	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										 	<img class="img-circle" src="home-resources/images/reception/photo.jpg" alt="Photo" style="width: 30px; height: 30px;" />	
										 	<strong class="caret"></strong>
										 </a>
										<ul class="dropdown-menu">
											<li>
												<a href="home/change_pwd?id=${user.id}" id="self">${user.name }</a>
											</li>
											<li class="divider"></li>
											<li>
												<a href="home/login_out">退出登录</a>
											</li>
										</ul>
									 </c:if>
									 <c:if test="${user == null }">
										<div class="btn-group" style="margin-top: 5px;">
											<button type="button" class="btn btn-default btn-sm" id="studentLogin">登录</button>
											<button type="button" class="btn btn-default btn-sm" id="studentRegister">注册</button>
											<a href="system/login" target="_blank" class="btn btn-default btn-sm" id="studentLogin">登录后台</a>
										</div>
									 </c:if>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<div style="margin-top: 0px; width: 100%;height:950px;">
			<iframe src="home.jsp" width="100%" height="100%" name="home"></iframe>
		</div>
	</div>


	<!-- js引入 -->
	<script src="${path }/home-resources/js/jquery.js"></script>
	<script src="${path }/home-resources/js/bootstrap/bootstrap.min.js"></script>
	<script src="${path }/home-resources/js/zeroModal/zeroModal.min.js"></script>
	<script src="${path }/home-resources/js/login.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#examCenter-link, #mineCenter-link").click(function() {
				//判断是否登录
				var userId = $(this).attr("userId");
				if(userId.trim() == "" || userId == null) {
					zeroModal.show({
						title: "提示",
						content: "登录后才能查看",
						width : '200px',
						height : '130px',
						overlay : false,
						ok : true,
						onClosed : function() {
							location.reload();
						}
					});
					return false;
				}
			});
			
			$("#self").click(function() {
				var href = $(this).attr("href");
				zeroModal.show({
					title: "Self",
					content: "个人信息查看",
					width : '400px',
					height : '200px',
					top : '100px',
					left : '430px',
					url: href,
					overlay : false,
					ok : true,
					onClosed : function() {
						location.reload();
					}
				});
				return false;
			});
		});
	</script>
</body>
</html>