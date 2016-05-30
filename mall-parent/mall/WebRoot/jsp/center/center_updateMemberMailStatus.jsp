<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>我的亲分期 - 账号设置- 邮箱认证</title>
</head>
<body>
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
				<!--认证成功&失败-->
				<s:if test="status == 0">
				<div class="identification_all">
					<img src="mall/images/success.png" /> <p>邮箱认证成功</p>
					<div class="identification_div ">
						<a class="common-btn-blue" href="center/center!account.do">返&nbsp;回</a>
					</div>
				</div>	
				</s:if>
				<s:elseif test="status == -1">
	            <div class="identification_all">
					<img src="mall/images/fail.png" /><p>邮箱认证失败</p>
					<div class="identification_div ">
						<a class="common-btn-blue" href="center/center!account.do">返&nbsp;回</a>
					</div>
				</div>   
				</s:elseif> 
				<s:elseif test="status == 1">
				 <div class="identification_all">
					<img src="mall/images/repeat.png"/> <p>此邮箱已经认证过！</p>
					<div class="identification_div ">
						<a class="common-btn-blue" href="center/center!account.do">返&nbsp;回</a>
					</div>
				</div>
				</s:elseif>
			</div>
		</div>        
	</div>
	<!--底部-->
	<footer>
		<%@include file="../common/foot.jsp"%>
	</footer>
</body>
</html>