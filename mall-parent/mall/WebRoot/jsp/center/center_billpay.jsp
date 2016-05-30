<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 立即支付</title>
	<script type="text/javascript">
		function wxpay(id, isEarly){
			window.location.href = "<%=baseUrl%>pay/pay!wxpay.do?payment.tradeType=1&payment.payType=2&payment.tradeNo=" + id + "&payment.isEarly=" + isEarly;;
		}
		function alipay(id, isEarly){
			window.location.href = "<%=baseUrl%>pay/pay!alipay.do?payment.tradeType=1&payment.payType=1&payment.tradeNo=" + id + "&payment.isEarly=" + isEarly;
		}
	</script>
</head>
<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
<div class="mid">
    <div class="main-wrap">
    	<%@include file="center_leftnav.jsp"%>
    	<!--右侧-->
    	<div class="user-right mu-ctxt">
	       	<div class="user-right-head">
				<h2>订单:<s:property value="billQuery.orderCode" /> 还款 </h2>
			</div>
			<div class="user-right-content">
				<div class="order-num-1">
					<div class="order-num-1">
						<p><label>订单号：</label><s:property value="billQuery.orderCode" /></p>
						<p>
							<label>商品：</label><span><s:property value="billQuery.productName" /></span>
						</p>
						<p><label>下单时间：</label><s:date name="billQuery.orderTime" format="yyyy-MM-dd" /></p>
					</div>
					<div class="order-num-2">
						<p><label>帐单号：</label><s:date name="billQuery.paymentDate" format="yyyy-MM"/></p>
						<p><label>期数：</label><s:property value="billQuery.currentMonth" />/<s:property value="billQuery.months" /></p>
						<!-- 
						<p><label>本金：</label><s:property value="billQuery.principal" />元</p>
						<p><label>服务费：</label><s:property value="billQuery.serviceCost" />元</p>
						<s:if test="getUserStyle() == 2">
							<p><label>财务费：</label><s:property value="billQuery.financialPay" />元</p>
						</s:if>
						<p><label>滞纳金：</label><s:property value="billQuery.lateFines" />元</p>
						<p><label>优惠券抵减：</label>0.00元</p>
						-->
						<p><label>本期合计：</label><b class="amount"><s:property value="%{formatDouble(billQuery.monthPay + billQuery.lateFines)}" />元</b></p>
					</div>
	
					<div class="order-num-3">
						<div class="step-tt">
							<strong>请选择支付方式：</strong>
						</div>
						<div class="pay-method select-bankcard">
							<a href="javascript: wxpay('<s:property value="billQuery.billId" />', '<s:property value="billQuery.theLast" />')" class="pay-a" >
								<img src="mall/images/wxpay.png" class="pay-img" alt="微信支付"/>
							</a>
                 			<a href="javascript: alipay('<s:property value="billQuery.billId" />', '<s:property value="billQuery.theLast" />')" class="pay-a">
                           		<img src="mall/images/alipay.png" class="pay-img" alt="支付宝支付"/>
                      		</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>