<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 商品订单</title>
	<meta name="keywords" content="亲分期,大学生,分期,分期购物,分期电商,分期电商平台,分期商城,大学生分期,大学生购物,分期购物平台,大学生分期购物 , 大学生分期付款,大学生分期购物,分期付款,iphone6分期付款,手机分期付款,0元首付,大学生分期消费,大学生商城"></meta>
	<meta name="description" content="亲分期是国内最受大学生喜爱的分期购物平台，认证只需3分钟，正品保证，急速发货，大学生分期购物的天堂，让大学生，凭学生证、身份证即可办理,支持0元首付,轻松还款无压力"></meta>
	<script type="text/javascript">
	
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
				<h2>账户设置</h2>
			</div>
			<div class="safety-list">
				<span class="phone">手机账号:</span>
				<span class="passAuth">
				<s:if test=" memberQuery == null || collarQuery == null">
					（未认证）
				</s:if>
				<s:else>（${memberQuery.phone}${collarQuery.phone} 已认证）</s:else>
				</span>
				<!--  
				<a href="center/modifyPhone.html">[修改]</a>
				-->
				<span class="nocert">
				<s:if test=" memberQuery != null">
					认证已通过
				</s:if>
				</span>
			</div>
			<s:if test="getUserStyle == 1">
				<div class="safety-list">
					<span class="phone">
					<s:if test=" memberQuery == null || memberQuery.isEmailOauth == 1">
						<a href="center/bindMail.html">绑定邮箱</a>
					</s:if>
					<s:else>（${memberQuery.email} 已认证）</s:else>
					</span>
				</div>
			</s:if>
			<!--  
			<div class="safety-list">
				<span class="phone">交易密码</span><a href="<%=basePath%>center/center!findPwd.do">找回</a>
			</div>
			-->
		</div>
    </div>
</div>

<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>