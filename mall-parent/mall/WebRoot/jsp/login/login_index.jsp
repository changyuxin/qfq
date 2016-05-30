<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<%@include file="login_head.jsp"%>
		<title>亲分期 - 会员登录</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#userName").focus();
			});
			
			/** 登录验证 */
			function validLogin() {
				var userName = $.trim($("#userName").val());
				var password = $.trim($("#password").val());
				if(userName.length == 0){
					$("#errInfo").html("手机号不能为空!");
					userName.focus();
					return false;
				}
				if(password.length == 0){
					$("#errInfo").html("密码不能为空!");
					password.focus();
					return false;
				}
				return true;
			}
			
			function login(){
				$("#errInfo").html("");
				if(validLogin()){
					$.post("<%=basePath%>login/login!userLogin.do", {
						"userQuery.userName" : $.trim($("#userName").val()),
						"userQuery.password" : $.md5($.trim($("#password").val()))
					}, function(data) {
						if (data.result == "FAILURE") {
							$("#errInfo").html(data.message).show(); 
						} else {
							window.location.href = "<%=basePath%>";	
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
	<div class="usm-wrap qlogin main">
		<%@include file="login_top.jsp"%>
 			<div class="login-content" id="ejs_container">
				<div class="pic left qlogin-other">
					<img alt="欢迎登录亲分期" src="mall/images/login-bg.png" style="margin-top:-20px;" />
				</div>
				<div class="form left">
					<h3>账户登录</h3>
					<div class="form-list dib-wrap ">
						<label for="" class="dib listdib"></label>
						<img src="mall/images/name.png" class="login-img" alt="手机号"/>
						<input id="userName" name="userName" type="text" placeholder="输入手机号" class="dib" />
					</div>
					<div class="form-list dib-wrap ">
						<label for="" class="dib listdib"></label>
						<img src="mall/images/pwd.png" class="login-img" alt="密码"/>
						<input id="password" name="password" type="password" placeholder="输入密码" class="dib" />
					</div>
					<p class="errInfo" id="errInfo"></p>
					<div class="dib-wrap lh-37 login_remb">
						<input type="checkbox" class="dib" id="rememberBtn" style="margin-left: 0px;"/>
						<label for="rememberBtn" class="dib">记住我</label>
						<a href="login/findpwd.html" class="right dib">忘记密码？</a>
					</div>
					<div class="dib-wrap">
						<button id="login_btn" class="login-btn btn dib" onclick="login();">
							登&nbsp;&nbsp;&nbsp;&nbsp;录
						</button>
					</div>
					<div class="dib-wrap lh-37">
						<span class="font-bl">
							<a class="dib" href="login/regist.html">还没有账号？<span class="font-bd">立即注册</span></a>
						</span>
					</div>
				</div>
			</div>
		<div class="clearfix"></div>
	</div>
	<%@include file="login_foot.jsp"%>
	
	
</body>
</html>