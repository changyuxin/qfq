<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<style type="text/css">
		.cnt_td {text-align: center; padding-left:15px; line-height: 20px;}
	</style>
</head>
<body style="overflow-x:hidden;">
	<table class="pn-ltable" style="font-size: 12px;" width="100%" cellspacing="1" cellpadding="0" border="0">
		<thead class="pn-lthead">
			<tr>
				<th>支付时间</th>
				<th>支付方式</th>
				<th>支付金额</th>
				<th>是否成功</th>
			</tr>
		</thead>
		<tbody class="pn-ltbody">
			<s:if test="payList.size > 0">
				<s:iterator value="payList" id="pay" status="L">
					<tr>
						<td class="cnt_td">
							<s:date name="#pay.createTime" format="yyyy-MM-dd HH:mm:ss"/><br/>
						</td>
						<td class="cnt_td">
							<s:if test="#pay.payType == 1">支付宝</s:if><s:if test="#pay.payType == 2">微信</s:if><br/>
						</td>
						<td class="cnt_td">
							<s:property value="#pay.total" /><br/>
						</td>
						<td class="cnt_td">
							<s:if test="#pay.status == 1"><font color="orange"><strong>失败</strong></font></s:if><s:if test="#pay.status == 2"><font color="green"><strong>成功</strong></font></s:if><br/>
						</td>
					</tr>
				</s:iterator>
			</s:if>
			<s:else>
				<tr>
					<td class="cnt_td">
						无还款记录!
					</td>
				</tr>
			</s:else>
		</tbody>
	</table>
</body>
</html>