<%@ page language="java" pageEncoding="UTF-8"%>

	<div class="modify-left">
        <ul>
        	<li><i class="i_1_off"></i><span>验证身份</span></li>
        	<li class="vertical-line "></li>
        	<li class="mdf-now"><i class="i_2_on"></i><span>设置新密码</span></li>
        	<li class="vertical-line"></li>
        	<li class=""><i class="i_3_off"></i><span>完成</span></li>
        </ul>
	</div>
	<div class="modify-right">
         <div class="modify-item">
             <label for="userName" id="label-one">新密码：</label>
             <input type="password" id="passWord" onfocus="showMsg('#checkPw','')" maxlength="32"/>
             <p><span id="checkPw"></span></p>
         </div>    
         <div class="modify-item">
             <label for="phone" id="">重复新密码：</label>
             <input type="password" id="passWord2" onfocus="showMsg('#checkPw2','')" maxlength="32"/>
             <p class="verify-step-1"><span id="checkPw2"></span></p>
         </div>
         <div class="modify-item">
         	 <input type="hidden" value="${userQuery.userName }" id="userName"/>
             <p><a id="step1" class="next-step" href="javascript:void(0)" onclick="nextStep('3')">下 一 步</a></p>
         </div>
	</div>
