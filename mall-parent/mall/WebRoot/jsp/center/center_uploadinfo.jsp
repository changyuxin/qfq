<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="../common/head.jsp"%>
		<link rel="stylesheet" href="<%=basePath%>css/white-collar.css" />
		<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
		<title>亲分期 - 产品评论图片</title>
		<script type="text/javascript">
		$(function(){

		});
		function uploadInfoSubmit(){
			$(".error-span").html("");
			if(validatUploadInfo(false)){
				$("#uploadForm").submit();
			}
		}
		function validatUploadInfo(flag){
	
			//上传信息验证
			if(!checkInputText6("#upload1")){
				return false;
			}
			if(!checkInputText6("#upload2")){
				return false;
			}
			if(!checkInputText6("#upload3")){
				return false;
			}
			$("#errorUploadInfoTxt").html("").hide(); 
			
			return true;
		}

		//上传信息
		function checkInputText6(obj){
			obj = $(obj);
			var labelName = obj.attr("labelName");
			var word = $.trim(obj.val());
			if (word == ''){
				$("#errorUploadInfoTxt").html(labelName + "不能为空!").show();
				return false;
			}
	 		if(labelName == "身份证（正面）"){
			    var strs = new Array();
				strs = $.trim($("#upload1").val()).split(".");
				var suffix = strs[strs.length - 1];
				if(suffix.toLowerCase() != "jpg" 
						&& suffix.toLowerCase() != "png"  
						&& suffix.toLowerCase() != "gif"
						&& suffix.toLowerCase() != "bmp"
						&& suffix.toLowerCase() != "jpeg"){
					$("#errorUploadInfoTxt").html(labelName + "不是图片格式!").show();
					return false;
				}
			}
			if(labelName == "身份证（反面）"){
			    var strs = new Array();
				strs = $.trim($("#upload2").val()).split(".");
				var suffix = strs[strs.length - 1];
				if(suffix.toLowerCase() != "jpg" 
						&& suffix.toLowerCase() != "png"  
						&& suffix.toLowerCase() != "gif"
						&& suffix.toLowerCase() != "bmp"
						&& suffix.toLowerCase() != "jpeg"){
					$("#errorUploadInfoTxt").html(labelName + "不是图片格式!").show();
					return false;
				}
			}
			if(labelName == "银行流水"){
			    var strs = new Array();
				strs = $.trim($("#upload3").val()).split(".");
				var suffix = strs[strs.length - 1];
				if(suffix.toLowerCase() != "jpg" 
						&& suffix.toLowerCase() != "png"  
						&& suffix.toLowerCase() != "gif"
						&& suffix.toLowerCase() != "bmp"
						&& suffix.toLowerCase() != "jpeg"
						&& suffix.toLowerCase() != "rar"
						&& suffix.toLowerCase() != "zip"){
					$("#errorUploadInfoTxt").html(labelName + "非法格式文件!").show();
					return false;
				}
			} 
			$("#errorUploadInfoTxt").html("").hide();
			return true;
		}
		
		function uploadOtherDetail(){
			var other = $("#other");
			other.append("<input type='file' class='white-collar-file white-collar-other' name='upload'/>"); 
		}
		</script>
    </head>
<body>
			<form id="uploadForm" method="post" enctype="multipart/form-data" action="<%=basePath%>collar/collar!uploadInfoImprove.do">
			    <input type="hidden" id="userId"  name="collarQuery.userId" value="<s:property value="getCurrentUser().userId" />" /> 
			 
	                <!--上传资料-->
	                	<p class="p_mian_title">
		                	<s:if test="collarQuery.uploadCardDetail!=null">
		                		<strong>上传图片<font color="red">(已上传图片)</font></strong>
		                	</s:if>
		                	<s:else>
		                		<strong>上传图片<font color="red">(请上传图片)</font></strong>
		                	</s:else>
	                	</p>
	                    <!--error窗口-->
	                    <div class="error-div error-span" style="display:none;" id="errorUploadInfoTxt"></div>
	                    <p class="p_mian" style="margin-top:20px;"><label>图片1</label>
	                    	<input type="file" class="white-collar-file" id="upload1" name="upload" labelName="身份证（正面）" onblur="checkInputText6(this);"/> 
	                     </p>
	                    <p class="p_mian"><label>银行流水：</label>
	                        <input type="file" class="white-collar-file" id="upload3" name="upload" labelName="银行流水" onblur="checkInputText6(this);"/>
	                    </p>
	                    <p class="p_mian"><label>其他：</label>
	                    	<div class="white-collar-other-div" id="other">
	                    		<input type="file" class="white-collar-file white-collar-other" name="upload"/>
	                    	</div> 
		                   	<div style="margin-left:225px;">
	                        	 <input type="button" value="添加" class="add-btn" onclick="uploadOtherDetail()"/>
	                    	</div>
	                    </p>
	                    <div style="float:right;margin:20px 50px 10px;">
								<a href="javascript:uploadInfoSubmit();" class="btn-submit-a">提交</a>
							</div>
			</form>
</body></html>