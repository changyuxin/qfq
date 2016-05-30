<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 咨询投诉</title>
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
				<h3>咨询投诉</h3>
				<div class="mydd">
				<p>&nbsp;</p>
					<strong>咨询</strong>
					<p>
						您可以拨打咨询电话400-628-5159或者点击网站首页的“QQ在线咨询”按钮咨询商品和服务。
					</p>
					<p>&nbsp;</p>
					<strong>投诉</strong>
					<p>您可以拨打投诉电话400-628-5159或者发送电子邮件到<a>qinfenqi@126.com</a><span style="font-size: 13px"><span style="font-family: 微软雅黑">进行投诉。</span><br>
					</span></p>
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