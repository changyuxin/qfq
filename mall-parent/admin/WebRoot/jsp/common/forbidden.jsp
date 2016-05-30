<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String contextPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
	String randomNum = System.currentTimeMillis() + Math.random() + "";	
%>
<style type="text/css">
	.forbidden {
		font-family: '微软雅黑','宋体';
    	text-align: center;
	}
</style>
<div style="padding-top:30px;padding-bottom:20px;">
	<div class="forbidden" style="margin-left:-120px"><img alt="" src="<%=contextPath%>img/system/forbidden.png"></div>
	<div class="forbidden" style="font-family: '微软雅黑','宋体';">抱歉...当前您没有访问权限</div>
	<div class="forbidden" style="font-family: '微软雅黑','宋体';"><span id="timeNum_<%=randomNum %>"></span>秒后返回<a href="<%=contextPath%>login.do" style="color: #F26522;font-weight: bold;">登陆页面</a>&nbsp;&nbsp;</div>
</div> 
<script type="text/javascript" language="javascript">
	function timeQuartz() {
		var timeNum = 5;
		document.getElementById("timeNum_<%=randomNum %>").innerHTML = timeNum;
		function quartz() {
			timeNum --;
			document.getElementById("timeNum_<%=randomNum %>").innerHTML = timeNum;
			if (timeNum == 0) {
				window.location.href = "<%=contextPath%>login.do";
			}
			//setTimeout("timeQuartz()",1000);
		}
		setInterval(quartz, 1000);
	}
	timeQuartz();
</script>