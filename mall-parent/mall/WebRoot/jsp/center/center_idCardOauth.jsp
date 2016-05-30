<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.uploadPreview.js" ></script>
	<style type="text/css">
		.img_w_h{max-width:250px; max-height:150px;}
	</style>
	<title>我的亲分期 - 信用认证 - 证件照认证</title>
	<script type="text/javascript">
	
		$(function(){
			var errorCode = '${errorCode}';
			if(errorCode != 0){
				layer.alert("上传失败");
			}
			new uploadPreview({ UpBtn: "upload1", DivShow: "card_front", ImgShow: "card_f" });
			new uploadPreview({ UpBtn: "upload2", DivShow: "card_back", ImgShow: "card_b" });
			new uploadPreview({ UpBtn: "upload3", DivShow: "card_stu", ImgShow: "card_s" });
			new uploadPreview({ UpBtn: "upload4", DivShow: "card_stu2", ImgShow: "card_s2" });
			new uploadPreview({ UpBtn: "upload5", DivShow: "card_an", ImgShow: "card_a" });
			new uploadPreview({ UpBtn: "upload61", DivShow: "card_s611", ImgShow: "card_s61" });
			
			var isCardOauth = '${memberQuery.isCardOauth}';
			var cardOauthOpinion = '${memberQuery.cardOauthOpinion}';
			if(isCardOauth == 4 && cardOauthOpinion.length > 0){
				showMsg(cardOauthOpinion);
			}
			
		});
		
		function showMsg(msg){
			$("#errorTxt").html(msg).show();
		}
		
		
		function uploadImg(){
			
			var upload1 = $("#upload1").val();
			var upload2 = $("#upload2").val();
			var upload1_1 = $("#upload1_1").val();
			var upload2_1 = $("#upload2_1").val();
			if(upload1.length == 0 || upload2.length == 0){
				if(upload1_1.length == 0 || upload2_1.length == 0){
					layer.alert("请上传身份证");
					return;
				}
			} else {
				if(!checkImg("身份证", upload1)){
					return;
				}
				
				if(!checkImg("身份证", upload2)){
					return;
				}
			}
			
			var upload3 = $("#upload3").val();
			var upload3_1 = $("#upload3_1").val(); 
			var upload4 = $("#upload4").val();
			var upload4_1 = $("#upload4_1").val();
			if(upload3.length == 0 && upload4.length == 0){
				if(upload3_1.length == 0 && upload4_1.length == 0){
					layer.alert("请上传学生证");
					return;
				}
			} else {
				if(!checkImg("学生证", upload3)){
					return;
				}
				
			}
			
			var upload5 = $("#upload5").val();
			var upload5_1 = $("#upload5_1").val();
			if(upload5.length == 0){
				if(upload5_1.length == 0){
					layer.alert("请上传声明合照");
					return;
				}
			} else {
				if(!checkImg("声明合照", upload5)){
					return;
				}
			}
			
			if(upload1.length == 0 && upload2.length == 0 && (upload3.length == 0 || upload4.length == 0) && upload5.length == 0){
				//layer.alert("没有新文件需要重新上传");
				//return;
				window.location.href = "<%=basePath%>center/credit.html";
				return;
			}
			
			if(upload1_1.length != 0 && upload2_1.length != 0 && (upload3_1.length != 0 || upload4_1.length != 0) && upload5_1.length != 0){
				if(upload1.length == 0 || upload2.length == 0 || upload3.length == 0 || (upload4_1.length != 0 && upload4.length == 0) || upload5.length == 0){
					layer.alert("所有证件都需要重新上传一遍");
					return;
				}
			}
			
			var otherPhotoLength = $("#othersPhotoListSize").val();
			if(otherPhotoLength > 0){
				if(!confirm("您上传过补充资料，是否舍弃之前的资料，如果是请点击确定，否则请点击取消")){
					layer.alert("请重新上传之前所有的补充资料");
					return;
				}
			}
			
			$("#uploadForm").submit();
		}
		
		function checkImg(name, upload){
			var strs = new Array();
			strs = upload.split(".");
			var suffix = strs[strs.length - 1];
			//if(	suffix.toLowerCase() != "jpg" 
			//	&& suffix.toLowerCase() != "png"  
			//	&& suffix.toLowerCase() != "gif"
			//	&& suffix.toLowerCase() != "bmp"
			//	&& suffix.toLowerCase() != "jpeg"){
			//	layer.alert("上传的" + name + "不是图片格式");
			//	return false;
			//}
			
			return true;
		}
		
		function uploadImgButton(id){
			$("#" + id).click();
		}
		
		//附加材料增加
		var num = 1;
		function addSupplementUpload(){
			var newNum = ++num;
			var str = '<div id="card6" class="upload-img-div">' +
						'<div class="smallImg" id="card_s61' + newNum + '"' +  '>' + 
							'<img id="card_s6' + newNum + '"' +  ' class="img_w_h" />' + 
					  	'</div>' +
						'<input id="upload6' + newNum + '"' +  ' type="file" name="supplementUpload"/>' + 
					  '</div>';
			$(str).insertBefore($("#divAppend"));
			new uploadPreview({ UpBtn: "upload6"+ newNum, DivShow: "card_s61"+ newNum, ImgShow: "card_s6"+ newNum });
		}
	</script>
