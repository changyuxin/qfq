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
			
			});
			
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
			function saveFocus(){
				if(validate()){
					$.post("manage/focus!saveFocus.do?timestamp=" + new Date().getTime(), 
						$("#focusForm").serializeArray(), 
						function(data) {
							if (data.result == "FAILURE") {
								layer.alert("保存轮播失败!");
							} else {
								window.parent.close();
							}
					}, "json");
				}
			}
		</script>
		
	</head>
	<body style="overflow-x:hidden; overflow-y:hidden;" > 
		<form id="focusForm" method="post" enctype="multipart/form-data" action="manage/focus!saveFocus.do">
			<table class="pn-ltable" style="" width="580" cellspacing="1" cellpadding="0" border="0">
			<tbody>
				<tr style="height: 40px;">  
					<td width="20%" class="pn-flabel">轮播图描述：</td>
					<td width="50%" class="pn-fcontent">
						<input type="text" size="30" id="focusDesc" name="focusImage.focusDesc" label="播图描述" value="<s:property value="focusImage.focusDesc"/>" onblur="checkNull($(this))"/>
					</td>
					<td width="30%" class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">轮播图链接：</td>
					<td class="pn-fcontent">
						<input type="text" size="30" id="focusLink" name="focusImage.focusLink" label="轮播图链接" value="<s:property value="focusImage.focusLink"/>" onblur="checkNull($(this))"/>
					</td>
					<td class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">轮播图图片：</td>
					<td class="pn-fcontent">
						<input type="file" id="focusImage" name="upload" label="轮播图图片" onblur="checkNull($(this))"/>
					</td>
					<td class="pn-fcontent">
						<img src="<s:property value="focusImage.imageUrl" />" alt="" width="220" height="100" />
					</td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">背景颜色：</td>
					<td class="pn-fcontent">
						<input type="text" size="30" id="bgColor" name="focusImage.bgColor" label="背景颜色" value="<s:property value="focusImage.bgColor"/>" onblur="checkNull($(this))"/>
					</td>
					<td class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">轮播图顺序：</td>
					<td class="pn-fcontent">
						<input type="text" size="30" id="focusOrder" name="focusImage.focusOrder" label="轮播图顺序" value="<s:property value="focusImage.focusOrder"/>" onblur="checkNull($(this))"/>
					</td>
					<td class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel"></td>
					<td class="pn-fcontent">
		        		<input type="hidden" value="<s:property value="focusImage.focusId"/>" name="focusImage.focusId" id="focusId"/>
						<input type="submit" value="保存" />
					</td>
					<td class="pn-fcontent"></td>
				</tr>
			</tbody>
		</table>
		</form>
	</body>
</html>





