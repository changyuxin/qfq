<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="../common/head.jsp"%>
		<link href="<%=basePath%>css/pay.css" type="text/css" rel="stylesheet" />
		<title>亲分期 - 微信支付</title>
	
		<script type="text/javascript">
			$(function(){
				//每1秒执行
				var i = 0, s = 90;
				$("body").everyTime("1s", "A", function(){
					if(i == s){
						$("body").stopTime("A");
						window.location.href="center/order.html";
					} else {
						i++;
						$("#time").html("正在支付中 " + (s - i) + "秒");
						$.post("pay/pay!getPayStatus.do", {
							"payment.outTradeNo" : '<s:property value="payment.outTradeNo" />',
							"timestamp" : new Date().getTime()
						}, function(data) {
							if (data.result == "SUCCESS") {
								window.location.href="center/order.html";
							}
						}, "json");
					}
				});
				
			});
			
		</script>
	</head>
	<body>
		<!-- Save for Web Slices (index.png) -->
		<div class="head">
			<%@include file="../common/top.jsp"%>
		</div>
		<div id="container">
			<div id="content" class="fn-clear">
		        <div id="" class="order-area">
	                <div id="" class="">
	                    <div class="orderDetail-base">
	                          <div class="order-extand-explain fn-clear">
	                              <span class="fn-left" style="cursor: auto">
	                              	<span>正在使用微信支付</span>
	                              	<span style="cursor: pointer; color: #08c;">[?]</span>
	                              	<span style="color: #08c;" id="time"></span>
	                              </span>
	                          </div>              
	                          <div class="commodity-message-row">
	                               <span class="first long-content">亲分期分期付款</span>
	                               <span class="second short-content">收款方：亲分期(北京)科技有限公司</span>
	                          </div>              
	                          <span class="payAmount-area" id=""><strong class=" amount-font-22 "><s:property value="%{formatDouble(payment.totalFee / 100)}" /></strong> 元</span>                                              
	                     </div>                                       
	                </div>
		        </div>
			        <div class="cashier-center-container">
			            <div id="" class="cashiser-switch-wrapper fn-clear">
			                <div class="cashier-center-view view-qrcode fn-left">
			                    <div class="qrcode-integration qrcode-area">
			                        <div class="qrcode-header">
			                            <div class="ft-center">扫一扫付款（元）</div>
			                            <div class="ft-center qrcode-header-money"><s:property value="%{formatDouble(payment.totalFee / 100)}" /></div>
			                        </div>
			                        <div class="qrcode-img-wrapper">
			                            <div class="qrcode-img-area">
			                            <div style="position: relative;display: inline-block;">
			                            	<!--二维码生成位置-->
			                            	<img src="${rtnCnt }" />
			                            </div>
			                        </div>
			                            <div class="qrcode-img-explain fn-clear">
			                                <img class="fn-left" src="mall/images/scan.png" alt="扫一扫标识" />
			                                <div class="fn-left">打开微信应用<br>通过扫一扫付款</div>
			                            </div>
			                        </div>    
			                    </div>
			                    <div class="qrguide-area">
			    					<img src="../mall/images/example.png" class="qrguide-area-img" />
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
	</body>
</html>