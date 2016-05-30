<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript">
			function savetraceRecord(id, type){
				if($("#record").val().length == 0){
					layer.alert("跟踪内容未填写!");
					return;
				}
				$.ajax({
					type : "POST",
					data : {
						"userQuery.userId" : id,
						"userQuery.record" : $("#record").val(),
						"timestamp" : new Date().getTime()
					},
					url : "user/user!saveTraceRecord.do",
					dataType: "json",
					error: function(request) {
		                layer.alert("保存跟踪内容失败!");
			        },
					success : function(data) {
			           	if (data.result == "SUCCESS") {
			           		window.parent.close();
			           	} else {
			           		layer.closeAll();
			           		layer.alert("保存跟踪内容失败!"); 
			           		return;
			           	} 
					}
				});
			}
		</script>
	</head>
	<body style="overflow-x:hidden; overflow-y:hidden">
		<form id="auditForm" method="post">
			<table class="pn-ltable" style="width: 100%; text-align: right;" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
						<tr>
							<td>
								跟踪结果：
							</td>
							<td style="text-align: left;">
								<textarea cols="30" rows="5" name="userQuery.record" id="record"></textarea>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td style="text-align: left;">
								<input type="button" value="保存结果" onclick="savetraceRecord('<s:property value="userQuery.userId" />')"/>
							</td>
						</tr>
				</tbody>
			</table>
			
					
			</div>
		</form>
	</body>
</html>





