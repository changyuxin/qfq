<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 关于我们</title>
</head>
<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
<!--焦点轮转-->
<div class="mid">
<div class="main_box">
		<div class="grzx">
			<%@include file="help_left.jsp"%>
			<div class="grzx_right">
				<h3>关于我们</h3>
				<div class="mydd ">
					<p>&nbsp;</p>
					<p>亲分期（qinfenqi.com）是亲分期（北京）科技有限公司旗下网站，总部位于北京，是国内首家线下线上（o2o）城市精英人群（大学生、白领、都市蓝领）分期购物服务商城，致力于打造一个安全、方便、高效、快捷的信用消费服务平台，旨在通过高品质的会员服务，为城市精英人群提供一个轻松、舒适、人性化的分期购物体验，以“快乐生活，信用消费”的服务理念，让广大城市精英人群都能“信用”消费，亲身畅享各自的快乐生活和精彩人生。逐步构建成为一个全国性最权威的“信用等级会员制”信用服务体系。</p>
					<p>精彩生活从亲分期开始！一个精彩的信用消费驿站！</p>
                    <p>&nbsp;</p>
				</div>
			</div>
		</div>
	</div>

</div>
<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>
<!-- End Save for Web Slices -->
<script src="<%=basePath%>js/focus.run.js" type="text/javascript"></script>
</body>
</html>