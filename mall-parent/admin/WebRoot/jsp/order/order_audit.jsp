<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript">
			function saveAuditOpinion(id){
				if($("#opinion").val().length == 0){
					layer.alert("审核意见未填写!");
					return;
				}
				$.ajax({
					type : "POST",
					data : {
						"orderQuery.orderId" : id,
						"orderQuery.auditOpinion" : $("#opinion").val(),
						"timestamp" : new Date().getTime()
					},
					url : "order/order!auditNoPass.do",
					dataType: "json",
					error: function(request) {
		                layer.alert("保存审核信息失败!");
			        },
					success : function(data) {
			           	if (data.result == "SUCCESS") {
			           		window.parent.closeLayer();
			           	} else {
			           		layer.closeAll();
			           		layer.alert("审核订单失败!"); 
			           		return;
			           	} 
					}
				});
			}
		</script>
	</head>
	<body style="overflow-x:hidden; overflow-y:hidden">
		<form id="deliverForm" method="post">
			<table class="pn-ltable" style="width: 100%; text-align: right;" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
						<tr>
							<td>
								审核意见：
							</td>
							<td style="text-align: left;">
								<textarea cols="30" rows="5" name="orderQuery.auditOpinion" id="opinion"></textarea>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td style="text-align: left;">
								<input type="button" value="保存意见" onclick="saveAuditOpinion('<s:property value="orderQuery.orderId" />')"/>
							</td>
						</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>





