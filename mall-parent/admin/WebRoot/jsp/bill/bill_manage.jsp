<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.cnt_td {padding: 7px 3px; text-align: center; line-height: 20px; vertical-align: top;}
		.link_a{margin-right: 5px;}
		.font_b{font-weight: 800;}
	</style>
	<script type="text/javascript">
		$(function(){
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="billQuery.pageNo" />,
				total: <s:property value="billQuery.total" />,
				pageSize: <s:property value="billQuery.pageSize" />,
				callback: function(selectPage) {
					$("[name='billQuery.pageNo']").val(selectPage);
					queryBillList();
				}
			});
			//点击确定触发
			$("#queryBill").click(function(){
				queryBillList(1);
			});
			$(".pn-ltable tr").mouseover(function() {
				$(this).addClass("over");
			}).mouseout(function() {
				$(this).removeClass("over");
			});
		});
		
		// 催收记录
		function recordResult(id, ststus){
			if(ststus == 2){
				layer.alert("已经还款，无需催收!");
			} else {
				layer.open({
				    type: 2,
				    title: "催收结果",
				    shadeClose: false,
				    shade: 0.3,
				    area: ["400px", "200px"],
				    content: "bill/bill!auditPage.do?billQuery.billId=" + id
				});
			}
		}
		
		// 还款记录
		function showPayLog(id, ststus){
			layer.open({
			    type: 2,
			    title: "还款记录",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["600px", "400px"],
			    content: "bill/bill!payList.do?billQuery.billId=" + id + "&billQuery.tradeType=1" 
			});
		}
		
		function closeLayer(){
			layer.closeAll("iframe");
			queryBillList();
		}
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 账单管理</div>
			<div class="clear"></div>
		</div>
		<!--  -->
		<form id="billForm" method="post">		
			<div class="rhead">
				真实姓名：<input type="text" name="billQuery.trueName" value="<s:property value='billQuery.trueName'/>" style="width:100px" /> 
				还款状态：<select id="paymentStatus" name="billQuery.paymentStatus" style="width: 80px; text-align: center; font-size: 10px;">
							<option value="0" selected="selected">请选择</option>
						   	<option value="1" <s:if test="billQuery.paymentStatus == 1"> selected="selected"</s:if>>未还款</option>
						   	<option value="2" <s:if test="billQuery.paymentStatus == 2"> selected="selected"</s:if>>已还款</option>
						   	<option value="3" <s:if test="billQuery.paymentStatus == 3"> selected="selected"</s:if>>已延期</option>
			          	 </select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="queryBill"/>
				<input type="hidden" name="billQuery.pageNo" value="<s:property value='billQuery.pageNo'/>"/>
				<input type="hidden" name="billQuery.pageTotal" value="<s:property value='billQuery.pageTotal'/>"/>
				<input type="hidden" name="billQuery.indexstatus" value="<s:property value='billQuery.indexstatus'/>" id="indexstatus"/>
				<div class="clear"></div>
			</div>
			<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox" />
						</th>
						<th>帐单ID</th>
						<th>真实姓名</th>
						<th>类型</th>
						<th>用户名</th>
						<!--  
						<th>产品名称</th>
						-->
						<th>期数</th>
						<th>本金</th>
						<th>服务费</th>
						<th>财务费</th>
						<th>月供</th>
						<th>滞纳金</th>
						<th>还款总额</th>
						<th>滞纳天数</th>
						<th>应还款日期</th>
						<th>实际还款日期</th>
						<th>还款状态</th>
						<th>催收结果</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="bills.size() > 0">
						<s:iterator value="bills" id="bill">
							<tr>
								<td class="cnt_td">
									<input type="checkbox" name="ids" />
								</td>
								<td class="cnt_td">
									<s:property value="#bill.billId" />
								</td>
								<td class="cnt_td">
									<s:property value="#bill.trueName" />
								</td>
								<td class="cnt_td">
									<s:if test="#bill.userStyle == 1">大学生</s:if>
									<s:if test="#bill.userStyle == 2">白领</s:if>
								</td>
								<td class="cnt_td">
									<s:property value="#bill.username" />
								</td>
								<!--  
								<td class="cnt_td" style="text-align: left;">
									<s:property value="#bill.productName" />
								</td>
								-->
								<td class="cnt_td">
									<s:property value="#bill.currentMonth"/>/<s:property value="#bill.months"/>
								</td>
								<td class="cnt_td">
									<s:property value="#bill.principal" />
								</td>
								<td class="cnt_td">
									<s:if test="%{formatDouble(#bill.servicePay)} == null ">
										0.00
									</s:if>
									<s:else>
										<s:property value="%{formatDouble(#bill.servicePay)}" />
									</s:else>
								</td>
								<td class="cnt_td">
									<s:if test="%{formatDouble(#bill.financialPay) == null ">
										0.00
									</s:if>
									<s:else>
										<s:property value="%{formatDouble(#bill.financialPay)}" />
									</s:else>
								</td>
								<td class="cnt_td">
									<font color="blue"><b><s:property value="%{formatDouble(#bill.monthPay)}" /></b></font>
								</td>
								<td class="cnt_td">
									<s:if test="%{formatDouble(#bill.lateFines) == null ">
										0.00
									</s:if>
									<s:else>
										<font color="green"><b><s:property value="%{formatDouble(#bill.lateFines)}" /></b></font>
									</s:else>
								</td>
								<td class="cnt_td">
									<font color="orange"><b><s:property value="%{formatDouble(#bill.monthPay + #bill.lateFines)}" /></b></font>
								</td>
								<td class="cnt_td">
									<font color="green"><s:property value="#bill.lateDays" /></font>
								</td>
								<td class="cnt_td">
									<s:date name="#bill.paymentDate" format="yyyy-MM-dd"/>
								</td>
								<td class="cnt_td">
									<s:date name="#bill.actualPaymentDate" format="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td class="cnt_td">
									<s:if test="#bill.paymentStatus == 1">
										<font color="blue"><b>还款中</b></font>
									</s:if>
									<s:elseif test="#bill.paymentStatus == 2">
										<font color="green"><b>已还款</b></font>
									</s:elseif>
									<s:else>
										<font color="red"><b>已延期</b></font>
									</s:else>
								</td>
								<td class="cnt_td" >
									<s:property value="#bill.auditOpinion" />
								</td>
								<td class="cnt_td" style="vertical-align: top; padding-top: 8px; ">
									<s:if test="isPermissionUrl('bill/bill!auditPage.do')">
										<input type="button" value="催收结果" onclick="recordResult('<s:property value="#bill.billId"/>', '<s:property value="#bill.paymentStatus"/>')" class="btn-top" />   
									</s:if>
									<s:if test="isPermissionUrl('log/log!logList.do')">
										<input type="button" value="催收记录" onclick="showOpLog(5, '<s:property value="#bill.billId"/>')" class="btn-top" />
									</s:if>
									<s:if test="isPermissionUrl('bill/bill!payList.do')">
										<input type="button" value="还款记录" onclick="showPayLog('<s:property value="#bill.billId"/>', '<s:property value="#bill.paymentStatus"/>')" class="btn-top" />
									</s:if>
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="billQuery.total" /> 条记录</div>
			</div>
		</form>
	<!--main end-->
	</body>
</html>





