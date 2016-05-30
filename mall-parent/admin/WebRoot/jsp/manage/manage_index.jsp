<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<title>亲分期后台-配置管理</title>
<script type="text/javascript">
	$(document).ready(function() {
		loadPage("manage/manage!authCodePage.do");
	});
	function loadPage(url) {
		$("#main").load(url).html(loading);
	}
</script>
</head>
<body>
	<%@include file="../common/top.jsp"%>
	<div style="overflow:hidden;">
		<div class="div_l" id="left_nav">
			<div class="lttop difference_title">配置管理</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a href="javascript:loadPage('manage/manage!authCodePage.do')">授权码管理</a></li>
				<li><a href="javascript:loadPage('manage/coupon!manage.do')">优惠券管理</a></li>
				<li><a href="javascript:loadPage('manage/manage!defaultRatePage.do')">默认服务费率</a></li>
				<!-- 
				<li><a href="javascript:loadPage('manage/manage!prodRecom.do')">精品推荐</a></li>
				 -->
				<li><a href="javascript:loadPage('manage/focus!manage.do')">首页轮播</a></li>
			</ul>
		</div>
		<div class="body-box" id="main"></div>
	</div>
</body>
</html>





