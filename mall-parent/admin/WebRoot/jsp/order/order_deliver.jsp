<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript">
			function saveDeliverInfo(){
				if($("#deliverName").val().length == 0){
					layer.alert("快递公司未选择!");
					return;
				}
				if($("#deliverName").val() != "ziti"){
					if($("#deliverCode").val().length == 0){
						layer.alert("运单编号未填写!");
						return;
					}
				}
				if($("#productImei").val().length == 0){
					layer.alert("商品IMEI号未填写!");
					return;
				}
				$.ajax( {
					type : "POST",
					data : $("#deliverForm").serialize(),
					url : "order/order!saveDeliverInfo.do",
					dataType: "json",
					error: function(request) {
		                layer.alert("保存发货信息失败!");
			        },
					success : function(data) {
			           	if (data.result == "SUCCESS") {
			           		window.parent.closeLayer();
			           	} else {
			           		layer.alert("保存发货信息失败!");
			           		return;
			           	} 
					}
				});
			}
			function deliverChange(){
				if($("#deliverName").val() == "ziti"){
					$("#deliver_no").hide();
				} else {
					$("#deliver_no").show();
				}
			}
		</script>
	</head>
	<body style="overflow-x:hidden;overflow-y:hidden"> 
		<form id="deliverForm" method="post">
			<input type="hidden" name="orderQuery.orderId" value="<s:property value="orderQuery.orderId" />" />
			<table class="pn-ltable" style="width: 100%; text-align: right;" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
						<tr>
							<td>
								快递公司：
							</td>
							<td style="text-align: left;">
								<select name="orderQuery.deliverName" id="deliverName" onchange="deliverChange()">
									<option value="">-请选择-</option>
									<option value="ziti" <s:if test="orderQuery.deliverName == 'ziti'"> selected="selected"</s:if>>自提</option>
									<option value="shunfeng" <s:if test="orderQuery.deliverName == 'shunfeng'"> selected="selected"</s:if>>顺丰快递</option>
									<option value="yuantong" <s:if test="orderQuery.deliverName == 'yuantong'"> selected="selected"</s:if>>圆通快递</option>
									<option value="shentong" <s:if test="orderQuery.deliverName == 'shentong'"> selected="selected"</s:if>>申通快递</option>
									<option value="zhongtong" <s:if test="orderQuery.deliverName == 'zhongtong'"> selected="selected"</s:if>>中通快递</option>
									<option value="huitong" <s:if test="orderQuery.deliverName == 'huitong'"> selected="selected"</s:if>>汇通快递</option>
									<option value="yunda" <s:if test="orderQuery.deliverName == 'yunda'"> selected="selected"</s:if>>韵达快递</option>
									<option value="tiantian" <s:if test="orderQuery.deliverName == 'tiantian'"> selected="selected"</s:if>>天天快递</option>
									<option value="ems" <s:if test="orderQuery.deliverName == 'ems'"> selected="selected"</s:if>>邮政EMS</option>
								</select>
							</td>
						</tr>
						<s:if test="orderQuery.deliverName != 'ziti'">
							<tr id="deliver_no">
								<td>
									运单编号：
								</td>
								<td style="text-align: left;">
									<input type="text" name="orderQuery.deliverCode" id="deliverCode" value="<s:property value="orderQuery.deliverCode"/>" />
								</td>
							</tr>
						</s:if>
						<tr>
							<td>
								商品IMEI：
							</td>
							<td style="text-align: left;">
								<input type="text" name="orderQuery.productImei" id="productImei" value="<s:property value="orderQuery.productImei"/>" />
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td style="text-align: left;">
								<input type="button" value="确认保存" onclick="saveDeliverInfo()"/>
							</td>
						</tr>
				</tbody>
			</table>
			
					
			</div>
		</form>
	</body>
</html>





