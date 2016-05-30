<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
		<style type="text/css">
			.tr_h{height: 40px;}
		</style>
		<script type="text/javascript">
			$(function(){
			
			});
			// 保存用户
			function saveCoupon(){
				$.post("manage/coupon!saveCoupon.do?timestamp=" + new Date().getTime(), 
					$("#couponForm").serializeArray(), 
					function(data) {
						if (data.result == "FAILURE") {
							layer.alert("保存失败!");
						} else {
							window.parent.close();
						}
				}, "json");
			}
		</script>
		
	</head>
	<body style="overflow-x:hidden; overflow-y:hidden;" > 
		<form id="couponForm" method="post">
			<table class="pn-ltable" style="" width="580" cellspacing="1" cellpadding="0" border="0">
			<tbody>
				<tr style="height: 40px;">  
					<td width="20%" class="pn-flabel">优惠券名称：</td>
					<td width="50%" class="pn-fcontent">
						<input type="text" size="30" id="couponName" name="couponQuery.couponName" label="优惠券名称" value="<s:property value="couponQuery.couponName"/>" onblur="checkNull($(this))"/>
					</td>
					<td width="30%" class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">优惠券金额：</td>
					<td class="pn-fcontent">
						<input type="text" size="10" id="couponSums" name="couponQuery.couponSums" label="优惠券金额" value="<s:property value="couponQuery.couponSums"/>" onblur="checkNull($(this))"/>&nbsp;元
					</td>
					<td class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">优惠券总数：</td>
					<td class="pn-fcontent">
						<input type="text" size="10" id="couponTotal" name="couponQuery.couponTotal" label="优惠券总数" value="<s:property value="couponQuery.couponTotal"/>" onblur="checkNull($(this))"/>&nbsp;个
					</td>
					<td class="pn-fcontent">
					</td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">优惠券类型：</td>
					<td class="pn-fcontent">
						<select id="couponType" name="couponQuery.couponType" label="优惠券类型" onblur="checkNull($(this))">
							<option value="">请选择</option>
							<option value="1" <s:if test="couponQuery.couponType == 1"> selected="selected"</s:if>>帐单减免</option>
							<option value="2" <s:if test="couponQuery.couponType == 2"> selected="selected"</s:if>>订单减免</option>
						</select>
					</td>
					<td class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">每个用户领用：</td>
					<td class="pn-fcontent">
						<input type="text" size="10" id="userDraw" name="couponQuery.userDraw" label="每个用户领用" value="<s:property value="couponQuery.userDraw"/>" onblur="checkNull($(this))"/>&nbsp;个
					</td>
					<td class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel">有效期：</td>
					<td class="pn-fcontent">
						<input style="width:110px;" id="startTime" type="text" class="Wdate one_bg" name="couponQuery.startTime"
			                    	onclick="WdatePicker({isShowClear:true,autoPickDate:true, readOnly:true, dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'endTime\');}'})" 
			                    	value="<s:date name="couponQuery.startTime" format="yyyy-MM-dd"/>"
			                    	/> 至 
	            		<input style="width:110px;" id="endTime" type="text" class="Wdate one_bg2" name="couponQuery.endTime"
		                    	onclick="WdatePicker({isShowClear:true, autoPickDate:true, readOnly:true, dateFmt:'yyyy-MM-dd', minDate:'#F{$dp.$D(\'startTime\');}'})" 
		                    	value="<s:date name="couponQuery.endTime" format="yyyy-MM-dd"/>"
		                    	/>
					</td>
					<td class="pn-fcontent"></td>
				</tr>
				<tr style="height: 40px;">  
					<td class="pn-flabel"></td>
					<td class="pn-fcontent">
		        		<input type="hidden" value="<s:property value="couponQuery.couponId"/>" name="couponQuery.couponId" id="couponId"/>
						<input type="button" value="保存" onclick="saveCoupon()" />
					</td>
					<td class="pn-fcontent"></td>
				</tr>
			</tbody>
		</table>
		</form>
	</body>
</html>





