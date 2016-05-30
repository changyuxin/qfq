<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<style type="text/css">
		.cnt_td {padding-left:10px; text-align: left; line-height: 20px;}
	</style>
	</head>
	<body style="overflow-x:hidden; overflow-y:hidden">
			<table class="pn-ltable" style="width: 100%; text-align: right;" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
						<tr>
							<td><b>用户ID</b>：</td>
							<td class="cnt_td">
								<s:property value="userQuery.userId" />
							</td>
						</tr>
						<tr>
							<td><b>用户名</b>：</td>
							<td class="cnt_td">
								<s:property value="userQuery.userName" />
							</td>
						</tr>
						<tr>
							<td><b>用户类型</b>：</td>
							<td class="cnt_td">
								<s:if test="userQuery.userStyle == 1">大学生</s:if>
								<s:if test="userQuery.userStyle == 2">白领</s:if>
							</td>
						</tr>
						<tr>
							<td><b>登录次数</b>：</td>
							<td class="cnt_td">
								<s:property value="userQuery.loginCount" />
							</td>
						</tr>
						<tr>
							<td><b>当前登录时间</b>：</td>
							<td class="cnt_td">
								<s:date name="userQuery.currentLoginTime" format="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
						<tr>
							<td><b>当前登录IP</b>：</td>
							<td class="cnt_td">
								<s:property value="userQuery.currentLoginIp" /><br/><s:if test="userQuery.currentIpArea != null"><s:property value="userQuery.currentIpArea" /></s:if>
							</td>
						</tr>
						<tr>
							<td><b>上次登录时间</b>：</td>
							<td class="cnt_td">
								<s:date name="userQuery.lastLoginTime" format="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
						<tr>
							<td><b>上次登录IP</b>：</td>
							<td class="cnt_td">
								<s:property value="userQuery.lastLoginIp" /><br/><s:if test="userQuery.lastIpArea != null"><s:property value="userQuery.lastIpArea" /></s:if>
							</td>
						</tr>
						<tr>
							<td><b>注册时IP</b>：</td>
							<td class="cnt_td">
								<s:property value="userQuery.registerIp" /><br/><s:if test="userQuery.registIpArea != null"><s:property value="userQuery.registIpArea" /></s:if>
							</td>
						</tr>
						<tr>
							<td><b>注册时间</b>：</td>
							<td class="cnt_td">
								<s:date name="userQuery.createTime" format="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
				</tbody>
			</table>
	</body>
</html>





