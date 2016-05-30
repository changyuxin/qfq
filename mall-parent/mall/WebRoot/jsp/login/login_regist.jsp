<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
        <%@include file="login_head.jsp"%>
        <script type="text/javascript" src="<%=basePath%>js/jquery.timers-1.2.js" ></script>
		<title>亲分期  - 注册会员</title>
		<script type="text/javascript">
			$(function(){
				getValidateImages();
			});
			function regist(){
				$("#register_btn").removeClass("btn").addClass("btn_gray").attr("disable", "disable");
				$(".errInfo_register").html("");
				if(validate()){
					var userName = $("#userName");
					var password = $("#password");
					
					var mobileCode = $("#mobileCode");
					$.post("<%=basePath%>login/login!checkMobileCode.do", {
						"userQuery.code" : $.trim(mobileCode.val()),
						"userQuery.userName" : $.trim(userName.val()),
						"timestamp" : new Date().getTime()
					}, function(data) {
						if (data.result == "FAILURE") {
							showMsg("#mobileCode", "短信验证码验证不通过!");
							$("#register_btn").removeClass("btn_gray").addClass("btn").removeAttr("disable");
						} else {
							showMsg("#mobileCode", "");
							$("#codeStatus").val("2");
							$.post("<%=basePath%>login/login!userRegist.do", {
								"userQuery.userName" : $.trim(userName.val()),
								"userQuery.password" : $.md5($.trim(password.val())),
								"timestamp" : new Date().getTime()
							}, function(data) {
								if (data.result == "FAILURE") {
									userName.next().html(data.message);
									$("#register_btn").removeClass("btn_gray").addClass("btn").removeAttr("disable");
								} else {
									window.location.href = "<%=basePath%>";
								}
							}, "json");
							
						}
					}, "json");
				}
			}
			
			function validate(){
				
				// 验证用户名
				checkUserName();
				
				// 验证图片验证码
				checkImgCode();
				
				var imageCodeStatus = $.trim($("#imageCodeStatus").val());
				if(imageCodeStatus == 1){
					showMsg("#imageCode", "输入图片验证码验证不通过!");
					return false;
				}
				var registStatus = $.trim($("#registStatus").val());
				
				if(registStatus == 1){
					showMsg("#userName", "手机号码已经注册过，请更换手机号再进行注册!");
					return false;
				}
				var codeStatus = $.trim($("#codeStatus").val());
				if(codeStatus == 1){
					showMsg("#mobileCode", "短信验证码验证不通过!");
					return false;
				}
				
				// 验证短信验证码
				checkSMSCode();
				
				// 验证密码
				checkPassword();
				
				// 验证确认密码
				checkConfirmPass();
				
				return true;
			}
			
			
			//校验手机号是否已经注册
			function checkMobileRegist(){
				var userName = $.trim($("#userName").val());
				if(checkUserName()){
					$.post("<%=basePath%>login/login!checkRegist.do", {
						"userQuery.userName" : userName,
						"timestamp" : new Date().getTime()
					}, function(data) {
						if (data.result == "FAILURE") {
							showMsg("#userName", "手机号码已经注册过，请更换手机号再进行注册!");
						} else {
							showMsg("#userName", "");
							$("#registStatus").val(2);
						}
					}, "json");
				}
			}
			
			//校验验证码是否正确
			function checkMobileCode(){
				var mobileCode = $("#mobileCode");
				var userName = $("#userName");
				if(checkSMSCode()){
					$.post("<%=basePath%>login/login!checkMobileCode.do", {
						"userQuery.code" : $.trim(mobileCode.val()),
						"userQuery.userName" : $.trim(userName.val()),
						"timestamp" : new Date().getTime()
					}, function(data) {
						if (data.result == "FAILURE") {
							showMsg("#mobileCode", "短信验证码验证不通过!");
						} else {
							showMsg("#mobileCode", "");
							$("#codeStatus").val("2");
						}
					}, "json");
				}
			}
			
			function getMobileCode(){
				var userName = $.trim($("#userName").val());
				var registStatus = $.trim($("#registStatus").val());
				showMsg("#mobileCode", "");
				if(userName.length == 0){
					showMsg("#userName", "手机号不能为空!");
					return;
				} else if(registStatus == 1){
					showMsg("#mobileCode", "手机号已经注册，无法获取验证码!");
					return;
				} else {
					// 验证图片验证码
					checkValidateCode();
					// alert($("#imageCodeStatus").val());
					var h = "<a href='javascript: getMobileCode()' style='color:#fff !important'>获取动态验证码</a>";
					if($("#imageCodeStatus").val() == 2){
						//每1秒执行
						var i = 0, s = 60;
						$("body").everyTime("1s", "A",function(){
							if(i == s){
								$("body").stopTime("A");
								$("#getVerify").removeClass("verification_btn_gray").addClass("verification_btn_blue").html(h);
							} else {
								$("#getVerify").removeClass("verification_btn_blue").addClass("verification_btn_gray").html("重新获取验证码(" + (s - i) + ")");
								i++;
							}
						});
						$.post("<%=basePath%>login/login!getMobileCode.do", {
							"userQuery.userName" : userName,
							"timestamp" : new Date().getTime()
						}, function(data) {
							if (data.result == "FAILURE") {
								showMsg("#mobileCode", "短信验证码获取失败!");
								$("body").stopTime("A");
								$("#getVerify").html(h);
							} else {
								showMsg("#mobileCode", "短信验证码已发送，请注意查收!");
								//$("body").stopTime("A");
								//$("#getVerify").html(h);
							}
						}, "json");
					} else {
						return;
					}
				}
			}
			
			function checkUserName(){
				var userName = $.trim($("#userName").val());
				if(userName.length == 0){
					showMsg("#userName", "手机号不能为空!");
					return false;
				}
				if(userName.length > 11 || userName.length < 11){
					showMsg("#userName", "手机号码位数不正确!");
					return false;
				}
				if(isNaN(userName)){
					showMsg("#userName", "手机号码必须为数字!");
					return false;
				}
				if(!userName.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/)){
					showMsg("#userName", "手机号码不合法!");
					return false;
				}
				return true;
			}
			
			function checkPassword(){
				var password = $.trim($("#password").val());
				if(password.length == 0){
					showMsg("#password", "密码不能为空!");
					return false;
				}
				if(password.length < 6){
					showMsg("#password", "密码长度不能小于6位!");
					return false;
				}
				if(isNaN(password) == false){
					showMsg("#password", "密码必须包含字母与数字!");
					return false;
				}
				showMsg("#password", "");
			}
			
			function checkConfirmPass(){
				var password = $.trim($("#password").val());
				var confirmPass = $.trim($("#confirmPass").val());
				if(confirmPass.length == 0){
					showMsg("#confirmPass", "确认密码不能为空!");
					return false;
				}
				if(confirmPass.length < 6){
					showMsg("#confirmPass", "密码长度不能小于6位!");
					return false;
				}
				if(password != confirmPass){
					showMsg("#confirmPass", "两次密码输入不一致!");
					return false;
				}
				showMsg("#confirmPass", "");
			}
			
			function checkImgCode(){
				var validateCode = $.trim($("#validateCode").val());
				if(validateCode.length == 0){
					showMsg("#imageCode", "输入图片验证码不能为空!");
					return;
				}
				if(validateCode.length < 4 || validateCode.length > 4){
					showMsg("#imageCode", "输入图片验证码位数不正确!");
					return false;
				}
				//if(imageCodeStatus == 1){
				//	showMsg("#imageCode", "输入图片验证码验证不通过!");
				//	return false;
				//}
				showMsg("#confirmPass", "");
				return true;
			}
			
			function checkSMSCode(){
				var mobileCode = $.trim($("#mobileCode").val());
				if(mobileCode.length == 0){
					showMsg("#mobileCode", "短信验证码不能为空!");
					return false;
				}
				if(mobileCode.length < 6 || mobileCode.length > 6){
					showMsg("#mobileCode", "短信验证码位数不正确!");
					return false;
				}
				showMsg("#mobileCode", "");
				return true;
			}
			
			function showMsg(id, msg){
				$(id).next(".errInfo_register").html(msg);
			}
			
			//验证输入的图片验证码是否正确
			function checkValidateCode(){
				var validateCode = $.trim($("#validateCode").val());
				if(checkImgCode()){
					$.post("<%=basePath%>login/login!checkValidateCode.do", {
						"validateCode" : validateCode,
						"timestamp" : new Date().getTime()
					}, function(data) {
						if(data.code == "-1"){
							$("#imgCode").find(".errInfo_register").html("输入图片验证码为空!");
							return;
						} else if (data.code == "-2") {
							$("#imgCode").find(".errInfo_register").html("输入验证码输入不正确!");
							return;
						} else {
							showMsg("#imageCode", "");
							$("#imageCodeStatus").val("2");
						}
					}, "json");
				}
			}
		</script>
	</head>
