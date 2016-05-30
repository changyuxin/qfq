<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link rel="stylesheet" href="<%=basePath%>css/login.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.timers-1.2.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.md5.js" ></script>
	<title>会员登录 - 忘记密码</title>
	<script type="text/javascript">
			
		$(function(){
			getValidateImages();
		});
		
			
		function validate(){
			
			var password = $.trim($("#passWord").val());
			var password2 = $.trim($("#passWord2").val());
			
			if(password.length == 0){
				showMsg("#checkPw", "密码不能为空!");
				return false;
			}
			if(password.length < 6){
				showMsg("#checkPw", "密码长度不能小于6位!");
				return false;
			}
			if(password2.length == 0){
				showMsg("#checkPw2", "重复新密码不能为空!");
				return false;
			}
			if(password2.length < 6){
				showMsg("#checkPw2", "重复新密码长度不能小于6位!");
				return false;
			}
			if(password != password2){
				showMsg("#checkPw2", "两次密码输入不一致!");
				return false;
			}
			
			return true;
		}
		
		function showMsg(id, msg){
			$(id).html(msg);
		}
		
		//验证用户名
		function checkphoneNumber(){
			
			var phoneNumber = $.trim($("#phoneNumber").val());
			if(phoneNumber.length == 0){
				showMsg("#checkphoneNumber", "手机号不能为空!");
				return;
			}
			if(phoneNumber.length > 11 || phoneNumber.length < 11){
				showMsg("#checkphoneNumber", "手机号码位数不正确!");
				return;
			}
			if(isNaN(phoneNumber)){
				showMsg("#checkphoneNumber", "手机号码必须为数字!");
				return;
			}
			if(!phoneNumber.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/)){
				showMsg("#checkphoneNumber", "手机号码不合法!");
				return;
			}
			
			$.post("login/login!checkRegist.do", {
				"userQuery.userName" : phoneNumber,
				"timestamp" : new Date().getTime()
			}, function(data) {
				if (data.result == "FAILURE") {
					showMsg("#checkphoneNumber", "");
				} else {
					showMsg("#checkphoneNumber", "手机号码不是注册号码，请确认后再输入!");
					return;
				}
			}, "json");
			
		}
		
		//验证输入的图片验证码是否正确
		function checkValidateCode(){
			
			var validateCode = $.trim($("#validateCode").val());
			
			$.post("login/login!checkValidateCode.do", {
				"validateCode" : validateCode,
				"timestamp" : new Date().getTime()
			}, function(data) {
				if (data.code == "-1") {
					showMsg("#checkvalidateCode", "验证码不能为空!");
					return;
				} if (data.code == "-2") {
					showMsg("#checkvalidateCode", "验证码输入不正确!");
					return;
				} 
			}, "json");
			
		}
		
		//获取手机验证码
		function getPhoneValidateCode(){
			var phone = $.trim($("#phoneNumber").val());
			var validateCode = $.trim($("#validateCode").val());
			
			if(validateCode.length == 0){
				showMsg("#checkvalidateCode","请输入验证码");
				return;
			}
			
			$.post("center/center!getPhoneValidateCode.do", {
				"memberQuery.phone" : phone,
				"validateCode" : validateCode,
				"timestamp" : new Date().getTime()
			}, function(data) {
				if(data.codeError == 0){
					showMsg("#checkvalidateCode", "");
					//每1秒执行
					var i = 0, s = 60;
					$("body").everyTime("1s", "A",function(){
						if(i == s){
							$("body").stopTime("A");
							$("#getverify").show();
							$("#resendcode").hide();
						} else {
							$("#getverify").hide();
							$("#resendcode").show();
							$("#second_show").html(s - i);
							i++;
						}
					});
					if (data.result == "FAILURE") {
						showMsg("#phoneValidateCode", "短信验证码获取失败!");
					} else {
						showMsg("#phoneValidateCode", "短信验证码已发送，请注意查收!");
					}
				} else {
					showMsg("#checkvalidateCode", "验证码输入错误!");
				} 
			}, "json");
			
		}
		
		function nextStep(id){
			
			if(id == 2){
				var phone = $.trim($("#phoneNumber").val());
				var phoneValidateCode = $.trim($("#phoneValidateCode").val());
				
				if(phoneValidateCode.length == 0){
					showMsg("#checkphoneValidateCode","请输入手机验证码");
					return;
				}
				
				$.post("login/login!checkMobileCode.do", {
					"userQuery.code" : phoneValidateCode,
					"userQuery.userName" : phone,
					"timestamp" : new Date().getTime()
				}, function(data) {
					if (data.result == "FAILURE") {
						showMsg("#checkphoneValidateCode", "短信验证码验证不通过!");
						return;
					} else {
						$("#findPwd").load("login/login!modifyPwdJsp.do?userQuery.userName=" + phone);
					}
				}, "json");
			} else if(id == 3){
				
				var password = $.trim($("#passWord").val());
				var password2 = $.trim($("#passWord2").val());
				var userName = $.trim($("#userName").val());
				if(validate()){
					$.ajax( {
						type : "POST",
						data : {"password" : $.md5(password), "password2" : $.md5(password2), "userQuery.userName" : userName},
						url : "login/login!updatePwd.do",
						dataType: "json",
						error: function(request) {
							layer.alert("密码修改失败!");
				        },
						success : function(data) {
				           	if (data == 0) {
				           		layer.alert("密码修改成功!");
				           		$("#passWord").val("");
								$("#passWord2").val("");
								$("#findPwd").load("login/login!findpwdfinish.do");
				           	} else if(data == -2){
				           		layer.alert("该用户已经不存在!");
				           	} else {
				           		layer.alert("密码修改失败!");
				           	} 
						}
					});
				}
			}
		}
	</script>
