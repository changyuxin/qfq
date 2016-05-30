<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link  type="text/css"  href="<%=basePath%>css/order.css" rel="stylesheet"/>
	<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
	<title>亲分期 - 订单详情</title>
	<script type="text/javascript">
		
		function editRecvInfo(){
			$("#recvInfo").load("<%=basePath%>order/order!getRecvInfo.do", {"address.addressId" : $("#addressId").val(), "timestamp" : new Date().getTime()});
		}
		var type = "<s:property value="orderQuery.orderTypes"/>";
		
		$(function(){
			for(var i = 1; i <= 24; i++){
				$("#month").append("<option value='" + i + "'>" + i + "月</option>");
			}
			$("#month").val($("#months").val());
			if($("#addressId").val().length == 0){
				$("#recvInfo").html("").load("<%=basePath%>order/order!getRecvInfo.do", {"timestamp" : new Date().getTime()}).show();
			} else {
				$("#recvInfo").show();
			}
			if(type == 2){
				$("#recommand").hide();
				$("#instalment").hide();
			}
		});
		
		
		function cacuMonthPay(){
			var quantity =  $("#quantity").val();
			$.post("<%=basePath%>product/product!cacuMonthPay.do", {
				"productQuery.productId" : $("#productId").val(),
				"productQuery.firstPay" : $("#firstPay").val(),
				"productQuery.months" : $("#month").val(),
				"productQuery.salePrice" : $("#salePrice").val(),
				"timestamp" : new Date().getTime()
			}, function(data) {
				$("#showMonthPay").html((data.monthPay * quantity).toFixed(2));
				$("#monthPay").val((data.monthPay * quantity).toFixed(2));
				$("#serviceRate").val(data.rate);
			}, "json");
			
		}
		
		// 创建订单
		function createOrder(){
			if(isNaN($("#firstPay").val())){
				layer.alert("首付金额只能输入数字!");
				return;
			}
			if($("#addressId").val().length == 0){
				layer.alert("请填写收货地址后再提交订单!");
				return;
			}
			if(us == 2){
				if($("#auditStatus").val() == 3){
					submitOrder();
				} else {
					orderTip("<%=basePath%>collar/infoPage.html");
				}
			} else {
				//if($("#isIdOauth").val() == 3 && 
				//	$("#isContactOauth").val() == 3 && 
				//		$("#isBkcardOauth").val() == 3 ){
					submitOrder();
				//} else {
				//	orderTip("<%=basePath%>center/credit.html");
				//}
			}
		}
		// 会员状态不符合
		function orderTip(url){
			layer.open({
			    type: 1,
			    title:"订单提交失败",
			    skin: "layui-layer-rim", //加上边框
			    area: ["300px", "200px"], //宽高
			    content: "<div style='font-size:14px; padding: 30px; text-align: center;'>您还没有完成信用认证，无法提交订单，请尽快完成信用认证！</div><div style='text-align: center;'><a class='common-btn bg-ea' href='" + url + "'>立即认证</a></div>"
			});
		}
		
		// 提交订单
		function submitOrder(){
			$("#submit_btn").attr({"disabled":"disabled"});
			$.ajax( {
				type : "POST",
				url : "<%=basePath%>order/order!createOrder.do?timestamp=" + new Date().getTime(),
				data : $("#orderForm").serialize(),
				dataType: "json",
				success : function(data) {
		           	if (data.result == "SUCCESS") {
		           		if(type == 2){
		           			window.location.href = "<%=basePath%>center/order.html";
		           		} else {
			           		window.location.href = "<%=basePath%>contract/" + data.orderId + ".html";
		           		}
		           		//window.location.href = "order/contract!contract.do?orderQuery.orderId=" + data.orderId;
		           		return;
		           	} else {
		           		layer.alert("提交订单失败!");
		           	}
				}
			});
		}
		
	</script>
</head>

<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>

