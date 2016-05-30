<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<style type="text/css">
		.cnt_td {padding-left:10px; text-align: left; line-height: 20px;}
	</style>
</head>
<body style="overflow-x:hidden;">
	<table class="pn-ltable" style="font-size: 12px;" width="100%" cellspacing="1" cellpadding="0" border="0">
		<thead class="pn-lthead">
			<tr>
				<th>身份证</th>
				<th>姓名</th>
				<th>欠款总额</th>
				<th>总罚息</th>
				<th>逾期笔数</th>
				<th>状态</th>
				<th>平台</th>
			</tr>
		</thead>
		<tbody class="pn-ltbody">
			<s:iterator value="blackList" id="black">
				<tr>
					<td class="cnt_td"><s:property value="#black.id" /></td>
					<td class="cnt_td"><s:property value="#black.name" /></td>
					<td class="cnt_td"><s:property value="#black.totalArrears" /></td>
					<td class="cnt_td"><s:property value="#black.totalPenalty" /></td>
					<td class="cnt_td"><s:property value="#black.lateTimes" /></td>
					<td class="cnt_td"><s:property value="#black.status" /></td>
					<td class="cnt_td"><s:property value="#black.platform" /></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</body>
</html>