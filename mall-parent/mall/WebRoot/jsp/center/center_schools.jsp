<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 高校选择</title>
	<script type="text/javascript">
		$(function(){
			$("#1").addClass("choosen");
			getSchools($("#1").attr("id"));
		});
		
		function getSchools(proId){
			$("[prov]").removeClass("choosen");
			$("#" + proId).addClass("choosen");
			$("#proId").val(proId);
			$.getJSON("<%=basePath%>center/center!getSchools.do", {
				"school.schoolProId" : proId,
				"timestamp" : new Date().getTime()
			}, function(data) {
				$("#university").html("");
				$.each(data, function(i, item){
					$("#university").append("<li><a class='universityitem' data-id='" + item.schoolId + "' onclick='selected(this)'  style='cursor: pointer;'>" + item.schoolName + "</a></li>"); 
				});
			}, "json");
		}
		
		
		function selected(o){
			$("#schoolId", window.parent.document).val($(o).attr("data-id"));
			$("#schoolName", window.parent.document).val($(o).html());
			parent.layer.closeAll("iframe");
		}
		
		// 查询学校
		function searchSchool(){
			$.getJSON("<%=basePath%>center/center!searchSchool.do", {
				"school.schoolProId" : $("#proId").val(),
				"school.schoolName" : $("#schoolName").val(),
				"timestamp" : new Date().getTime()
			}, function(data) {
				$("#university").html("");
				$.each(data, function(i, item){
					$("#university").append("<li><a class='universityitem' data-id='" + item.schoolId + "' onclick='selected(this)'  style='cursor: pointer;'>" + item.schoolName + "</a></li>"); 
				});
			}, "json");
		}
		
	</script>
</head>
<body>
<div class="chooseboxwp" id="chooseboxwp">
		<div class="chooseprovince">
			<ul class="province-list">
				<s:iterator value="schoolProList" id="schoolPro" status="L">
					<li prov id="${schoolPro.provinceId}" onclick="getSchools(${schoolPro.provinceId})" style="cursor: pointer;">${schoolPro.provinceName}</li>
				</s:iterator>
				<input type="hidden" id="proId" />
			</ul>
		</div>
		<div class="chooseuniversity">
			<!--  -->
			<div class="searchSchool">
				<label>搜索：</label>
				<input type="text" id="schoolName" />&nbsp;&nbsp;&nbsp;<a href="javascript:searchSchool();" class="common-btn-blue">查询</a>
			</div>
			<ul class="university-list" id="university"></ul>
		</div>
	</div>
</body>
</html>