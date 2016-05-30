<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 联系我们</title>
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
				<h3>联系我们</h3>
				<div class="mydd ">
					<p>&nbsp;</p>
						<strong>亲分期（北京）科技有限公司（北京总部）</strong>
					<p>&nbsp;</p>
					<p>地址： 北京市石景山区实兴大街30号院17号楼4层</p>
                    <p>电话：400-628-5159</p>
                    <p>邮件：qinfenqi@126.com</p>
					<p>&nbsp;</p>
						<strong>东北分公司（大连）</strong>
					<p>&nbsp;</p>
                        <p>地址：辽宁省大连市开发区金马路凯伦国际大厦A座508室</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
						<strong>深圳营销中心</strong>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
						<strong>沈阳营销中心</strong>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
						<strong>长春营销中心</strong>
					<p>&nbsp;</p>
                    <p>&nbsp;</p>
						<strong>哈尔滨营销中心</strong>
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