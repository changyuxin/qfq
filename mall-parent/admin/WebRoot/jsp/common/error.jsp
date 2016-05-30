<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>错误页面</title>
</head>

<body>

<div id="content">
<p>系统出错了，请联系管理员。错误：<s:property value="exception"/></p>
</div>
</body>
</html>