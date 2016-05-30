<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="../common/head.jsp"%>
	<style type="text/css">
		.cnt_td {padding: 7px 3px; text-align: center; line-height: 20px; vertical-align: top;}
		.link_a{margin-right: 5px;}
		.font_b{font-weight: 800;}
	</style>
</head>
<body>
	<!--main-->
	<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
		<thead class="pn-lthead">
			<tr>
				<th width="25">
					<input type="checkbox" />
				</th>
				<th>真实姓名</th>
				<th>用户名</th>
				<th>期数</th>
				<th>本金</th>
				<th>服务费</th>
				<th>财务费</th>
				<th>滞纳金</th>
				<th>月供</th>
				<th>还款总额</th>
				<th>还款日期</th>
				<th>还款状态</th>
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
							<s:property value="#bill.trueName" />
						</td>
						<td class="cnt_td">
							<s:property value="#bill.username" />
						</td>
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
							<s:if test="%{formatDouble(#bill.lateFines) == null ">
								0.00
							</s:if>
							<s:else>
								<s:property value="%{formatDouble(#bill.lateFines)}" />
							</s:else>
						</td>
						<td class="cnt_td">
							<s:property value="%{formatDouble(#bill.monthPay)}" />
						</td>
						<td class="cnt_td">
							<font color="orange"><b><s:property value="%{formatDouble(#bill.monthPay + #bill.lateFines)}" /></b></font>
						</td>
						<td class="cnt_td">
							<s:date name="#bill.paymentDate" format="yyyy-MM-dd"/>
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
					</tr>
				</s:iterator>
			</s:if>
		</tbody>
	</table>
	<!--main end-->
	</body>
</html>





