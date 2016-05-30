<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<title>亲分期后台-系统管理</title>
	<script type="text/javascript">
		$(document).ready(function(){
			queryUserList(1);
			$("[system]").click(function(){
				$("[system]").css("color", ""); 
				$(this).css("color", "red");
			});
		});
		
		//根据条件查询用户
	    function queryUserList(index){
	    	//点击查询时,将页码置为1
			if(index == 1){
				$("[name='userQuery.pageNo']").val(1);
			}
			$("#main").load("system/user!manage.do", $("#queryForm").serializeArray()).html(loading);
	    }
	    
	    //根据条件查询角色
	    function queryRoleList(index){
	    	//点击查询时,将页码置为1
			if(index == 1){
				$("[name='roleQuery.pageNo']").val(1);
			}
			$("#main").load("system/role!manage.do", $("#queryForm").serializeArray()).html(loading);
	    }
	    
	    //根据条件查询资源
	    function queryResourceList(index){
	    	//点击查询时,将页码置为1
			if(index == 1){
				$("[name='resourceQuery.pageNo']").val(1);
			}
			$("#main").load("system/resource!manage.do", $("#queryForm").serializeArray()).html(loading);
	    }
		
	</script>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<div style="overflow:hidden;">
		<div class="div_l" id="left_nav">
			<div class="lttop difference_title">系统管理</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a system href="javascript:queryUserList(1);" style="color: red;">用户管理</a></li>
				<li><a system href="javascript:queryRoleList(1);" >角色管理</a></li>
				<li><a system href="javascript:queryResourceList(1);" >资源管理</a></li>
			</ul>
		</div>
		<div class="body-box" id="main">
		</div>
	</div>
</body>
</html>





