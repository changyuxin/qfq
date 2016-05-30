<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style type="text/css">
		.status-list { margin: 0; padding: 0; margin-left: 12px; margin-top: -9px; padding-left: 10px; list-style: none; line-height: 30px;}
		.status-list li { height: auto; min-height: 30px; font-size: 12px;}
		.time{width:48px;margin-right:28px;margin-left:5px;font-size:12px;}
		.text{display:inline-block;width:653px;font-size:12px;}
	</style>
</head>
<body style="overflow-x:hidden;overflow-y:scroll">
	<ul class="status-list">
		<s:if test="deliverInfos.size > 0">
			<s:iterator value="deliverInfos" id="info">
				<li>
					<span class="time"><s:property value="#info.time" />&nbsp;&nbsp;&nbsp;<s:property value="#info.content" /></span>
				</li>
			</s:iterator>
		</s:if>
		<s:else>
			<li>
				<span class="time">暂无物流信息!</span>
			</li>
		</s:else>
	</ul>
</body>
</html>