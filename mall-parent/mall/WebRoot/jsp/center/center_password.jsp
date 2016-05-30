<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.md5.js" ></script>
	<title>亲分期  - 商品订单</title>
	<script type="text/javascript">
		function updatePass(){
			
			var oldPassword = $.trim($("#oldPassword").val());
			var passWord = $.trim($("#passWord").val());
			var confirmPass = $.trim($("#confirmPass").val());
			
			if(oldPassword.length == 0){
				showMsg("#checkoldPassword","请输入旧密码！");
				return;
			}
			
			if(passWord.length == 0){
				showMsg("#checkpassWord","请输入新密码！");
				return;
			}
			
			if(passWord.length < 6){
				showMsg("#checkpassWord","新密码长度不能小于六位！");
			    return;
			}
			
			if(confirmPass.length == 0){
				showMsg("#checkconfirmPass","请输入确认密码！");
				return;
			}
			
			if(passWord != confirmPass){
				showMsg("#checkconfirmPass","新密码与确认密码不一致！");
			    return;
			}
			
			//$("#oldPassword").val($.md5(oldPassword));
			//$("#passWord").val($.md5(passWord));
			//$("#confirmPass").val($.md5(confirmPass));
			
			$.ajax( {
				type : "POST",
				data : {"oldPassword" : $.md5(oldPassword), "passWord" : $.md5(passWord)},
				url : "<%=basePath%>center/center!updatePass.do",
				dataType: "json",
				error: function(request) {
	                alert("密码修改失败!");
		        },
				success : function(data) {
		           	if (data == 0) {
		           		layer.alert("密码修改成功!");
		           		$("#oldPassword").val("");
						$("#passWord").val("");
						$("#confirmPass").val("");
		           	} else if(data == -1){
		           		showMsg("#checkoldPassword","旧密码输入不正确!");
		           	} else if(data == -2){
		           		alert("该用户已经不存在!");
		           	} else if(data == -3){
		           		alert("密码修改失败!");
		           	} 
				}
			});
		}
		
		/** Enter键提交 */
		$(document).keyup(function(event){
			var currKey = 0, e = e || event;
			if (e.keyCode == 13) {
				updatePass();
			}
		});
		
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
            	<h2>修改密码</h2>
            </div>
            <div class="user-right-content">
				<form action="" id="updatePassForm" method="post" name="updatePassForm">
				    <div class="form-list">
						<label class="">旧密码</label>
						<input type="password" class="" value="" id="oldPassword" name="oldPassword" onfocus="showMsg('#checkoldPassword','')" maxlength="20"/>
						<strong id="checkoldPassword" class="check-text"></strong>
					</div>
					<div class="form-list">
						<label class="col-sm-4 control-label">新密码</label>
						<input type="password" class="form-control" value="" id="passWord" name="passWord" onfocus="showMsg('#checkpassWord','')" maxlength="20"/>
						<strong id="checkpassWord" class="check-text"></strong>
			        </div>
			        <div class="form-list">
				    	<label class="col-sm-4 control-label">确认密码</label>
				    	<input type="password" class="form-control" value="" id="confirmPass" name="confirmPass" onfocus="showMsg('#checkconfirmPass','')" maxlength="20"/>
						<strong id="checkconfirmPass" class="check-text"></strong>
					</div>
					<div class="form-button">
						<label class=""></label>
						<button type="button" id="updatePassWordButton" class="fc-button" onclick="updatePass()">修改</button>
					</div>
				</form>
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