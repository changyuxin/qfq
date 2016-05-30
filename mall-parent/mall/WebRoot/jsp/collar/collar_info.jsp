<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="../common/head.jsp"%>
		<link rel="stylesheet" href="<%=basePath%>css/white-collar.css" />
		<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
		<title>亲分期 - 白领信息表</title>
		<script type="text/javascript">
			$(function(){
				$("#baseInfo").load("collar/collar!getBaseInfo.do").html(loading);
				$("#companyInfo").load("collar/collar!getCompanyInfo.do").html(loading);
				$("#mailInfo").load("collar/collar!getMailInfo.do").html(loading);
				$("#homeInfo").load("collar/collar!getHomeInfo.do").html(loading);
				$("#incomeInfo").load("collar/collar!getIncomeInfo.do").html(loading);
				$("#bankcardInfo").load("collar/collar!getBankcardInfo.do").html(loading);
				$("#uploadInfo").load("collar/collar!getUploadInfo.do").html(loading);
			});
		</script>
    </head>
<body>
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
	<!--信用支付-->
<div style="margin:0 auto; width:1200px;position:relative;">
	<div class="main-wrap">
	<%@include file="../center/center_leftnav.jsp"%>
	
<div class="apply-all">
		<div class="apply-wrap">
			<div class="apply-tt">
            	<p class="apply-tt-p" style="text-align: left; padding-left: 20px; padding-top: 7px;">我的信息</p>
			</div>
			<form id="collarForm" method="post">
			   
				<div id="" style="width: 1000px; padding-top:10px;">
	            	<!--客户基本信息-->
					<div class="white-collar-div" id="baseInfo" style="padding-bottom:60px;">
	                </div>
	                <!--单位信息-->
	                <div class="white-collar-div" id="companyInfo" style="padding-bottom:60px;">
	                </div>
	                <!--邮寄地址及联系方式-->
	                <div class="white-collar-div" id="mailInfo" style="padding-bottom:60px;">
	                </div>
	                <!--家庭及紧急联系方式-->
	                <div class="white-collar-div" id="homeInfo" style="padding-bottom:60px;">
	                </div>
	                <!--收入及其他信息-->
	                <div class="white-collar-div" id="incomeInfo" style="padding-bottom:60px;">
	                </div>
	                <!--银行卡信息-->
	                <div class="white-collar-div" id="bankcardInfo" style="padding-bottom:60px;">
	                </div>  
	                <!--上传资料-->
	                <div class="white-collar-div" id="uploadInfo" style="padding-bottom:60px;">
	                </div>
	                <div class="annotation">
	                <p class="annotation-p">注释:</p>
	                <p class="annotation-p-title">1.关于分期</p>
	                <p class="annotation-p-main">1.关于分期</p>
	                <p class="annotation-p-main">1.关于分期</p>
	                <p class="annotation-p-main">1.关于分期</p>
	                <p class="annotation-p-main">1.关于分期</p>
	                </div>       		
				</div>
			</form>
		</div>
	</div>	
</div></div>
<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>