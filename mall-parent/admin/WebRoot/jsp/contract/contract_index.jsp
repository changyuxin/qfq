<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<script src="<%=basePath%>js/jquery.jPrintArea.js" type="text/javascript"></script>
<title>亲分期后台-合同管理</title>
<script type="text/javascript">
	$(document).ready(function() {
		//$("#main").load("contract/contract!getContractsPage.do");
		queryContractList(1);
		$("[contract]").click(function(){
			$("[contract]").css("color",""); 
			$(this).css("color","red");
		});
	});
	
	//根据条件查询
    function queryContractList(index){
    	//点击查询时,将页码置为1
		if(index == 1){
			$("[name='contractQuery.pageNo']").val(1);
		}
		$("#main").load("contract/contract!getContractsPage.do",$("#contractForm").serializeArray()).html(loading);
    }
	function showContractList(id){
		document.getElementById("contract").value = id;
		queryContractList(1);
	} 
</script>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<div style="overflow:hidden;">
		<div class="div_l" id="left_nav">
			<div class="lttop difference_title">合同状态</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a contract href="javascript:showContractList(0)">全部合同</a></li>
				<li><a contract href="javascript:showContractList(1)">未审核合同</a></li>
				<li><a contract href="javascript:showContractList(2)">已审核合同</a></li>
				<li><a contract href="javascript:showContractList(3)">已取消合同</a></li>
			</ul>
		</div>
		<div class="body-box" id="main"></div>
	</div>
</body>
</html>





