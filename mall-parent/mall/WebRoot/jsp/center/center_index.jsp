<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 个人中心首页</title>
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
        <div class="mu-ctxt">
            <div class="mu-userinfo">
                <h1 class="inline-block">
                     <img src="mall/images/uer.png" alt="用户头像" />
                </h1>
                <h2 class="inline-block">
                    <p class="font1 font-size3">上午好，<s:property value="getCurrentUser().userName" /></p>
                    <p>
                        <span class="font3 font-size0">手机号：<s:property value="getCurrentUser().userName" /><a href="center/modifyPhone.html" class="font-bd margin_10">更换</a></span>
                    </p>
                </h2>
                <h3 class="inline-block">
                	<s:if test="getCurrentUser() != null && getUserStyle() == 1 ">
              		<p>
              			<i class="icon_o icon_green"></i>
                  		<span class="font3 font-size0">
                        	信用额度：<span class="bold">¥ <s:property value="%{formatDouble(memberQuery.creditLimit + memberQuery.usedCreditLimit)}" /> </span>
                           	<s:if test="memberQuery.isBkflowOauth != 3">
                           		<a class="font-bd margin_10" href="center/credit.html">提升额度</a>
                           	</s:if>
                       	</span>
                    </p>
                    <p>
                    	<i class="icon_o icon_yellow"></i>
                      	<span class="font3 font-size0">
                      		可用额度：<span class="bold">¥ <s:property value="%{formatDouble(memberQuery.creditLimit)}" /></span>
                      	</span>
                      	<!--  -->
                      	<i class="icon_o icon_red"></i>
                      	<span class="font3 font-size0">
                      		可预借现金额度：<span class="bold">¥ <s:property value="%{formatDouble(memberQuery.creditLimit)}" /></span>
                      	</span>
                      	
                    </p>
	                 </s:if>
	                 <s:else>
	                 <p>
              			<i class="icon_o icon_green"></i>
                  		<span class="font3 font-size0">
                        	信用额度：<span class="bold">¥ <s:property value="%{formatDouble(collarQuery.creditLimit + collarQuery.usedCreditLimit)}" /> </span>
                       	</span>
                    </p>
                    <p>
                    	<i class="icon_o icon_yellow"></i>
                      	<span class="font3 font-size0">
                      		可用额度：<span class="bold">¥ <s:property value="%{formatDouble(collarQuery.creditLimit)}" /></span>
                      	</span>
                      	<i class="icon_o icon_red"></i>
                      	<span class="font3 font-size0">
                      		可预借现金额度：<span class="bold">¥ <s:property value="%{formatDouble(collarQuery.creditLimit)}" /></span>
                      	</span>
                    </p>
	                 </s:else>
                 </h3>
                 
                 
			</div>
            <div class=" mu-box-m1">
	            <div class="center_index">
					<ul class="center_index_ul">
	                	<li>
	                		<a href="center/order.html">
		                		<i class="center_index_img_1"></i>
		                		<p class="center_index_p">商品订单</p>
	                		</a>
	                	</li>
	                    <li>
		                    <a href="center/bill.html">
		                    	<i class="center_index_img_2"></i>
		                    	<p class="center_index_p">商品账单</p>
		                    </a>
	                    </li>
	                    <s:if test="getCurrentUser() != null && getUserStyle() == 1 ">
	                    	<li>
			                    <a href="center/credit.html">
			                    	<i class="center_index_img_3"></i>
			                    	<p class="center_index_p">我的信用</p>
			                    </a>
		                    </li>
	                    </s:if>
	                    <s:else>
	                    	<s:if test="collarQuery.auditStatus != 3">
		                   		<li>
				                    <a href="collar/infoPage.html">
				                    	<i class="center_index_img_3"></i>
				                    	<p class="center_index_p">我的信息</p>
				                    </a>
			                    </li>
		                    </s:if>
	                    </s:else>
	                    <li>
		                    <a href="center/account.html">
		                    	<i class="center_index_img_4"></i>
		                    	<p class="center_index_p">账号设置</p>
		                    </a>
	                    </li>
	                    <li>
		                    <a href="center/password.html">
		                    	<i class="center_index_img_5"></i>
		                    	<p class="center_index_p">修改密码</p>
		                    </a>
	                    </li>
	                    <s:if test="getCurrentUser() != null && getUserStyle() == 1 ">
	                    <li>
		                    <a href="center/embassy.html">
		                    	<i class="center_index_img_6"></i>
		                    	<p class="center_index_p">成为大使</p>
		                    </a>
	                    </li>
	                    </s:if>
	                </ul>
	            </div>
            </div>     

         </div>
    </div>
</div>

<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body>
</html>