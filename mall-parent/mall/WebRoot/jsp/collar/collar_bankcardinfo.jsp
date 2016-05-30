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
		function bankcardInfoSubmit(){
			$(".error-span").html("");
			if(validateBankcardInfo(false)){
				$("#bankcardInfo").load("collar/collar!bankInfoImprove.do", $("#bankcardForm").serializeArray()).html(loading);
			}
		}
		function validateBankcardInfo(flag){
			//银行开户信息
			if(!checkInputText5("#bankCard")){
				return false;
			}
			if(!checkInputText5("#bankCardName")){
				return false;
			}
			if(!checkInputText5("#bankCardId")){
				return false;
			}
			$("#errorBankInfoTxt").html("").hide();
	
			
			return true;
		}

		//开户信息
		function checkInputText5(obj){
			obj = $(obj);
			var labelName = obj.attr("labelName");
			var word = $.trim(obj.val());
			if (word == ''){
				$("#errorBankInfoTxt").html(labelName + "不能为空!").show();
				return false;
			}
			if(labelName == "账号"){
				if(isNaN(word)){
					$("#errorBankInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			$("#errorBankInfoTxt").html("").hide();
			return true;
		}
		</script>
    </head>
<body>
			<form id="bankcardForm" method="post">
			    <input type="hidden" id="userId"  name="collarQuery.userId" value="<s:property value="getCurrentUser().userId" />" /> 
	                <!--银行卡信息-->
	                    <p class="p_mian_title"><strong>银行卡信息</strong></p>
	                    <!--error窗口-->
	                    <div class="error-div error-span" style="display:none;" id="errorBankInfoTxt"></div>
	                    <p class="p_mian" style="margin-top:20px;"><label>银行卡开户行：</label>
	    					<select style="width:200px;" id="bankCard" name="collarQuery.bankCard" labelName="银行卡开户行" onblur="checkInputText5(this);">
	                        	<option value="">请选择</option>
	    						<option value="ICBC" <s:if test="collarQuery.bankCard == 'ICBC'"> selected="selected"</s:if>>工商银行</option>
	                            <option value="ABC" <s:if test="collarQuery.bankCard == 'ABC'"> selected="selected"</s:if>>农业银行</option>
	                            <option value="BOC" <s:if test="collarQuery.bankCard == 'BOC'"> selected="selected"</s:if>>中国银行</option>
	                            <option value="CCB" <s:if test="collarQuery.bankCard == 'CCB'"> selected="selected"</s:if>>建设银行</option>
	                            <option value="CMBCHINA" <s:if test="collarQuery.bankCard == 'CMBCHINA'"> selected="selected"</s:if>>招商银行</option>
	                            <option value="SPDB" <s:if test="collarQuery.bankCard == 'SPDB'"> selected="selected"</s:if>>浦发银行</option>
	                            <option value="CIB" <s:if test="collarQuery.bankCard == 'CIB'"> selected="selected"</s:if>>兴业银行</option>
	                            <option value="CEB" <s:if test="collarQuery.bankCard == 'CEB'"> selected="selected"</s:if>>光大银行</option>
	                            <option value="GDB" <s:if test="collarQuery.bankCard == 'GDB'"> selected="selected"</s:if>>广发银行</option>
	                            <option value="PINGAN" <s:if test="collarQuery.bankCard == 'PINGAN'"> selected="selected"</s:if>>平安银行</option>
	                            <option value="HXB" <s:if test="collarQuery.bankCard == 'HXB'"> selected="selected"</s:if>>华夏银行</option>
	                            <option value="CMBC" <s:if test="collarQuery.bankCard == 'CMBC'"> selected="selected"</s:if>>民生银行</option>
	                            <option value="SHB" <s:if test="collarQuery.bankCard == 'SHB'"> selected="selected"</s:if>>上海银行</option>
	                            <option value="ECITIC" <s:if test="collarQuery.bankCard == 'ECITIC'"> selected="selected"</s:if>>中信银行</option>
	                            <option value="BOCO" <s:if test="collarQuery.bankCard == 'BOCO'"> selected="selected"</s:if>>交通银行</option>
	                            <option value="POST" <s:if test="collarQuery.bankCard == 'POST'"> selected="selected"</s:if>>邮政储蓄银行</option>
	    					</select>
	    				</p>
	                    <p class="p_mian">
	                    	<label>开户姓名：</label><input type="text" id="bankCardName" name="collarQuery.bankCardName" value="<s:property value='collarQuery.bankCardName'/>" labelName="开户姓名" onblur="checkInputText5(this);"/>
	                    	 账号：<input type="text" style="width:250px" id="bankCardId" name="collarQuery.bankCardId" value="<s:property value='collarQuery.bankCardId'/>" labelName="账号" onblur="checkInputText5(this);"/></p>
	               			<div style="float:right;margin:20px 50px 10px;">
								<a href="javascript:bankcardInfoSubmit();" class="btn-submit-a">提交</a>
							</div>	
			</form>

</body></html>