<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<%
    	String path = request.getContextPath();
	    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
	<c:set var="path" value="<%=basePath %>"></c:set>
 	<link href="${path }/home-resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background-color: #EEEEEE;">
	<div class="jumbotron" style="height: 630px; padding-bottom: 0px; margin-bottom: 0px;">
		<div >
		<img src="${path }/home-resources/images/reception/home-bg.png" width="100%"  style="height: 600px"/>
			<p style="margin-top:20px;">
				<a class="btn btn-primary btn-large" href="http://www.baidu.com" target="_blank">Learn more</a>
			</p>
		</div>
	</div>

	<!-- js引入 -->
    <script src="${path }/home-resources/js/jquery.js"></script>
    <script src="${path }/home-resources/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>