<div class="mid">

	<div class="apply-all">
		<form id="orderForm">
        <div class="apply-wrap">
            <div class="apply-tt">
                <h3>完善订单信息</h3>
            </div>
            <div class="apply-steps">
           		<input type="hidden" name="address.addressId" id="addressId" value="${address.addressId}" />
           		<input type="hidden" name="address.provinceNum" id="provinceNum" value="${address.provinceNum}" />
           		<input type="hidden" name="address.cityNum" id="cityNum" value="${address.cityNum}" />
           		<input type="hidden" name="address.districtNum" id="districtNum" value="${address.districtNum}" />
           		<input type="hidden" name="orderQuery.productId" id="productId" value="${productQuery.productId}" />
           		<input type="hidden" name="orderQuery.productName" id="productId" value="${productQuery.productName}" />
           		<input type="hidden" name="orderQuery.productPrice" id="salePrice" value="${productQuery.salePrice}" />
           		<input type="hidden" name="orderQuery.servicePay" id="servicePay" value="${productQuery.servicePay}" />
           		<input type="hidden" name="orderQuery.serviceRate" id="serviceRate" value="${productQuery.serviceRate}" />
           		<input type="hidden" name="orderQuery.orderTypes" id="orderTypes" value="${orderQuery.orderTypes}" />
           		
           		<input type="hidden" name="orderQuery.financialRate" id="financialRate" value="${productQuery.financialRate}" />
           		<input type="hidden" name="orderQuery.financialPay" id="financialPay" value="${productQuery.financialPay}" />
           		
           		<input type="hidden" name="orderQuery.productCovimg" id="productCovimg" value="${productQuery.coverImg}" />
           		<input type="hidden" name="orderQuery.monthPay" id="monthPay" value="${productQuery.monthPay}" />
           		<input type="hidden" name="months" id="months" value="${orderQuery.months}" />
           		<input type="hidden" name="orderQuery.quantity" id="quantity" value="${orderQuery.quantity}" />
           		<input type="hidden" name="orderQuery.receiveName" id="receiveName" value="${address.receiveName}" />
           		<input type="hidden" name="orderQuery.receiveMobile" id="phoneNum" value="${address.phoneNum}" />
           		<input type="hidden" name="orderQuery.receiveAddress" id="address" value="${address.provinceNum}${address.cityNum}${address.districtNum}${address.address}" />
           		
           		<!-- 大学生  -->
           		<input type="hidden" name="memberQuery.isIdOauth" id="isIdOauth" value="${memberQuery.isIdOauth}" />
           		<input type="hidden" name="memberQuery.isContactOauth" id="isContactOauth" value="${memberQuery.isContactOauth}" />
           		<input type="hidden" name="memberQuery.isBkcardOauth" id="isBkcardOauth" value="${memberQuery.isBkcardOauth}" />
           		<input type="hidden" name="memberQuery.isEcpOauth" id="isEcpOauth" value="${memberQuery.isBkcardOauth}" />
           		<input type="hidden" name="memberQuery.isCardOauth" id="isCardOauth" value="${memberQuery.isBkcardOauth}" />
           		<input type="hidden" name="memberQuery.creditLimit" id="creditLimit" value="${memberQuery.creditLimit}" />
           		
           		<!-- 白领 -->
           		<input type="hidden" name="collarQuery.creditLimit" id="collarCreditLimit" value="${collarQuery.creditLimit}" />
           		<input type="hidden" name="collarQuery.auditStatus" id="auditStatus" value="${collarQuery.auditStatus}" />
           		
           		<div class="step-wrap nobt" id="recvInfo" style="display: none;">
           			<div class="step-tt"><strong>收货人信息</strong></div>                     
               		<div class="step-ctent">
                   		<div class="item-info">
                       		<label>收货人：</label>${address.receiveName}
                       		
                       		<a class="common-btn bg-ea" style="margin-left:120px" onclick="editRecvInfo()">编辑</a>
                  		</div>
                 		<div class="item-info"><label>手机号：</label>${address.phoneNum}</div>
                		<div class="item-info address-item"><label>地址：</label>${address.provinceNum}${address.cityNum}${address.districtNum}${address.address}</div>
                	</div>
                </div>
            
                <div class="step-wrap  ">
                    <div class="step-tt">
                        <strong>商品清单</strong>
                    </div>
                    <div class="step-ctent buy-goods">
                        <table cellpadding="0" cellspacing="1" width="100%" border="0">
                            <tbody><tr>
                                <th width="60%">商品</th>
                                <th>价格</th>
                                <th>数量</th>
                            </tr>
                            <tr>
                                <td class="goods-info" >
                                    <a href="javascript: showProDetail('${productQuery.productId }')">
                                     <div><img src="${productQuery.coverImg }" /></div>
                                     <p><span>${productQuery.productName }</span></p>
                                    </a>
                                </td>
                                <td>￥${productQuery.salePrice }</td>
                                <td>${orderQuery.quantity }</td>
                            </tr>
                        </tbody></table>
                    </div>
                </div>
                <div class="step-wrap " id="instalment">
                    <div class="step-tt">
                        <strong>分期计算器</strong>
                    </div>
                    <div class="step-ctent">
                        <div class=" item-info all-price">
                            <label for="price">总价：</label>
                            <span>￥</span><span id="price">${productQuery.salePrice - orderQuery.firstPay}</span>
                        </div>
                        <div class="item-info pay-info">
                            <label for="paypre">首付金额：</label >
                            <input class="order-input-width" type="text" value="${orderQuery.firstPay }" id="firstPay" name="orderQuery.firstPay" onblur="cacuMonthPay()"/>                     
                            <span class="font-fc pl">￥</span>
                            <span id="shouFuKuan" class="font-fc">${orderQuery.firstPay }</span>
                        </div>
                        <div class="item-info pay-info nomb">
                            <label for="paynum">分期月数：</label>
                            <select id="month" class="order-input-width" name="orderQuery.months" onchange="cacuMonthPay()"></select>
                            <span class="font-ea pl">月供：</span><span class="font-fc">￥</span><span id="showMonthPay" class="font-fc">${productQuery.monthPay * orderQuery.quantity }</span>
                        </div>
                    </div>
                </div>
                <div class="step-wrap" id="recommand">
                    <div class="step-tt">
                        <strong>推荐码</strong>
                    </div>
                    <div class="step-ctent" style="padding-left: 55px;">
                    	<input type="text" id="recommandCode" name="orderQuery.recommendCode"/>
                    </div>
                </div>    
            </div>
        </div>
         </form>
        <div class="clearfix"></div>
        <button class="bg-fc common-btn fr" onclick="createOrder()" style="margin: 20px 0" id="submit_btn">提交订单</button>
     	<s:if test="getUserStyle() == 1 && orderQuery.orderTypes == 1">
	                （温馨提示：由于分期月数限制，暂不支持毕业时间为<font color="red">2015年12月之前</font>的同学下单）
     	</s:if>
        <div class="clearfix"></div>
    </div>
  
</div>


<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</div>

</body>
</html>