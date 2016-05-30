<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="../common/head.jsp"%>
		<link href="<%=basePath%>css/pay.css" type="text/css" rel="stylesheet" />
		<title>亲分期 - 微信支付</title>
		<style type="text/css">
			.loading-main {margin:0 auto;height:540px;width:1200px;overflow:hidden;}
			.loading-page-main{position:relative;background:#f9f9f9;margin:0 auto;width:700px;padding:50px 50px 70px;margin-top:100px;border:1px solid #999;}
			.loading-page-main:before{content:'';display:block;background:url(img/errorPageBorder.png?1427783409637);height:7px;position:absolute;top:-7px;width:100%;left:0}
			.loading-page-actions{font-size:0;z-index:100}
			.loading-page-actions div{font-size:14px;padding:30px 0 0 10px;-ms-box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;color:#838383}
			.loading-page-actions:before{content:'';display:block;position:absolute;z-index:-1;bottom:17px;left:50px;width:200px;height:10px;-moz-box-shadow:4px 5px 31px 11px #999;-webkit-box-shadow:4px 5px 31px 11px #999;box-shadow:4px 5px 31px 11px #999;-moz-transform:rotate(-4deg);-webkit-transform:rotate(-4deg);-ms-transform:rotate(-4deg);-o-transform:rotate(-4deg);transform:rotate(-4deg)}
			.loading-page-actions:after{content:'';display:block;position:absolute;z-index:-1;bottom:17px;right:50px;width:200px;height:10px;-moz-box-shadow:4px 5px 31px 11px #999;-webkit-box-shadow:4px 5px 31px 11px #999;box-shadow:4px 5px 31px 11px #999;-moz-transform:rotate(4deg);-webkit-transform:rotate(4deg);-ms-transform:rotate(4deg);-o-transform:rotate(4deg);transform:rotate(4deg)}
			.loading-center {text-align:center;}
			.loading-p-1 {text-align:center;margin-top:20px; font-size:18px;color:#ff3100}
			.loading-p-2 {text-align:center;margin-top:20px;}
			.loading-a {color:#2872db !important; font-size:13px !important;}
		</style>
	</head>
	<body>
		<!-- Save for Web Slices (index.png) -->
		<div class="head">
			<%@include file="../common/top.jsp"%>
		</div>
		<div class="loading-main">
            <div class="loading-page-main">
                <div class="loading-page-actions">
                	<div class="loading-center">
                		<img src="../mall/images/loading_main.gif" />
                	</div>
    				<p class="loading-p-1">正在为您跳转到支付页面......</p>
    				<p class="loading-p-2">如长时间没有反应 <a href="center/bill.html" class="loading-a">返回重试</a></p>
                </div>
            </div>
        </div>
		<!--底部-->
		<footer> 
			<%@include file="../common/foot.jsp"%>
		</footer>
		${rtnCnt }
	</body>
</html>