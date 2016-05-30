<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 已购商品</title>
	<script type="text/javascript">
		function cancelOrder(id){
			layer.confirm("确认取消订单吗?", function(){
				$.post("<%=basePath%>order/order!cancelOrder.do", {
					"orderQuery.orderId" : id,
					"timestamp" : new Date().getTime()
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert("取消订单失败!"); 
					} else {
						location.href = "<%=basePath%>center/order.html";
					}
				}, "json");
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
    <div class="main-wrap">
    	<%@include file="center_leftnav.jsp"%>
    	<!--右侧-->
        <div class="user-right mu-ctxt">
			<div class="user-right-head">
				<h2>已购商品</h2>
			</div>
			<div class="user-right-content">
				<div class="order-table" style="display:block;">
					<s:if test="orderList!= null && orderList.size() > 0">
					<table width="100%" border="0" cellpadding="1" cellspacing="0">
						<tbody>
	                    	<tr class="bills" >
                            	<td width="80px">订单编号</td>
                            	<td width="150px">商品名称</td>
                            	<td width="40px">数量</td>
                           		<td width="60px">商品价格</td>
                            	<td width="60px">邮递费</td>
                            	<td width="60px">首付金额</td>
                            	<td width="100px">月供金额</td>
                            	<td width="120px">购买日期</td>
                            	<td width="80px">状态</td>
                            	<td width="80px">操作</td>
                            </tr>
		            		<s:iterator value="orderList" id="order">
		            			<s:if test="orderStatus == 10">
	                           		<tr class="font-size0">
	                                   <td><s:property value="orderCode" /></td>                                   
	                                   <td><a href="products/<s:property value="productId" />.html"><s:property value="productName" /></a> </td>                                   
	                                   <td>1 </td> 
	                                   <s:if test="productId == 1568 || productId == 1569 || productId == 1570">
	                                   	<td><strong>¥<b><s:property value="0" /></b></strong></td>
		                               	<td><strong>¥<b><s:property value="productPrice" /></b></strong></td>
		                               </s:if>
		                               <s:else>
		                               	<td><strong>¥<b><s:property value="productPrice" /></b></strong></td> 
		                               	<td><strong>¥<b><s:property value="0" /></b></strong></td>
		                               </s:else>                                                                     
	                                   <td><strong>¥<b><s:property value="firstPay" /></b></strong></td>                                   
	                                   <td> <p><strong>¥<font><s:property value="monthPay" /></font></strong> x<s:property value="months" /></p> </td>                                   
	                                   <td width="70px"><span><s:date name="createTime" format="yyyy-MM-dd" /></span></td>                             
	                                   <td><s:property value="%{@com.qinfenqi.mall.common.constant.OrderStatus@getName(orderStatus)}"/></td>                                   
	                         			<td class="logInfo">
	                         				<s:if test="orderTypes == 1">
		                         				<s:if test="orderStatus == 1">
			                                		<div><a href="order/contract!contract.do?orderQuery.orderId=<s:property value="orderId" />">签订合同</a></div>
			                                	</s:if>
		                         				<s:if test="orderStatus == 1 || orderStatus == 2 || orderStatus == 8">
		                         					<s:if test="firstPayStatus == 1 && firstPay > 0">
		                         						<div><a href="javascript: payment('<s:property value="orderId" />', 2)">支付首付</a></div>
		                         					</s:if>
		                         					<div><a href="javascript: cancelOrder(<s:property value="orderId" />)">取消订单</a></div>
		                         				</s:if>
		                         				<s:if test="orderStatus == 3 || orderStatus == 4 || orderStatus == 5">
			                                		<div><a href="center/bill.html">去还款</a></div>
			                                		<div><a href="center/<s:property value="orderId" />.html">去评论</a></div>
			                                	</s:if>  	
			                                </s:if>
			                                <s:if test="orderTypes == 2">
			                                	<s:if test="orderStatus == 9">
			                                		<div><a href="javascript: payment(<s:property value="orderId" />, 3)">立即付款</a></div>
				                                	<div><a href="javascript: cancelOrder(<s:property value="orderId" />)">取消订单</a></div>
			                                	</s:if>
			                                </s:if>
		                                	<s:if test="orderStatus == 6">
		                                		 <s:if test="productId == 1568 || productId == 1569 || productId == 1570">
		                                			<div><a href="freeproducts/<s:property value="productId" />.html">再次领取</a></div>
		                                		</s:if>
		                                		<s:else> 
		                                			<div><a href="products/<s:property value="productId" />.html">再次购买</a></div>
		                                		</s:else>
		                                	</s:if>
		                                	<s:if test="orderStatus == 10">
			                                		<div><a href="center/<s:property value="orderId" />.html">去评论</a></div>
			                                </s:if>
			                          		<div><a href="order/<s:property value="orderId" />.html">查看详情</a></div>
		                       			</td>                                   
	                     			</tr>
	                     		</s:if>
                    		</s:iterator>             	
						</tbody>
					</table>
                   	</s:if>
					<s:else>
						<p class="without-indent-p">亲，您还没有订单，先去<a href="#" class="without-indent-a">首页</a>逛一逛吧</p>
					</s:else>
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