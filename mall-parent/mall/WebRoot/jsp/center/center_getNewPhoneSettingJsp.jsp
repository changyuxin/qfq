<%@ page language="java" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function(){
		getValidateImages();
	});
	
</script>

<div class="user-right-head">
	<h2>手机认证</h2>
</div>
<div class="progress saftyProgress ">
    <ul class="bg">
    	<li><span>1</span><s>验证身份</s></li>
        <li class="active"><span>2</span><s>设置新的手机号码</s></li>
        <li><span>3</span><s>完成</s></li>
    </ul>
</div>
<form action="#" method="post" name="form" id="loginForm">
	<div class="auth-box">
		<div class="auth-item">
			<label>输入新手机号：</label> 
			<input type="text" id="phone" onfocus="showMsg('#checkphoneNumber','')" onblur="checkphoneNumber()">
		</div>
		<div class="auth-item ">
			<label>&nbsp;</label> 
			<span id="checkphoneNumber"></span>
		</div>
		<div class="auth-item">
			<label>请输入验证码：</label> 
			<input type="text" id="validateCode" class="validate-Code" name="validateCode" onblur="checkValidateCode(this.value)" onfocus="showMsg('#checkvalidateCode','')" /> 
			<img src="" alt="请把看到的数字字母组合输入左边的验证码框内 "  id="validateImage"/>
            <a href="javascript:void(0);" onclick="getValidateImages()" class="left changePic">看不清？换一张。</a>
		</div>
		<div class="auth-item ">
			<label>&nbsp;</label> 
			<span id="checkvalidateCode"></span>
		</div>
		<div class="auth-item mb">
			<label>&nbsp;</label> 
			<a class="get-verify btn" href="javascript:void(0)" id="getverify" onclick="getPhoneValidateCode()">获取手机验证码</a>
			<a class="resend btn" href="javascript:void(0)" id="resendcode">
			<var id="second_show">60</var>秒后可再次获取</a> 
			<span id="promptSuccess"></span>
		</div>
		<div class="auth-item">
			<label>请输入手机验证码：</label>
			<input type="text" id="phoneValidateCode" onfocus="showMsg('#checkphoneValidateCode', '')">
		</div>
		<div class="auth-item ">
			<label>&nbsp;</label> 
			<span id="checkphoneValidateCode"></span>
		</div>
		<div class="auth-item">
			<label>&nbsp;</label>
			<input type="button" value="确 定" onclick="nextStep('3')">
		</div>
	</div>
</form>
