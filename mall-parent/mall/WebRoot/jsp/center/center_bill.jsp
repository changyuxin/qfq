<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 我的帐单</title>
	<script type="text/javascript">
		function billpayPage(status, billId) {
			if(status < "3"){
				layer.alert("订单未完成审核，暂时无法进行还款操作!");
			} 
			if (status == "8"){
				layer.alert("订单审核不通过，暂时无法进行还款操作!");
			}
			if (status >= "3" && status < "8") {
				window.location.href = "<%=basePath%>bill/" + billId + ".html";
			}
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
				<h2>商品账单</h2>
			</div>
			<div class="user-right-content">
				<div class="order-table first-order showOrder">
					<s:if test="orderList.size > 0">
						<s:iterator value="orderList" id="order">
							<s:if test="billQuerys.size() > 0">
								<div style="margin-top: 0px;" class="order-table-title first-table">
									<span class="order-left">
										<b>下单时间：<s:date name="#order.createTime" format="yyyy-MM-dd HH:mm:ss"/></b>
										<s>订单编号：<s:property value="orderCode" /></s>
										<s class="left-s">共<s:property value="months" />期</s>
										<s>已还<s:property value="overMonths" />期</s><s>未还<s:property value="remainMonths" />期 </s>
									</span>
								</div>
								<table style="margin-bottom: 8px; display: table;" class="event-table-55687" border="0" cellpadding="0" cellspacing="0" width="100%">
									<tbody>
										<s:set name="userStyle" value="getUserStyle()"/>
			                            <tr class="bills shows">
											<td width="94px">年月</td>
											<td title="例3/12，贷款分12期当前为第3期" width="94px">期数</td>
											<td width="94px">分期本金</td>
											<td width="94px">服务费</td>
											<s:if test="#userStyle == 2">
												<td width="94px">财务费</td>
											</s:if>
											<td width="94px">滞纳金</td>
											<td class="total" width="94px">还款总额</td>
											<td width="110px">还款日</td>
											<td width="94px">状态</td>
											<td width="204px">操作</td>
										</tr>
										<s:if test="billQuerys.size() > 0">
											<s:iterator value="billQuerys" id="bill" status="L">
												<tr class="font-size0">
													<td><s:date name="#bill.paymentDate" format="yyyy-MM"/></td>
													<td><s:property value="currentMonth" />/<s:property value="months" /></td>
													<td><strong>¥<b><s:property value="%{formatDouble(#bill.principal)}" /></b></strong></td>
													<td><strong>¥<b><s:property value="%{formatDouble(#bill.servicePay)}" /></b></strong></td>
													<s:if test="#userStyle == 2">
														<td><strong>¥<b><s:property value="%{formatDouble(#bill.financialPay)}" /></b></strong></td>
													</s:if>
													<td>¥<b><s:property value="lateFines" /></b></td>
													<td class="total">¥<b><s:property value="%{formatDouble(#bill.monthPay + #bill.lateFines)}" /></b></td>
													<td>
														<s:if test="#bill.paymentStatus == 2">
															<s:date name="#bill.actualPaymentDate" format="yyyy-MM-dd"/>
														</s:if>
														<s:else>
															<s:date name="#bill.paymentDate" format="yyyy-MM-dd"/>
														</s:else>
													</td>
													<td class="blue1">
														<s:property value="%{@com.qinfenqi.mall.common.constant.PaymentStatus@getName(#bill.paymentStatus)}"/>
													</td> 
													<td>
														<s:if test="#bill.paymentStatus == 1">
															<s:if test="#bill.theLast == 1 && #bill.isCurrPayDate != 1">
																<a href="bill/<s:property value="billId" />.html?billQuery.theLast=<s:property value="theLast" />" class="orange">提前还款</a>
															</s:if>
														</s:if>
														<s:if test="#bill.isCurrPayDate == 1">
															<a href="javascript: billpayPage('<s:property value="orderStatus" />', '<s:property value="billId" />')" class="orange">立即还款</a>
														</s:if>
														<!--  -->
														
													</td> 
												</tr>
											</s:iterator>
										</s:if>							
									</tbody>
								</table>
							</s:if>
						</s:iterator>
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