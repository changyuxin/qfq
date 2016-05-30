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
		
		var phone = $.trim($("#phone").val());
		var validateCode = $.trim($("#validateCode").val());
		if(validateCode.length == 0){
			showMsg("#checkvalidateCode","请输入验证码");
			return;
		}
		
		$.post("<%=basePath%>center/center!getPhoneValidateCode.do", {
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
					showMsg("#checkphoneValidateCode", "手机验证码获取失败!");
				} else {
					showMsg("#checkphoneValidateCode", "手机验证码已发送，请注意查收!");
				}
			} else {
				showMsg("#checkvalidateCode", "验证码输入错误!");
			} 
		}, "json");
		
	}
	
	function showMsg(id, msg){
		$(id).html(msg);
	}
	
	function checkValidateCode(value){
		
		var validateCode = $.trim(value);
		if(validateCode.length == 0){
			showMsg("#checkvalidateCode","请输入验证码");
			return;
		}
		
		$.post("<%=basePath%>center/center!checkValidateCode.do", {
			"validateCode" : validateCode,
			"timestamp" : new Date().getTime()
		}, function(data) {
			if(data.codeError == 0){
				showMsg("#checkvalidateCode", "");
			} else {
				showMsg("#checkvalidateCode", "验证码输入错误!");
			} 
		}, "json");
	}
	
	//校验验证码是否正确
	function nextStep(id){
		if(id == 2){
			checkMobileCode(id);
		} else if(id == 3){
			
			var phone = $.trim($("#phone").val());
			var phoneValidateCode = $.trim($("#phoneValidateCode").val());
			var checkphoneNumber = $.trim($("#checkphoneNumber").val());
			var checkvalidateCode = $.trim($("#checkvalidateCode").val());
			var phoneValidateCode = $.trim($("#phoneValidateCode").val());
			if(checkphoneNumber.length == 0 || checkvalidateCode.length == 0 || phoneValidateCode.length == 0){
				$.ajax( {
					type : "POST",
					data : {"phone" : phone, "phoneValidateCode" : phoneValidateCode},
					url : "center/center!setNewPhoneByUserId.do",
					dataType: "json",
					error: function(request) {
						layer.alert("设置新的手机号码失败!");
			        },
					success : function(data) {
						switch(data){
							case 0  : $("#modifyPhone").load("center/center!setNewPhonefinishJsp.do?status=" + data); break;
							case -1 : layer.alert("新手机号不能为空"); break;
							case -2 : layer.alert("新手机号位数不正确"); break;
							case -3 : layer.alert("新手机号必须为数字"); break;
							case -4 : layer.alert("新手机号不合法"); break;
							case -5 : layer.alert("新手机号已注册过"); break;
							case -6 : layer.alert("手机验证码验证不通过"); break;
							case -7 : layer.alert("设置新的手机号码失败"); break;
							default: break;
						}
					}
				});
			}
			
		}
	}
	
	function checkMobileCode(id){
		var phone = $.trim($("#phone").val());
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
				showMsg("#checkphoneValidateCode", "手机验证码验证不通过!");
			} else {
				if(id==2){
					$("body").stopTime("A");
					$("#getverify").show();
					$("#resendcode").hide();
					$("#modifyPhone").load("center/center!getNewPhoneSettingJsp.do");
				}
			}
		}, "json");
	}
	
	//验证用户名
	function checkphoneNumber(){
		
		var phoneNumber = $.trim($("#phone").val());
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
			"user.userName" : phoneNumber,
			"timestamp" : new Date().getTime()
		}, function(data) {
			if (data.result == "FAILURE") {
				showMsg("#checkphoneNumber", "手机号码已注册过!");
				return;
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
			<div id="modifyPhone" class="user-right mu-ctxt">
				<div class="user-right-head">
					<h2>手机认证</h2>
				</div>
				<div class="progress saftyProgress ">
				    <ul class="bg">
				    	<li class="active"><span>1</span><s>验证身份</s></li>
				        <li><span>2</span><s>设置新的手机号码</s></li>
				        <li><span>3</span><s>完成</s></li>
				    </ul>
				</div>
				<form action="#" method="post" name="form" id="loginForm">
					<input type="hidden" id="_csrf" name="_csrf" value="f1f719d4-383d-47bf-ac65-2e618a3a9319" />
					<div class="auth-box">
						<div class="auth-item">
							<label>当前绑定手机号：</label> ${memberQuery.phone}
                            <input id="phone" name="member.phone" value="${memberQuery.phone}" type="hidden" />
						</div>
						<div class="auth-item ">
							<label>&nbsp;</label> <span id="checkphoneNumber" class="font-red"></span>
						</div>
						<div class="auth-item">
							<label>请输入验证码：</label> 
							<input type="text" id="validateCode" class="validate-Code" onblur="checkValidateCode(this.value)" name="validateCode" onfocus="showMsg('#checkvalidateCode','')" /> 
							<img src="" alt="请把看到的数字字母组合输入左边的验证码框内 "  id="validateImage" class="left" />&nbsp;
		                	<a href="javascript:;" onclick="getValidateImages()" class="common-btn-blue">看不清？换一张</a>
						</div>
						<div class="auth-item ">
							<label>&nbsp;</label> <span id="checkvalidateCode" class="font-red"></span>
						</div>
						<div class="auth-item mb">
							<label>&nbsp;</label> 
							<a class="common-btn-blue" href="javascript:;" id="getverify" onclick="getPhoneValidateCode()">
								获取手机验证码
							</a>
							<a class="resend btn" href="javascript:;" id="resendcode" style="display: none;">
								<var id="second_show">60</var>秒后可再次获取
							</a> 
							<span id="promptSuccess"></span>
						</div>
						<div class="auth-item">
							<label>请输入手机验证码：</label>
							<input type="text" id="phoneValidateCode" onfocus="showMsg('#checkphoneValidateCode','')" />
						</div>
						<div class="auth-item ">
							<label>&nbsp;</label><span id="checkphoneValidateCode" class="font-red"></span>
						</div>
						<div class="auth-item">
							<label>&nbsp;</label><a href="javascript:;" onclick="nextStep('2')" class="common-btn-blue">确定</a>
						</div>
					</div>
				</form>
			</div>
		</div>        
	</div>
	<!--底部-->
	<footer>
		<%@include file="../common/foot.jsp"%>
	</footer>
</body>
</html>