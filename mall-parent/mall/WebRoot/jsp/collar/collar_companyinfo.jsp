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
		function companyInfoSubmit(){
			$(".error-span").html("");
			if(validateCommanyInfo(false)){
				$("#companyInfo").load("collar/collar!companyInfoImprove.do", $("#companyForm").serializeArray()).html(loading);
			}
		}
		function validateCommanyInfo(flag){
			//工作单位信息
			if(!checkInputText1("#companyName")){
				return false;
			}
			if(!checkInputText1("#companyType")){
				return false;
			}
			if(!checkInputText1("#department")){
				return false;
			}
			if(!checkInputText1("#post")){
				return false;
			}
			if(!checkInputText1("#companyAddress")){
				return false;
			}
			if(!checkInputText1("#companyContactPerson")){
				return false;
			}
			if(!checkInputText1("#companyfixedTelephone")){
				return false;
			}
			if(!checkInputText1("#companyPhone")){
				return false;
			}
			$("#errorCompanyInfoTxt").html("").hide();
			
			return true;
		}
		//单位信息验证
		function checkInputText1(obj){
			obj = $(obj);
			var labelName = obj.attr("labelName");
			var word = $.trim(obj.val());
			if (word == ''){
				$("#errorCompanyInfoTxt").html(labelName + "不能为空!").show();
				return false;
			}
			if(labelName == "手机"){
				if(word.length > 11 || word.length < 11){
					$("#errorCompanyInfoTxt").html(labelName + "位数不正确!").show();
					return false;
				}
				if(isNaN(word)){
					$("#errorCompanyInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
				if(!word.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/)){
					$("#errorCompanyInfoTxt").html(labelName + "不合法!").show();
					return false;
				}
			}
			if(labelName == "固定电话"){
				if(isNaN(word)){
					$("#errorCompanyInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			$("#errorCompanyInfoTxt").html("").hide();
			return true;
		}
		</script>
    </head>
<body>
			<form id="companyForm" method="post">
			    <input type="hidden" id="userId"  name="collarQuery.userId" value="<s:property value="getCurrentUser().userId" />" /> 
	                <!--单位信息-->
	                    <p class="p_mian_title"><strong>工作单位信息</strong></p>
	                    <!--error窗口-->
	                    <div class="error-div error-span" style="display:none;" id="errorCompanyInfoTxt"></div>
	                    <p class="p_mian" style="margin-top:20px;">
	                    	<label>单位名称：</label><input type="text" style="width:300px" id="companyName" name="collarQuery.companyName" value="<s:property value='collarQuery.companyName'/>" labelName="单位名称" onblur="checkInputText1(this);"/>
                    		 单位性质：
                    		<select style="width:150px;" id="companyType" name="collarQuery.companyType" labelName="单位性质" onblur="checkInputText1(this);">
                      			<option value="">请选择</option>
                      			<option value="1" <s:if test="collarQuery.companyType== 1"> selected="selected"</s:if>>外商独资/外企办事处</option>
                               	<option value="2" <s:if test="collarQuery.companyType == 2"> selected="selected"</s:if>>中外合营（合资/合作）</option>
                               	<option value="3" <s:if test="collarQuery.companyType == 3"> selected="selected"</s:if>>私营/民营企业</option>
                               	<option value="4" <s:if test="collarQuery.companyType == 4"> selected="selected"</s:if>>国有企业</option>
                               	<option value="5" <s:if test="collarQuery.companyType == 5"> selected="selected"</s:if>>国内上市公司</option>
                               	<option value="6" <s:if test="collarQuery.companyType == 6"> selected="selected"</s:if>>政府机关/非盈利机构</option>
                               	<option value="7" <s:if test="collarQuery.companyType == 7"> selected="selected"</s:if>>事业单位</option>
                               	<option value="8" <s:if test="collarQuery.companyType == 8"> selected="selected"</s:if>>其他</option>
                       		</select>
	                    </p>
	                    <p class="p_mian">
	                    	<label>所在部门：</label><input type="text" id="department" class="input_w_80" name="collarQuery.department" value="<s:property value='collarQuery.department'/>" labelName="所在部门" onblur="checkInputText1(this);"/>
	                    	职务：<input type="text" class="input_w_80" id="post" name="collarQuery.post" value="<s:property value='collarQuery.post'/>" labelName="职务" onblur="checkInputText1(this);"/></p>
	                    <p class="p_mian">
	                    	<label>单位地址：</label><input type="text" id="companyAddress" style="width:400px" name="collarQuery.companyAddress" value="<s:property value='collarQuery.companyAddress'/>" labelName="单位地址" onblur="checkInputText1(this);"/>
	                   		单位电话：<input type="text" style="width:150px" id="companyfixedTelephone" name="collarQuery.companyfixedTelephone" value="<s:property value='collarQuery.companyfixedTelephone'/>" labelName="固定电话" onblur="checkInputText1(this);"/>
	                    </p>
	                    <p class="p_mian">
	                    	<label>同事姓名：</label><input type="text" id="companyContactPerson" class="input_w_80" name="collarQuery.companyContactPerson" value="<s:property value='collarQuery.companyContactPerson'/>" labelName="联系人" onblur="checkInputText1(this);"/>
							同事手机：<input type="text" style="width:150px" id="companyPhone" name="collarQuery.companyPhone" value="<s:property value='collarQuery.companyPhone'/>" labelName="手机" onblur="checkInputText1(this);"/>
						</p>
						<div style="float:right;margin:20px 50px 10px;">
							<a href="javascript:companyInfoSubmit();" class="btn-submit-a">提交</a>
						</div>
			</form>
		

</body></html>