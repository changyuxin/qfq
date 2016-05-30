<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>

<div class="user-right-head">
	<h2>手机认证</h2>
</div>
<div class="progress saftyProgress ">
    <ul class="bg">
    	<li><span>1</span><s>验证身份</s></li>
        <li><span>2</span><s>设置新的手机号码</s></li>
        <li class="active"><span>3</span><s>完成</s></li>
    </ul>
</div>
<!--认证成功&失败-->
<s:if test="status == 0">
	<div class="identification_all">
		<img src="images/success.png"> <p>认证成功</p>
		<div class="identification_div ">
			<a class="common-btn-blue" href="center/center!account.do">返&nbsp;回</a>
		</div>
	</div>
</s:if>
<s:else>
	<div class="identification_all">
		<img src="images/fail.png"> <p>认证失败</p>
		<div class="identification_div ">
			<a class="common-btn-blue" href="center/center!account.do">返&nbsp;回</a>
		</div>
	</div>
</s:else>