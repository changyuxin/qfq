<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
<link href="<%=basePath%>css/detail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.gallery.js"></script>
<title>亲分期 - <s:property value="productQuery.productName" /></title>
	<script type="text/javascript">
		$(function(){
			// 加载商品推荐列表 
			getRecommends();
			  
			$(".product-payment dd a").click(function(){
				var thisToggle = $(this).is(".inline-block") ? $(this) : $(this).prev();
				$(".inline-block").removeClass("current");
				thisToggle.addClass("current");
				$("#month").val(thisToggle.attr("data-month"));
				cacuMonthPay();
				return false;
			});		
		
			$("a[color-id]").click(function(){
				$("a[color-id]").removeClass("active");
				$(this).addClass("active");
				changeProd($(this).attr("color-id"), $("#specId").val(), $("#productPid").val());
				return false;
			});
			
			$("a[spec-id]").click(function(){
				$("a[spec-id]").removeClass("active");
				$(this).addClass("active");
				changeProd($("#colorId").val(), $(this).attr("spec-id"), $("#productPid").val());
				return false;
			});
			
			
			$("#month").html("<option value=''>请选择</option>");
			for(var i = 1; i <= 24; i++){
				$("#month").append("<option value='" + i + "'>" + i + "月</option>");
				$("#month").val(24);
			}
			$("a[color-id]").each(function(){
				if($(this).attr("color-id") == $("#colorId").val()){
					$(this).addClass("active");
				}
			});
			$("a[spec-id]").each(function(){
				if($(this).attr("spec-id") == $("#specId").val()){
					$(this).addClass("active");
				}
			});
			$("#DB_gallery").DB_gallery({
				thumWidth:55,            
				thumGap:8,                
				thumMoveStep:4,           
				moveSpeed:300,            
				fadeSpeed:500,            
			});
			
		});
		function getRecommends(){
			$("#recomm_list").load("<%=basePath%>product/product!getRecommends.do",{"productQuery.categoryId" : $("#categoryId").val(),"timestampe" : new Date().getTime()});
		}
		
		function changeProd(colorId, specId, productPid){
			$.post("<%=basePath%>product/product!queryProduct.do", {
					"productQuery.colorId" : colorId,
					"productQuery.specId" : specId,
					"productQuery.productPid" : productPid,
					"timestamp": new Date().getTime()
				}, function(data) {
					showProDetail(data.pid);
				}, "json");
		}
		
		function plus(){
			var q = parseInt($("#quantity").val()) + 1;
			$("#quantity").val(q);
			cacuMonthPay();
		}
		function menus(){
			var q = $("#quantity").val() - 1;
			if(q == 0){
				q = 1;
			}
			$("#quantity").val(q);
			cacuMonthPay();
		}
		function order(type){
			// alert($("#productId").val() + ", " + $("#firstPay").val() + ", " + $("#month").val())
			var f = $("#firstPay").val();
			//var p = $("#salePrice").val();
			//if(us == 2){
			//	var r = f/p;
			//	if(r < 0.3){
			//		layer.alert("首付比例低于30%!无法进行分期!");
			//		return;
			//	} 
			//}
			window.location.href = "<%=basePath%>order/order!order.do?orderQuery.orderTypes=" + type + "&orderQuery.productId=" + $("#productId").val() + "&orderQuery.firstPay=" + f + "&orderQuery.months=" + $("#month").val() + "&orderQuery.quantity=" + $("#quantity").val();
		}
		function cacuMonthPay(){
			var quantity =  $("#quantity").val();
			$.post("<%=basePath%>product/product!cacuMonthPay.do", {
				"productQuery.productId" : $("#productId").val(),
				"productQuery.firstPay" : $("#firstPay").val(),
				"productQuery.months" : $("#month").val(),
				"productQuery.salePrice" : $("#salePrice").val(),
				"timestampe" : new Date().getTime()
			}, function(data) {
				var monthPay = data.monthPay * quantity;
				var principal = data.principal * quantity;
				var servicePay = data.servicePay * quantity;
				var financialPay = data.financialPay * quantity;
				var html = "<strong>￥"; 
					html += monthPay.toFixed(2);
					html += "(本金：￥" + principal.toFixed(2);
					html += " + 服务费：￥ " + servicePay.toFixed(2); 
					if(financialPay > 0){
						html += " + 财务费：￥" + financialPay.toFixed(2);
					}
					html += ")</strong>";
				$("#returnMoneyInfo").html(html);
			}, "json");
			
		}
		
	</script>
