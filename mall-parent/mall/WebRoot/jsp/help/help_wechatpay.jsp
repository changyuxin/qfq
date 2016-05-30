<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 微信在线支付</title>
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
				<h3>微信在线支付</h3>
				<div class="mydd">
				<p>&nbsp;</p>
					<p>如果您已经拥有微信并绑定了银行卡（可以使用微信发红包收红包），即可选择微信进行付款。 </p>
					<p>&nbsp;</p>
					<p>如果您还不知道如何使用微信，请点击这个链接，查看微信支付使用帮助：</p>
					<p><a href="http://jingyan.baidu.com/article/fd8044fafcf1a15030137a7b.html" target="_blank" class="zaixianzhifu">http://jingyan.baidu.com/article/fd8044fafcf1a15030137a7b.html </a></p>
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