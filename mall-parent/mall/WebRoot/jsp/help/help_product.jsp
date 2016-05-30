<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 商品相关</title>
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
				<h3>商品相关</h3>
				<div class="mydd ">
                	<strong>无货商品什么时候可以到货呢？</strong>
					<p>&nbsp;</p>
					<p>具体到货时间请以第三方商家为准。</p>
                    <p>&nbsp;</p>
                	<strong>页面显示有货的商品，为什么在下单的时候会被告知无货呢？</strong>
                    <p>&nbsp;</p>
                    <p>同时下单的客户较多时会发生此类情况，并且我们的下单时间与您提交订单的时间会有一定的差异。如出现此情况，我们将会及时与您联系并协助您更改订单。</p>
					<p>&nbsp;</p>
                    <p>&nbsp;</p><p>&nbsp;</p>
				</div>
			</div>
		</div>
	</div>

</div>
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>
<!-- End Save for Web Slices -->
<script src="<%=basePath%>js/focus.run.js" type="text/javascript"></script>
</body>
</html>