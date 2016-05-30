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
				$("#parentId").val('<s:property value="resourceQuery.parentId"/>');
				$("[isButton]").each(function(){
					if($(this).val() == '<s:property value="resourceQuery.isButton"/>'){
						$(this).attr("checked", "checked");
					}
				});
				$("[isCommon]").each(function(){
					if($(this).val() == '<s:property value="resourceQuery.isCommon"/>'){
						$(this).attr("checked", "checked");
					}
				});
				$("[isNav]").each(function(){
					if($(this).val() == '<s:property value="resourceQuery.isNav"/>'){
						$(this).attr("checked", "checked");
					}
				});
			});
			// 保存用户
			function saveResource(){
				$.post("system/resource!saveResource.do?timestamp=" + new Date().getTime(), 
					$("#resourceForm").serializeArray(), 
					function(data) {
						if (data.result == "FAILURE") {
							layer.alert("保存资源失败!");
						} else {
							window.parent.close();
						}
				}, "json");
			}
		</script>
		
	</head>
	<body style="overflow-x:hidden; overflow-y:hidden;" > 
		<form id="resourceForm" method="post">
			<table class="pn-ltable" style="" width="580" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
					<tr style="height: 40px;">  
						<td width="20%" class="pn-flabel">资源名称：</td>
						<td width="55%" class="pn-fcontent">
							<input type="text" size="40" id="roleName" maxlength="20" name="resourceQuery.resourceName" label="资源名称" value="<s:property value="resourceQuery.resourceName"/>" onblur="checkNull($(this))"/>
						</td>
						<td width="25%" class="pn-fcontent">
							长度在6-20位之间
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td class="pn-flabel">上级资源：</td>
						<td class="pn-fcontent">
			        		<select name="resourceQuery.parentId" id="parentId">
			        			<option value="0">请选择</option>
			        			<s:iterator value="navResources" id="resource">
			        				<option value="<s:property value="#resource.resourceId" />">
			        					<s:property value="#resource.resourceName" />
			        				</option>>
				            	</s:iterator>
			        		</select>
						</td>
						<td class="pn-fcontent">
							
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td class="pn-flabel">URL：</td>
						<td class="pn-fcontent">
			        		<input type="text" id="url" label="URL" name="resourceQuery.url" value="<s:property value="resourceQuery.url"/>"
			        			style="width: 288px;" onblur="checkNull($(this))"/>
						</td>
						<td class="pn-fcontent">
							
						</td>
					</tr>
					<!-- -->
					<tr style="height: 40px;">  
						<td class="pn-flabel">是否公共资源：</td>
						<td class="pn-fcontent">
			        		<input type="radio" isCommon label="公共资源" name="resourceQuery.isCommon" value="0" checked="checked"/> 否
			        		<input type="radio" isCommon label="公共资源" name="resourceQuery.isCommon" value="1" /> 是
						</td>
						<td class="pn-fcontent">
						</td>
					</tr>
					 
					<tr style="height: 40px;">  
						<td class="pn-flabel">是否导航：</td>
						<td class="pn-fcontent">
			        		<input type="radio" isNav label="导航" name="resourceQuery.isNav" value="0" checked="checked"/> 否
			        		<input type="radio" isNav label="导航" name="resourceQuery.isNav" value="1" /> 是
						</td>
						<td class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td class="pn-flabel">是否按钮：</td>
						<td class="pn-fcontent">
			        		<input type="radio" isButton label="按钮" name="resourceQuery.isButton" value="0" checked="checked"/> 否
			        		<input type="radio" isButton label="按钮" name="resourceQuery.isButton" value="1" /> 是
						</td>
						<td class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td class="pn-flabel"></td>
						<td class="pn-fcontent">
			        		<input type="hidden" value="<s:property value="resourceQuery.resourceId"/>" name="resourceQuery.resourceId" id="resourceId"/>
							<input type="button" value="保存" onclick="saveResource()"/>
						</td>
						<td class="pn-fcontent">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>





