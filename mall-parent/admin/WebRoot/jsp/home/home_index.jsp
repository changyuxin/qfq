<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<title>亲分期后台-首页</title>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#main").load("home/home!sysinfo.do").html(loading);
		});
	</script>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<!--left-->
	<div class="div_l">
		<div class="lttop">
			常用链接
		</div>
		<hr />
		<div id="t" class="pn-tree"></div>
	</div>
	<!--left end-->
	<!--main-->
	<div class="body-box" id="main">
		
	</div>
	<!--main end-->
</body>
</html>