<body>
	<div class="usm-wrap qregister main">
		<%@include file="login_top.jsp"%>
		<div id="tip-float" class="tip-float">已有亲分期帐户？<a href="login/login.html" class="btn-login">直接登录</a></div>
            <div class="content" id="ejs_container">
                <div class="form left">
                    <h3 class="lh-37"><span class="font-bd" >|</span>注册新用户</h3>
                    <div class="dib-wrap lh-37 ">
                        <label class="dib">手机号码：</label>
                        <input name="userName" id="userName" type="text" placeholder="请输入正确的手机号码" class="dib" maxlength="11" onblur="checkMobileRegist()"/>
                        <p class="errInfo_register"></p>
                        <input id="registStatus" name="registStatus" value="1" type="hidden" />
                    </div>
                    <div class="dib-wrap" id="imgCode">
                        <label class="dib">图片验证码：</label>
                        <input class="dib" id="validateCode" name="validateCode" onblur="checkValidateCode()" onfocus="showMsg('#imageCode','')" 
                        	maxlength="4" placeholder="输入图片验证码" style="width:110px;"/>
                        <input id="imageCodeStatus" name="imageCodeStatus" value="1" type="hidden" />
                        <a id="imageCode" href="javascript:;" onclick="getValidateImages()">
                        	<img src="" id="validateImage" alt="验证码" width="100" height="38" style="margin-left:5px;" />
                        </a>
                        <p class="errInfo_register"></p>
                    </div>
                    <div class="dib-wrap">
                        <label class="dib">短信验证码：</label>
                        <input id="mobileCode" name="mobileCode" type="text" placeholder="短信验证码" class="dib lang_yz" 
                        	style="width:110px;" maxlength="12" onblur="checkMobileCode()" />
                        <p class="errInfo_register"></p>
                        <input id="codeStatus" name="codeStatus" value="1" type="hidden" />
                        <div class="verification_btn_blue" id="getVerify">
                        	<a href="javascript: getMobileCode()" style="color:#fff !important">获取动态验证码</a>
                        </div>
                    </div>
                     <div class="dib-wrap">
                        <label class="dib">创建密码：</label>
                        <input name="password" id="password" type="password" placeholder="请输入密码，（6-20）位数字与字母" class="dib" onblur="checkPassword()"/>
                        <p class="errInfo_register"></p>
                    </div>
                    <div class="dib-wrap">
                        <label class="dib">确认密码：</label>
                        <input id="confirmPass" name="confirmPass" type="password" placeholder="请再次输入密码" class="dib" onblur="checkConfirmPass()"/>
                        <p class="errInfo_register"></p>
                    </div>
                    <div class="dib-wrap check-box">
                   		<label class="dib"></label>
                        <input type="checkbox" class="dib" checked="check" id="rememberBtn"/>
                        <label class="dib agreement" style="width:245px;">
                        	已阅读并同意<a class="font-bd" href="help/agreement.html" target="_blank">《亲分期网站注册协议》</a>
                        </label>
                    </div>
                    <div class="dib-wrap">
                        <label class="dib">&nbsp;</label>
                        <input id="register_btn" type="button" class="regiter-btn btn dib"
                        	 value="注&nbsp;&nbsp;&nbsp;&nbsp;册" style="height:40px" onclick="regist()" />
                    </div>
                </div>
            </div>
        <div> 
        	<img class="right-img" src="mall/images/login-bg.png" alt="欢迎注册亲分期购物商城"/> 
        </div>
		<div class="clearfix"></div>
	</div>
	<%@include file="login_foot.jsp"%>
</body>
</html>