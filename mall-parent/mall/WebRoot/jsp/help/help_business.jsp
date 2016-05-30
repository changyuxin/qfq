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
				<h3>交易条款</h3>
				<div class="mydd">
				<p>&nbsp;</p>
					<p>客户在接受商品订购与送货的同时，有义务遵守以下交易条款：</p>
					<p>
						<br> 1.&nbsp;订购的商品价格以您下订单时亲分期的网上价格为准。
					</p>
					<p>
						<br>
						2.&nbsp;请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，亲分期将不承担责任：
					</p>
					<p>
						<br> A. 客户提供错误信息和不详细的地址；
					</p>
					<p>
						<br> B. 货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果；
					</p>
					<p>
						<br> C. 不可抗力，例如：自然灾害、交通戒严、突发战争等。。
					</p>
					<p>
						<br>
						3.&nbsp;安全性：无论您是电话订购商品或是网络订购商品，我们会保证交易信息的安全，并由亲分期授权的员工处理您的订单。
					</p>
					<p>
						<br>
						4.&nbsp;隐私权：亲分期尊重您的隐私权，在任何情况下，我们从网站上或电话中得到的所有客户信息仅用来处理您的相关订单及服务。
					</p>
					<p>
						<br>
						5.&nbsp;免责：如因不可抗力或其它无法控制的原因使亲分期销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，亲分期会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失。。
					</p>
					<p>
					<br>
						6.&nbsp;客户监督：亲分期希望通过不懈努力，为客户提供最佳服务，亲分期在给客户提供服务的全过程中接受客户的监督。
					</p>
					<p><br>
						 7.&nbsp;争议处理：如果客户与亲分期之间发生任何争议，可依据当时双方所认定的协议及相关法律进行解决。
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