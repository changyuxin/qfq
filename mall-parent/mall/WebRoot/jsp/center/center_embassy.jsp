<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
	<title>亲分期  - 申请大使</title>
	<script type="text/javascript">
		$(function(){
			var province = '<s:property value="memberQuery.province"/>';
			var city = '<s:property value="memberQuery.city"/>';
			var district = '<s:property value="memberQuery.district"/>';
			if (province != '') {
				$("#area").distpicker({
					province : province,
					city : city,
					district : district
				});
			} else {
				$("#area").distpicker({
					autoSelect : false
				});
			}
			$("#province").val(province);
			$("#city").val(city);
			$("#district").val(district);
		});
		
		function submitApply(){
			var trueName = $("#trueName").val();
			if(trueName.length == 0){
				showMsg("#error_response","请先完成基础认证，再申请成为校园大使!");
				return;
			}
			var reason = $.trim($("[name='embassy.reason']").val());
			if(reason.length == 0){
				showMsg("#checkReason","请填写申请理由");
				return;
			}
			$("[name='embassy.reason']").val(reason);
			$.ajax( {
				type : "POST",
				data : $("#embassyForm").serialize(),
				url : "<%=basePath%>center/center!saveEmbassyApply.do",
				dataType: "json",
				error: function(request) {
	                layer.alert("保存申请大使资料失败!");
		        },
				success : function(data) {
		           	if (data == 0) {
		           		layer.alert("保存申请大使资料成功!");
		           		return;
		           	} else {
		           		layer.alert("保存申请大使资料失败!");
		           		return;
		           	} 
				}
			});
		}
		
		function showMsg(id, msg){
			$(id).html(msg);
		}
	</script>
</head>
<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
<div class="mid">
    <div class="main-wrap">
    	<%@include file="center_leftnav.jsp"%>
    	<!--右侧-->
        <div class="user-right mu-ctxt">
			<div class="user-right-head">
				<h2>申请成为大使</h2>
			</div>
			<div class="clear"></div>
			<form action="" id="embassyForm">
			<div id="user-apply-form" class="user-right-content apply-agent">
				<div class="item">
					<label class="ambassador-lable"><span class="span-star">*</span>姓名：</label>
					<span class="itemp"><s:property value="memberQuery.trueName"/></span>
					<input type="hidden" value="<s:property value="memberQuery.trueName"/>" name="embassy.trueName" id="trueName"/>
					<strong id="checkuserName" class="check-text"></strong>
				</div>
				<div class="item">
					<label class="ambassador-lable"><span class="span-star">*</span>电话：</label>
					<span class="itemp"><s:property value="memberQuery.phone" /></span>
					<input type="hidden" value="<s:property value="memberQuery.phone" />" name="embassy.phone" />
					<strong id="checkuserPhone" class="check-text"></strong>
				</div>
				<div class="item">
					<label class="ambassador-lable"><span class="span-star">*</span>身份证号：</label>
					<span class="itemp"><s:property value="memberQuery.idCard" /></span>
					<input type="hidden" value="<s:property value="memberQuery.idCard" />" name="embassy.idCard" />
					<strong id="checkuserIdCard" class="check-text"></strong>
				</div>
				<div class="area-choose item">
					<p id="area">
						<label class="ambassador-lable"><span class="span-star">*</span>地区：</label>
						<select label="省" id="province" name="embassy.province" class="area-form-control" style="width: 80px;"></select>&nbsp;
						<select label="市" id="city" name="embassy.city" class="area-form-control" style="width: 80px;"></select>&nbsp;
						<select label="区" id="district" name="embassy.district" class="area-form-control" style="width: 80px;"></select>&nbsp;
					</p>
				</div>
				<div class="item">
					<p>
						<label class="ambassador-lable"><span class="span-star">*</span>学校：</label>
						<span class="itemp"><s:property value="memberQuery.school" /></span>
						<input type="hidden" name="embassy.school" value="<s:property value="memberQuery.school" />" />
						<strong id="checkUniversity" class="check-text"></strong>
					</p>
				</div>
				
				
				<div class="item" style="margin-top:10px">
				</div>
				<div class="item">
					<label class="ambassador-lable"><span class="span-star">*</span>理由：</label>
					<textarea name="embassy.reason" class="light_gray_border" style="height: 100px; margin-top: 8px;" 
						placeholder="请填写理由（最多200字）"  onfocus="showMsg('#checkReason','')"   maxlength="200">${embassy.reason }</textarea>
					<strong id="checkReason" class="check-text"></strong>
				</div>
				<div class="item item-btu">
					<label>
						<input type="hidden" value="<s:property value="embassy.embassyId" />" name="embassy.embassyId" />
						<input type="hidden" value="<s:property value="embassy.userId" />" name="embassy.userId" />
					</label>
					<a href="javascript:submitApply();" class="common-btn-blue">提交申请</a>
					<strong id="error_response" class="apply-error-result"></strong>
				</div>
			</div>
			</form>
			<div id="user-apply-result-panel" class="user-right-content">
			</div>
		</div>
    </div>
</div>

<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>