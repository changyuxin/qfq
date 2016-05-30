<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
	<title>亲分期  - 高校选择</title>
	<style type="text/css">
		.chooseboxwp {position: fixed;width: 700px;z-index: 10001;}
		.choosebox {float: left;border: 1px solid #FF3100;width: 700px;background-color: white;}
		.chooseboxtt {background: #FF3100;color: white;padding: 4px 10px 5px;font-size: 14px;font-weight: 700;margin: 0;}
		.chooseprovince,.chooseuniversity {margin: 5px 8px 10px 8px;padding: 10px 0px;border: 1px solid #C3C3C3;}
		.chooseprovince .choosen {background-color: #FF3100;color: white;}
		.searchSchool {line-height: 26px;margin: 5px 20px;}
		.searchSchool label{width: 60px;line-height: 26px;margin-right: 10px;}
		.searchSchool input[type=text] {height: 26px;width: 300px;float: none;margin: 0;}
		.searchbox{position: relative;width: 200px;display: inline-block;}
		.searchbox ul{width:200px;max-height:100px;line-height:26px;position: absolute;top: 26px;border: 1px solid #C3C3C3;background-color: #fff;z-index: 100;display: none;}
		.province-list {margin: 0px 10px;}
		.province-list li {width: 38px;text-align: center;margin-top: 5px;padding: 5px 0px;display: inline-block;}
		.province-list li:hover,.province-list li.choosen,.university-list li a:HOVER{background-color: #FF3100;color: #fff;}
		.chooseuniversity {overflow-x: hidden;overflow-y: auto;height: 250px;}
		.university-list {height: 250px;width: 100%;}
		.university-list li a {color: #666;padding:6px;display: inline-block;width: 40%;float: left;margin:0px 20px;}
		.chooseboxbtm {background: #F0F5F8;text-align: right;border-top: 1px solid #CCC;height: 50px;}
		.chooseboxbtm .chooseboxClose {vertical-align: middle;text-align: center;background-color: #FF3100;color: white;border: 1px solid #FF3100;cursor: pointer;width: 100px;height: 30px;margin-top: 10px;margin-right: 10px;border-radius:3px;}
		.common-btn-blue {background-color: #2782DB;border-radius: 5px;color: #FFF !important;line-height: 20px;  padding: 6px 20px;display: inline-block;text-align:center;}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#1").addClass("choosen");
			getSchools($("#1").attr("id"));
		});
		
		function getSchools(proId){
			$("[prov]").removeClass("choosen");
			$("#" + proId).addClass("choosen");
			$("#proId").val(proId);
			$.getJSON("<%=basePath%>embassy/embassy!getSchools.do", {
				"school.schoolProId" : proId,
				"timestamp" : new Date().getTime()
			}, function(data) {
				$("#university").html("");
				$.each(data, function(i, item){
					$("#university").append("<li><a class='universityitem' data-id='" + item.schoolId + "' onclick='selected(this)'>" + item.schoolName + "</a></li>"); 
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
			$.getJSON("<%=basePath%>embassy/embassy!searchSchool.do", {
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
					<li prov id="${schoolPro.provinceId}" onclick="getSchools(${schoolPro.provinceId})">${schoolPro.provinceName}</li>
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