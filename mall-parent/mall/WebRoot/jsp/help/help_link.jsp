<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 友情链接</title>
</head>
<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
<!--焦点轮转-->
<div class="mid">
<div class="main_box">
		<div class="grzx">
			<%@include file="help_left.jsp"%>
			<div class="grzx_right">
				<h3>友情链接</h3>
				<div class="mydd">
                <p>&nbsp;</p>
                <p><a href="http://m.kuaidi100.com" style="color: #4eaccc;">快递查询</a></p>
                <p>&nbsp;</p>
            </div>
			</div>
		</div>
	</div>

</div>
<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>
<!-- End Save for Web Slices -->
<script src="<%=basePath%>js/focus.run.js" type="text/javascript"></script>
</body>
</html>