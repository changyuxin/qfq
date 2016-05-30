<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<base href="<%=basePath%>">
<basePath value="<%=basePath%>" id="basePath"></basePath>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<meta http-equiv="Pragma" CONTENT="no-cache" />
<meta http-equiv="Cache-Control" CONTENT="no-store, no-cache, must-revalidate" />
<meta http-equiv="Expires" CONTENT="-1" />
<meta name="keywords" content="亲分期,大学生,分期,分期购物,分期电商,分期电商平台,分期商城,大学生分期,大学生购物,分期购物平台,大学生分期购物 , 大学生分期付款,大学生分期购物,分期付款,iphone6分期付款,手机分期付款,0元首付,大学生分期消费,大学生商城"></meta>
<meta name="description" content="亲分期是国内最受大学生喜爱的分期购物平台，认证只需3分钟，正品保证，急速发货，大学生分期购物的天堂，让大学生，凭学生证、身份证即可办理,支持0元首付,轻松还款无压力"></meta>
<link rel="stylesheet" href="<%=basePath%>css/login.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.md5.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/layer/layer.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.timers-1.2.js" ></script>
<script type="text/javascript">
	function tbr(){
		alert("此功能稍后开放，请耐心等待!");
	}
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
	  	hm.src = "//hm.baidu.com/hm.js?07842ff80b1064b1bf514b66f03ecbf2";
	  	var s = document.getElementsByTagName("script")[0]; 
	  	s.parentNode.insertBefore(hm, s);
	})();
	
	// 验证码
	function getValidateImages(){
		document.getElementById("validateImage").src="center/center!getValidateCode.do?rand=" + new Date().getTime();
	}
</script>
