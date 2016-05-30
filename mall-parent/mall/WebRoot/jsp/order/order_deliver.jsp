<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>	
<div class="status-box">
	<ul class="status-list">
		<s:iterator value="deliverInfos" id="info">
			<li>
				<span class="time"><s:property value="#info.time" /></span>
				<span class="text"><s:property value="#info.content" /></span>
			</li>
		</s:iterator>
	</ul>
</div>