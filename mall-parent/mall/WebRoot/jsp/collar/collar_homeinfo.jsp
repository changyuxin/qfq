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
			
		});
		function homeInfoSubmit(){
			$(".error-span").html("");
			if(validateHomeInfo(false)){
				$("#homeInfo").load("collar/collar!homeInfoImprove.do", $("#homeForm").serializeArray()).html(loading);
			}
		}
		function validateHomeInfo(flag){

			//家庭信息验证
			if(!checkInputText3("#fatherName")){
				return false;
			}
			if(!checkInputText3("#fatherPhone")){
				return false;
			}
			if(!checkInputText3("#motherName")){
				return false;
			}
			if(!checkInputText3("#motherPhone")){
				return false;
			}
			if(!checkInputText3("#friendName")){
				return false;
			}
			if(!checkInputText3("#friendPhone")){
				return false;
			}
			$("#errorFamilyInfoTxt").html("").hide();
	
			
			return true;
		}

		//家庭信息验证
		function checkInputText3(obj){
			obj = $(obj);
			var labelName = obj.attr("labelName");
			var word = $.trim(obj.val());
			if (word == ''){
				$("#errorFamilyInfoTxt").html(labelName + "不能为空!").show();
				return false;
			}
			if(labelName == "联系方式"){
				if(isNaN(word)){
					$("#errorFamilyInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			$("#errorFamilyInfoTxt").html("").hide();
			return true;
		}
		</script>
    </head>
<body>
			<form id="homeForm" method="post">
			    <input type="hidden" id="userId"  name="collarQuery.userId" value="<s:property value="getCurrentUser().userId" />" /> 
	                <!--家庭及紧急联系方式-->
	                    <p class="p_mian_title"><strong>家庭及紧急联系人信息</strong></p>
	                    <!--error窗口-->
	                    <div class="error-div error-span" style="display:none;" id="errorFamilyInfoTxt"></div>
	                    <p class="p_mian" style="margin-top:20px;">
	                    	<label>父亲姓名：</label><input type="text" id="fatherName" name="collarQuery.fatherName" value="<s:property value='collarQuery.fatherName'/>" labelName="父亲姓名" onblur="checkInputText3(this);"/>
	                    	联系方式：<input type="text" id="fatherPhone" name="collarQuery.fatherPhone" value="<s:property value='collarQuery.fatherPhone'/>" labelName="联系方式" onblur="checkInputText3(this);"/></p>
	                    <p class="p_mian">
	                    	<label>母亲姓名：</label><input type="text" id="motherName" name="collarQuery.motherName" value="<s:property value='collarQuery.motherName'/>" labelName="母亲姓名" onblur="checkInputText3(this);"/>
	                    	联系方式：<input type="text" id="motherPhone" name="collarQuery.motherPhone" value="<s:property value='collarQuery.motherPhone'/>" labelName="联系方式" onblur="checkInputText3(this);"/></p>
	                    <p class="p_mian">
	                    	<label>夫妻或儿女姓名：</label><input type="text" name="collarQuery.wifeName" value="<s:property value='collarQuery.wifeName'/>"/>
	                    	联系方式：<input type="text" name="collarQuery.wifePhone" value="<s:property value='collarQuery.wifePhone'/>" labelName="联系方式" onblur="checkInputText3(this);"/></p>
	                    <p class="p_mian">
	                    	<label>亲戚或朋友姓名：</label><input type="text" id="friendName" name="collarQuery.friendName" value="<s:property value='collarQuery.friendName'/>" labelName="亲戚或朋友姓名" onblur="checkInputText3(this);"/>
	                    	联系方式：<input type="text" id="friendPhone" name="collarQuery.friendPhone" value="<s:property value='collarQuery.friendPhone'/>" labelName="联系方式" onblur="checkInputText3(this);"/></p>
	                	<div style="float:right;margin:20px 50px 10px;">
							<a href="javascript:homeInfoSubmit();" class="btn-submit-a">提交</a>
						</div>
			</form>
</body></html>