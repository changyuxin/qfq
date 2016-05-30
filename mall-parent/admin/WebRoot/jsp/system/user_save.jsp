<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
		<style type="text/css">
			.tr_h{height: 40px;}
		</style>
		<script type="text/javascript">
			$(function(){
				var province = '${userQuery.province}';
				var city = '${userQuery.city}';
				var district = '${userQuery.district}';
				if (province != '') {
					$("#area").distpicker({
						province : province,
						city : city,
						district : district
					});
				} else {
					$("#area").distpicker({
						autoSelect : false
					});
				}
				$("#province").val(province);
				$("#city").val(city);
				$("#district").val(district);
				$("#roleId").val('${userQuery.roleId}');
				$("#deptId").val('${userQuery.deptId}');
			});
			
			function checkLength(o, l){
				var label = o.attr("label");
				var value = o.val();
				if(value < l){
					layer.alert(label + "长度不能小于" + l + "位!");
					return false;
				} else {
					return true;
				}
			}
			
			function validate(){
				var userName = $("#userName");
				var password = $("#password");
				var province = $("#province");
				var city = $("#city");
				var district = $("#district");
				var roleId = $("#roleId");
				if(!checkNull(userName)){
					return false;
				}
				if(!checkNull(password)){
					return false;
				}
				if(!checkNull(province)){
					return false;
				}
				if(!checkNull(city)){
					return false;
				}
				if(!checkNull(district)){
					return false;
				}
				if(!checkNull(roleId)){
					return false;
				}
				return true;
				
			}
			
			// 保存用户
			function saveUser(){
				if(validate()){
					$.post("system/user!saveUser.do?timestamp=" + new Date().getTime(), 
						$("#userForm").serializeArray(), 
						function(data) {
							if (data.result == "FAILURE") {
								layer.alert("保存用户失败!");
							} else {
								window.parent.close();
							}
					}, "json");
				}
			}
		</script>
		
	</head>
	<body style="overflow-x:hidden; overflow-y:hidden;" > 
		<form id="userForm" method="post">
			<table class="pn-ltable" style="" width="580" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">用户名：</td>
						<td width="48%" class="pn-fcontent">
							<input type="text" size="30" id="userName" maxlength="20" name="userQuery.userName" label="用户名" value="<s:property value="userQuery.userName"/>" onblur="checkNull($(this))"/>
						</td>
						<td width="40%" class="pn-fcontent">
							长度在6-20位之间
						</td>
					</tr>
					<s:if test="userQuery.userId == 0 ">
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">密码：</td>
						<td width="58%" class="pn-fcontent">
			        		<input type="password" size="30" maxlength="20" id="password" label="密码" name="userQuery.password" onblur="checkNull($(this))"/>
						</td>
						<td width="30%" class="pn-fcontent">
							长度在6-20位之间
						</td>
					</tr>
					</s:if>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">地区：</td>
						<td width="48%" class="pn-fcontent">
							<div id="area">
				        		<select label="省" id="province" name="userQuery.province" class="area-form-control" style="width: 80px;" onblur="checkNull($(this))"></select>&nbsp;
								<select label="市" id="city" name="userQuery.city" class="area-form-control" style="width: 80px;" onblur="checkNull($(this))"></select>&nbsp;
								<select label="区" id="district" name="userQuery.district" class="area-form-control" style="width: 80px;" onblur="checkNull($(this))"></select>&nbsp;
							</div>
						</td>
						<td width="40%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">角色：</td>
						<td width="48%" class="pn-fcontent">
			        		<select name="userQuery.roleId" id="roleId" label="角色" onblur="checkNull($(this))">
			        			<option value="">请选择</option>
			        			<s:iterator value="roleList" id="role" >
			        				<option value="<s:property value="#role.roleId" />"><s:property value="#role.roleName" /></option>
			        			</s:iterator>
			        		</select>
						</td>
						<td width="40%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">部门：</td>
						<td width="48%" class="pn-fcontent">
			        		<select name="userQuery.deptId" id="deptId" label="部门" onblur="checkNull($(this))">
			        			<option value="">请选择</option>
			        			<s:iterator value="deptList" id="dept" >
			        				<option value="<s:property value="#dept.deptId" />"><s:property value="#dept.deptName" /></option>
			        			</s:iterator>
			        		</select>
						</td>
						<td width="40%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel"></td>
						<td width="48%" class="pn-fcontent">
			        		<input type="hidden" value="<s:property value="userQuery.userId"/>" name="userQuery.userId" id="userId"/>
			        		<input type="hidden" value="0" name="userQuery.userStyle" id="userStyle"/>
							<input type="button" value="保存" onclick="saveUser()"/>
						</td>
						<td width="40%" class="pn-fcontent">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>





