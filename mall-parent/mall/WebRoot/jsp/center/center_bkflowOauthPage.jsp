<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>我的亲分期 - 信用认证 - 证件照认证</title>
	<script type="text/javascript">
		$(function(){
			var errorCode = '${errorCode}';
			if(errorCode != 0){
				layer.alert("上传失败");
			}
			
			var isBkflowOauth = '${memberQuery.isBkflowOauth}';
			var bkflowOauthOpinion = '${memberQuery.bkflowOauthOpinion}';
			if(isBkflowOauth == 4 && bkflowOauthOpinion.length > 0){
				$("#errorTxt").show();
				showMsg("#errorTxt", bkflowOauthOpinion);
			}
			
		});
	
		function checkImg(name, upload){
			var strs = new Array();
			strs = upload.split(".");
			var suffix = strs[strs.length - 1];
			if(suffix.toLowerCase() != "jpg" 
					&& suffix.toLowerCase() != "png"  
					&& suffix.toLowerCase() != "gif"
					&& suffix.toLowerCase() != "bmp"){
				layer.alert("上传的" + name + "不是图片格式");
				return false;
			}
			return true;
		}
		
		function uploadImgButton(){
			$("#bkflowImg").click();
		}
	
		function saveBkflowOauth(){
			var bkflowImg = $.trim($("#bkflowImg").val());
			var reg = /^[1-9]\d*$/;
			var price = $.trim($("#price").val());
			var upload1 = $("#upload1").val();
			var priceOld =  $.trim($("#priceOld").val());
			if(price.length == 0){
				showMsg("#checkPrice","期望提升额度不能为空");
				return;
			} else {
				if(!reg.test(price)){
					showMsg("#checkPrice","期望提升额度必须是正整数");
					return;
				}
				if(price > 4000){
					showMsg("#checkPrice","请输入4000以下额度");
					return;
				}
			}
			if(bkflowImg.length == 0){
				if(upload1.length == 0){
					layer.alert("请上传银行流水照片");
					return;
				}
			} else {
				if(!checkImg("银行流水照片", bkflowImg)){
					return;
				}
				
			}
			if(priceOld == price && bkflowImg.length == 0 && upload1.length != 0){
				window.location.href = "<%=basePath%>center/center!credit.do";
				return;
			} else if(priceOld != price && upload1.length != 0 && bkflowImg.length == 0){
				layer.alert("银行流水照片需要重新上传一遍");
				return;
			}
			$("#uploadForm").submit();
			
		}
		function checkPrice(){
			var reg = /^[1-9]\d*$/;
			var price = $.trim($("#price").val());
			if(price.length == 0){
				showMsg("#checkPrice","期望提升额度不能为空");
				return;
			} else {
				if(!reg.test(price)){
					showMsg("#checkPrice","期望提升额度必须是正整数");
					return;
				}
				if(price > 4000){
					showMsg("#checkPrice","请输入4000以下额度");
					return;
				}
			}
		}
		function showMsg(id, msg){
			$(id).html(msg);
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
        </p>
        <div class="mycredit-wrap">
            <p class="mycreditwrap-tit font-size2 font1">额度提升认证2</p>
            <div class="inline-block water_left">
                <div class="u-forward">
                    <p>
                        <span class="block font-size2 font1" style="margin:30px 0px"><b>认证说明：</b></span>
                        <span class="block font-size2 font1" style="line-height: 26px;margin-bottom: 20px;">您可以提供（拍照上传）本人名下的银行卡最近6个月的流水明细，认证通过后，我们会为您增加相应的信用额度<span class="font-red">（认证通过后不能再次认证）</span>。</span>
                    </p>
                    <div class="u_water" id="zoomImg">
                    <s:if test="null != memberQuery.bkflowPhoto && memberQuery.bkflowPhoto != ''">
                    	 <img id="bkflowPhotoImg" src="${memberQuery.bkflowPhoto}" />
                    </s:if>
                    <s:else>
                        <img src="mall/images/bankwater.png" />
                    </s:else>
                    </div>
                    <p>
                        <span class="block font-size2 font1" style="margin:30px 0px"><b>照片要求：</b></span>
                        <span class="block font-size2 font1" style="line-height: 26px;margin-bottom: 20px;">携带银行卡和身份证到就近开户行要求打印近半年的流水对账单即可。 （流水单必须为银行打印纸质版拍照，每张流水单要有银行盖章，电脑截屏无效，要求能看清文字，否则无法通过审核）</span>
                        <span class="block font-size2 font1" style="line-height: 26px;margin-bottom: 20px;">最多上传15张照片，每张照片最大不能超过2M  <span class="font-red">(请按照银行流水顺序上传，有助于更快通过审核)</span></span>
                    </p>
                </div>
            </div>
            <form id="uploadForm" method="post" enctype="multipart/form-data" action="center/center!updateBkflowOauth.do">
            <input type="hidden" name="memberQuery.memberId " id="memberId" value="${memberQuery.memberId }"/>
            <div class="inline-block water_right">
            	<div class="mycredit-title form-normal font-size0 ui-error">
					<label class="label"></label>
					<p class="error-p inline-block font-red card_width" id="errorTxt" style="margin-bottom: 0px;margin-top: 0px;display: none;"></p>
				</div>
                <div class="u-forwardright">
                    <p style="margin: 25px 0px;">
                        <span class=" font-size2 font1"><b>期望提升额度：</b></span>
                        <input id="price" <s:if test="memberQuery.bkflowPrice != 0">value="${memberQuery.bkflowPrice}"</s:if> name="memberQuery.bkflowPrice" 
                        	placeholder="请输入4000以下额度" onblur="checkPrice()" onfocus="showMsg('#checkPrice','')" type="text" style="width:140px;height:30px;" />
                        	<input id="priceOld" value="${memberQuery.bkflowPrice}" type="hidden"/>
                        <span>元</span>
                    </p>
                    <p style="margin: 10px 0px;">
                    	<span id="checkPrice" class="font-red"></span>
                    </p>
                    <p class="font-size2 font1" style="line-height: 26px;margin-bottom: 20px;">
                       	 合理的期望值有助于您更快的通过审核，最终提升额度将根据您的资料计算得出
                    </p>
                    <ul class="fl bankwater-img-list" id="bankWaterUL">
                         <li class="fl" id="bankWaterLI">
                            <span class="block font-size2 font4">银行流水照片1</span>
                            <div class="am-imgbox image_count ">
                            <img src="" />
                                <div id="bkflowPhotoImg2" class="upload_imgs bankwater_p"><p onclick="uploadImgButton()">点击上传照片</p></div>
                            </div>
                        </li>                       
                    </ul>    
                    <input id="bkflowImg" type="file" name="upload" class="bankwater_input"></input>
                    <s:if test="null != memberQuery.bkflowPhoto && memberQuery.bkflowPhoto != ''">
                    	<input id="upload1" type="hidden" value="<s:property value="memberQuery.bkflowPhoto" />"/>
                 	</s:if>
                 	<s:else>
                 		<input id="upload1" type="hidden" value=""/>
                 	</s:else>
                    <p><a class="common-btn-blue" href="javascript:saveBkflowOauth()">提交审核</a></p>
                  </div>
            </div>
            </form>
            <div class="clear"></div>
        </div>
    </div>
</div>
</div>
<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>