<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/help.css" rel="stylesheet" />
	<title>帮助页面 - 审核资料说明</title>
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
				<h3>审核资料说明</h3>
				<div class="mydd ">
					<p>&nbsp;</p>
					<table width="90%" cellspacing="0" cellpadding="0" border="1">
						<tbody><tr class="text-center">
							<td style="width: 110px">审核材料</td>
							<td>要求</td>
							<td>替代证明材料</td>
						</tr>
						<tr>
							<td>二代身份证原件<br>正反面照片</td>
							<td>1. 身份证需在有效期内<br> 2. 原件拍照（复印件不可）<br> 3.
								提供原图，不可使用任何修图软件处理，不可使用网上（微博/QQ空间等）有水印的照片<br> 4.
								照片清晰可辨识，不可使用模糊或反光的照片<br> 5. 需年满18周岁<br>
							</td>
							<td>有效期内的临时身份证的正反面照片</td>
						</tr>
						<tr>
							<td>学籍证明文件（学生证/一卡通原件照片）</td>
							<td>1. 必须通过国家学籍验证系统的检验（信用认证时填写姓名和身份证号即可，系统将自动验证学籍信息）。 建议同时提供学信网的账户信息，确保一次通过审核。
                            <br> 2. 学生证或一卡通原件中需含有个人姓名，专业，学制，照片等信息

							</td>
							<td>1. 录取通知书（需含有本人的姓名，专业，入学年份等信息）<br> 2. 加盖学校公章的在校证明<br>
								3.
								如学籍验证未通过，且无法提供学信网信息的，可提供本校教务网站的账户信息（需含有个人信息，照片，专业，学制等信息，信息不全的无法通过审核）
							</td>
						</tr>
						<tr>
							<td>本人与证件的合照</td>
							<td>1. 照片需清晰，光线不宜过暗<br> 2. 必须露出面部五官，不可遮挡<br> 3.
								手写《证件使用及购买说明》并在后面签名，文字为：“本人所提供的证件仅供亲分期网站认证并购买商品时使用，此账户由本人操作（未因任何理由交由他人代为操作），发生的消费由本人承担，且本人同意网站电子合同条款。”文字建议写的大一些，照片中可辨识。<br>
								4. 手持身份证、学生证（一卡通）及《证件使用及购买说明》一起合影 <br>
							</td>
							<td>无</td>
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