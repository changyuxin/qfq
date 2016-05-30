<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	
	<title>我的亲分期 - 信用认证 - 紧急联系方式</title>
	<script type="text/javascript">
	
		$(function(){
			var isEcpOauth = '${memberQuery.isEcpOauth}';
			var ecpOauthOpinion = '${memberQuery.ecpOauthOpinion}';
			if(isEcpOauth == 4 && ecpOauthOpinion.length > 0){
				showMsg(ecpOauthOpinion);
			}
		});
	
		function validIdInfo(type){
			hideMsg();
			//紧急联系方式
			if(type == 4){
				
				if(!checkInputText($("#fatherName"))){
					return false;
				}
				
				if(!checkInputText($("#fatherPhone"))){
					return false;
				}
				
				if(!checkInputText($("#motherName"))){
					return false;
				}
				
				if(!checkInputText($("#motherPhone"))){
					return false;
				}
				
				var fatherPhone = $.trim($("#fatherPhone").val());
				var motherPhone = $.trim($("#motherPhone").val());
				var fatherName = $.trim($("#fatherName").val());
				var motherName = $.trim($("#motherName").val());
				var friendName = $.trim($("#friendName").val());
				var friendPhone = $.trim($("#friendPhone").val());
				
				if(fatherPhone == motherPhone){
					showMsg("父亲(母亲)和同学的电话号码不能一样");
					return false;
				}
				
				if(fatherName == motherName){
					showMsg("父亲(母亲)和同学的姓名不能一样");
					return false;
				}
				
				if(friendName == motherName){
					showMsg("同学的姓名和基础认证中同学姓名不能一样");
					return false;
				}
				if(friendPhone == motherPhone){
					showMsg("同学的电话号码和基础认证中同学电话号码不能一样");
					return false;
				}
				
				
				
			}
			
			return true;
		}
	
		//基础信息认证
		function nextstep(type){
			
			hideMsg();
			//var fatherName = $("#fatherName").val();
			//var fatherPhone = $("#fatherPhone").val();
			
			//var motherName = $("#motherName").val();
			//var motherPhone = $("#motherPhone").val();
			
			if(validIdInfo(type)){
				$.ajax( {
					type : "POST",
					data : $("#upgradeoauth").serializeArray(),
					url : "<%=basePath%>center/center!oauthIdInfo.do?oauthType=" + type,
					dataType: "json",
					error: function(request) {
		                layer.alert("紧急联系方式认证失败!");
			        },
					success : function(data) {
		           		if(type == 4){
			           		switch(data){
			           			case  0 : $("#ejs_baseAuth").load("center/center!idCardOauth.do"); break;
								case 1 : showMsg("父亲(母亲)电话不能为空"); break;
								case 2 : showMsg("父亲(母亲)电话位数不正确"); break;
								case 3 : showMsg("父亲(母亲)电话必须为数字"); break;
								case 4 : showMsg("父亲(母亲)电话号码不合法"); break;
								case 5 : showMsg("同学电话不能为空"); break;
								case 6 : showMsg("同学电话位数不正确"); break;
								case 7 : showMsg("同学电话必须为数字"); break;
								case 8 : showMsg("同学电话号码不合法"); break;
								case 9 : showMsg("父亲(母亲)姓名不能为空"); break;
								case 10 : showMsg("同学姓名不能为空"); break;
								case 11 : showMsg("父亲(母亲)和同学的姓名不能一样"); break;
								case 12 : showMsg("父亲(母亲)和同学的电话号码不能一样"); break;
								case -1 : showMsg("紧急联系方式认证失败"); break;
								default: break;
							}
		           		}
					}
				});
			}
		}
	
		//检测文本框输入
		function checkInputText(obj){
			hideMsg();
			obj = $(obj);
			var labelName = obj.attr("labelName");
			var word = $.trim(obj.val());
			if (word == ''){
				showMsg(labelName + "不能为空!");
				return false;
			}
			
			if(labelName.indexOf('电话') > -1){
				if(word.length > 11 || word.length < 11){
					showMsg(labelName + "手机号码位数不正确!");
					return false;
				}
				if(isNaN(word)){
					showMsg(labelName + "手机号码必须为数字!");
					return false;
				}
				if(!word.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/)){
					showMsg("手机号码不合法!");
					return false;
				}
			}
			
			hideMsg();
			return true;
		}
	
		function changeOauth(id){
			//var e = $("#" + id);
			if(id == "ecp_oauth"){
				//if($("#isEcpOauth").val() > 1){
					$("#idcard_oauth").removeClass("credit-title2").addClass("credit-title3");
					window.location.href = "<%=basePath%>center/center!upgradeOauthPage1.do";
				//} else {
				//	return;
				//}
			}
			if(id == "idcard_oauth"){
				if($("#isEcpOauth").val() > 1){
					$("#ejs_baseAuth").load("<%=basePath%>center/center!idCardOauth.do");
				} else {
					return;
				}
			}
		}
		
		function uploadIdPic(){
			$("#uploadForm").submit();
		}
		
		function showMsg(msg){
			$("#errorTxt").show().html(msg);
		}
		
		function hideMsg(){
			$("#errorTxt").hide().html("");
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
		<div class="my-Credit">
		    <p class="clearfix my-Credittitle">
		        <i class="inline-block"></i>
		        <span class="inline-block font1 font-size3">信用认证</span>
		        <span class="inline-block font3 right">&lt;<a href="center/credit.html">返回认证列表</a></span>
		        <input type="hidden" name="isEcpOauth" id="isEcpOauth" value="${memberQuery.isEcpOauth }"/>
		        <input type="hidden" name="isCardOauth" id="isCardOauth" value="${memberQuery.isCardOauth }"/>
		        <input type="hidden" name="friendName" id="friendName" value="${memberQuery.friendName }"/>
		        <input type="hidden" name="friendPhone" id="friendPhone" value="${memberQuery.friendPhone }"/>
		    </p>
    		<div id="ejs_baseAuth">
        		<div class="auth_container auth_container_higth">
            		<div class="mycredit-wrap div_a_higth">
            			<p class="mycreditwrap-tit font-size2 font1">额度提升认证1</p>
            			<div class="credit_contacts_title font-size2">
			                <p class="clearfix">
		                        <a href="javascript:changeOauth('ecp_oauth');" id="ecp_oauth" class="left block credit-title1 font-white">1、紧急联系方式</a>
		                        <a href="javascript:changeOauth('idcard_oauth');" id="idcard_oauth" class="left block credit-title3 font3">2、证件照认证</a>
			                </p>
			            </div>
                        <form id="upgradeoauth">
                        	<input type="hidden" name="memberQuery.memberId" id="memberId" value="${memberQuery.memberId}" />
         					<div class="credit_contacts" id="upgrade1">
               					<div class="credit_contacts_Box">
	                               	<div class="form-normal font-size0 ui-error">
		                        		<p class="error-p inline-block font-red contacts_p" id="errorTxt" style="display: none;"></p>
		                    		</div>
	                                <div class="response">
                                        <div>
                        					<label class="credit_contacts_lable">父亲(母亲)姓名:</label> 
                                            <input class="txt-normal" id="fatherName" name="memberQuery.parentName" labelName="父亲(母亲)姓名" placeholder="" type="text" value="${memberQuery.parentName }" onblur="checkInputText($('#fatherName'))" />
                                        </div>
                                        <div>
                        					<label class="credit_contacts_lable">父亲(母亲)电话:</label> 
                                            <input class="txt-normal" id="fatherPhone" name="memberQuery.parentPhone" labelName="父亲(母亲)电话" placeholder="" type="text" value="${memberQuery.parentPhone }" onblur="checkInputText($('#fatherPhone'))" />
                                        </div>
                                        <div>
                        					<label class="credit_contacts_lable">同学姓名:</label> 
                                            <input class="txt-normal" value="${memberQuery.motherName }" id="motherName" name="memberQuery.motherName" labelName="同学姓名" placeholder="" type="text" onblur="checkInputText($('#motherName'))"/>
                                        </div>
                                        <div>
                        					<label class="credit_contacts_lable">同学电话:</label> 
                                            <input class="txt-normal" value="${memberQuery.motherPhone }"  id="motherPhone" name="memberQuery.motherPhone" labelName="同学电话" placeholder="" type="text" onblur="checkInputText($('#motherPhone'))"/>
                                        </div>
                                	</div>
                       			</div>
                       		</div>
               			</form>
              		</div>
	              	<div class="a_mycredit_contacts">
			        	<label class="credit_contacts_lable"></label> 
		          		<a href="javascript:void(0);" class="common-btn-blue" onclick="nextstep(4)">下一步</a>
					</div>                     
				</div> 
           		<hr class="credit_contacts_hr"/>   
				<div class="mycredit-question inline-block" style="margin-top: 50px;">
					<h1 class="font-size3"><i class="inline-block font-white">Q</i>填写注意事项  </h1>
	                <div class="credit-ques font3 font-size2">
	                    <div><P>1）此步骤所填写的同学信息不能与基础认证所填写的同学信息相同；</P>
	                        <P>2）此步骤只要求填写父母任何一方信息即可；</P>
	                        <p style="color:#F00">3）资料一旦提交成功，即不能再做任何修改，烦请认真检查资料是否填写正确。〔附：联系人姓名要求真实、联系方式要求正确〕</p>
	                    </div>    
	                </div>
	            </div>
        	</div>
		</div>
	</div>
</div>
<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>