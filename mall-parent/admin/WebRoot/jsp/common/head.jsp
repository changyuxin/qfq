<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<base href="<%=basePath%>">
<basePath value="<%=basePath%>" id="basePath"></basePath>
<meta http-equiv="Pragma" CONTENT="no-cache" />
<meta http-equiv="Cache-Control" CONTENT="no-store, no-cache, must-revalidate" />
<meta http-equiv="Expires" CONTENT="-1" />
<link href="<%=basePath%>css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/editor.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery.form.js" type="text/javascript"></script>
<script src="<%=basePath%>js/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery.md5.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery.pagination.js" type="text/javascript"></script>
<script src="<%=basePath%>js/datepicker/WdatePicker.js"></script>
<script type="text/javascript">
	function tbr(){
		layer.alert("此功能稍后开放，请耐心等待!");
	}
	var basePath = $("#basePath").attr("value");
	
	var loading = '<div class="loading-div"><p>正在加载数据......</p><img src="img/loading_main.gif" /></div>';
	
	// 查看操作记录
	function showOpLog(type, id){
		layer.open({
		    type: 2,
		    title: "操作记录",
		    shadeClose: true,
		    shade: 0.3,
		    area: ["600px", "400px"],
		    content: "log/log!logList.do?log.bizType=" + type + "&log.bizId=" + id
		});
	}
	// 查看用户
	function showUserInfo(id){
		layer.open({
		    type: 2,
		    title: "用户信息",
		    shadeClose: false,
		    shade: 0.3,
		    area: ["400px", "400px"],
		    content: "user/user!showUserInfo.do?userQuery.userId=" + id
		});
	}
	
	// 判断是否为空
	function checkNull(o){
		var label = o.attr("label");
		var value = o.val();
		if(value == ''){
			layer.alert(label + "不能为空!");
			return false;
		} else {
			return true;
		}
	}
</script>
