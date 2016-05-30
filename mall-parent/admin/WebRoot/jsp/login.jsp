<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<title>亲分期后台管理登录</title>
	<link type="text/css" rel="stylesheet"  href="<%=basePath%>css/login.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.3.min.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.md5.js" ></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#userName").focus();
		});
		
		/** 登录验证 */
		function validLogin() {
			var userName = $.trim($("#userName").val());
			var password = $.trim($("#password").val());
			if(userName.length == 0){
				$("#msg").html("用户名不能为空!");
				userName.focus();
				return false;
			}
			if(password.length == 0){
				$("#msg").html("密码不能为空!");
				password.focus();
				return false;
			}
			return true;
		}
		
		function login(){
			$("#msg").html("");
			if(validLogin()){
				$.post("login.do", {
					"userName" : $.trim($("#userName").val()),
					"password" : $.md5($.trim($("#password").val()))
				}, function(data) {
					if (data.result == "FAILURE") {
						$("#msg").html(data.message).show(); 
					} else {
						location.href = "<%=basePath%>home/home!index.do";	
					}
				}, "json");
			}
		}
		
		/** Enter键提交 */
		$(document).keyup(function(event){
			var currKey = 0, e = e || event;
			if (e.keyCode == 13) {
				login();
			}
		});
	</script>
	
</head>

<body>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td height="600" align="center">
					<table width="894" border="0" align="center" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td><img src="img/jspgou_03.jpg"></td>
								<td><img src="img/jspgou_04.jpg"></td>
								<td><img src="img/jspgou_05.jpg"></td>
							</tr>
							<tr>
								<td><img src="img/jspgou_07.jpg"></td>
								<td background="img/jspgou_08.jpg">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
                                                <td colspan="2" class="td_false" id="msg"></td>
											</tr>
											<tr>
												<td class="td_admin">用户名：</td>
												<td class="td_other">
													<input type="input" id="userName" name="userName" maxlength="20" class="input" value="" />
												</td>
											</tr>
											<tr>
												<td class="td_admin">密码：</td>
												<td class="td_other">
													<input type="password" id="password" name="password" maxlength="20" class="input" value="" />
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<input type="button" value=" 登录 " class="btn" onclick="login()" style="cursor: pointer;" /> &nbsp;&nbsp; 
           										</td>
         										</tr>
       									</tbody>
									</table>
								</td>
        						<td><img src="img/jspgou_09.jpg"></td>
      						</tr>
      						<tr>
						        <td><img src="img/jspgou_10.jpg"></td>
						        <td><img src="img/jspgou_11.jpg"></td>
						        <td><img src="img/jspgou_12.jpg"></td>
						      </tr>
						    </tbody>
						</table>
					</td>
  				</tr>
			</tbody>
		</table>
	</body>
</html>