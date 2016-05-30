<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>亲分期购物商城</title>
	<script type="text/javascript">

	</script>
</head>

<body>
   

<s:iterator value="prodList" id="prod">
	<li class="recomm_item">
		<a target="_blank" href="products/<s:property value="#prod.productId"/>.html">
			<img src="<s:property value="#prod.coverImg"/>" class="recomm_img" title="" alt="" />
		</a>
		<h3 class="recomm_title">
			<a href="products/<s:property value="#prod.productId"/>.html" target="_blank"><s:property value="#prod.productName"/></a>
		</h3>
		<p class="recomm_info">
			售价：<span class="a_font">￥<s:property value="%{formatDouble(#prod.salePrice)}" /></span><br/>
			月供：<span class="red_color a_font">￥<s:property value="%{formatDouble(#prod.monthPay)}" /></span> 起 
		</p>
		<span class="line"></span>
	</li>
</s:iterator>

</body>
</html>