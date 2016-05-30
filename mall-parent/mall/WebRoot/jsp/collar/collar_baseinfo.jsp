<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="../common/head.jsp"%>
		<link rel="stylesheet" href="<%=basePath%>css/white-collar.css" />
		<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
		<title>亲分期 - 白领信息表</title>
		<script type="text/javascript">
		$(function(){
			var province = '${collarQuery.province}';
			var city = '${collarQuery.city}';
			var district = '${collarQuery.district}';
			if(province != ''){
				$("#baseContact").distpicker({
					province: province,
					city: city,
					district: district
				 });
			} else {
				$("#baseContact").distpicker({
					autoSelect: false 
				});
			}
		});
		function baseInfoSubmit(){
			$(".error-span").html("");
			if(validateBaseInfo(false)){
					$.ajax( {
						type : "POST",
						url : "center/center!idCardValid.do?memberQuery.idCard=" + $("#idCard").val(),
						dataType: "json",
						async: false,
						error: function(request) {
			                layer.alert("身份证号码认证失败!");
				        },
						success : function(data) {
				           	if (data == 1) {
				           		//$("#collarForm").submit();
				           		$("#baseInfo").load("collar/collar!baseInfoImprove.do", $("#baseForm").serializeArray()).html(loading);
				           		//layer.alert("提交成功!");
				           	} else {
				           		$("#errorBaseInfoTxt").html("身份证号输入不正确!").show();
				           		layer.alert("身份证号输入不正确!");
				           		return false;
				           	} 
						}
					});
			}
		}
		function validateBaseInfo(flag){
			//基本信息判断
			if(!checkInputText("#trueName")){
				return false;
			}
			if(!checkInputText("#sex")){
				return false;
			}
			if(!checkInputText("#idCard",flag)){
				return false;
			}
			if(!checkInputText("#province")){
				return false;
			}
			if(!checkInputText("#city")){
				return false;
			}
			if(!checkInputText("#street")){
				return false;
			}
			if(!checkInputText("#neighborhood")){
				return false;
			}
			if(!checkInputText("#building")){
				return false;
			}
			if(!checkInputText("#unit")){
				return false;
			}
			if(!checkInputText("#floor")){
				return false;
			}
			if(!checkInputText("#room")){
				return false;
			}
			$("#errorBaseInfoTxt").html("").hide();
			return true;
		}
		//基本信息验证
		function checkInputText(obj,flag){
			obj = $(obj);
			var labelName = obj.attr("labelName");
			var word = $.trim(obj.val());
			if (word == ''){
				$("#errorBaseInfoTxt").html(labelName + "不能为空!").show();
				return false;
			}
			if(labelName == "楼"){
				if(isNaN(word)){
					$("#errorBaseInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "单元"){
				if(isNaN(word)){
					$("#errorBaseInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "层"){
				if(isNaN(word)){
					$("#errorBaseInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "室"){
				if(isNaN(word)){
					$("#errorBaseInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "身份证号" && flag){
				$.ajax( {
					type : "POST",
					url : "center/center!idCardValid.do?memberQuery.idCard=" + word,
					dataType: "json",
					error: function(request) {
		                layer.alert("身份证号码认证失败!");
			        },
					success : function(data) {
			           	if (data == 1) {
			           		return true;
			           	} else {
			           		$("#errorBaseInfoTxt").html(labelName + "输入不正确!").show();
			           		return false;
			           	} 
					}
				});
			}
			$("#errorBaseInfoTxt").html("").hide();
			return true;
		}
		</script>
    </head>
<body>
		<form id="baseForm" method="post" enctype="multipart/form-data" action="collar/collar!collarInfoImprove.do">
            	 <input type="hidden" id="userId"  name="collarQuery.userId" value="<s:property value="getCurrentUser().userId" />" /> 
            	<!--客户基本信息-->
                	<p class="p_mian_title"><strong>客户基础信息</strong></p>
                    <!--error窗口-->
                    <div class="error-div error-span" style="display:none" id="errorBaseInfoTxt"></div>
                    <p class="p_mian" style="margin-top:20px;">
	                	<label>姓名：</label><input type="text" class="input_w_80" id="trueName" name="collarQuery.trueName" value="<s:property value='collarQuery.trueName'/>" labelName="姓名" onblur="checkInputText(this);"/>
	                    	 性别：
	                    	<select class="input_w_80" id="sex" name="collarQuery.sex" labelName="性别" onblur="checkInputText(this);">
                                 <option value="">请选择</option>
                                 <option value="1" <s:if test="collarQuery.sex == 1"> selected="selected"</s:if>>男</option>
                                 <option value="2" <s:if test="collarQuery.sex == 2"> selected="selected"</s:if>>女</option>
                            </select>
							身份证号：
	                  		<input type="text" style="width:150px;" id="idCard" name="collarQuery.idCard" value="<s:property value='collarQuery.idCard'/>" labelName="身份证号" onblur="checkInputText(this,true);"/>
                    </p>
                	<div class="area-choose" id="baseContact">
						<p class="p_mian">
                      	<label>现居住地址：</label>
                              <select id="province" name="collarQuery.province" class="area-form-control" style="width: 117px;" labelName="省" onblur="checkInputText(this);"></select>&nbsp;&nbsp; 
						   <select id="city" name="collarQuery.city" class="area-form-control" style="width: 117px;" labelName="市" onblur="checkInputText(this);"></select>&nbsp;&nbsp;
                              <select id="district" name="collarQuery.district" class="area-form-control" style="width: 117px;" ></select>&nbsp;&nbsp;
                              <input type="text" style="width:100px;" id="street" name="collarQuery.street" value="<s:property value='collarQuery.street'/>" labelName="街（路）" onblur="checkInputText(this);"/>街（路）<br/>
                              <label></label>
                              <input type="text" style="margin-left:1px" id="neighborhood" name="collarQuery.neighborhood" value="<s:property value='collarQuery.neighborhood'/>" labelName="小区" onblur="checkInputText(this);"/>小区
                              <input type="text" class="input_w_80" id="building" name="collarQuery.building" value="<s:property value='collarQuery.building'/>" labelName="楼号" onblur="checkInputText(this);"/>号楼
                              <input type="text" class="input_w_80" id="unit" name="collarQuery.unit" value="<s:property value='collarQuery.unit'/>" labelName="单元" onblur="checkInputText(this);"/>单元
                              <input type="text" class="input_w_80" id="floor" name="collarQuery.floor" value="<s:property value='collarQuery.floor'/>" labelName="层" onblur="checkInputText(this);"/>层
                              <input type="text" class="input_w_80" id="room" name="collarQuery.room" value="<s:property value='collarQuery.room'/>" labelName="室" onblur="checkInputText(this);"/>室</p>
                    </div>
                    <div style="float:right;margin:20px 50px 10px;">
						<a href="javascript:baseInfoSubmit();" class="btn-submit-a">提交</a>
					</div>
		</form>
		
</body></html>