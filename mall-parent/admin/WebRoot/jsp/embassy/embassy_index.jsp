<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
<title>亲分期后台-大使管理</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("[embassy]").click(function(){
			$("[embassy]").css("color",""); 
			$(this).css("color","blue");
		});
		init();
		queryEmbassyList(1);
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
    function queryEmbassyList(index){
    	//点击查询时,将页码置为1
		if(index == 1){
			$("[name='embassyQuery.pageNo']").val(1);
		}
		$("#main").load("embassy/embassy!getEmbassyPage.do", $("#embassyForm").serializeArray()).html(loading);
    }
	function showEmbassyList(id){
		document.getElementById("embassy").value = id;
		queryEmbassyList(1);
	} 
</script>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<div style="overflow:hidden;">
		<div class="div_l" id="left_nav">
			<div class="lttop difference_title">大使列表</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a embassy href="javascript:showEmbassyList(0)" style="color: blue;">全部大使<span id="status_all" style="color: red;"></span></a></li>
				<li><a embassy href="javascript:showEmbassyList(1)">正式大使<span id="status_1" style="color: red;"></span></a></li>
				<li><a embassy href="javascript:showEmbassyList(2)">非正式大使<span id="status_2" style="color: red;"></span></a></li>
				<li><a embassy href="javascript:showEmbassyList(3)">已注消大使<span id="status_3" style="color: red;"></span></a></li>
			</ul>
		</div>
		<div class="body-box" id="main"></div>
	</div>
</body>
</html>





