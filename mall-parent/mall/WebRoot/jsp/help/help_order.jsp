<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 账单相关</title>
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
				<h3>订单相关</h3>
				<div class="mydd ">
                	<strong>为什么我的订单会审核不通过？</strong>
					<p>&nbsp;</p>
					<p>如果遇到订单审核不通过的情况，可能是因为订单商品链接不正确、非正规电商网站、资质不够、照片不够清晰、认证信息错误（身份证号码、姓名、学校）、合同签署错误等问题导致，我们的城市经理会及时跟您取得联系。为了确保您的订单能够快速二次审核通过，也请您积极配合我们的信息采集工作。</p>
                    <p>&nbsp;</p>
                    <strong>如何修改订单？</strong>
                    <p>&nbsp;</p>
                    <p>您提交订单后将不能自行修改任何信息，需致电公司客服400-628-5159帮您修改。</p>
                    <p>&nbsp;</p>
					<strong>为什么我的订单被取消了？</strong>
                    <p>&nbsp;</p>
                    <p>您好，如果您的订单由于异常情况（用户信息错误、商品信息不完善、无法与您取得联系等），自下单之日起时长超过7天订单还未完成，该订单将会被系统自动取消。如果您还想继续购买商品，请准备好详细的商品信息和个人信息资料并保持联系畅通，重新下单即可。</p>
                    <p>&nbsp;</p>
                    <strong>订单取消后能不能恢复？</strong>
                    <p>&nbsp;</p>
                    <p>非常抱歉，订单取消后是不能恢复的，您需要重新下单购买。</p>
                    <p>&nbsp;</p>
                    <strong>订单已经提交成功，什么时候可以发货？</strong>
                    <p>&nbsp;</p>
                    <p>下单成功后我们会通知第三方商家尽快发货，您可以在“我的订单”中查看每个订单的进度。</p>
                    <p>&nbsp;</p>
                    <strong>订单状态说明</strong>
                    <p>&nbsp;</p>
                    <p>在网站提交订单后，会出现以下几种状态：</p>
                    <p>提交订单：我们的客服正在初步审核您的订单</p>
                    <p>签订合同：</p>
                    <p>待审核：签约完成后，您的合同信息将由我们做细致审核；</p>
                    <p>审核通过：审核通过后我们将会安排发货</p>
                    <p>确认收货：</p>
                    <p>分期还款：</p>
                    <p>&nbsp;</p>
                    <strong>账单什么时候生成？</strong>
                    <p>&nbsp;</p>
                    <p>账单会在我们下单购买商品后生成。</p>
                    <P>&nbsp;</P><P>&nbsp;</P>
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