<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>投票列表</title>
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../../easyui/css/demo.css">
	<script type="text/javascript" src="../../easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../easyui/js/validateExtends.js"></script>
	<script type="text/javascript" src="../../easyui/themes/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	function formatterDate(value){
		var date = new Date(value);
         var y = date.getFullYear();  
         var m = date.getMonth() + 1;  
         m = m < 10 ? ('0' + m) : m;  
         var d = date.getDate();  
         d = d < 10 ? ('0' + d) : d;  
         var h = date.getHours();
         h = h < 10 ? ('0' + h) : h;
         var minute = date.getMinutes();
         var second = date.getSeconds();
         minute = minute < 10 ? ('0' + minute) : minute;  
         second = second < 10 ? ('0' + second) : second; 
         return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second; 
	}
	$(function() {	
		//datagrid初始化 
	    $('#dataList').datagrid({ 
	        title:'投票列表', 
	        iconCls:'icon-more',//图标 
	        border: true, 
	        collapsible: false,//是否可折叠的 
	        fit: true,//自动大小 
	        method: "get",
	        url:"get_list",
	        idField:'id', 
	        singleSelect: true,//是否单选 
	        pagination: true,//分页控件 
	        rownumbers: true,//行号 
	        sortName: 'id',
	        sortOrder: 'DESC', 
	        remoteSort: false,
	        columns: [[  
				{field:'chk',checkbox: true,width:50},
 		        {field:'id',title:'ID',width:50, sortable: true},    
 		        {field:'user',title:'用户',width:200,formatter: function(value,row,index){
 		        	if(value != null){
 		        		return value.name;
 		        	}
 		        }},
 		       {field:'subject',title:'投票主题',width:200,formatter: function(value,row,index){
		        	if(value != null){
		        		return value.name;
		        	}
		        }},
		        {field:'subjectItem',title:'投票选项',width:200,formatter: function(value,row,index){
		        	if(value != null){
		        		return value.title;
		        	}
		        }},
 		        {field:'subjectId',title:'总投票数',width:200,formatter: function(value,row,index){
		        	if(value != null){
		        		return row.subject.voteNumber;
		        	}
		        }},
 		       {field:'subjectItemId',title:'选项投票数',width:200,formatter: function(value,row,index){
		        	if(value != null){
		        		return row.subjectItem.voteNumber;
		        	}
		        }},
 		        {field:'createTime',title:'投票时间',width:150,formatter: function(value,row,index){
 		        	return formatterDate(value);
 		        }},
	 		]], 
	        toolbar: "#toolbar"
	    }); 
	    //设置分页控件 
	    var p = $('#dataList').datagrid('getPager'); 
	    $(p).pagination({ 
	        pageSize: 10,//每页显示的记录条数，默认为10 
	        pageList: [10,20,30,50,100],//可以设置每页记录条数的列表 
	        beforePageText: '第',//页数文本框前显示的汉字 
	        afterPageText: '页    共 {pages} 页', 
	        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
	    });
	    //设置工具类按钮
	    $("#add").click(function(){
	    	$("#addDialog").dialog("open");
	    });
	  	
	  	
	  	//搜索按钮监听事件
	  	$("#search-btn").click(function(){
	  		$('#dataList').datagrid('load',{
	  			username: $('#username').val(),
	  			subjectName: $('#subjectName').val(),
	  			subjectItemTitle: $('#subjectItemName').val()
	  		});
	  	});
	  
	});
	

	</script>
</head>
<body>
	<!-- 数据列表 -->
	<table id="dataList" cellspacing="0" cellpadding="0"> 
	</table> 
	
	<!-- 工具栏 -->
	<div id="toolbar">
		<div style="margin-top: 3px;">
		用户名：<input id="username" class="easyui-textbox"  />
		主题名称：<input id="subjectName" class="easyui-textbox"  />
		选项名称：<input id="subjectItemName" class="easyui-textbox" />
			<a id="search-btn" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
		</div>
	</div>
	
	
	
</body>
</html>