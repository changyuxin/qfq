<%@ page language="java" pageEncoding="UTF-8"%>

	<div class="mu-menu">
		<dl>
			<dt class="mu-menu-div"><span class="font-size3 font-bd "><a href="center/home.html" class="mu-menu-a" title="返回个人中心首页">个人中心</a></span></dt>
			<dd>
				<i></i><strong>我的订单</strong>
				<ul>
					<li><a href="center/order.html" class="">商品订单</a></li>
				</ul>
			</dd>
			<dd>
				<i></i><strong>我的购物</strong>
				<ul>
					<li><a href="center/bought.html" class="">已购商品</a></li>
				</ul>
			</dd>
            <dd>
            	<i></i><strong>我的账单</strong>
                <ul>
                	<li><a href="center/bill.html">商品账单</a></li>
                </ul>
       		</dd>
                <dd>
            	<i></i><strong>我的设置</strong>
                <ul>
                	<!--  -->
					<li><a href="center/coupon.html" class="">优惠券</a></li>
					
					<s:if test="getCurrentUser() != null && getUserStyle() == 1 ">
                    	<li><a href="center/credit.html">我的信用</a></li>
                    </s:if>
                    <s:else>
                    	<s:if test="collarQuery.auditStatus != 3">
                    	 <li><a href="collar/infoPage.html">我的信息</a></li>
                    	 </s:if>
                    </s:else>
                    <li><a href="center/account.html">账号设置</a></li>
                    <li><a href="center/password.html">修改密码</a></li>
                    <li><a href="center/address.html">收货地址</a></li>
                    <s:if test="getCurrentUser() != null && getUserStyle() == 1 ">
                    	<!--  
                    	<li><a href="center/embassy.html">申请成为大使</a></li>
                    	-->
                    </s:if>               
                 </ul>
     		</dd>
    		<!--  
           	<dd>
            	<a href="#" target="_self"><i></i>我的收藏</a>
            	<ul>
             		<li><a href="#" target="_self" class="">收藏夹</a></li>            
                </ul>
            </dd>
            -->
		</dl>
	</div>