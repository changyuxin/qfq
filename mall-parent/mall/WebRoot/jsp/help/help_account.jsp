<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 账户信息</title>
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
				<h3>账户信息</h3>
				<div class="mydd ">
                	<strong> 如何增强账户安全系数？</strong>
					<p>&nbsp;</p>
					<p>建议将账户密码设置为字母、数字、符号的搭配组合，密码长度不要过短。</p>
                    <p>&nbsp;</p>
                    <strong>为什么要绑定手机和邮箱？</strong>
                    <P>&nbsp;</P>
                    <p>当您的账户额度有变动时能及时接到通知；忘记密码时可用二者任意方式找回。</p>
                    <p>&nbsp;</p>
                    <strong>账户中的“可用额度”指的是什么？</strong>
                    <p>&nbsp;</p>
                    <p>您账户中的“可用额度”是指目前您能分期的总额，不能提现，不可兑换，只能在亲分期商城中作为分期购物额度使用。</p>
                    <p>&nbsp;</p><p>&nbsp;</p>
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