</head>
<body>
	<!-- Save for Web Slices (index.png) -->
	<div class="head">
		<%@include file="../common/top.jsp"%>
	</div>
	<div class="main_box">
		<h3>找回密码：</h3>
		<div id="findPwd" class="modify-wrap step-1">
			<div class="modify-left">
				<ul>
                   	<li class="mdf-now">
                   		<i id="shenfen" class="i_1_on"></i>
                   		<span>验证身份</span>
                   	</li>
                   	<li class="vertical-line "></li>
                   	<li class="">
                   		<i id="mima" class="i_2_off"></i>
                   		<span>设置新密码</span>
                   	</li>
                   	<li class="vertical-line"></li>
                   	<li class="">
	                   	<i id="finish" class="i_3_off"></i>
	                   	<span>完成</span>
                   	</li>
               	</ul>
			</div>
			<div class="modify-right">
                <div class="modify-item">
					<label for="userName" id="label-one">用户名：</label>
					<input type="text" id="phoneNumber" onblur="checkphoneNumber()" onfocus="showMsg('#checkphoneNumber','')"/>
                    <p class="prompt-step-1">
                    	<span id="checkphoneNumber" style="color: red;"></span>
                    </p>
                    <label for="userName" id="label-two">验证码：</label>
                    <input type="text" id="validateCode" class="validate-Code" name="validateCode" onblur="checkValidateCode()" onfocus="showMsg('#checkvalidateCode','')" /> 
					<img src="" alt="请把看到的数字字母组合输入左边的验证码框内 "  id="validateImage" class="left" />
                	<a href="javascript:;" onclick="getValidateImages()" class="loading">刷新</a>
                    <p class="prompt-step-1"><span id="checkvalidateCode"></span></p>
                    <p class="step-1">
                    	<a class="get-verify" href="javascript:;" id="getverify" onclick="getPhoneValidateCode()">
							获 取  验 证 码
						</a>
						<a class="resend" href="javascript:;" id="resendcode" style="display: none;">
							<var id="second_show">60</var>秒后重新发送
						</a> 
						<span id="promptSuccess"></span>
                    </p>
                </div>    
				<div class="modify-item">
					<label for="phone" id="">输入验证码：</label>
					<input type="text" id="phoneValidateCode" onfocus="showMsg('#checkphoneValidateCode','')" />
					<p class="verify-step-1"><span id="checkphoneValidateCode"></span></p>
					<p><a id="step1" class="next-step" href="javascript:;" onclick="nextStep('2')">下 一 步</a></p>
				</div>
			</div>
		</div>
	</div>	
	<%@include file="../common/foot.jsp"%>
</body>
</html>