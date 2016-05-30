<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<script src="<%=basePath%>js/jquery.jPrintArea.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery.imgpreview.js" type="text/javascript"></script>
<title>亲分期后台-会员管理</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("[nav]").click(function(){
			$("[nav]").css("color",""); 
			$(this).css("color","blue");
		});
		init();
		queryMemberList(1);
	});
	
	function init(){
		var c = '<s:property value="countStr"/>';
		var a = c.split(",");
		var all = 0;
		for(var i = 0; i < a.length; i++){
			var r = a[i].split("-");
			var id = "#status_" + r[0];
			$(id).html("（" + r[1] + "）");
			all += parseInt(r[1]);
		}
		$("#status_all").html("（" + all + "）");
	}
	
	
	//根据条件查询
    function queryMemberList(index){
    	//点击查询时,将页码置为1
		if(index == 1){
			$("[name='memberQuery.pageNo']").val(1);
		}
		$("#main").load("member/member!getMembersPage.do",$("#memberForm").serializeArray()).html(loading);
    }
    
	function showMemberList(status){
		$("#auditStatus").val(status);
		queryMemberList(1);
	}
</script>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<div style="overflow:hidden;">
		<div class="div_l" id="left_nav">
			<div class="lttop difference_title" onclick="queryMemberList(1)" style="cursor: pointer;">大学生会员</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a nav href="javascript:showMemberList(0);" style="color: blue;">全部会员<span id="status_all" style="color: red;"></span></a></li>
				<li><a nav href="javascript:showMemberList(1);">待审核<span id="status_1" style="color: red;"></span></a></li>
				<li><a nav href="javascript:showMemberList(2);">重新审核<span id="status_2" style="color: red;"></span></a></li>
				<li><a nav href="javascript:showMemberList(3);">审核通过<span id="status_3" style="color: red;"></span></a></li>
				<li><a nav href="javascript:showMemberList(4);">审核不过<span id="status_4" style="color: red;"></span></a></li>
			</ul>
			<div class="lttop difference_title" style="cursor: pointer;">审核通过统计</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a nav href="javascript:showMemberList(5);">第一步审过<span id="status_5" style="color: red;"></span></a></li>
				<li><a nav href="javascript:showMemberList(6);">第二步审过<span id="status_6" style="color: red;"></span></a></li>
				<li><a nav href="javascript:showMemberList(7);">第三步审过<span id="status_7" style="color: red;"></span></a></li>
				<s:if test="isPermissionUrl('member/member!archive.do')">
					<li><a nav href="javascript:showMemberList(99);">已归档<span id="status_99" style="color: red;"></span></a></li>
				</s:if>
			</ul>
		</div>
		<div class="body-box" id="main"></div>
	</div>
</body>
</html>





