<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.szy.entity.VoteType"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>考试中心</title>
	<%
    	String path = request.getContextPath();
	    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
	<c:set var="path" value="<%=basePath %>"></c:set>
 	<link href="${path }/home-resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
 	<link rel="stylesheet" type="text/css" href="${path }/home-resources/js/zeroModal/zeroModal.css" />
</head>
<body style="background-color: #EEEEEE;">
	<div class="container" style="margin-top: 100px;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row" id="root-row">
					<c:choose>
						<c:when test="${fn:length(voteList) > 0 }">
							<c:forEach items="${voteList }" var="vote">
								<div class="col-md-4">
									<div class="thumbnail">
										<img alt="300x200" src="${pageContext.request.contextPath }/home-resources/images/reception/peitu1.jpg" />
										<div class="caption">
											<h3>
												${vote.name }
											</h3>
											<p>投票类型: ${vote.type.tips }</p>
											<p class="beginTime">开始时间: <fmt:formatDate value="${vote.startTime }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
											<p class="beginTime">结束时间: <fmt:formatDate value="${vote.endTime }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
											<c:forEach items="${vote.subjectItems }" var="subjectItem">
												<p style="background-color:#e2e2e2;border-radius:3px;"><label class="vote-label" for="vote_item${subjectItem.id}" data-val="${subjectItem.voteNumber}" style="margin-bottom:0px;width:100%;cursor:pointer;"><span class="item-title">${subjectItem.title}(${subjectItem.voteNumber})</span><span class="item-per item-per-${subjectItem.flag}" style="display: inline-block;width:${subjectItem.per}%;background-color:#FFA500;">&nbsp;</span></label></p>
											</c:forEach>
											<p>
												<a class="btn btn-default btn-lg btn-block" href="javascript:void(0)">投票总数(${vote.voteNumber })</a>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							 <div class="jumbotron">
								 <h1>暂无投票信息</h1>
								 <p>请去投票</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>

	<!-- js引入 -->
    <script src="${path }/home-resources/js/jquery.js"></script>
    <script src="${path }/home-resources/js/bootstrap/bootstrap.min.js"></script>
    <script src="${path }/home-resources/js/zeroModal/zeroModal.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		
    		var divColMd4 = [];
    		var length = $(".row").find("div.col-md-4").length;
    		$("#root-row").find("div.col-md-4").each(function(i,e){
    			if(i > 2){
    				divColMd4.push($(e));
    				$(e).remove();
    			}
    			if(i == length-1){
    				var html = "";
    				var str ='';
    				var k=0;
    				for(;k<divColMd4.length;k++){
    					str +=  divColMd4[k].prop('outerHTML');
    					if((k+1)%3==0 && k!=0){
    						html += '<div class="row">' + str + '</div>';
    						str = '';
    					}
    				}
    				if((k)%3!=0){
    					html += '<div class="row">' + str + '</div>';;
    				}
    				$("#root-row").after(html);
    			}
    		})
    		
    		
    		
    	});
    	$(".item-per-true").css({background:"#008000"});
    </script>
</body>
</html>