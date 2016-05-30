<%@ page language="java" pageEncoding="UTF-8"%>

<script type="text/javascript">
		$(function(){
			var isContactOauth = '${memberQuery.isContactOauth}';
			var contactOauthOpinion = '${memberQuery.contactOauthOpinion}';
			if(isContactOauth == 4 && contactOauthOpinion.length > 0){
				showMsg(contactOauthOpinion);
			}
		});
</script>

	<div class="mycredit-form inline-block" id="contactInfoForm">
		<div class="form-normal font-size0 ui-error">
			<label class="label"></label>
			<p class="error-p inline-block font-red card_width" id="errorTxt" style="display: none;"></p>
		</div>
        <div class="form-normal font-size2">
            <label class="label">本人QQ:</label>
            <input class="txt-normal card_width" labelName="本人QQ" placeholder="请输入本人真实QQ号码" type="text" id="qq" name="memberQuery.QQ" value="${memberQuery.QQ}" onblur="checkInputText(this);checkIsNaN('#qq', 'QQ号码')"/>
        </div>
        <div class="form-normal font-size2 ">
            <label class="label">本人微信号:</label>
            <input class="txt-normal card_width" labelName="本人微信号" placeholder="请输入本人真实微信号" type="text" id="wechat" name="memberQuery.weiXin" value="${memberQuery.weiXin}" onblur="checkInputText(this);"/>
        </div>
        <div class="form-normal font-size2 ">
            <label class="label">同学姓名:</label>
            <input class="txt-normal card_width" labelName="同学姓名" placeholder="请输入同学真实姓名" type="text" id="classMateName" name="memberQuery.friendName" value="${memberQuery.friendName}" onblur="checkInputText(this);"/>
        </div>
        <div class="form-normal font-size2 ">
            <label class="label">同学手机号:</label>
            <input class="txt-normal card_width" labelName="同学手机号" placeholder="请输入同学真实手机号" type="text" id="classMateMobile" name="memberQuery.friendPhone" value="${memberQuery.friendPhone}" onblur="checkInputText(this);checkMobile('#classMateMobile', '#mobileStatus')"/>
        	<input type="hidden" value="1" id="mobileStatus">
        </div>
        <div class="form-normal ">
            <label class="label-normal"></label>
            <input type="button" class=" btn-blue btn-h1 btn-noborder font-white btn-m1" value="下一步" onclick="nextstep(2)"/>
        </div>
	</div>
	<div class="mycredit-question inline-block">
		<h1 class="font-size3">温馨提示：</h1>
		<div class="credit-ques font3 font-size2">
			<p><strong>请务必填写您的同学真实手机号，我们将通过电子系统查询比对该信息是否真实。填写不实的手机号将无法通过认证。我们仅会在长时间无法联系到您的情况下，才会和您所填写的联系人联系，请您放心填写。</strong></p>
		</div>
</div>