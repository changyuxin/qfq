<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript">
			function saveEmbassy(){
				var embassyId = $("input:radio[name='memberQuery\\.embassyId']:checked").val();
				if(embassyId == null){
					layer.alert("未选择大使!");
					return;
				}
				$.ajax({
					type : "POST",
					data : {
						"memberQuery.embassyId": $("input[name='memberQuery\\.embassyId']:checked").val() ,
						"memberQuery.embassyName": $("input[name='memberQuery\\.embassyId']:checked").next("label").text(), 
						"memberQuery.memberId": $("#memberId").val(), 
						"timestamp" : new Date().getTime()
					},
					url : "member/member!distEmbasssy.do",
					dataType: "json",
					error: function(request) {
		                layer.alert("分配大使失败!");
			        },
					success : function(data) {
			           	if (data.result == "SUCCESS") {
			           		window.parent.close();
			           	} else {
			           		layer.closeAll();
			           		layer.alert("分配大使失败!"); 
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
							<td width="100">
								校园大使：
							</td>
							<td style="text-align: left;">
								<s:if test="embassys.size > 0">
									<s:iterator value="embassys" id="embassy">
										<input type="radio" name="memberQuery.embassyId" id="<s:property value="#embassy.embassyId" />" value="<s:property value="#embassy.embassyId" />" />
										<label for="<s:property value="#embassy.embassyId" />"><s:property value="#embassy.trueName" /></label>
									</s:iterator>
								</s:if>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td style="text-align: left;">
								<input type="hidden" id="memberId" value="<s:property value="memberQuery.memberId" />" />
								<input type="button" value="保存" onclick="saveEmbassy()"/>
							</td>
						</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>