</head>

<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
<!--导航-->
<div class="nav_class">
	<%@include file="../common/nav.jsp"%>
</div>

<div class="mid">
<p class="product-nav">
	<a href="/">首页</a> <span>&gt;&gt;</span> 
	<a href="javascript: showProdList('<s:property value="productQuery.categoryId" />')"><s:property value="productQuery.categoryName" /></a>
</p>	

<div class="product-div">
	<!--图片控件-->
	<div id="DB_gallery">
		<div class="DB_imgSet">
			<div class="DB_imgWin"><img src="" width="350" height="350" alt="图片"/></div>
		</div>
		<div class="DB_thumSet">
			<ul class="DB_thumMove">
				<s:iterator value="productImages" id="imageUrl">
					<li>
						<a href="<s:property value="imageUrl"/>">
							<img src="<s:property value="imageUrl"/>" alt="图片相册" width="55" height="55"/>
						</a>
					</li>				
				</s:iterator>
			</ul>
			<div class="DB_thumLine"></div>
		</div>
	</div>
    <div class="product-info left">
        <div class="product_item clearfix">
        	<div class="product-title">
             	<h3 class="font-size5 product-name" title="<s:property value="productQuery.productName" />"><s:property value="productQuery.productName" /></h3>
             	<!-- 
             	<s:if test="productQuery.salePrice > 3000">
					<font color="red">【亲分期】下单即送五重好礼！</font>
				</s:if>
				 -->
             	<input type="hidden" id="productId" value="<s:property value="productQuery.productId" />" />
                <input type="hidden" id="categoryId" value="<s:property value="productQuery.categoryId" />" />
                <input type="hidden" id="colorId" value="<s:property value="productQuery.colorId" />" />
                <input type="hidden" id="specId" value="<s:property value="productQuery.specId" />" />
                <input type="hidden" id="salePrice" value="<s:property value="productQuery.salePrice" />" />
                <input type="hidden" id="productPid" value="<s:property value="productQuery.productPid" />" />
                <p class="font-size2 font4" title="<s:property value="productQuery.productDesc" />"><s:property value="productQuery.productDesc" /> </p>
                <div class="product_code">
                	<span>商品编号：<s:property value="productQuery.productCode" /></span>
                	<span class="product-collect"><!-- 收藏--></span>
                </div>
        	</div>
        </div>		
        <div class="product_item2 product-choose">
           <dl class="product-price clearfix">
               <dt class="font4">商品价格：</dt>
               <dd>
                   <span class="font-red font-size5">￥<strong><s:property value="%{formatDouble(productQuery.salePrice)}" /></strong></span><!--  &nbsp;<s:if test="productQuery.marketPrice > 0">(全款价格：<s:property value="productQuery.marketPrice" />)</s:if>-->
               </dd>
           </dl>
           <s:if test="colors.size() > 0 && productQuery.productPid > 0">
	           	<dl class="product-mold choose-color event-props clearfix">
					<dt class="font4">颜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：</dt>
					<dd>
						<s:iterator value="colors" id="color">
                   			<a href="javascript:void();" class="font3 event-prop dib font-size0" color-id="<s:property value="colorId" />" title="<s:property value="colorName" />"  style="min-width:60px">
                   				<span class="font3"><s:property value="colorName" /></span>
                   			</a>
	               		</s:iterator>
           			</dd>
	          	</dl>
           	</s:if>
           	<s:if test="specs.size() > 0 && productQuery.productPid > 0">
	           	<dl class="product-mold choose-color event-props clearfix">
					<dt class="font4">内存容量：</dt>
						<dd>
							<s:iterator value="specs" id="spec">
	                   			<a href="javascript:void();" class="font3 event-prop dib font-size0" spec-id="<s:property value="specId" />" title="<s:property value="specDesc" />"  style="min-width:60px">
	                   				<span class="font3"><s:property value="specDesc" /></span>
	                   			</a>
		               		</s:iterator>
            			</dd>
	          	</dl>
           	</s:if>
       	</div>		
        <div class="product_item product-amount ">
             <dl class="product-amo clearfix">
                 <dt class="font4">购买数量：</dt>
                 <dd class=" dib-wrap">
                     <a href="javascript: menus();" class="dib  event-minus-num font-size0">-</a>
                     	<input id="quantity" class="event-item-quantity" value="1" type="text" />
                     <a href="javascript: plus();" class="dib  event-add-num font-size0">+</a>
                     <span class="font_normal">&nbsp;件</span>
                 </dd>
             </dl>
			<dl class="product-payment event-choose-month clearfix">
           		<dt class="font4">首付金额：</dt>
           		<dd style="padding-right:50px;">
               		<input type="text" placeholder="首付金额" style="width:80px; height:25px; padding-left: 3px;" id="firstPay" onblur="cacuMonthPay()" value="0"/><span class="font_normal">&nbsp;元</span>
               	</dd>
                 <dt class="payment_2">分期时间：</dt>
                 <dd>
                     <select id="month" style="float: left;" name="month" onchange="cacuMonthPay()"></select>
                 </dd>
                 <dd id="instals" style="margin-left:20px;">
					<a href="javascript:;" class="inline-block font3" data-month="3">3个月</a>
					<a href="javascript:;" class="inline-block font3" data-month="6">6个月</a>
                    <a href="javascript:;" class="inline-block font3" data-month="9">9个月</a>
                    <a href="javascript:;" class="inline-block font3" data-month="12">12个月</a>
                    <a href="javascript:;" class="inline-block font3" data-month="15">15个月</a>
                    <a href="javascript:;" class="inline-block font3" data-month="18">18个月</a>
                    <a href="javascript:;" class="inline-block font3 current" data-month="24">24个月</a>
                 </dd>
             </dl>
             <dl class="product-pay clearfix">
                 <dt class="font4">月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供：</dt> 
                 <dd style="margin-top:5px;">
                 	<span style="color:#F00; font-size:12px;" id="returnMoneyInfo">
                 		<strong>￥<s:property value="productQuery.monthPay" />(本金：￥<s:property value="productQuery.principal" /> + 服务费：￥ <s:property value="productQuery.servicePay" /><s:if test="productQuery.financialPay > 0">  + 财务费：￥ <s:property value="productQuery.financialPay" /></s:if>)</strong>
                 	</span>
                 </dd>
             </dl>
        </div>		
        <div class="product-button">
             <button id="confirmBuy" class="common-btn event-confirm-buy bg-fc" onclick="order(2)">
                <span class="product-span">全款购买</span>
            </button>
            <button id="confirmBuy" class="common-btn event-confirm-buy bg-fc" onclick="order(1)">
                <span class="product-span">分期购买</span>
            </button>
        </div>
        <div class="special-div"><img src="mall/images/1x.jpg" height="24" class="special-div-img" alt="正品保证"/>正品保证</div>
 		<div class="special-div"><img src="mall/images/2x.jpg" height="24" class="special-div-img" alt="全国联保"/>全国联保</div>
       	<div class="special-div"><img src="mall/images/3x.jpg" height="24" class="special-div-img" alt="急速发货"/>急速发货</div>
       	<div class="special-div"><img src="mall/images/4x.jpg" height="24" class="special-div-img" alt="无忧退换"/>无忧退换</div>
    </div>
</div>

<!--下方滑动门-->
<div id="slide_first">
    <div class="slideTxtBox">
        <div class="hd">
            <ul>
                <li id="link2d11" class="on" onclick="showtitle1(this);">商品详情</li>
                <li><a href="commentList/<s:property value="productQuery.productId" />.html">评论详情</a></li>
                <!--  
                <li id="link2d12" onclick="showtitle1(this);">包装清单</li>
                -->
            </ul>
        </div>
        <div class="bd">
            <ul id="d11" style="display: block;">  
                <div>
                	${productQuery.detailImg }
                </div>
            </ul>
            <!--  
            <ul id="d12" style="display: none;">
                <div>
                	<p>电源适配器 × 1</p><p> 超细纤维擦拭布 × 1 </p><p>快速入门指南 × 1</p>
                </div>
            </ul>
            -->
        </div>
    </div>
</div>
<!--商品推荐-->
<div class="main_left">
	<div class="recomm_nav">
	<h2 class="recomm_header">商品推荐</h2>
	<ul class="recomm_list" id="recomm_list">
		<img src="mall/images/loading.gif" style="margin: 50px 50px 50px 66px;" alt="商品推荐" />
	</ul>
	</div>
</div>
</div>
<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>
</body>
</html>