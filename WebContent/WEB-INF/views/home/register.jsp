<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>注册</title>
	<%
    	String path = request.getContextPath();
	    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
	<c:set var="path" value="<%=basePath %>"></c:set>
 	<link href="${path }/home-resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
 	<link href="${path }/home-resources/js/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
 	<link rel="stylesheet" type="text/css" href="${path }/home-resources/js/zeroModal/zeroModal.css" />
 	<style type="text/css">
 		.dropdown-toggle {
 			height: 30px;
 		}
 	</style>
</head>
<body>
	<div>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form class="form-horizontal" role="form" id="studentRegSub" action="">
						<div class="form-group">
							 <label for="account" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input class="form-control" name="name" id="account" type="text" placeholder="请输入用户名" />
							</div>
						</div>
						<div class="form-group">
							 <label for="pwd" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input class="form-control" name="password" id="pwd" type="password" placeholder="请输入密码" />
							</div>
						</div>
						<div class="form-group">
							 <label for="class" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<select class="selectpicker form-control" name="sex" id="sex" data-live-search="true">
									<option value="1">男</option>
									<option value="2">女</option>
								</select>
							</div>
						</div>
						<br />
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="button" class="btn btn-default btn-lg btn-primary btn-block" id="signSubmit">
							 		注  册
								 </button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>	

	<!-- js引入 -->
    <script src="${path }/home-resources/js/jquery.js"></script>
    <script src="${path }/home-resources/js/zeroModal/zeroModal.min.js"></script>
    <script src="${path }/home-resources/js/login.js"></script>
    <script src="${path }/home-resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="${path }/home-resources/js/bootstrap-select/bootstrap-select.min.js"></script>
    <script type="text/javascript">
    	$('.selectpicker').selectpicker({
    	    style: 'btn-default',
    	    size: 8
    	});
    </script>
</body>
</html>