</head>
<body>
	<div class="auth_container">
		<div class="mycredit-wrap">
			<p class="mycreditwrap-tit font-size2 font1">额度提升认证1</p>
        	<div class="credit_contacts_title font-size2">
	            <p class="clearfix">
	            	<a href="javascript:changeOauth('ecp_oauth');" id="ecp_oauth" class="left block credit-title2 font-white">1、紧急联系方式</a>
	                <a href="javascript:changeOauth('idcard_oauth');" id="idcard_oauth" class="left block credit-title2 font3">2、证件照认证</a>
	            </p>
			</div>
			<!--error-->
            <div class="form-normal font-size0 ui-error" style="text-align:center">
               <p class="error-p inline-block font-red contacts_p" id="errorTxt" style="display: none;"></p>
           </div>
			<form id="uploadForm" method="post" enctype="multipart/form-data" action="center/center!uploadIdCardsImg.do">
				<div class="mycredit-title font-size2">
					<div id="uploadBlockSection" class="creditAuth-wrap uploadBlock creditAuth-wrap-on">
						<div id="creditUploadImg" class="creditAuth-content upload-warp event-creditAuthEdit creditAuthEdit ">
							<div class="con_upImg">
								<h2 class="con_title_left"> <b class="inline-block">01</b><span class="font-size3 font-bd">上传身份证</span></h2>
								<div class="con_left">
		                       		<div class="esp">
		                                 <span class="block"></span>
		                                 <s:if test="null != memberQuery.idCardPhoto && memberQuery.idCardPhoto.split(';')[0] != ''">
			                                 <div class="ini_img">
			                                 	<img src="<s:property value="memberQuery.idCardPhoto.split(';')[0]" />" alt="" width="272" height="173" />
			                                 </div>
		                                 </s:if>
		                                 <s:else>
			                                 <div class="ini_img ini_img1">
			                                 	
			                                 </div>
		                                 </s:else>
		                     		</div> 
									<div class="esp">
		                                <span class="block"></span>
		                                <s:if test="null != memberQuery.idCardPhoto && memberQuery.idCardPhoto.split(';')[1] != ''">
			                                 <div class="ini_img">
			                                 	<img src="<s:property value="memberQuery.idCardPhoto.split(';')[1]" />" alt="" width="272" height="173" />
			                                 </div>
		                                 </s:if>
		                                 <s:else>
			                                 <div class="ini_img ini_img2"> </div>
		                                 </s:else>
		                            </div>
		                            <p class="img-tips">照片要求：照片需清晰，不可反光</p>
		                        </div>
                        		<div class="upload-img con_right">
		                            <div id="card" class="upload-img-div ">
		                                <div class="smallImg" id="card_front">
		                                	<img id="card_f" class="img_w_h" />
		                                </div>
		                                <input id="upload1" type="file" name="upload" />
		                                <s:if test="null != memberQuery.idCardPhoto && memberQuery.idCardPhoto != ''">
			                                <input id="upload1_1" type="hidden" value="<s:property value="memberQuery.idCardPhoto.split(';')[0]" />"/>
		                                </s:if>
		                                <s:else>
		                                	<input id="upload1_1" type="hidden" value=""/>
		                                </s:else>
		                            </div>
		                            <div id="card2" class="upload-img-div ">
		                                <div class="smallImg" id="card_back">
		                                    <img id="card_b" class="img_w_h" />
		                                </div>
		                                <input id="upload2" type="file" name="upload" />
		                                 <s:if test="null != memberQuery.idCardPhoto && memberQuery.idCardPhoto != ''">
			                                <input id="upload2_1" type="hidden" value="<s:property value="memberQuery.idCardPhoto.split(';')[1]" />"/>
		                                </s:if>
		                                <s:else>
		                                	<input id="upload2_1" type="hidden" value=""/>
		                                </s:else>
		                            </div>
	                        	</div>
							</div>
							<div class="con_upImg">
	                        	<h2 class="con_title_left"><b class="inline-block">02</b><span class="font-size3 font-bd">上传学生证</span></h2>
	                           	<div class="con_left">
	                               	<div class="esp">
	                                   	<span class=" block"></span>
	                                  		<s:if test="null != memberQuery.studentPhoto && memberQuery.studentPhoto.split(';')[0] != ''">
			                                 <div class="ini_img">
			                                 	<img src="<s:property value="memberQuery.studentPhoto.split(';')[0]" />" alt="" width="272" height="173" />
			                                 </div>
		                                 </s:if>
		                                 <s:else>
			                                 <div class="ini_img ini_img3">
			                                 </div>
		                                 </s:else>
	                         		</div>
	                         		<div class="esp">
	                                   	<span class=" block"></span>
	                                  		<s:if test="null != memberQuery.studentPhoto && memberQuery.studentPhoto.split(';').length > 1">
			                                 <div class="ini_img">
			                                 	<img src="<s:property value="memberQuery.studentPhoto.split(';')[1]" />" alt="" width="272" height="173" />
			                                 </div>
		                                 </s:if>
		                                 <s:else>
			                                 <div class="ini_img ini_img3_2">
			                                 </div>
		                                 </s:else>
	                         		</div>
	                               	<p class="img-tips">学生证需加盖钢印或者学校公章，
	                                  	<span class="font-red"></span>
	                             	</p>
	                         	</div>
	                       		<div class="upload-img con_right">
	                         		<div id="card3" class="upload-img-div ">
	                                   	<div class="smallImg" id="card_stu">
	                                   		<img id="card_s" class="img_w_h" />
	                               		</div>
	                               		<input id="upload3" type="file" name="stuPhotoUpload"></input>
	                               		<s:if test="null != memberQuery.studentPhoto && memberQuery.studentPhoto.split(';')[0] != ''">
	                               			<input id="upload3_1" type="hidden" value="<s:property value="memberQuery.studentPhoto.split(';')[0]" />"/>
	                               		</s:if>
	                               		<s:else>
	                               			<input id="upload3_1" type="hidden" value=""/>
	                               		</s:else>
	                             	</div>
                                    <div id="card4" class="upload-img-div ">
	                                   	<div class="smallImg" id="card_stu2">
	                                   		<img id="card_s2" class="img_w_h" />
	                               		</div>
	                               		<input id="upload4" type="file" name="stuPhotoUpload"></input>
	                               		<s:if test="null != memberQuery.studentPhoto && memberQuery.studentPhoto.split(';').length > 1">
	                               			<input id="upload4_1" type="hidden" value="<s:property value="memberQuery.studentPhoto.split(';')[1]" />"/>
	                               		</s:if>
	                               		<s:else>
	                               			<input id="upload4_1" type="hidden" value=""/>
	                               		</s:else>
	                             	</div>
	                        	</div>
	                     	</div>
	                    	<div class="con_upImg">
	                      		<h2 class="con_title_left"><b class="inline-block"> 03</b><span class="font-size3 font-bd">上传声明合照</span></h2>
	                       		<div class="con_left">
	                         		<div class="esp1">
	                              		<span class=" block"></span>
	                                	<s:if test="null != memberQuery.statementPhoto && memberQuery.statementPhoto != ''">
				                     		<div class="ini_img">
				                            	<img src="<s:property value="memberQuery.statementPhoto" />" alt="" width="272" height="333" />
				                       		</div>
			                         	</s:if>
			                         	<s:else>
				                        	<div class="ini_img ini_img4" style="height: 340px;"></div>
			                       		</s:else>
	                               	</div>
	                               	<p class="img-tips"><strong> 步骤一：请用A4纸手写以下内容及本人签名</strong></p>
	                                <p class="img-tips"><b>声明文件头</b>：证件使用及购买说明；<b>声明内容</b>：本人所提供的证件仅供亲分期网站认证并购买商品时使用，此账户由本人操作（未因任何理由交由他人代为操作），发生的消费由本人承担，且本人同意亲分期网站电子合同条款。
	                               		<span class="font-red">记得本人签名！</span>
	                           		</p>
	                                <p class="img-tips"><strong>步骤二：证件人面部无遮挡、五官清晰可见，手持身份证、学生证及手写声明合影拍照。</strong></p>
	                               	<p class="img-tips"></p>
	                         	</div>
	                         	<div class="upload-img con_right">
	                           		<div id="card5" class="upload-img-div ">
	                           			<div class="smallImg" id="card_an">
	                             			<img id="card_a" class="img_w_h" />
	                               		</div>
	                             		<input id="upload5" type="file" name="upload"></input>
	                             		<s:if test="null != memberQuery.statementPhoto && memberQuery.statementPhoto != ''">
		                             		<input id="upload5_1" type="hidden" value="<s:property value="memberQuery.statementPhoto" />"/>
	                             		</s:if>
	                             		<s:else>
	                             			<input id="upload5_1" type="hidden" value=""/>
	                             		</s:else>
	                            	</div>
	                       		</div>
	                  		</div>
                  		  	<!--第四步-->
                            <div class="con_upImg">
                                 <h2 class="con_title_left"><b class="inline-block"> 04</b><span class="font-size3 font-bd">补充资料</span></h2>
                                 <div class="con_left">
                                 <s:if test="othersPhotoList.size() > 0">
                                 	<input type="hidden" value="1" id="othersPhotoListSize"/>
                                 </s:if>
                                 <s:else>
                                  	<input type="hidden" value="0" id="othersPhotoListSize"/>
                                 </s:else>
                                 <s:if test="othersPhotoList != null">
                                 	<s:iterator value="othersPhotoList" var="var">
		                               	<div class="esp">
		                                   	<span class=" block"></span>
			                                 <div class="ini_img">
			                                 	<img src="<s:property value="var" />" alt="" width="272" height="173" />
			                                 </div>
		                         		</div>
                                 	</s:iterator>
                                 </s:if>
                                     <p class="img-tips">情景一：审核未通过，需要根据审核意见补充相应资料</p>
                                     <p class="img-tips">情景二：上述三项资料不完整，需提供可替代的资料</p>
                                     <p class="img-tips">如果未遇到上述情景，补充资料可无需操作</p>
                                     <p class="img-tips"></p>
	                         	</div>
                                 <div class="upload-img con_right">
	                                 <div id="card6" class="upload-img-div ">
	                                   	<div class="smallImg" id="card_s611">
	                                   		<img id="card_s61" class="img_w_h" />
	                               		</div>
	                               		<input id="upload61" type="file" name="supplementUpload"></input>
	                             	 </div>
	                                 <div class="supplement_div_a" id="divAppend">
	                                 	<a href="javascript:addSupplementUpload()" class="supplement_a">添加更多资料</a>
	                                 </div>
                                 </div>
                           	</div>
	              		</div>
	                		<input type="hidden" id="userId" value="${memberQuery.userId }"/>
	             			<a href="javascript:uploadImg()" class="common-btn-blue a_btn_con" style="width: 110px !important;height: 35px !important;" > 提交认证</a>
	   					</div>
	  				</div>
	 			</form>
			</div>
		</div>   
</body>
</html>