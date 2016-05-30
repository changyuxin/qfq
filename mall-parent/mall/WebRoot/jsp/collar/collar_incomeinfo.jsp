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
		function incomeInfoSubmit(){
			$(".error-span").html("");
			if(validateIncomeInfo(false)){
				$("#incomeInfo").load("collar/collar!incomeInfoImprove.do", $("#incomeForm").serializeArray()).html(loading);
			}
		}
		function validateIncomeInfo(flag){
			//家庭收入验证
			if(!checkInputText4("#educationLevel")){
				return false;
			}
			if(!checkInputText4("#familyIncome")){
				return false;
			}
			if(!checkInputText4("#workingMonth")){
				return false;
			}
			if(!checkInputText4("#workingYearNow")){
				return false;
			}
			if(!checkInputText4("#monthIncome")){
				return false;
			}
			if(!checkInputText4("#socialSecurityStatus")){
				return false;
			}
			if(!checkInputText4("#housingStatus")){
				return false;
			}
			if(!checkInputText4("#monthSpends")){
				return false;
			}
			if(!checkInputText4("#guaranteeName")){
				return false;
			}
			if(!checkInputText4("#guaranteePhone")){
				return false;
			}
			$("#errorIncomeInfoTxt").html("").hide();
			
			return true;
		}
		//家庭收入信息
		function checkInputText4(obj){
			obj = $(obj);
			var labelName = obj.attr("labelName");
			var word = $.trim(obj.val());
			if (word == ''){
				$("#errorIncomeInfoTxt").html(labelName + "不能为空!").show();
				return false;
			}
			if(labelName == "家庭收入"){
				if(isNaN(word)){
					$("#errorIncomeInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "总工作时间"){
				if(isNaN(word)){
					$("#errorIncomeInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "个人月收入"){
				if(isNaN(word)){
					$("#errorIncomeInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "每月生活支出额度"){
				if(isNaN(word)){
					$("#errorIncomeInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "联系人电话"){
				if(isNaN(word)){
					$("#errorIncomeInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			$("#errorIncomeInfoTxt").html("").hide();
			return true;
		}
		</script>
    </head>
<body>
			<form id="incomeForm" method="post">
			    <input type="hidden" id="userId"  name="collarQuery.userId" value="<s:property value="getCurrentUser().userId" />" /> 
	                <!--收入及其他信息-->
	                    <p class="p_mian_title"><strong>收入及其他信息</strong></p>
	                    <!--error窗口-->
	                    <div class="error-div error-span" style="display:none;" id="errorIncomeInfoTxt"></div>
	                    <p class="p_mian" style="margin-top:20px;">
	                    	<label>教育程度：</label>
			 				<select class="input_w_80" id="educationLevel" name="collarQuery.educationLevel" labelName="教育程度" onblur="checkInputText4(this);">
                           		<option value="">请选择</option>
                          		<option value="1" <s:if test="collarQuery.educationLevel == 1"> selected="selected"</s:if>>中学</option>
                            	<option value="2" <s:if test="collarQuery.educationLevel == 2"> selected="selected"</s:if>>高中</option>
                           		<option value="3" <s:if test="collarQuery.educationLevel == 3"> selected="selected"</s:if>>专科</option>
                            	<option value="4" <s:if test="collarQuery.educationLevel == 4"> selected="selected"</s:if>>本科</option>
                           		<option value="5" <s:if test="collarQuery.educationLevel== 5"> selected="selected"</s:if>>研究生</option>
                              	<option value="6" <s:if test="collarQuery.educationLevel == 6"> selected="selected"</s:if>>博士</option>
                       		</select>
	                    	家庭收入：¥
	                    	<s:if test="collarQuery.familyIncome == 0">
								<input type="text" class="input_w_80" id="familyIncome" name="collarQuery.familyIncome" value="" labelName="家庭收入" onblur="checkInputText4(this);"/>
							</s:if>
							<s:else>
								<input type="text" class="input_w_80" id="familyIncome" name="collarQuery.familyIncome" value="<s:property value='collarQuery.familyIncome'/>" labelName="家庭收入" onblur="checkInputText4(this);"/>
							</s:else>
	                    	</p>
	                        <p class="p_mian">
	                        	<label>总工作时间：</label>
	                        		<s:if test="collarQuery.workingMonth == 0">
										<input type="text" class="input_w_80" id="workingMonth" name="collarQuery.workingMonth" value="" labelName="总工作时间" onblur="checkInputText4(this);"/>
									</s:if>
									<s:else>
										<input type="text" class="input_w_80"  id="workingMonth" name="collarQuery.workingMonth" value="<s:property value='collarQuery.workingMonth'/>" labelName="总工作时间" onblur="checkInputText4(this);"/>
									</s:else>
	                        		（月）
	                    			现单位工作时间：
	                    			<select class="input_w_80" id="workingYearNow" name="collarQuery.workingYearNow" labelName="现单位工作时间" onblur="checkInputText4(this);">
	                                    <option value="">请选择</option>
	                                    <option value="1" <s:if test="collarQuery.workingYearNow == 1"> selected="selected"</s:if>>一年以内</option>
	                                    <option value="2" <s:if test="collarQuery.workingYearNow == 2"> selected="selected"</s:if>>一年</option>
	                                    <option value="3" <s:if test="collarQuery.workingYearNow == 3"> selected="selected"</s:if>>两年</option>
	                                    <option value="4" <s:if test="collarQuery.workingYearNow == 4"> selected="selected"</s:if>>三年</option>
	                                    <option value="5" <s:if test="collarQuery.workingYearNow == 5"> selected="selected"</s:if>>四年</option>
	                                    <option value="6" <s:if test="collarQuery.workingYearNow == 6"> selected="selected"</s:if>>五年</option>
	                                    <option value="7" <s:if test="collarQuery.workingYearNow == 7"> selected="selected"</s:if>>六年</option>
	                                    <option value="8" <s:if test="collarQuery.workingYearNow == 8"> selected="selected"</s:if>>七年</option>
	                                    <option value="9" <s:if test="collarQuery.workingYearNow== 9"> selected="selected"</s:if>>八年</option>
	                                    <option value="10" <s:if test="collarQuery.workingYearNow == 10"> selected="selected"</s:if>>九年</option>
	                                    <option value="11" <s:if test="collarQuery.workingYearNow == 11"> selected="selected"</s:if>>十年</option>
	                                    <option value="12" <s:if test="collarQuery.workingYearNow == 12"> selected="selected"</s:if>>十年以上</option>
	                        		</select>
	                        	</p>
	                       <p class="p_mian">
	                       		<label>个人月收入：</label>¥
                       			<s:if test="collarQuery.monthIncome == 0">
									<input type="text" class="input_w_80" id="monthIncome" name="collarQuery.monthIncome" value=""  labelName="个人月收入" onblur="checkInputText4(this);"/>
								</s:if>
								<s:else>
									<input type="text" class="input_w_80" id="monthIncome" name="collarQuery.monthIncome" value="<s:property value='collarQuery.monthIncome'/>" labelName="个人月收入" onblur="checkInputText4(this);"/>
								</s:else>
								每月生活支出额度：¥
                                <s:if test="collarQuery.monthSpends == 0">
									<input type="text" class="input_w_80" id="monthSpends" name="collarQuery.monthSpends" value="" labelName="每月生活支出额度" onblur="checkInputText4(this);"/>
								</s:if>
								<s:else>
									<input type="text" class="input_w_80" id="monthSpends" name="collarQuery.monthSpends" value="<s:property value='collarQuery.monthSpends'/>" labelName="每月生活支出额度" onblur="checkInputText4(this);"/>
								</s:else>
                    			 是否有社保：
                    			<select class="input_w_80" id="socialSecurityStatus" name="collarQuery.socialSecurityStatus" labelName="社保状态" onblur="checkInputText4(this);">
                                    <option value="">请选择</option>
                                    <option value="1" <s:if test="collarQuery.socialSecurityStatus == 1"> selected="selected"</s:if>>是</option>
                                    <option value="2" <s:if test="collarQuery.socialSecurityStatus == 2"> selected="selected"</s:if>>否</option>
                               	</select>
     							是否有住房：
                              	<select class="input_w_80" id="housingStatus" name="collarQuery.housingStatus" labelName="住房状态" onblur="checkInputText4(this);">
                                    <option value="">请选择</option>
                                    <option value="1" <s:if test="collarQuery.housingStatus == 1"> selected="selected"</s:if>>是</option>
                                    <option value="2" <s:if test="collarQuery.housingStatus == 2"> selected="selected"</s:if>>否</option>
                             	</select>
	                 		</p>
	                    	<p class="p_mian"><label>
	                    		其他（担保人）联系人姓名：</label><input type="text" id="guaranteeName" name="collarQuery.guaranteeName" value="<s:property value='collarQuery.guaranteeName'/>" labelName="其他（担保人）联系人姓名" onblur="checkInputText4(this);"/>
	                    		联系人电话：<input type="text" id="guaranteePhone" name="collarQuery.guaranteePhone" value="<s:property value='collarQuery.guaranteePhone'/>" labelName="联系人电话" onblur="checkInputText4(this);"/></p>
	                     	<div style="float:right;margin:20px 50px 10px;">
								<a href="javascript:incomeInfoSubmit();" class="btn-submit-a">提交</a>
							</div>	
			</form>

</body></html>