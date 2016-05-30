<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<title>亲分期后台-白领会员管理</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("[nav]").click(function(){
			$("[nav]").css("color",""); 
			$(this).css("color","blue");
		});
		showCollarList(1);
		init();
	});
	
	function init(){
		var c = '<s:property value="countStr"/>';
		var a = c.split(",");
		var all = 0;
		for(var i = 0; i < a.length; i++){
			var r = a[i].split("-");
			var id = "#status_" + r[0];
			$(id).html("（" + r[1] + "）");
			all += parseInt(r[1]);
		}
		$("#status_all").html("（" + all + "）");
	}
	
	
    //根据条件查询
    function queryCollarList(index){
    	//点击查询时,将页码置为1
		if(index == 1){
			$("[name='collarQuery.pageNo']").val(1);
		}
		
		$("#main").load("collar/collar!getCollarsPage.do", $("#collarForm").serializeArray()).html(loading);
    }
    
    function showCollarList(status){
		$("#auditStatus").val(status);
		queryCollarList(1);
	}
    
</script>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<div style="overflow:hidden;">
		<div class="div_l" id="left_nav">
			<div class="lttop difference_title">白领会员</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a nav href="javascript:showCollarList(0);" style="color: blue;">全部会员<span id="status_all" style="color: red;"></span></a></li>
				<li><a nav href="javascript:showCollarList(1);">待审核<span id="status_1" style="color: red;"></span></a></li>
				<li><a nav href="javascript:showCollarList(2);">重新审核<span id="status_2" style="color: red;"></span></a></li>
				<s:if test="isPermissionUrl('collar/collar!auditPassData.do')">
					<li><a nav href="javascript:showCollarList(3);">审核通过<span id="status_3" style="color: red;"></span></a></li>
				</s:if>
				<li><a nav href="javascript:showCollarList(4);">审核不通过<span id="status_4" style="color: red;"></span></a></li>
			</ul>
		</div>
		<div class="body-box" id="main"></div>
	</div>
</body>
</html>





