<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 发票说明</title>
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
				<h3>发票说明</h3>
				<div class="mydd">
        <p>&nbsp;</p>
        <p>亲分期所售商品均提供正规机打发票。发票内容默认为您所订购的产品全称和型号，发票抬头为您的姓名，如果您需要修改发票抬头，请在下单时注明或者与客服联系。订单确认以后，将无法修改发票内容，给您带来不便，敬请您谅解。</p>
        <br>
        <p>
          在您将所有货款分期支付完成以后，您可以与亲分期客服联系，索要您的发票，我们将通过校园经理将发票送到您的手里。<br>
        </p>
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