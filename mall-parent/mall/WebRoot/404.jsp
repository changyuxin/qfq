<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<meta http-equiv="Pragma" CONTENT="no-cache" />
		<meta http-equiv="Cache-Control" CONTENT="no-store, no-cache, must-revalidate" />
		<meta http-equiv="Expires" CONTENT="-1" />
		<meta name="keywords" content="亲分期,大学生,分期,分期购物,分期电商,分期电商平台,分期商城,大学生分期,大学生购物,分期购物平台,大学生分期购物 , 大学生分期付款,大学生分期购物,分期付款,iphone6分期付款,手机分期付款,0元首付,大学生分期消费,大学生商城"></meta>
		<meta name="description" content="亲分期是国内最受大学生喜爱的分期购物平台，认证只需3分钟，正品保证，急速发货，大学生分期购物的天堂，让大学生，凭学生证、身份证即可办理,支持0元首付,轻松还款无压力"></meta>
		<link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/error.css" rel="stylesheet" type="text/css" />
		<title>亲分期 -大学生最喜爱的分期购物商城之一【分期电商平台 - qinfenqi.com】</title>
	</head>
	
	<body style="min-width: 990px;">
		<!-- Save for Web Slices (index.png) -->
		<div class="head">
			<div id="head_hello">
			<div class="hello_left">欢迎来到最值得信赖的分期商城！</div>
				<div class="hello_right">
					请<a href="<%=basePath%>login/login.html"><span>【登陆】</span></a><a href="<%=basePath%>login/regist.html"><span>【免费注册】</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="<%=basePath%>center/home.html"><span>个人中心</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="<%=basePath%>center/order.html"><span>我的订单</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="<%=basePath%>center/bill.html"><span>我要还款</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<!--  
			     		<a href="#"><span>收藏夹</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			     		-->
					<a href="<%=basePath%>help/faq.html"><span>帮助中心</span></a>&nbsp;&nbsp;
				</div>
			</div>
			<div class="head_ul">
		       <div id="logo">
		           <a href="<%=basePath%>" title="返回亲分期首页"><img src="<%=basePath%>mall/images/logo.png" alt="亲分期购物商城"></a>
		       </div>
		       <div id="search">
		            <input type="text" placeholder="请输入关键字进行搜索" id="search_main" >
		            <a href="javascript:searchProduct();"><img src="<%=basePath%>mall/images/search_main.png" style="margin:-10px; padding-left:5px;" alt="搜索"></a>
		            <div> 
			            <a href="javascript:searchProduct('苹果 iPhone6');"><span>苹果 iPhone6</span></a>&nbsp;&nbsp;
			           	<a href="javascript:searchProduct('三星 S6');"><span>三星 S6</span></a>&nbsp;&nbsp;
			           	<a href="javascript:searchProduct('小米 note');"><span>小米 note</span> </a>&nbsp;&nbsp;
			           	<a href="javascript:searchProduct('华为 Mate7');"><span>华为 Mate7</span> </a>&nbsp;&nbsp;
			           	<a href="javascript:searchProduct('vivo X5');"><span>vivo X5</span></a>&nbsp;&nbsp;
			           	<a href="javascript:searchProduct('乐 Max');"><span>乐 Max</span></a>
		           </div>
		       </div>
				<div class="right">
					<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2898146307&site=qq&menu=yes">
						<img src="<%=basePath%>mall/images/zixun.png" class="zixun" alt="在线咨询">
					</a>
					<img src="<%=basePath%>mall/images/number.png" alt="400电话"> 
				</div>
			</div>
		</div>
		<div class="error-page">
		    <div class="error-page-container">
		        <div class="error-page-main">
		            <img src="<%=basePath%>mall/images/error.png" width="137" height="200" class="error-page-img" />
		            <h3>对不起，您请求的页面已经不存在......</h3>
		            <div class="error-page-actions">
		                <div>
		                    <a href="<%=basePath%>" class="error-page-a">点击返回首页</a>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!--底部-->
		<footer>
			<%@include file="jsp/common/foot.jsp"%>
		</footer>
	</body>
</html>