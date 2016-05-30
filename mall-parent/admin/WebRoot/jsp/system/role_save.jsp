<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<style type="text/css">
			.tr_h{height: 40px;}
		</style>
		<script type="text/javascript">
			$(function(){
				var ids = '<s:property value="roleQuery.resourceIds"/>';
				var arr = ids.split(",");
				for(var i = 0; i < arr.length; i++){
					$("input[type='checkbox']").each(function(){
						if($(this).val() == arr[i]){
							$(this).attr("checked", "checked");
						}
					});
				}
			});
		
			// 保存用户
			function saveRole(){
				$.post("system/role!saveRole.do?timestamp=" + new Date().getTime(),{
					"roleQuery.roleName" : $("#roleName").val(),
					"roleQuery.resourceIds" : getIds(),
					"roleQuery.roleId" : $("#roleId").val()
					}, function(data) {
						if (data.result == "FAILURE") {
							layer.alert("保存角色失败!");
						} else {
							window.parent.close();
						}
				}, "json");
			}
			
			function getIds(){
				var ids = '';
				$("input[type='checkbox']:checked").each(function(){
					ids += $(this).val() + ",";
				});
				return ids.substring(0, ids.length - 1);
			}
		</script>
		
	</head>
	<body style="overflow-x:hidden; overflow-y:scroll;" > 
		<form id="roleForm" method="post">
			<table class="pn-ltable" style="" width="97%" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
					<tr style="height: 40px;">  
						<td width="20%" class="pn-flabel">角色名称：</td>
						<td width="55%" class="pn-fcontent">
							<input type="text" size="30" id="roleName" maxlength="20" name="roleQuery.roleName" label="角色名称" value="<s:property value="roleQuery.roleName"/>" onblur="checkNull($(this))"/>
						</td>
						<td width="20%" class="pn-fcontent">
							长度在6-20位之间
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">权限：</td>
						<td width="48%" class="pn-fcontent">
							<s:iterator value="resourceList" id="resource">
				        		<div style="min-height:20px;padding-top:5px;width:550px;float:left">
				                	<input type="checkbox" style="vertical-align:bottom" value="<s:property value="#resource.resourceId"/>"/>
				                	<s:property value="#resource.resourceName"/>
				                </div>
				                <s:if test="children.size > 0">
					                <div style="padding-left:50px;width:550px;min-height:20px;float:left">
					                	<s:iterator value="children" id="child">
						                    <div style="width:125px;float:left">
						                    	<input type="checkbox" style="vertical-align:bottom" value="<s:property value="#child.resourceId"/>"/>
						                    	<s:property value="#child.resourceName"/>
						                    </div>
					                    </s:iterator>
					                </div>
				                </s:if>
			                </s:iterator>
						</td>
						<td width="40%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel"></td>
						<td width="48%" class="pn-fcontent">
			        		<input type="hidden" value="<s:property value="roleQuery.roleId"/>" name="roleQuery.roleId" id="roleId"/>
							<input type="button" value="保存" onclick="saveRole()"/>
						</td>
						<td width="40%" class="pn-fcontent">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>





