<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
<title>亲分期后台-帐单管理</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("[bill]").click(function(){
			$("[bill]").css("color",""); 
			$(this).css("color","red");
		});
		queryBillList(1);
	});
	
	//根据条件查询
    function queryBillList(index){
    	//点击查询时,将页码置为1
		if(index == 1){
			$("[name='billQuery.pageNo']").val(1);
		}
		$("#main").load("bill/bill!getBillsPage.do", $("#billForm").serializeArray());
    }
    //根据条件查询
    function getBillList(index){
    	//点击查询时,将页码置为1
		if(index == 1){
			$("[name='billQuery.pageNo']").val(1);
		}
		$("#main").load("bill/bill!getBillsPage.do");
    }
	function showBillList(id){
		$("#indexstatus").val(id);
		queryBillList(1);
	} 
</script>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<div style="overflow:hidden;">
		<div class="div_l" id="left_nav">
			<div class="lttop difference_title">申请状态</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a bill href="javascript:getBillList(1)" style="color: red;">全部帐单</a></li>
				<li><a bill href="javascript:showBillList(0)">今天到期</a></li>
				<li><a bill href="javascript:showBillList(2)">近两天到期</a></li>
				<li><a bill href="javascript:showBillList(1)">已延期</a></li>
				<li><a bill href="javascript:showBillList(3)">近期已还款</a></li>
			</ul>
		</div>
		<div class="body-box" id="main"></div>
	</div>
</body>
</html>





