<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<style type="text/css">
		.cnt_td {text-align: center; line-height: 20px;}
	</style>
</head>
<body style="overflow-x:hidden;">
	<table class="pn-ltable" style="font-size: 12px;" width="100%" cellspacing="1" cellpadding="0" border="0">
		<thead class="pn-lthead">
			<tr>
				<th>操作时间</th>
				<th>操作人</th>
				<th>操作内容</th>
			</tr>
		</thead>
		<tbody class="pn-ltbody">
			<s:iterator value="logs" id="log">
				<tr>
					<td class="cnt_td">
						<s:date name="#log.createTime" format="yyyy-MM-dd"/><br/>
						<s:date name="#log.createTime" format="HH:mm:ss"/>
					</td>
					<td class="cnt_td"><s:property value="#log.userName" /></td>
					<td class="cnt_td" style="padding-left:10px; text-align: left; width: 400px;"><s:property value="#log.description" /></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</body>
</html>