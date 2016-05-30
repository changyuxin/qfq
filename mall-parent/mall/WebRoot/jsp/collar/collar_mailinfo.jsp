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
			var mailProvince = '${collarQuery.mailProvince}';
			var mailCity = '${collarQuery.mailCity}';
			var mailDistrict = '${collarQuery.mailDistrict}';
			if(mailProvince != ''){
				$("#mailContact").distpicker({
					mailProvince: mailProvince,
					mailCity: mailCity,
					mailDistrict: mailDistrict
				 });
			} else {
				$("#mailContact").distpicker({
					autoSelect: false 
				});
			}
		});
		function mailInfoSubmit(){
			$(".error-span").html("");
			if(validateMailInfo(false)){
				$("#mailInfo").load("collar/collar!mailInfoImprove.do", $("#mailForm").serializeArray()).html(loading);
			}
		}
		function validateMailInfo(flag){
			//邮寄信息验证
			if(!checkInputText2("#mailProvince")){
				return false;
			}
			if(!checkInputText2("#mailCity")){
				return false;
			}
			if(!checkInputText2("#mailStreet")){
				return false;
			}
			if(!checkInputText2("#mailNeighborhood")){
				return false;
			}
			if(!checkInputText2("#mailBuilding")){
				return false;
			}
			if(!checkInputText2("#mailUnit")){
				return false;
			}
			if(!checkInputText2("#mailFloor")){
				return false;
			}
			if(!checkInputText2("#mailRoom")){
				return false;
			}
			if(!checkInputText2("#mailPhone")){
				return false;
			}
			if(!checkInputText2("#mailQQ")){
				return false;
			}
			if(!checkInputText2("#mailWeixin")){
				return false;
			}
			if(!checkInputText2("#mail")){
				return false;
			}
			$("#errorMailInfoTxt").html("").hide();
			return true;
		}
		//邮寄信息验证
		function checkInputText2(obj){
			obj = $(obj);
			var labelName = obj.attr("labelName");
			var word = $.trim(obj.val());
			if (word == ''){
				$("#errorMailInfoTxt").html(labelName + "不能为空!").show();
				return false;
			}
			if(labelName == "楼"){
				if(isNaN(word)){
					$("#errorMailInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "单元"){
				if(isNaN(word)){
					$("#errorMailInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "层"){
				if(isNaN(word)){
					$("#errorMailInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "室"){
				if(isNaN(word)){
					$("#errorMailInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "本人联系方式"){
				if(isNaN(word)){
					$("#errorMailInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			if(labelName == "QQ"){
				if(isNaN(word)){
					$("#errorMailInfoTxt").html(labelName + "必须为数字!").show();
					return false;
				}
			}
			$("#errorMailInfoTxt").html("").hide();
			return true;
		}
		
		</script>
    </head>
<body>
			<form id="mailForm" method="post">
			    <input type="hidden" id="userId"  name="collarQuery.userId" value="<s:property value="getCurrentUser().userId" />" /> 
	                <!--邮寄地址及联系方式-->
	                    <p class="p_mian_title"><strong>邮寄地址及联系方式</strong></p>
	                    <!--error窗口-->
	                    <div class="error-div error-span" style="display:none;" id="errorMailInfoTxt"></div>
	                    <div class="area-choose" id="mailContact">
		               		<p class="p_mian">
		                		<label>邮寄地址：</label>
	                    		<select id="mailProvince" name="collarQuery.mailProvince" class="area-form-control" style="width: 117px;" labelName="省" onblur="checkInputText2(this);"></select>&nbsp;&nbsp; 
								<select id="mailCity" name="collarQuery.mailCity" class="area-form-control" style="width: 117px;" labelName="市" onblur="checkInputText2(this);"></select>&nbsp;&nbsp;
	                        	<select id="mailDistrict" name="collarQuery.mailDistrict" class="area-form-control" style="width: 117px;" ></select>&nbsp;&nbsp;
		                        <input type="text" style="width:100px;" id="mailStreet" name="collarQuery.mailStreet" value="<s:property value='collarQuery.mailStreet'/>" labelName="街（路）" onblur="checkInputText2(this);"/>街（路）<br/>
                               	<label></label>
                               	<input type="text" style="margin-left:1px" id="mailNeighborhood" name="collarQuery.mailNeighborhood" value="<s:property value='collarQuery.mailNeighborhood'/>" labelName="小区" onblur="checkInputText2(this);"/>小区
                               	<input type="text" class="input_w_80" id="mailBuilding" name="collarQuery.mailBuilding" value="<s:property value='collarQuery.mailBuilding'/>" labelName="楼号" onblur="checkInputText2(this);"/>号楼
                               	<input type="text" class="input_w_80" id="mailUnit" name="collarQuery.mailUnit" value="<s:property value='collarQuery.mailUnit'/>" labelName="单元" onblur="checkInputText2(this);"/>单元
                               	<input type="text" class="input_w_80" id="mailFloor" name="collarQuery.mailFloor" value="<s:property value='collarQuery.mailFloor'/>" labelName="层" onblur="checkInputText2(this);"/>层
                               	<input type="text" class="input_w_80" id="mailRoom" name="collarQuery.mailRoom" value="<s:property value='collarQuery.mailRoom'/>" labelName="室" onblur="checkInputText2(this);"/>室
		                     </p>
		                 </div>
                        <p class="p_mian"><label>
                        	本人联系方式：</label><input  id="mailPhone" type="text" name="collarQuery.mailPhone" value="<s:property value='collarQuery.mailPhone'/>" labelName="本人联系方式" onblur="checkInputText2(this);"/>
                    	    QQ：<input type="text"  id="mailQQ" name="collarQuery.mailQQ" value="<s:property value='collarQuery.mailQQ'/>" labelName="QQ" onblur="checkInputText2(this);"/><br/>
							<label>微信：</label><input type="text" id="mailWeixin" name="collarQuery.mailWeixin" value="<s:property value='collarQuery.mailWeixin'/>" labelName="微信" onblur="checkInputText2(this);"/>
                            E-mail：<input type="text" style="width:150px;" id="mail" name="collarQuery.mail" value="<s:property value='collarQuery.mail'/>" labelName="e-mail" onblur="checkInputText2(this);"/>
            			</p>
            			<div style="float:right;margin:20px 50px 10px;">
							<a href="javascript:mailInfoSubmit();" class="btn-submit-a">提交</a>
						</div>
			</form>
<!--底部-->

</body></html>