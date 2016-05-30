<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 最多可以分几期</title>
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
				<h3>最多可以分几期</h3>
				<div class="mydd ">
					<p>&nbsp;</p>
					
					<p>您可选的最多分期期数取决于您的毕业时间，您需要在毕业之前将最后一期还清，详情请参见下表:</p>
					<p>&nbsp;</p>
					<table width="90%" cellspacing="0" cellpadding="0" border="1" class="text-center">
						<tbody><tr>
							<td>学制</td>
							<td>年级</td>
							<td>最高分期数</td>
						</tr>
						<tr>
							<td rowspan="3">大专（三年制）</td>
							<td>专一</td>
							<td>24期</td>
						</tr>
						<tr>
							<td>专二</td>
							<td>19期</td>
						</tr>
						<tr>
							<td>专三</td>
							<td>7期</td>
						</tr>
						<tr>
							<td rowspan="4">本科（四年制））</td>
							<td>大一</td>
							<td>24期</td>
						</tr>
						<tr>
							<td>大二</td>
							<td>24期</td>
						</tr>
						<tr>
							<td>大三</td>
							<td>19期</td>
						</tr>
						<tr>
							<td>大四</td>
							<td>7期</td>
						</tr>
						<tr>
							<td rowspan="5">本科（五年制））</td>
							<td>大一</td>
							<td>24期</td>
						</tr>
						<tr>
							<td>大二</td>
							<td>24期</td>
						</tr>
						<tr>
							<td>大三</td>
							<td>24期</td>
						</tr>
						<tr>
							<td>大四</td>
							<td>19期</td>
						</tr>
						<tr>
							<td>大五</td>
							<td>7期</td>
						</tr>
						<tr>
							<td rowspan="2">研究生（二年制）</td>
							<td>研一</td>
							<td>19期</td>
						</tr>
						<tr>
							<td>研二</td>
							<td>7期</td>
						</tr>
						<tr>
							<td rowspan="3">研究生（三年制）</td>
							<td>研一</td>
							<td>24期</td>
						</tr>
						<tr>
							<td>研二</td>
							<td>19期</td>
						</tr>
						<tr>
							<td>研三</td>
							<td>7期</td>
						</tr>
						<tr>
							<td>博士生</td>
							<td>依学制而定</td>
							<td>依学制而定</td>
						</tr>
					</tbody></table>
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