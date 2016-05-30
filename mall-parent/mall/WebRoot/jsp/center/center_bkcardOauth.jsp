<%@ page language="java" pageEncoding="UTF-8"%>

	<script type="text/javascript">
		$(function(){
			
			var bankBrand = '${memberQuery.bankName}';
			if(bankBrand == ''){
				$("#bankBrand").val("ICBC");
			} else {
				$("#bankBrand").val(bankBrand);
			}
			var isBkcardOauth = '${memberQuery.isBkcardOauth}';
			var bkcardOauthOpinion = '${memberQuery.bkcardOauthOpinion}';
			if(isBkcardOauth == 4 && bkcardOauthOpinion.length > 0){
				showMsg(bkcardOauthOpinion);
			}
			
		});
	</script>
	<div class="mycredit-form inline-block">
		<div class="form-normal font-size0 ui-error">
			<label class="label"></label>
			<p class="error-p inline-block font-red card_width" id="errorTxt" style="display: none;"></p>
		</div>
        <div class="form-normal font-size2 ">
            <label class="label">姓名:</label>
            <input id="bankCustomerName" class="txt-normal card_width" data-exp="void-" type="text" labelName="姓名" name="memberQuery.bankCustomerName" value="${memberQuery.trueName}" readonly="readonly"/>
        </div>
        <div class="form-normal font-size2 ">
            <label class="label">身份证:</label>
            <input id="cardId" class="txt-normal card_width" data-exp="void-" type="text" labelName="身份证号码" name="memberQuery.bankCustomerCard" value="${memberQuery.idCard}" readonly="readonly"/>
        </div>
		<div class="form-normal font-size2 ui-error">
			<label class="label">开户行:</label>
				<select id="bankBrand" class="select-long  card_width" name="memberQuery.bankName">
					<option value="ICBC">工商银行</option>
		            <option value="ABC">农业银行</option>
		            <option value="BOC">中国银行</option>
		            <option value="CCB">建设银行</option>
		            <option value="CMBCHINA">招商银行</option>
		            <option value="SPDB">浦发银行</option>
		            <option value="CIB">兴业银行</option>
		            <option value="CEB">光大银行</option>
		            <option value="GDB">广发银行</option>
		            <option value="PINGAN">平安银行</option>
		            <option value="HXB">华夏银行</option>
		            <option value="CMBC">民生银行</option>
		            <option value="SHB">上海银行</option>
		            <option value="ECITIC">中信银行</option>
		            <option value="BOCO">交通银行</option>
		            <option value="POST">邮政储蓄银行</option>
                 </select>
             </div>
             <div class="form-normal font-size2 ">
                 <label class="label">银行卡号:</label>
                 <input id="bankCardNumber" class="txt-normal  card_width" data-exp="void" data-check="yes" labelName="银行卡号" 
                 	placeholder="请输入本人银行卡号" type="text" name="memberQuery.bankCard" value="${memberQuery.bankCard}" 
                 		onblur="checkInputText(this);">
             </div>
             <div class="form-normal font-size2 ">
                 <label class="label">银行预留手机号:</label>
                 <input id="mobile" class="txt-normal card_width" data-exp="void-m" data-check="yes" labelName="银行预留手机号"  
                 	placeholder="请输入本人银行预留手机号" type="text" name="memberQuery.bankPhone" value="${memberQuery.bankPhone}" 
                 		onblur="checkInputText(this);checkMobile('#mobile', '#mobileStatus');">
             	 <input type="hidden" value="1" id="mobileStatus">
             </div>
             <div class="form-normal font-size2 ">
                 <label class="label-normal"></label>
                 <a id="getCode" class="a-blue" href="javascript: getBandMobileCode();">获取验证码</a>
             </div>
             <div class="form-normal font-size2 ">
                 <label class="label" >验证码:</label>
                 <input class="txt-normal card_width" data-exp="void-code6" labelName="验证码" 
                 	placeholder="请输入验证码" type="text" id="validCode" onblur="checkInputText(this);">
             </div>
			<div class="form-normal ">
				<label class="label-normal"></label>
				<input id="sendNum" type="button" class=" btn-blue btn-h1 btn-noborder font-white btn-m1" value="绑定" onclick="nextstep(3)"/>
  			</div>
		</div>
		<div class="mycredit-question inline-block">
			<h1 class="font-size3">
				<i class="inline-block font-white">Q</i>银行卡绑定常见问题：
			</h1>
			<div class="credit-ques font3 font-size0">
 				<dl>
                    <dt>1.没有银行卡怎么办？</dt>
                    <dd>请您拿本人的身份证到就近的银行办理即可，办理的同时预留一下您的手机号。</dd>
                </dl>
                <dl>
                    <dt>2.我的银行卡是入学的时候学校发的，没有银行预留手机号怎么办？</dt>
                    <dd>请您拿本人的身份证前往该银行的网点绑定您的手机号即可。</dd>
                </dl>
                <dl>
                    <dt>3.我提供这些银行账户的信息安全吗？会不会存在无故被扣费的风险？</dt>
                    <dd>是安全的，请您放心提供。各大电商平台都在采用这种方式，因为银行每次都会给您在银行预留的手机号发送短信验证码，所以您的银行账户是安全的。（温馨提示：为了保障您的资金安全，请不要将您的验证码告知他人。亲分期的工作人员和校园大使绝对不会向您索要手机验证码。如果您发现有人向您索要手机验证码，请及时举报。）</dd>
                </dl>
                <dl>
                    <dt>4.我自己的银行卡没有预留手机号，可不可以用我同学/朋友的银行卡代替？</dt>
                    <dd>不可以，只能使用本人的手机号，使用他人的银行卡将无法通过验证，订单也无法发货。</dd>
                </dl>
			</div>
		</div>