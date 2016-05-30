<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="../common/head.jsp"%>
		<title>亲分期 - 首付支付</title>
		<style type="text/css">
			.step-tt {margin-top: 20px; font-size: 16px; margin-left: 20px; color: rgb(102, 102, 102);}
			.select-bankcard {margin: 20px; padding: 15px; border-radius: 15px; border: 1px solid rgb(204, 204, 204);}
			.select-bankcard img {margin-right:40px;}
		</style> 
		<script type="text/javascript">
			function wxpay(id, type){
			 	window.parent.location.href = "<%=basePath%>pay/pay!wxpay.do?payment.tradeType=" + type + "&payment.payType=2&payment.tradeNo=" + id;
			}
			function alipay(id, type){
				window.parent.location.href = "<%=basePath%>pay/pay!alipay.do?payment.tradeType=" + type + "&payment.payType=1&payment.tradeNo=" + id;
			}
		</script>
	</head>
	<body>
		<div class="order-num-3">
			<div class="step-tt">
				<strong>请选择支付方式：</strong>
			</div>
			<div class="pay-method select-bankcard">
				<a href="javascript: wxpay('<s:property value="payment.tradeNo" />', '<s:property value="payment.tradeType" />')" class="pay-a" >
					<img src="mall/images/wxpay.png" class="pay-img" alt="微信支付"/>
				</a>
	         	<a href="javascript: alipay('<s:property value="payment.tradeNo" />', '<s:property value="payment.tradeType" />')" class="pay-a">
	            	<img src="mall/images/alipay.png" class="pay-img" alt="支付宝支付"/>
	           	</a>
			</div>
		</div>
	</body>
</html>