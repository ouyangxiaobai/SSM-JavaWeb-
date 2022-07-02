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
											<c:if test="${fn:contains(vote.type.name(),singleType)}">
												<c:forEach items="${vote.subjectItems }" var="subjectItem">
													<p style="background-color:#e2e2e2;border-radius:3px;"><label class="vote-label" for="vote_item${subjectItem.id}" data-val="${subjectItem.voteNumber}" style="margin-bottom:0px;width:100%;cursor:pointer;"><input type="radio" name="vote_item${vote.id}" class="vote-item" id="vote_item${subjectItem.id}" value="${vote.id}-${subjectItem.id}" /><span class="item-title">${subjectItem.title}</span><span class="item-per" style="display: inline-block;">&nbsp;</span></label></p>
												</c:forEach>
											</c:if>
											<c:if test="${fn:contains(vote.type.name(),muilteType)}">
												<c:forEach items="${vote.subjectItems }" var="subjectItem">
													<p style="background-color:#e2e2e2;border-radius:3px;"><label class="vote-label" for="vote_item${subjectItem.id}" data-val="${subjectItem.voteNumber}" style="margin-bottom:0px;width:100%;cursor:pointer;"><input type="checkbox" class="vote-item" id="vote_item${subjectItem.id}" value="${vote.id}-${subjectItem.id}" /><span class="item-title">${subjectItem.title}</span><span class="item-per" style="display: inline-block;">&nbsp;</span></label></p>
												</c:forEach>
											</c:if>
											<c:if test="${vote.endTime.getTime() > nowTime}">
											<c:if test="${vote.startTime.getTime() < nowTime}">
											<p>
												<a class="btn btn-default btn-lg btn-block" style="color: #eee;background-color: #3c763d;" onclick="vote(this)" href="javascript:void(0)"><span class="btn-txt">确定投票</span>(<span class="total-span">${vote.voteNumber }</span>)</a>
											</p>
											</c:if> 
											</c:if> 
											<c:if test="${vote.endTime.getTime() < nowTime}">
											<p>
												<a class="btn btn-default btn-lg btn-block" href="javascript:void(0)">已结束投票(${vote.voteNumber })</a>
											</p>
											</c:if> 
											<c:if test="${vote.startTime.getTime() > nowTime}">
											<p>
												<a class="btn btn-default btn-lg btn-block" href="javascript:void(0)">还未开始投票(${vote.voteNumber })</a>
											</p>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							 <div class="jumbotron">
								 <h1>暂无投票信息</h1>
								 <p>请等待管理员分配</p>
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
    	function vote(e){
    		var $this = $(e);
    		if($(e).attr('voted') == 'true'){
    			zeroModal.show({
					title: "提示",
					content: "您已经投过票了!",
					width : '200px',
					height : '130px',
					overlay : true,
					ok : true,
					onClosed : function() {
						//location.reload();
					}
				});
    			return;
    		}
    		var caption = $(e).parent("p").parent("div.caption");
    		var checkedItems = caption.find("input.vote-item:checked");
    		if(checkedItems.length < 1){
    			zeroModal.show({
					title: "提示",
					content: "请选择选项!",
					width : '200px',
					height : '130px',
					overlay : true,
					ok : true,
					onClosed : function() {
						//location.reload();
					}
				});
    			return;
    		}
    		var subjectId = "";
    		var subjectItemId = "";
    		checkedItems.each(function(i,e){
    			var val = $(e).val().split('-');
    			subjectId = val[0];
    			subjectItemId += val[1] + ',';
    		});
    		$.ajax({
    			url:'add_vote',
    			data:{subjectId:subjectId,subjectItemIds:subjectItemId.substring(0,subjectItemId.length-1)},
    			method:'post',
    			dataType:'json',
    			success:function(data){
    				if(data.type == 'success'){
    					$this.children("span.btn-txt").text("您已投票");
    					$this.attr('voted','true');
    					$this.css({background:'#e6e6e6',color:'black'});
    					checkedItems.each(function(i,e){
    		    			var l = $(e).parent("label");
    		    			var itemNum = parseInt(l.attr('data-val')) + 1;
    		    			//label.text(label.text() + itemNum);
    		    			l.attr('data-val',itemNum);
    		    		});
    					
    					var label = caption.find("label.vote-label");
    					var total = parseInt(caption.find("span.total-span").text());
    					total = total + checkedItems.length;
    					caption.find("span.total-span").text(total);
    					label.each(function(i,e){
    						var voteNum = $(e).attr('data-val');
    						$(e).children("span.item-title").text($(e).children("span.item-title").text() + '(' + voteNum + ')：');
    						$(e).children("input.vote-item").remove();
    						var per = parseFloat(voteNum)/parseFloat(total) * 100;
    						$(e).children("span.item-per").css({width:per + "%",background:"red"});
    					});
    					console.log();
    				}else if(data.type == 'voted'){
    					
    					zeroModal.show({
    						title: "提示",
    						content: data.msg,
    						width : '200px',
    						height : '130px',
    						overlay : true,
    						ok : true,
    						onClosed : function() {
    							//location.reload();
    						}
    					});
    					
    					$this.children("span.btn-txt").text("您已投票");
    					$this.attr('voted','true');
    					$this.css({background:'#e6e6e6',color:'black'});
    					var label = caption.find("label.vote-label");
    					var total = parseInt(caption.find("span.total-span").text());
    					caption.find("span.total-span").text(total);
    					label.each(function(i,e){
    						var voteNum = $(e).attr('data-val');
    						$(e).children("span.item-title").text($(e).children("span.item-title").text() + '(' + voteNum + ')：');
    						$(e).children("input.vote-item").remove();
    						var per = parseFloat(voteNum)/parseFloat(total) * 100;
    						$(e).children("span.item-per").css({width:per + "%",background:"#FFA500"});
    					});	
    				}else{
    					zeroModal.show({
    						title: "提示",
    						content: data.msg,
    						width : '200px',
    						height : '130px',
    						overlay : true,
    						ok : true,
    						onClosed : function() {
    							//location.reload();
    						}
    					});
    				}
    			}
    		});
    	}
    </script>
</body>
</html>