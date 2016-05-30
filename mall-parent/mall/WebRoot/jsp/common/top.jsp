<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="head_hello">
	<div class="hello_left">欢迎来到最值得信赖的分期商城！</div>
		<div class="hello_right">
			<s:if test="getCurrentUser() == null">
				请<a href="login/login.html"><span>【登录】</span></a><a href="login/regist.html"><span>【免费注册】</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			</s:if>
			<s:elseif test="getCurrentUser() != null">
				<a href="center/home.html"><span class="hello_right_span1">您好！<s:property value="getCurrentUser().userName" /></span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="javascript: logout();"><span>退出</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			</s:elseif>
			<a href="center/home.html"><span>个人中心</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<s:if test="getCurrentUser() != null && getUserStyle() == 1 ">
			<a href="center/credit.html"><span>我的信用</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			</s:if>
			<a href="center/order.html"><span>我的订单</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="center/bill.html"><span>我要还款</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<!--  
	     		<a href="#"><span>收藏夹</span></a>&nbsp;&nbsp;|&nbsp;&nbsp;
	     		-->
			<a href="help/faq.html"><span>帮助中心</span></a>&nbsp;&nbsp;
		</div>
	</div>
<div class="head_ul">
      <div id="logo">
          <a href="/" title="返回亲分期首页"><img src="mall/images/logo.png" alt="亲分期购物商城"></a>
      </div>
      <div id="search">
           <input type="text" placeholder="请输入关键字进行搜索" id="search_main" >
           <a href="javascript:searchProduct();"><img src="mall/images/search_main.png" style="margin:-10px; padding-left:5px;" alt="搜索"></a>
           <div> 
            <a href="search/苹果 iPhone6S.html" target="_blank"><span>苹果 iPhone6S</span></a>&nbsp;&nbsp;
           	<a href="search/三星 S6.html" target="_blank"><span>三星 S6</span></a>&nbsp;&nbsp;
           	<a href="search/魅族 MX4.html" target="_blank"><span>魅族 MX4</span> </a>&nbsp;&nbsp;
           	<a href="search/华为 P8.html" target="_blank"><span>华为 P8</span> </a>&nbsp;&nbsp;
           	<a href="search/vivo X5.html" target="_blank"><span>vivo X5</span></a>&nbsp;&nbsp;
           	<a href="search/小米 4.html" target="_blank"><span>小米 4</span></a>
          </div>
      </div>
	<div class="right">
		<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2898146307&site=qq&menu=yes">
			<img src="mall/images/zixun.png" class="zixun" alt="在线咨询">
		</a>
		<img src="mall/images/number.png" alt="400电话"> 
	</div>
</div>

