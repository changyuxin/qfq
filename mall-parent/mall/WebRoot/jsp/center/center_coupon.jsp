<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 商品订单</title>
	<script type="text/javascript">
		$(function(){
			$("[nav]").click(function(){
				$("[nav]").css("color", ""); 
				$(this).css("color", "#fc6710");
			});
			initStatus();
		});
		
		function initStatus(){
			var s = '<s:property value="coupon.auditStatus"/>';
			$("[nav]").each(function(){
				if($(this).attr("status") == s){
					$(this).addClass("active");
				} else {
					$(this).removeClass("active");
				}
			});
		}
		
		function showCoupons(id){
			
		
		
		}
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
					<h2>我的优惠券</h2>
				</div>
				<div class="user-right-content">
					<div class="coupons-head">
						<a nav href="javascript:;" onclick="showCoupons('0')" style="color: #fc6710;" status="0">全部</a>
						<a nav href="javascript:;" onclick="showCoupons('1')" status="1">可用</a>
						<a nav href="javascript:;" onclick="showCoupons('2')" status="2">已使用</a>
						<a nav href="javascript:;" onclick="showCoupons('3')" status="3">已过期</a>
					</div>
					<form name="couponForm">
						<input type="hidden" name="couponRecord.status" value="<s:property value="couponRecord.status" />" />
					</form>
					<div class="">
						<table width="100%" border="0" cellpadding="1" cellspacing="0">
							<tr>
								<td width="200px">优惠券</td>
								<td width="90px">优惠金额</td>
								<td width="100px">生效日期</td>
								<td width="100px">到期日期</td>
								<td width="90px">状态</td>
							</tr>
							<tr>
								<td width="200px">优惠券</td>
								<td width="90px">优惠金额</td>
								<td width="100px">生效日期</td>
								<td width="100px">到期日期</td>
								<td width="90px">状态</td>
							</tr>
                        </table>
                        <!-- 
						<font color="#C2C2C2">优惠券使用方法:下单完毕后您可以在签订合同时使用优惠券</font>
						 -->
					</div>
				</div>
			</div>
		</div>
    </div>
</div>

<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>