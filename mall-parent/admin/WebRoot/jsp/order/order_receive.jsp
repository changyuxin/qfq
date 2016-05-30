<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript">
			function saveReceiveInfo(){
				if($("#receiveName").val().length == 0){
					layer.alert("收货人姓名收货人!");
					return;
				}
				if($("#receiveMobile").val().length == 0){
					layer.alert("收信人电话收货人!");
					return;
				}
				if($("#receiveAddress").val().length == 0){
					layer.alert("收货地址未填写!");
					return;
				}
				$.ajax( {
					type : "POST",
					data : $("#receiveForm").serialize(),
					url : "order/order!saveReceiveInfo.do",
					dataType: "json",
					error: function(request) {
		                layer.alert("保存收货人信息失败!");
			        },
					success : function(data) {
			           	if (data.result == "SUCCESS") {
			           		window.parent.closeLayer();
			           	} else {
			           		layer.alert("保存收货人信息失败!");
			           		return;
			           	} 
					}
				});
			}
		</script>
	</head>
	<body style="overflow-x:hidden;overflow-y:hidden"> 
		<form id="receiveForm" method="post">
			<input type="hidden" name="orderQuery.orderId" value="<s:property value="orderQuery.orderId" />" />
			<table class="pn-ltable" style="width: 100%; text-align: right;" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
						<tr>
							<td>
								收货人姓名：
							</td>
							<td style="text-align: left;">
								<input type="text" name="orderQuery.receiveName" id="receiveName" value="<s:property value="orderQuery.receiveName"/>" />
							</td>
						</tr>
						<tr>
							<td>
								收货人电话：
							</td>
							<td style="text-align: left;">
								<input type="text" name="orderQuery.receiveMobile" id="receiveMobile" value="<s:property value="orderQuery.receiveMobile"/>" />
							</td>
						</tr>
						<tr>
							<td>
								收货人地址：
							</td>
							<td style="text-align: left;">
								<textarea type="text" name="orderQuery.receiveAddress" id="receiveAddress" style="font-size: 12.5px; font-family:Microsoft YaHei; width: 350px;"><s:property value="orderQuery.receiveAddress"/></textarea>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td style="text-align: left;">
								<input type="button" value="确认保存" onclick="saveReceiveInfo()"/>
							</td>
						</tr>
				</tbody>
			</table>
			
					
			</div>
		</form>
	</body>
</html>





