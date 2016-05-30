<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.cnt_td {padding-left:10px; text-align: left; line-height: 20px;}
	</style>
	<script type="text/javascript">
		$(function(){
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="orderQuery.pageNo" />,
				total: <s:property value="orderQuery.total" />,
				pageSize:<s:property value="orderQuery.pageSize" />,
				callback: function(selectPage) {
					$("[name='orderQuery.pageNo']").val(selectPage);
					queryOrderList();
				}
			});
			//点击确定触发
			$("#queryOrder").click(function(){
				queryOrderList(1);
			});
			//点击确定触发
			$("#exportOrder").click(function(){
				exportOrders();
			});
			$(".pn-ltable tr").mouseover(function() {
				$(this).addClass("over");
			}).mouseout(function() {
				$(this).removeClass("over");
			});
			// $(".pn-ltable tr:even").addClass("alt");
			
		});
		
		// 导出会员
		function exportOrders(){
			location.href = basePath + "order/order!exportOrders.do?orderQuery.orderStatus=" + $("#status").val();
		}
		
		function closeLayer(){
			layer.closeAll();
			queryOrderList();
		}
		
		function showDeliverInfo(code, name){
			layer.open({
			    type: 2,
			    title: "物流信息",
			    shadeClose: true,
			    shade: 0.3,
			    area: ["600px", "600px"],
			    content: "order/order!deliverInfo.do?orderQuery.deliverCode=" + $.trim(code) + "&orderQuery.deliverName=" + $.trim(name)
			});
		}
		
		// 发货
		function deliverPage(id){
			layer.open({
			    type: 2,
			    title: "保存发货信息",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["500px", "200px"],
			    content: "order/order!deliverPage.do?orderQuery.orderId=" + id
			});
		}
		
		// 查看帐单
		function showBillDetail(orderId, userId){
			layer.open({
			    type: 2,
			    title: "查看帐单",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["800px", "500px"],
			    content: "bill/bill!showBillDetail.do?billQuery.orderId=" + orderId + "&billQuery.userId=" + userId
			});
		}
		
		// 查看合同
		function showContractDetail(id, status){
			if(status == 1){
				layer.alert("未签合同!");
			} else if (status == 6){
				layer.alert("订单已取消!");
			} else {
				layer.open({
				    type: 2,
				    title: "查看合同",
				    shadeClose: false,
				    shade: 0.3,
				    area: ["1000px", "600px"],
				    content: "contract/contract!showContractDetail.do?contractQuery.orderId=" + id
				});
			}
					
			
		}
		// 查看会员详情
		function showMemberDetail(id, style){
			if(style == 1){
				layer.open({
				    type: 2,
				    title: "查看会员",
				    shadeClose: false,
				    shade: 0.3,
				    area: ["1000px", "600px"],
				    content: "member/member!showMemberDetail.do?memberQuery.userId=" + id
				});
			}
			if(style == 2){
				layer.open({
				    type: 2,
				    title: "查看会员",
				    shadeClose: false,
				    shade: 0.3,
				    area: ["1000px", "600px"],
				    content: "collar/collar!showCollarDetail.do?collarQuery.userId=" + id
				});
			}
		}
		
		// 审核通过
		function auditPass(id, firstPay, status, userId){
			var f = false;
			if(firstPay > 0){
				if(status == 1){
					layer.alert("未支付首付，无法确认订单!");
				} else if(status == 2){
					f = true;
				}
			} else if(firstPay == 0){
				f = true;
			}
			if(f){
				layer.confirm("确认审核通过吗?", function(){
					$.post("order/order!auditPass.do", {
						"orderQuery.orderId" : id,
						"orderQuery.userId" : userId,
						"timestamp" : new Date().getTime()
					}, function(data) {
						if (data.result == "FAILURE") {
							layer.alert(data.msg); 
						} else {
							closeLayer();
						}
					}, "json");
				});
			}
		}
		
		// 审核不通过
		function auditNoPass(id, firstPay, status){
			var f = false;
			if(firstPay > 0){
				if(status == 1){
					layer.alert("未支付首付，无法确认订单!");
				} else if(status == 2){
					f = true;
				}
			} else if(firstPay == 0){
				f = true;
			}
			if(f){
				layer.open({
				    type: 2,
				    title: "审核意见",
				    shadeClose: false,
				    shade: 0.3,
				    area: ["400px", "200px"],
				    content: "order/order!auditPage.do?orderQuery.orderId=" + id
				});
			}
		}
		
		// 取消订单
		function cancelOrder(id){
			layer.confirm("确认取消订单吗?", function(){
				$.post("order/order!cancelOrder.do", {
					"orderQuery.orderId" : id,
					"timestamp" : new Date().getTime()
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert("取消订单失败!"); 
					} else {
						closeLayer();
					}
				}, "json");
			});
		}
		
		// 查看首付还款记录
		function showPayLog(id, ststus){
			layer.open({
			    type: 2,
			    title: "支付记录",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["600px", "400px"],
			    content: "bill/bill!payList.do?billQuery.billId=" + id + "&billQuery.tradeType=2"
			});
		}
		// 编辑收货人信息
		function receivePage(id){
			layer.open({
			    type: 2,
			    title: "编辑收货人信息",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["500px", "200px"],
			    content: "order/order!receivePage.do?orderQuery.orderId=" + id
			});
		}
		
		// 退首付
		function returnFirstPay(id){
			layer.confirm("确认退还首付吗?", function(){
				$.post("order/order!returnFirstPay.do", {
					"orderQuery.orderId" : id,
					"timestamp" : new Date().getTime()
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert("退还首付失败!"); 
					} else {
						closeLayer();
					}
				}, "json");
			});
		}
		
		// 查询黑名单
		function searchBlackList(name){
			layer.open({
			    type: 2,
			    title: "黑名单查询结果",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["700px", "400px"],
			    content: "member/member!searchBlackList.do?memberQuery.trueName=" + name
			});
		}
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 订单 - 全部订单</div>
			<div class="clear"></div>
		</div>
		<!-- --> 
		<form id="orderForm" method="post">		
			<div class="rhead">
					订单编号：<input type="text" name="orderQuery.orderCode" value="<s:property value='orderQuery.orderCode'/>" style="width:100px" />
					帐单类型：<select id="orderTypes" name="orderQuery.orderTypes" style="width: 80px; text-align: center; font-size: 10px;">
                 		<option value="0" selected="selected">全部订单</option>
                   		<option value="1" <s:if test="orderQuery.orderStatus == '1'"> selected="selected"</s:if>>分期订单</option>
                   		<option value="2" <s:if test="orderQuery.orderStatus == 2"> selected="selected"</s:if>>全款订单</option>
                 	</select>
					收货人姓名：<input type="text" name="orderQuery.receiveName" value="<s:property value='orderQuery.receiveName'/>" style="width:100px" />
					快递单号：<input type="text" name="orderQuery.deliverCode" value="<s:property value='orderQuery.deliverCode'/>" style="width:100px" />
					<!-- 订单状态：
					<select id="orderStatus" name="orderQuery.orderStatus" style="width: 80px; text-align: center; font-size: 10px;" onchange="getOrderStatus(this.value)">
                 		<option value="0" selected="selected">全选</option>
                   		<option value="1" <s:if test="orderQuery.orderStatus == '1'"> selected="selected"</s:if>>未签合同</option>
                   		<option value="2" <s:if test="orderQuery.orderStatus == 2"> selected="selected"</s:if>>待审核</option>
                   		<option value="3" <s:if test="orderQuery.orderStatus == 3"> selected="selected"</s:if>>审核通过</option>
                   		<option value="4" <s:if test="orderQuery.orderStatus == 4"> selected="selected"</s:if>>确认收货</option>
                   		<option value="5" <s:if test="orderQuery.orderStatus == 5"> selected="selected"</s:if>>还款中</option>
                   		<option value="6" <s:if test="orderQuery.orderStatus == 6"> selected="selected"</s:if>>已取消</option>
                   		<option value="7" <s:if test="orderQuery.orderStatus == 7"> selected="selected"</s:if>>已完成</option>
                 	</select> -->
					时间范围：<input style="width:135px;" id="startTime" type="text" class="Wdate one_bg" name="orderQuery.startTime"
			                    	onclick="WdatePicker({isShowClear:true,autoPickDate:true, readOnly:true, dateFmt:'yyyy-MM-dd HH:mm:ss', maxDate:'#F{$dp.$D(\'endTime\');}'})" 
			                    	value="<s:property value="#request.orderQuery.startTime" />"
			                    	/>
		            		<input style="width:135px;" id="endTime" type="text" class="Wdate one_bg2" name="orderQuery.endTime"
			                    	onclick="WdatePicker({isShowClear:true, autoPickDate:true, readOnly:true, dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'startTime\');}'})" 
			                    	value="<s:property value="#request.orderQuery.endTime" />"
			                    	/>
						&nbsp;&nbsp;<input type="button" value="查询" id="queryOrder" />
						<s:if test="isPermissionUrl('order/order!exportOrders.do')">
						&nbsp;&nbsp;<input type="button" value="导出" id="exportOrder" />
						</s:if>
						<input type="hidden" id="status" name="orderQuery.orderStatus" value="<s:property value='orderQuery.orderStatus'/>"/>
						<input type="hidden" name="orderQuery.pageNo"  value="<s:property value='orderQuery.pageNo'/>"/>
						<input type="hidden" name="orderQuery.pageTotal"  value="<s:property value='orderQuery.pageTotal'/>"/>
				<div class="clear"></div>
			</div>
			<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox" />
						</th>
						<th>订单信息</th>
						<th>产品信息</th>
						<th>分期相关</th>
						<th>收货人相关</th>
						<th>发货相关</th>
						<th>时间</th>
						<th>状态</th>
						<!-- 
						<th>审核意见</th>
						 -->
						<th>操作选项</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="orderList.size() > 0">
						<s:iterator value="orderList" id="order">
							<tr>
								<td align="center">
									<input type="checkbox" name="ids" value="5" />
								</td>
								<td class="cnt_td">
									订单编号：<s:property value="#order.orderCode"/><br/>
									订单类型：<s:if test="#order.orderTypes == 1">分期订单</s:if><s:if test="#order.orderTypes == 2">全款订单</s:if>
								</td>
								<td class="cnt_td" style="width:300px;">
									产品名称：<s:property value="#order.productName"/><br/>
									产品编号：<s:property value="#order.productCode"/><br/>
									产品数量：<s:property value="#order.quantity"/><br/>
									产品价格：<s:property value="%{formatDouble(#order.productPrice)}"/><br/>
								</td>
								<td class="cnt_td" style="width:150px;">
									分期首付：<s:property value="%{formatDouble(#order.firstPay)}"/>元<br/>
									分期月数：<s:property value="#order.months"/>月<br/>
									分期月供：<s:property value="%{formatDouble(#order.monthPay)}" />元<br/>
									起始时间：<s:date name="#order.createTime" format="yyyy-MM-dd"/><br/>
									结束时间：<s:date name="#order.stopTime" format="yyyy-MM-dd"/><br/>
								</td>
								<td class="cnt_td" style="width:250px;">
									收货人姓名：<s:property value="#order.receiveName"/>（<a href="javascript: searchBlackList('<s:property value='#order.receiveName'/>')"><font color="blue">查询黑名单</font></a>）<br/>
									收货人电话：<s:property value="#order.receiveMobile"/><s:if test="#order.receiveMobile != null && #order.receiveMobile != ''">（<a href="javascript: showUserInfo('<s:property value="#order.userId"/>')"><font color="blue">查看</font></a>）</s:if> <br/>
									收货人地址：<s:property value="#order.receiveAddress"/><br/>
									<s:if test="#order.deliverStatus == 1 && #order.orderStatus == 3">
										<s:if test="isPermissionUrl('order/order!receivePage.do')">
											<input type="button" value="编辑地址" onclick="receivePage('<s:property value="#order.orderId"/>')" class="btn-top" /><br/>
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td" style="width:220px;">
									<s:if test="#order.deliverName != null && !'ziti'.equals(#order.deliverName)">
										取货方式：快递<br/>
										快递单号：<s:if test="#order.deliverCode != null && !''.equals(#order.deliverCode)"><s:property value="#order.deliverCode"/>（<a href="javascript:showDeliverInfo('<s:property value="#order.deliverCode"/>', '<s:property value="#order.deliverName"/>')" style="color: blue;">查看物流</a>）</s:if><br/>
										快递公司：<s:property value="%{@com.qinfenqi.mall.common.constant.Deliver@getName(#order.deliverName)}"/><br/>
									</s:if>
									<s:if test="#order.deliverName != null && 'ziti'.equals(#order.deliverName)">
										取货方式：自提<br/>
									</s:if>
									发货时间：<s:date name="#order.deliverTime" format="yyyy-MM-dd HH:mm:ss"/><br/>
									商品IMEI：<s:property value="#order.productImei"/><br/>
									<s:if test="#order.deliverStatus == 1 && (#order.orderStatus == 3 || #order.orderStatus == 10)">
										<s:if test="isPermissionUrl('order/order!deliverPage.do')">
											<input type="button" value="确认发货" onclick="deliverPage('<s:property value="#order.orderId"/>')" class="btn-top" />
										</s:if>
									</s:if>
									<s:if test="#order.deliverStatus == 2 && #order.orderStatus == 4">
										<s:if test="isPermissionUrl('order/order!deliverPage.do')">
											<input type="button" value="编辑信息" onclick="deliverPage('<s:property value="#order.orderId"/>')" class="btn-top" /><br/>
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td" >
									创建时间：<br/>
									<s:date name="#order.createTime" format="yyyy-MM-dd HH:mm:ss"/><br/>
									更新时间：<br/>
									<s:date name="#order.updateTime" format="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td class="cnt_td" style="width:180px;">
									订单状态：<s:property value="%{@com.qinfenqi.mall.common.constant.OrderStatus@getName(#order.orderStatus)}"/> <s:if test="#order.orderStatus == 8"><img id="opinion" src="img/message.gif" alt="message" onmousemove="layer.tips('${order.auditOpinion}', '#opinion')" onmouseout="layer.closeAll()"/></s:if><br/>
									发货状态：<s:property value="%{@com.qinfenqi.mall.common.constant.DeliverStatus@getName(#order.deliverStatus)}"/><br/>
									首付状态：<s:if test="#order.firstPay == 0">无首付</s:if><s:if test="#order.firstPay > 0"><s:if test="#order.firstPayStatus == 1">未支付</s:if><s:if test="#order.firstPayStatus == 2">已支付（ <a href="javascript:showPayLog(<s:property value="#order.orderId"/>)" style="color:blue;">查看</a>）</s:if><s:if test="#order.firstPayStatus == 3">已退款</s:if></s:if>
									<s:if test="#order.orderStatus == 6 && #order.firstPayStatus == 2">
										<input type="button" value="退首付" onclick="returnFirstPay('<s:property value="#order.orderId"/>')" class="btn-top" />
									</s:if>
								</td>
								<!-- 
								<td class="cnt_td" style="width:50px;">
									<s:property value="#order.auditOpinion"/>
								</td>
								 -->
								<td align="center" style="width:150px; wiline-height:50px; vertical-align: top; padding-top: 8px; padding-bottom: 8px;">
									<s:if test="#order.orderTypes == 1">
										<input type="button" value="查看会员" onclick="showMemberDetail('<s:property value="#order.userId"/>', '<s:property value="#order.userStyle"/>')" class="btn-top" /><br/>
										<input type="button" value="查看合同" onclick="showContractDetail('<s:property value="#order.orderId"/>', '<s:property value="#order.orderStatus"/>')" class="btn-top" /><br/>
										<s:if test="isPermissionUrl('bill/bill!getBillsPage.do')">
											<s:if test="#order.orderStatus == 3 || #order.orderStatus == 4 || #order.orderStatus == 5 || #order.orderStatus == 7 || #order.orderStatus == 8">
												<input type="button" value="查看帐单" onclick="showBillDetail('<s:property value="#order.orderId"/>', '<s:property value="#order.userId"/>')" class="btn-top" /><br/>
											</s:if>
										</s:if>
									</s:if>
									<s:if test="#order.orderStatus == 1 || #order.orderStatus == 2">
										<s:if test="isPermissionUrl('order/order!auditPass.do')">
											<input type="button" value="审核通过" onclick="auditPass('<s:property value="#order.orderId"/>', '<s:property value="#order.firstPay"/>', '<s:property value="#order.firstPayStatus"/>', '<s:property value="#order.userId"/>')" class="btn-top" /><br/>
										</s:if>
										<s:if test="isPermissionUrl('order/order!auditPage.do')">
											<input type="button" value="审核不通过" onclick="auditNoPass('<s:property value="#order.orderId"/>', '<s:property value="#order.firstPay"/>', '<s:property value="#order.firstPayStatus"/>')" class="btn-top" /><br/>
										</s:if>
									</s:if>
									<!-- -->
									<s:if test="#order.orderStatus != 6">
										<s:if test="isPermissionUrl('order/order!cancelOrder.do')">
											<input type="button" value="取消订单" onclick="javascript:cancelOrder('<s:property value="#order.orderId"/>');" class="btn-top" /><br/>
										</s:if>
									</s:if>
									<s:if test="isPermissionUrl('log/log!logList.do')">
										<input type="button" value="操作记录" onclick="showOpLog(1, '<s:property value="#order.orderId"/>')" class="btn-top" /><br/>
									</s:if>
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="orderQuery.total" /> 条记录</div>
			</div>
		</form>
	<!--main end-->
	</body>
</html>





