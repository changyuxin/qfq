<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="../common/head.jsp"%>
	<style type="text/css">
		.cnt_td {padding: 7px 3px; text-align: center; line-height: 20px; vertical-align: top;}
	</style>
	<title>亲分期后台-系统管理</title>
	<script type="text/javascript">
		$(function(){
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="userQuery.pageNo" />,
				total: <s:property value="userQuery.total" />,
				callback: function(selectPage) {
					$("[name='userQuery.pageNo']").val(selectPage);
					queryUserList();
				}
			});
			//点击确定触发
			$("#query").click(function(){
				queryUserList(1);
			});
		});
		
		// 
		function saveUserPage(id){
			layer.open({
			    type: 2,
			    title: "保存用户",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["600px", "300px"],
			    content: "system/user!saveUserPage.do?userQuery.userId=" + id
			});
		}
		
		function deleteUser(id){
			layer.confirm("确认是否删除用户!", function(){
				$.post("system/user!deleteUser.do", {
					"userQuery.userId" : id,
					"timestamp" : new Date().getTime() 
					}, function(data) {
						if (data.result == "FAILURE") {
							layer.alert("删除用户失败!");
						} else {
							layer.alert("删除用户成功!");
							queryUserList();
							layer.close(index);
						}
					}, "json");
			});
		}
		
		function enableUser(id, status, desc){
			$.post("system/user!enableUser.do", {
				"userQuery.userId" : id,
				"userQuery.userStatus" : status,
				"timestamp" : new Date().getTime() 
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert(desc + "用户失败!");
					} else {
						queryUserList();
						layer.close(index);
					}
				}, "json");
		}
				
		
		function close(){
			queryUserList();
			layer.closeAll("iframe");
		}
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 系统管理 - 用户管理</div>
			<input type="button" class="ropt" value="添加用户" onclick="saveUserPage(0)" />
			<div class="clear"></div>
		</div>
		<!--  -->
		<form id="queryForm" method="post">
			<div class="rhead">
				用户名：<input type="text" name="userQuery.userName" value="<s:property value='userQuery.userName'/>" style="width:100px" /> 
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="query" />
				<input type="hidden" name="userQuery.userStyle"  value="0"/>
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
						<th>用户名</th>
						<th>角色</th>
						<th>所属部门</th>
						<th>登录次数</th>
						<th>上次登录</th>
						<th>创建时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="userList.size() > 0">
						<s:iterator value="userList" id="user">
							<tr>
								<td class="cnt_td">
									<input type="checkbox" name="id" />
								</td>
								<td class="cnt_td">
									<s:property value="#user.userName" />
								</td>
								<td class="cnt_td">
									<s:property value="#user.roleName" />
								</td>
								<td class="cnt_td">
									<s:property value="#user.deptName" />
								</td>
								<td class="cnt_td">
									<s:property value="#user.loginCount" />
								</td>
								<td class="cnt_td">
									<s:date name="#user.lastLoginTime" format="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td class="cnt_td">
									<s:date name="#user.createTime" format="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td class="cnt_td">
									<s:if test="#user.userStatus == 1">
										启用
									</s:if>
									<s:if test="#user.userStatus == 2">
										停用
									</s:if>
								</td>
								<td class="cnt_td">
									<input type="button" value="编辑" onclick="saveUserPage('<s:property value="#user.userId" />')" />&nbsp;
									<input type="button" value="删除" onclick="deleteUser('<s:property value="#user.userId" />')" />&nbsp;
									<input type="button" value="启用" onclick="enableUser('<s:property value="#user.userId" />', 1, '启用')" />&nbsp;
									<input type="button" value="停用" onclick="enableUser('<s:property value="#user.userId" />', 2, '停用')" />&nbsp;
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





