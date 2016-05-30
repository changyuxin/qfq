<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 购物流程</title>
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
				<h3>购物流程</h3>
				<div class="mydd">
					<p>&nbsp;</p>
					<strong>第一步，信用认证</strong>
						<p>&nbsp;</p>
					<p>注册账户以后，您只需花几分钟在线填写您的学籍信息，紧急联系方式，并拍照上传所需的证件照片提交审核即可，可联系校园大使帮忙（快速上传资料、快速审核并签定合同）。亲分期承诺将在24小时内审核完毕，最快10分钟即可审核通过，要的就是速度！审核结果将通过短信的方式通知到您，您无需频繁登录网站查看。通过信用审核以后，您将即可拥有可直接消费的信用额度，就可以下单啦。在等待信用审核的时候，您也可以同时下单，通过了信用审核以后，您的订单将立即生效，我们将有专人与您联系，为您发货。</p>
					<p>&nbsp;</p>
					<strong>二步，挑选心仪商品并下单</strong>
					<p>&nbsp;</p>
					<p>选择心仪商品，确定首付比例及分期数，生成购物合同，下单成功！</p>
					<p>&nbsp;</p>
					<strong>第三步，送货上门</strong>
					<p>&nbsp;</p>
					<p>审核通过后的订单将在24小时之内发货，请您保持电话畅通，耐心等待。您也可以登录网站个人中心查询物流信息。</p>
					<p>&nbsp;</p>
					<strong>第四步，按时还款</strong>
					<p>&nbsp;</p>
					<p>每月登录网站个人中心，查看订单和账单信息，按时还款，保持良好的信用记录。</p>
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