<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="js/slide.door.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
	<title>亲分期  - 我的信用</title>
	<script type="text/javascript">
		$(function(){
			$("#oauth_ctnt").show();
			var isIdOauth = '${memberQuery.isIdOauth}';
			var idOauthOpinion = '${memberQuery.idOauthOpinion}';
			if(isIdOauth == 4 && idOauthOpinion.length > 0){
				showMsg(idOauthOpinion);
			}
			var certificationType = '${memberQuery.certificationType}';
			if(certificationType == '1'){
				tabchange($("#1"),'slide_first','d11-top','h_qian','h_hou');
			} else if(certificationType == '2'){
				tabchange($("#2"),'slide_first','d11-top','h_qian','h_hou');
			}
			
			var province = '${memberQuery.province}';
			var city = '${memberQuery.city}';
			var district = '${memberQuery.district}';
			if(province != ''){
				$(".area-choose").distpicker({
					province: province,
					city: city,
					district: district
				 });
			} else {
				$(".area-choose").distpicker({
					autoSelect: false 
				});
			}
			
			$("#province").val('${memberQuery.province}');
			$("#city").val('${memberQuery.city}');
			$("#district").val('${memberQuery.district}');
			
			$("#graduateYear").val('${memberQuery.graduateYear}');
			$("#graduateMonth").val('${memberQuery.graduateMonth}');
			
		});
	
	
		function changeOauth(id){
			var e = $("#" + id);
			if(id == "idcard"){
				window.location.href = "<%=basePath%>center/center!baseOauthPage.do";
			}
			if(id == "contact"){
				if($("#idOauth").val() > 1){
					e.removeClass("credit-title3").addClass("credit-title2");
					$("#oauth_ctnt").load("<%=basePath%>center/center!contactOauthPage.do");
				} else {
					return;
				}
			}
			if(id == "bkcard"){
				if($("#idOauth").val() > 1 && $("#contactOauth").val() > 1){
					$("#contact").removeClass("credit-title3").addClass("credit-title2");
					$("#bkcard").removeClass("credit-title3").addClass("credit-title2");
					$("#oauth_ctnt").load("<%=basePath%>center/center!bkcardOauthPage.do");
				} else {
					return;
				}
			}
		}
		
		function selectSchool(){
			layer.open({
			    type: 2,
			    title: "选择学校",
			    shadeClose: true,
			    shade: 0.3,
			    area: ["700px", "500px"],
			    content: "<%=basePath%>center/center!schools.do"
			});
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
			if(labelName == "身份证号码"){
				$.ajax( {
					type : "POST",
					url : "<%=basePath%>center/center!idCardValid.do?memberQuery.idCard=" + word,
					dataType: "json",
					error: function(request) {
		                layer.alert("身份证号码认证失败!");
			        },
					success : function(data) {
			           	if (data == 1) {
			           		return true;
			           	} else {
			           		showMsg("身份证号码输入不正确!");
			           		return false;
			           	} 
					}
				});
			}
			if(labelName == "验证码"){
				var bankPhone = $("#mobile").val();
				$.ajax( {
					type : "POST",
					url : "<%=basePath%>center/center!validCode.do?validCode=" + word + "&memberQuery.bankPhone=" + bankPhone,
					dataType: "json",
					error: function(request) {
		                layer.alert("出错啦!");
			        },
					success : function(data) {
			           	if (data == 1) {
			           		return true;
			           	} else {
			           		showMsg("验证码验证失败!");
			           		return false;
			           	} 
					}
				});
			}
			hideMsg();
			return true;
		}
		
		function validIdInfo(type){
			//身份学籍认证
			if(type == 1){
				// 姓名
				if(!checkInputText($("#realName"))){
					return false;
				}
				// 身份证号码
				if($.trim($("#cardId").val()) == ''){
					showMsg("身份证号码不能为空!");
					return false;
				}
				if($.trim($("#province").val()) == ''){
					showMsg("请选择省");
					return;
				}
				if($.trim($("#city").val()) == ''){
					showMsg("请选择市");
					return;
				}
				if($.trim($("#district").val()) == ''){
					showMsg("请选择区");
					return;
				}
				// 所在学校
				if(!checkInputText($("#schoolName"))){
					return false;
				}
				// 所在寝室
				if(!checkInputText($("#schoolBedroom"))){
					return false;
				}
				// 毕业年份
				if(!checkInputText($("#graduateYear"))){
					return false;
				}
				// 毕业月份
				if(!checkInputText($("#graduateMonth"))){
					return false;
				}
				// 学籍认证
				var certificationType = $("#certificationType").val();
				// 学信网认证
				if(certificationType == '1') {
					
					// 学信网账号
					if(!checkInputText($("#xxAccount"))){
						return false;
					}
					
					// 学信网密码
					if(!checkInputText($("#xxPassword"))){
						return false;
					}
				} else {
				    // 教务网认证
					// 教务网账号
					if(!checkInputText($("#jwAccount"))){
						return false;
					}
					// 教务网密码
					if(!checkInputText($("#jwPassword"))){
						return false;
					}
					// 教务网网址
					if(!checkInputText($("#jwUrl"))){
						return false;
					}
				}
				
			} else if(type == 2){
				// qq
				if(!checkInputText($("#qq"))){
					return false;
				}
				if(isNaN($("#qq").val())){
					showMsg("QQ号码必须为数字!");
					return false;
				}
				
				// 微信号
				if(!checkInputText($("#wechat"))){
					return false;
				}
				// 同学姓名
				if(!checkInputText($("#classMateName"))){
					return false;
				}
				// 同学手机号
				if(!checkInputText($("#classMateMobile"))){
					return false;
				}
				
				checkMobile("#classMateMobile", "#mobileStatus");
				
				if($("#mobileStatus").val() == 1){
					showMsg("手机号码不正确!");
					return false;
				}
				
				
			} else if(type == 3){

				// 银行卡客户姓名
				if(!checkInputText($("#bankCustomerName"))){
					return false;
				}
				// 身份证号码
				if($.trim($("#cardId").val()) == ''){
					showMsg("身份证号码不能为空!");
					return false;
				}
				// 银行卡号
				if(!checkInputText($("#bankCardNumber"))){
					return false;
				}
				
				// 银行预留手机号
				if(!checkInputText($("#mobile"))){
					return false;
				}
				
				checkMobile("#mobile", "#mobileStatus");
				
				if($("#mobileStatus").val() == 1){
					showMsg("手机号码不正确!");
					return false;
				}
				
				// 验证码
				if($.trim($("#validCode").val()) == ''){
					showMsg("验证码不能为空!");
					return false;
				}
			}
			return true;
		}
		
		function checkMobile(id, status){
			var mobile = $(id).val();
			if(mobile.length > 11 || mobile.length < 11){
				showMsg("手机号码位数不正确!");
				return false;
			}
			if(isNaN(mobile)){
				showMsg("手机号码必须为数字!");
				return false;
			}
			if(!mobile.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/)){
				showMsg("手机号码不合法!");
				return false;
			}
			$(status).val(2);
			return true;
		}
		
		function checkIsNaN(id, label){
			if(isNaN($(id).val())){
				showMsg(label + "必须为数字!");
				return;
			}
		}
		
		
		function showMsg(msg){
			$("#errorTxt").show().html(msg);
		}
		
		function hideMsg(){
			$("#errorTxt").hide().html("");
		}
		
		
		//基础信息认证
		function nextstep(type){
			var bankPhone = $("#mobile").val();
			var cardId = $("#cardId").val();
			var validCode = $("#validCode").val();
			if(validIdInfo(type)){
				$.ajax( {
					type : "POST",
					data : $("#baseoauth").serializeArray(),
					url : "<%=basePath%>center/center!oauthIdInfo.do?oauthType=" + type  + "&validCode=" + validCode,
					dataType: "json",
					error: function(request) {
		                showMsg("身份学籍认证失败!");
			        },
					success : function(data) {
			           	if (data == 0) {
			           		if(type == 1){ 
			           			$("#idOauth").val(2);
			           			changeOauth("contact")
			           		} else if(type == 2){
			           			$("#contactOauth").val(2);
			           			changeOauth("bkcard")
			           		} else if(type == 3){
			           			window.location.href = "<%=basePath%>center/center!credit.do";
			           		}
			           	} else if(data == 1){
			           		$("#errorTxt").show();
			           		$("#errorTxt").html("身份证号码输入不正确!");
			           	} else if(data == 2){
			           		$("#errorTxt").show();
			           		$("#errorTxt").html("验证码输入不正确!");
			           	} else if(data == 3){
			           		$("#errorTxt").show();
			           		$("#errorTxt").html("该身份证号码已被其他账号使用!");
			           	} else if(data == 4){
			           		$("#errorTxt").show();
			           		$("#errorTxt").html("该身份证号码与身份学籍认证中填写的身份证号不一致!");
			           	} else{
			           	    layer.alert("身份学籍认证失败!");
			           	}
					}
				});
			}
		}
		//获得验证码
		function getBandMobileCode(){
			hideMsg();
			var mobile = $.trim($("#mobile").val());
			if(mobile.length == 0){
				showMsg("银行预留手机号不能为空!");
				return false;
			}
			
			checkMobile("#mobile", "#mobileStatus");
			
			if($("#mobileStatus").val() == 1){
				showMsg("手机号码不正确!");
				return;
			}
			
			//每1秒执行
			var i = 0, s = 60;
			$("body").everyTime("1s", "A",function(){
				if(i == s){
					$("body").stopTime("A");
					$("#getCode").html("<a href='javascript: getBandMobileCode()'>获取验证码</a>");
				} else {
					$("#getCode").html("重新获取验证码(" + (s - i) + ")");
					i++;
				}
			});
			$.post("<%=basePath%>center/center!getBandMobileCode.do", {
				"memberQuery.bankPhone" : mobile,
				"timestamp" : new Date().getTime()
			}, function(data) {
				if (data.result == "FAILURE") {
					showMsg("短信验证码获取失败!");
				} else {
					showMsg("短信验证码已发送，请注意查收!");
				}
			}, "json");
				
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
		        <input type="hidden" name="idOauth" id="idOauth" value="${memberQuery.isIdOauth }"/>
		        <input type="hidden" name="contactOauth" id="contactOauth" value="${memberQuery.isContactOauth }"/>
		        <input type="hidden" name="bkcardOauth" id="bkcardOauth" value="${memberQuery.isBkcardOauth }"/>
		    </p>
   			<div id="ejs_baseAuth">
        		<div class="auth_container">
            		<div class="mycredit-wrap">
            			<p class="mycreditwrap-tit font-size2 font1">基础认证 （审核通过即享额度：<span class="font-red font-size4">￥500</span>）</p>
            			<div class="mycredit-title font-size2">
                			<p class="clearfix">
                        		<a href="javascript:changeOauth('idcard');" class="left block credit-title1 font-white" id="idcard">
                            		1.身份学籍认证
                        		</a>
                        		<a href="javascript:;" onclick="changeOauth('contact')" class="left block credit-title3" name="oauth" id="contact">
                            		2.联系方式
                            	</a>
                        		<a href="javascript:;" onclick="changeOauth('bkcard')" class="left block credit-title3" name="oauth" id="bkcard">
                            		3.银行卡认证
                            	</a>
                			</p>
            			</div>
            			<form id="baseoauth">
            			<input type="hidden" name="memberQuery.memberId" id="memberId" value="${memberQuery.memberId}"/>
	            			<div id="oauth_ctnt" style="display: none;">
		                        <div class="mycredit-form inline-block" id="baseInfoForm">
		                    		<div class="form-normal font-size0 ui-error">
		                        		<label class="label"></label>
		                        		<p class="error-p inline-block font-red card_width" id="errorTxt" style="display: none;"></p>
		                    		</div>
		                    		<div class="form-normal font-size2">
		                        		<label class="label ">姓名:</label>
		                        		<input class="txt-normal" id="realName" name="memberQuery.trueName" labelName="姓名" data-check="yes" data-exp="void-r" placeholder="请填写本人身份证姓名" type="text" value="${memberQuery.trueName}" onblur="checkInputText(this);" />
		                    		</div>
				                    <div class="form-normal font-size2 ">
				                        <label class="label">身份证号码:</label>
				                        <input class="txt-normal" id="cardId" name="memberQuery.idCard" labelName="身份证号码" data-exp="void-c" placeholder="请填写本人身份证号码" type="text" value="${memberQuery.idCard}" onblur="checkInputText(this);"/>
				                    </div>
				                    <div class="area-choose">
										<p>
											<label style=" margin-right: 33px;">学校所在地区:</label>
											<select id="province" name="memberQuery.province" class="area-form-control" style="width: 117px;"></select>&nbsp; 
											<select id="city" name="memberQuery.city" class="area-form-control" style="width: 117px;"></select>&nbsp;
											<select id="district" name="memberQuery.district"  class="area-form-control" style="width: 117px;"></select>&nbsp;
										</p>
									</div>
				                    <div class="form-normal font-size2 ">
				                        <label class="label">所在学校:</label>
				                        <input id="schoolId"  type="hidden" />
				                        <input class="txt-normal card_width" style="cursor: pointer;" placeholder="点击选择学校" labelName="所在学校" id="schoolName" value="${memberQuery.school}" name="memberQuery.school" readonly onclick="selectSchool()" />
				                    </div>
				                    <div class="form-normal font-size2">
				                        <label class="label">所在寝室:</label> 
				                        <input class="txt-normal card_width" placeholder="详细填写寝室，包含校区、寝室号" labelName="所在寝室" id="schoolBedroom" value="${memberQuery.schoolBedroom}" name="memberQuery.schoolBedroom" />
				                    </div>
				                    <div class="form-normal font-size2">
				                        <label class="label">毕业年月:</label>
				                        <select id="graduateYear" class="select-short" name="memberQuery.graduateYear">
				                        	<option>请选择</option>
				                            <option>2016</option>
				                            <option>2017</option>
				                            <option>2018</option>
				                            <option>2019</option>
				                            <option>2020</option>
				                            <option>2021</option>
				                            <option>2022</option>
				                            <option>2023</option>
				                            <option>2024</option>
				                            <option>2025</option>
				                            <option>2026</option>
				                            <option>2027</option>
				                        </select>
				                        <select id="graduateMonth" class="select-short" style="margin-left:12px;" name="memberQuery.graduateMonth">
				                            <option>请选择</option>
				                            <option>02</option>
				                            <option>03</option>
				                            <option>06</option>
				                            <option>07</option>
				                        </select>
				                    </div>
				                    <div class="form-normal font-size2 ">
		                        		<label class="label school-float">学籍认证:</label>
				                    	<div class="slide_first">
				                            <div class="slideTxtBox">
				                            <input type="hidden" id="certificationType" name="memberQuery.certificationType" value="${memberQuery.certificationType}"/>
				                                <div class="hd">
				                                    <ul>
				                                        <li id="1" class="h_hou" onclick="tabchange(this,'slide_first','d11-top','h_qian','h_hou')">学信网信息</li>
				                                        <!--  
				                                        <li id="2" class="h_qian" onClick="tabchange(this,'slide_first','d11-top','h_qian','h_hou')">教务网认证</li>
				                                        -->
				                                    </ul>
				                                </div>
				                                <div class="bd">
				                                    <div class="d11-top">  
				                                        <div>
				                        					<label class="label">学信网账号:</label> 
				                                            <input class="txt-normal school-width" id="xxAccount" placeholder="学信网账号" labelName="学信网账号" type="text" name="memberQuery.xxAccount" value="${memberQuery.xxAccount}" onblur="checkInputText(this);"/>
				                                        </div>
				                                        <div>
				                        					<label class="label">学信网密码:</label> 
				                                            <input class="txt-normal school-width" id="xxPassword" placeholder="学信网密码" labelName="学信网密码" type="text" name="memberQuery.xxPassword" value="${memberQuery.xxPassword}" onblur="checkInputText(this);"/>
				                                        </div>
				                                    </div>
				                                    <!--  
				                                    <div class="d11-top" style="display: none;">
				                                        <div>
				                        					<label class="label">教务网账号:</label> 
				                                            <input class="txt-normal school-width" id="jwAccount" placeholder="教务网账号" labelName="教务网账号" type="text" name="memberQuery.jwAccount" value="${memberQuery.jwAccount}" onblur="checkInputText(this);"/>
				                                        </div>
				                                        <div>
				                        					<label class="label">教务网密码:</label> 
				                                            <input class="txt-normal school-width" id="jwPassword" placeholder="教务网密码" labelName="教务网密码" type="text" name="memberQuery.jwPassword" value="${memberQuery.jwPassword}" onblur="checkInputText(this);"/>
				                                        </div>
				                                        <div>
				                        					<label class="label">教务网网址:</label> 
				                                            <input class="txt-normal school-width" id="jwUrl" placeholder="教务网网址，请填写完整网址，包括http://" labelName="教务网网址" type="text" name="memberQuery.jwUrl" value="${memberQuery.jwUrl}" onblur="checkInputText(this);"/>
				                                        </div>                                          
				                                    </div>
				                                    -->
				                                </div>
				                            </div>
				    					</div>
				                    </div>
		                    		<div class="form-normal ">
				                        <label class="label"></label>
		                        		<input type="button" class=" btn-blue btn-h1 btn-noborder font-white" value="我已如实填写，下一步" onclick="nextstep(1)"/>
		                    		</div>
		                    		<!--  
				                    <div class="form-normal none" id="message">
				                        <p class="font-red font-size0 error-p inline-block error_red_p">
				                        	学籍认证失败，请检查个人信息，您还有<span>1</span>次机会
				                        </p>
				                	</div>
				                	-->
		                		</div>
		                		
		            			<div class="mycredit-question inline-block">
					                <h1 class="font-size3">
					                    <i class="inline-block font-white">Q</i>学籍身份认证常见问题：
					                </h1>
			                		<div class="credit-ques font3 font-size2">
					                    <p><strong>为什么我没有认证通过？</strong></p>
					                    <p>认证失败常由于以下原因造成：</p>
					                    <div>
					                        <p>1）姓名和身份证不真实；学籍不存在</p>
					                        <p>2）由于分期政策限制，2015年12月以前毕业的学生不支持申请。</p>
					                        <p>3）由于物流限制，不支持新疆和西藏的同学申请</p>
					                        <p>4）暂不支持学校为网络学校和成人教育院校和 3 + 2 院校的同学申请</p>
					                        <h2 class="font-red font-size0"><strong>*每人仅有三次认证机会，请务必真实填写</strong></h2>
					                    </div>
			                		</div>
		            			</div>
		            			
	        				</div>
        				</form>
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