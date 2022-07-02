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
	$(function() {	
		//datagrid初始化 
	   
	  	
	  	
	  	//搜索按钮监听事件
	  	$("#search-btn").click(function(){
	  		$.ajax({
	  			url:'get_subject_stats',
	  			type:'post',
	  			dataType:'json',
	  			data:{subjectName:$('#subjectName').val()},
	  			success:function(data){
	  				if(data.type == 'success'){
	  					var option = {
	  				            title: {
	  				                text: data.name
	  				            },
	  				            tooltip: {},
	  				            legend: {
	  				                data:['投票数']
	  				            },
	  				            xAxis: {
	  				                data: data.subjectNameList
	  				            },
	  				            yAxis: {},
	  				            series: [{
	  				                name: '投票数',
	  				                type: 'bar',
	  				                data: data.voteNumberList
	  				            }]
	  				        };
	  					myChart.setOption(option);
	  				}else{
	  					$.messager.alert("消息提醒",data.msg,"warning");
	  				}
	  			}
	  		});
	  	});
	  
	});
	

	</script>
</head>
<body>
	<div class="panel-header"><div class="panel-title panel-with-icon">投票信息统计</div><div class="panel-icon icon-more"></div><div class="panel-tool"></div></div> 
	
	<!-- 工具栏 -->
	<div id="toolbar" class="datagrid-toolbar">
		<div style="margin-top: 3px;">
		主题名称：<input id="subjectName" class="easyui-textbox"  />
			<a id="search-btn" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
		</div>
	</div>
	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 1200px;height:600px;"></div>
	
	
</body>
<script type="text/javascript" src="../../easyui/echarts.min.js"></script>
 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
		var nameData = ${subjectNameList};
		var dataList = ${voteNumberList};
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '主题投票排行榜'
            },
            tooltip: {},
            legend: {
                data:['投票数']
            },
            xAxis: {
                data: nameData
            },
            yAxis: {},
            series: [{
                name: '投票数',
                type: 'bar',
                data: dataList
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</html>