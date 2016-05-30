<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String allPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<script type="text/javascript">
	if(window.parent != null ){
		window.parent.location.href = "<%=allPath%>login.do";
	} else {
		window.location.href = "<%=allPath%>login.do";
	}
</script>