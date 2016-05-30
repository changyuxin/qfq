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
	
	function checkEmail(){
		var email = $("#email").val();
		var pos1 = email.indexOf("@");
        var pos2 = email.lastIndexOf("@");
        if (email.indexOf('@') == -1 || email.indexOf('.') == -1 || 
        		email.indexOf(' ') != -1 || pos1!=pos2)
        {
            showMsg("#checkemail","请输入合法的电子邮件地址");
            return false;
        }
        
        return true;
	}
	
	function emailAuth(){
		if(checkEmail()){
			//验证码不能为空
			var validateCode = $.trim($("#validateCode").val());
			if(validateCode.length == 0){
				showMsg("#checkvalidateCode","请输入验证码");
				return;
			}
			
			//每1秒执行
			var i = 0, s = 60;
			$("body").everyTime("1s", "A",function(){
				if(i == s){
					$("body").stopTime("A");
					$("#sendEmail").show();
					$("#resendcode").hide();
				} else {
					$("#sendEmail").hide();
					$("#resendcode").show();
					$("#second_show").html(s - i);
					i++;
				}
			});
			
			$.ajax({
				url:"<%=basePath%>center/center!sendValidateMail.do?rand="+new Date().getTime(), 
				type:"post", 
				data:$("#validateMailForm").serialize(),
				dataType:"json",
				success:function(data){
					if(data.code == 0){
						showMsg("#successSendEmail","邮箱绑定链接已发送至邮箱，请注意查收!");
						return;
	   					//window.location.href = "<%=basePath%>center/center!bindMailManageJsp.do";
					} else if(data.code == 1){
						showMsg("#checkvalidateCode","验证码错误");
						$("body").stopTime("A");
						$("#sendEmail").show();
						$("#resendcode").hide();
						return;
					} else if(data.code == 2){
						showMsg("#successSendEmail","用户不存在,发送失败");
						$("body").stopTime("A");
						$("#sendEmail").show();
						$("#resendcode").hide();
						return;
					}
				},
				complete : function(){}, 
				beforeSend : function(xhr){}, 
				error : function(){
					showMsg("#successSendEmail","服务器没有返回数据，可能服务器忙，请重试");
					$("body").stopTime("A");
					$("#sendEmail").show();
					$("#resendcode").hide();
				}
			});
		}
	}
	
	function showMsg(id, msg){
		$(id).html(msg);
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
					<h2>邮箱认证</h2>
				</div>
				<form action="#" method="post" name="validateMailForm" id="validateMailForm">
					<input type="hidden" id="_csrf" name="_csrf" value="" />
					<div class="auth-box">
						<div class="auth-item">
							<label>请输入邮箱：</label>
							<input type="text" onblur="checkEmail()" id="email" name="memberQuery.email" onfocus="showMsg('#checkemail','')" />
						</div>
						<div class="auth-item">
							<label>&nbsp;</label><span id="checkemail">&nbsp;</span>
						</div>
						<div class="auth-item">
							<label>请输入验证码：</label> 
							<input type="text" id="validateCode" class="validate-Code" name="validateCode" onfocus="showMsg('#checkvalidateCode','')" /> 
							<img src="" alt="请把看到的数字字母组合输入左边的验证码框内 "  id="validateImage" class="left"/>
		                	<a href="javascript:void(0);" onclick="getValidateImages()" class="left changePic">看不清？换一张。</a>
						</div>
						<div class="auth-item ">
							<label>&nbsp;</label> <span id="checkvalidateCode"></span>
						</div>
						<div class="auth-item">
							<label>&nbsp;</label>
							<input id="sendEmail" type="button" value="发送验证邮箱" onclick="emailAuth()" /> 
							<a class="resend btn" href="javascript:void(0)" id="resendcode">
								<var id="second_show">60</var>秒后可再次发送</a> 
							<span id="successSendEmail"></span>
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