<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.timers-1.2.js" ></script>
	<title>我的亲分期 - 账号设置- 手机认证</title>
	<script type="text/javascript">
		$(function(){
			getValidateImages();
		});
		
		function getPhoneValidateCode(){
			
			var phone = $.trim($("#phone").val())
			var validateCode = $.trim($("#validateCode").val());
			if(validateCode.length == 0){
				showMsg("#checkvalidateCode","请输入验证码");
				return;
			}
			
			$.post("<%=basePath%>center/center!getPhoneValidateCode.do", {
				"member.phone" : phone,
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
						showMsg("#phoneValidateCode", "手机验证码获取失败!");
					} else {
						showMsg("#phoneValidateCode", "手机验证码已发送，请注意查收!");
					}
				} else {
					showMsg("#checkvalidateCode", "验证码输入错误!");
				} 
			}, "json");
			
		}
		
		function showMsg(id, msg){
			$(id).html(msg);
		}
		
		//校验验证码是否正确
		function nextStep(){
			var phone = $.trim($("#phone").val())
			var phoneValidateCode = $.trim($("#phoneValidateCode").val());
			
			if(phoneValidateCode.length == 0){
				showMsg("#checkphoneValidateCode","请输入手机验证码");
				return;
			}
			
			$.post("<%=basePath%>login/login!checkMobileCode.do", {
				"user.code" : phoneValidateCode,
				"user.userName" : phone,
				"timestamp" : new Date().getTime()
			}, function(data) {
				if (data.result == "FAILURE") {
					showMsg("#checkphoneValidateCode", "手机验证码验证不通过!");
				} else {
					showMsg("#checkphoneValidateCode", "手机验证码验证通过");
				}
			}, "json");
		}
	</script>
</head>
<body>
	<!-- Save for Web Slices (index.png) -->
	<div class="head">
		<%@include file="../common/top.jsp"%>
	</div>
	<div class="mid">
    	<div class="main-wrap">
    		<%@include file="center_leftnav.jsp"%>
    		<!--右侧-->
			<div class="user-right mu-ctxt">
				<div class="user-right-head">
					<h2>找回交易密码</h2>
				</div>
				<div class="progress saftyProgress ">
					<ul class="bg">
						<li class="active"><span>1</span><s>验证身份</s></li>
						<li><span>2</span><s>设置新交易密码</s></li>
						<li><span>3</span><s>完成</s></li>
					</ul>
				</div>
				<input type="hidden" id="_csrf" name="_csrf" value="">
				<div class="auth-box">
					<div class="auth-item">
						<label>您绑定的手机号：</label>${member.phone}
                        <input type="hidden" id="phone" value="${member.phone}">
					</div>
					<div class="auth-item">
						<label>&nbsp;</label><span id="checkPw">&nbsp;</span>
					</div>
					<div class="auth-item">
						<label>请输入验证码：</label> 
						<input type="text" id="validateCode" class="validate-Code" name="validateCode" onfocus="showMsg('#checkvalidateCode','')"> 
						<img src="" alt="请把看到的数字字母组合输入左边的验证码框内 "  id="validateImage" class="left"/>
	                	<a href="javascript:void(0);" onclick="getValidateImages()" class="left changePic">看不清？换一张。</a>
					</div>
					<div class="auth-item ">
						<label>&nbsp;</label> <span id="checkvalidateCode"></span>
					</div>
					<div class="auth-item mb">
						<label>&nbsp;</label> 
						<a class="get-verify btn" href="javascript:void(0)" id="getverify" onclick="getPhoneValidateCode()">
							获取手机验证码
						</a>
						<a class="resend btn" href="javascript:void(0)" id="resendcode" style="display: none;">
							<var id="second_show">60</var>秒后可再次获取
						</a> 
						<span id="promptSuccess"></span>
					</div>
					<div class="auth-item">
						<label>请输入手机验证码：</label>
						<input type="text" id="phoneValidateCode" onfocus="showMsg('#checkphoneValidateCode','')">
					</div>
					<div class="auth-item ">
						<label>&nbsp;</label> <span id="checkphoneValidateCode"></span>
					</div>
					<div class="auth-item">
						<label>&nbsp;</label><input type="button" value="下一步" onclick="nextStep()">
					</div>
				</div>
			</div>
		</div>        
	</div>
	<!--底部-->
	<footer>
		<%@include file="../common/foot.jsp"%>
	</footer>
</body>
</html>