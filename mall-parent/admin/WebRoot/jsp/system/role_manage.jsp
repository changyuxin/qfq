<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="../common/head.jsp"%>
	<style type="text/css">
		.cnt_td {padding: 7px 3px; text-align: left; line-height: 20px; vertical-align: top;}
	</style>
	<title>亲分期后台-系统管理</title>
	<script type="text/javascript">
		$(function(){
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="roleQuery.pageNo" />,
				total: <s:property value="roleQuery.total" />,
				callback: function(selectPage) {
					$("[name='roleQuery.pageNo']").val(selectPage);
					queryRoleList();
				}
			});
			//点击确定触发
			$("#query").click(function(){
				queryRoleList(1);
			});
		});
		
		// 保存角色界面
		function saveRolePage(id){
			layer.open({
			    type: 2,
			    title: "保存角色",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["850px", "600px"],
			    content: "system/role!saveRolePage.do?roleQuery.roleId=" + id
			});
		}
		
		function deleteRole(id){
			layer.confirm("确认是否删除角色!", function(){
				$.post("system/role!deleteRole.do", {
					"roleQuery.roleId" : id,
					"timestamp" : new Date().getTime() 
					}, function(data) {
						if (data.result == "FAILURE") {
							layer.alert("删除角色失败!");
						} else {
							layer.alert("删除角色成功!");
							queryRoleList();
							layer.close(index);
						}
					}, "json");
			});
		}
		
		// 关闭
		function close(){
			queryRoleList();
			layer.closeAll("iframe");
		}
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 系统管理 - 角色管理</div>
			<input type="button" class="ropt" value="添加角色" onclick="saveRolePage(0)" />
			<div class="clear"></div>
		</div>
		<!--  -->
		<form id="queryForm" method="post">
			<div class="rhead">
				名称：<input type="text" name="roleQuery.roleName" value="<s:property value='roleQuery.roleName'/>" style="width:100px" /> 
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="query"/>
				<input type="hidden" name="roleQuery.pageNo"  value="<s:property value='roleQuery.pageNo'/>"/>
				<input type="hidden" name="roleQuery.pageTotal"  value="<s:property value='roleQuery.pageTotal'/>"/>
				<div class="clear"></div>
			</div>
			<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox" />
						</th>
						<th>角色姓名</th>
						<th>权限</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="roleList.size() > 0">
						<s:iterator value="roleList" id="role">
							<tr>
								<td class="cnt_td">
									<input type="checkbox" name="id" />
								</td>
								<td class="cnt_td">
									<s:property value="#role.roleName" />
								</td>
								<td class="cnt_td">
									<s:property value="#role.resourceNames" />
								</td>
								<td class="cnt_td">
									<s:date name="#role.createTime" format="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td class="cnt_td">
									<input type="button" value="编辑" onclick="saveRolePage('<s:property value="#role.roleId" />')" />&nbsp;
									<input type="button" value="删除" onclick="deleteRole('<s:property value="#role.roleId" />')" />&nbsp;
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="roleQuery.total" /> 条记录</div>
			</div>
		</form>
	<!--main end-->
	</body>
</html>





