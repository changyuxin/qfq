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
				pageNo: <s:property value="userQuery.pageNo" />,
				total: <s:property value="userQuery.total" />,
				pageSize : <s:property value="userQuery.pageSize" />,
				callback: function(selectPage) {
					$("[name='userQuery.pageNo']").val(selectPage);
					queryUserList();
				}
			});
			//点击确定触发
			$("#queryUser").click(function(){
				queryUserList(1);
			});
		});
		
		// 关闭
		function close(){
			queryUserList();
			layer.closeAll();
		}
		
		// 跟踪记录
		function traceRecordPage(id){
			layer.open({
			    type: 2,
			    title: "跟踪记录",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["400px", "200px"],
			    content: "user/user!traceRecordPage.do?userQuery.userId=" + id
			});
		}
		
		// 删除用户
		function deleteUser(id, style){
			layer.confirm("确认是否删除用户!", function(){
				$.post("user/user!deleteUser.do", {
					"userQuery.userId" : id,
					"userQuery.userStyle" : style,
					"timestamp" : new Date().getTime() 
					}, function(data) {
						if (data.result == "FAILURE") {
							layer.alert("删除用户失败!");
						} else {
							layer.alert("删除用户成功!");
							close();
						}
					}, "json");
			});
		} 
		
		// 根据IP查询用户
		function queryUserByIp(id, ip){
			var id = "#" + id;
			$(id).val(ip);
			queryUserList(1);
		}
		
		
		
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 用户管理 - 全部用户</div>
			<div class="clear"></div>
		</div>
		<!--  -->
		<form id="userForm" method="post">		
			<div class="rhead">
				用户名：<input type="text" id="userName" name="userQuery.userName" value="<s:property value='userQuery.userName'/>" style="width:100px" />&nbsp;
				当前登录IP：<input type="text" id="currentLoginIp" name="userQuery.currentLoginIp" value="<s:property value='userQuery.currentLoginIp'/>" style="width:120px" />&nbsp;
				上次登录IP：<input type="text" id="lastLoginIp" name="userQuery.lastLoginIp" value="<s:property value='userQuery.lastLoginIp'/>" style="width:120px" />&nbsp;
				注册IP：<input type="text" id="registerIp" name="userQuery.registerIp" value="<s:property value='userQuery.registerIp'/>" style="width:120px" />&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="queryUser"/>
				<input type="hidden" name="userQuery.userStyle"  value="<s:property value='userQuery.userStyle'/>" id="userStyle"/>
				<input type="hidden" name="userQuery.pageNo"  value="<s:property value='userQuery.pageNo'/>"/>
				<input type="hidden" name="userQuery.pageTotal"  value="<s:property value='userQuery.pageTotal'/>"/>
				<div class="clear"></div>
			</div>
			<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox" />
						</th>
						<th>用户ID</th>
						<th>用户名</th>
						<th>用户类型</th>
						<th>登录次数</th>
						<th>当前登录IP</th>
						<th>当前登录时间</th>
						<th>上次登录IP</th>
						<th>上次登录时间</th>
						<th>注册时IP</th>
						<th>注册时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="userList.size() > 0">
						<s:iterator value="userList" id="user">
							<tr>
								<td class="cnt_td">
									<input type="checkbox" name="ids" value="5" />
								</td>
								<td class="cnt_td">
									<s:property value="#user.userId" />
								</td>
								<td class="cnt_td">
									<s:property value="#user.userName" />
								</td>
								<td class="cnt_td">
									<s:if test="#user.userStyle == 1">大学生</s:if>
									<s:if test="#user.userStyle == 2">白领</s:if>
								</td>
								<td class="cnt_td">
									<s:property value="#user.loginCount" />
								</td>
								<td class="cnt_td">
									<a href="javascript:queryUserByIp('currentLoginIp', '<s:property value="#user.currentLoginIp" />')" style="color: blue;">
										<s:property value="#user.currentLoginIp" />
									</a><br/>
									<s:if test="#user.currentIpArea != null">（<s:property value="#user.currentIpArea" />）</s:if>
								</td>
								<td class="cnt_td">
									<s:date name="#user.currentLoginTime" format="yyyy-MM-dd"/><br/>
									<s:date name="#user.currentLoginTime" format="HH:mm:ss"/>
								</td>
								<td class="cnt_td">
									<a href="javascript:queryUserByIp('lastLoginIp', '<s:property value="#user.lastLoginIp" />')" style="color: blue;">
										<s:property value="#user.lastLoginIp" /><br/>
									</a>
									<s:if test="#user.lastIpArea != null">（<s:property value="#user.lastIpArea" />）</s:if>
								</td>
								<td class="cnt_td">
									<s:date name="#user.lastLoginTime" format="yyyy-MM-dd"/><br/>
									<s:date name="#user.lastLoginTime" format="HH:mm:ss"/>
								</td>
								<td class="cnt_td">
									<a href="javascript:queryUserByIp('registerIp', '<s:property value="#user.registerIp" />')" style="color: blue;">
										<s:property value="#user.registerIp" /><br/>
									</a>
									<s:if test="#user.registIpArea != null">（<s:property value="#user.registIpArea" />）</s:if>
								</td>
								<td class="cnt_td">
									<s:date name="#user.createTime" format="yyyy-MM-dd"/><br/>
									<s:date name="#user.createTime" format="HH:mm:ss"/>
								</td>
								<td class="cnt_td">
									<s:if test="isPermissionUrl('user/user!traceRecordPage.do')">
										<input type="button" value="跟踪记录" onclick="traceRecordPage('<s:property value="#user.userId"/>')" class="btn-top" />
									</s:if>
									<s:if test="isPermissionUrl('log/log!logList.do')">
										&nbsp;<input type="button" value="操作记录" onclick="showOpLog(6, '<s:property value="#user.userId"/>')" class="btn-top" />
									</s:if>
									<s:if test="isPermissionUrl('user/user!deleteUser.do')">
										&nbsp;<input type="button" value="删除用户" onclick="deleteUser('<s:property value="#user.userId"/>', '<s:property value="#user.userStyle"/>')" class="btn-top" />
									</s:if>
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="userQuery.total" /> 条记录</div>
			</div>
		</form>
	<!--main end-->
	</body>
</html>





