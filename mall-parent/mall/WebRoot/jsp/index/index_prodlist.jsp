<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	/*
	$("img.lazy").lazyload({
		 effect : "fadeIn"
	});
	*/
</script>
	<div class="index-part-body">
		<ul class="index-li fn-clear">
			<s:if test="products!= null && products.size() > 0">
				<s:iterator value="products" id="prod">
					<li class="js-product-item">
						<div class="fn-text-center am-img">
							<a href="products/<s:property value="#prod.productId"/>.html" target="_blank">
								<img class="lazy" data-original="<s:property value="#prod.coverImg"/>" bak-img="mall/images/grey.gif" 
									width="220" height="220" src="<s:property value="#prod.coverImg"/>" alt="<s:property value="#prod.productName"/>"/>
							</a>
							<em></em>
						</div>
						<p class="lis list_p_title">
							<a href="products/<s:property value="#prod.productId"/>.html" target="_blank">
								<s:property value="#prod.productName"/>
							</a>
						</p>
						<p class="list_p_time">月供：<span style="font-size:20px; color:#F00">￥<s:property value="%{formatDouble(#prod.monthPay)}" /></span> x24期</p>
						<p class="list_p_money">售价：￥<s:property value="%{formatDouble(#prod.salePrice)}" /></p>
					</li >
				</s:iterator>
			</s:if>
		</ul>                   
	</div>