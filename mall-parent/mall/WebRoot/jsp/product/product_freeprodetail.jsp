<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
<link href="<%=basePath%>css/detail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.gallery.js"></script>
<script type="text/javascript" src="jquery-1.11.3.min.js"></script>
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
			$ ('.footer li').click (function ()
			{
				var that = $ (this);
				that.addClass ('select').siblings ('li').removeClass ('select');
				var i = that.index ('.footer li');
				var len = 100 / 3;
				var lenwidth = len * i + '%';
				$ ('section.pagewrap').css (
				{
					'-webkit-transform' : "translate(" + lenwidth + ")",
					'-webkit-transition' : '300ms linear'
				});
			})
			
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
<%-- 		function showComment(){
		 	var productId = $.trim($("#productId").val());	 
			$.ajax( {
				type : "POST",
				data : {"comment.productId" : productId},
				url : "<%=basePath%>center/center!showComment.do",
				dataType: "json",
				error: function(request) {
	                alert("评论加载失败!");
		        },
				success : function(data) {
		           		commentList(data);
				}
			});
		} --%>
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
               <dt class="font4">商品价格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现价：</dt>
               <dd>
                   <span style="text-decoration:line-through;" class="font-red font-size5">￥<strong><s:property value="productQuery.marketPrice" /></strong></span><!--  &nbsp;-->
                   <span class="font-red font-size5"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;￥0.00</strong></span>
               </dd> 	
        <div class="product_item product-amount ">
             <dl class="product-amo clearfix">
                 <dt class="font4">购买数量：</dt>
                 <dd class=" dib-wrap">
                     <a href="javascript: menus();" class="dib  event-minus-num font-size0">-</a>
                     	<input id="quantity" class="event-item-quantity" value="1" type="text" />
                     <a href="javascript: plus();" class="dib  event-add-num font-size0">+</a>
                     <span class="font_normal">&nbsp;件</span>
                     <input type="hidden" placeholder="首付金额" style="width:80px; height:25px; padding-left: 3px;" id="firstPay"  value="0"/><span class="font_normal"></span> <!-- onblur="cacuMonthPay()" -->
               		 <input type="hidden" id="month" value="3" />
                 </dd>
             </dl>
 			 <dl class="product-payment event-choose-month clearfix">
				<dd style="padding-right:50px;">
           		 	<span class="font-red font-size3"><strong>全国统一邮费23元</strong></span>
           		 	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（每个会员账户只限领取1套)</span>
               		<input type="hidden" placeholder="首付金额" style="width:80px; height:25px; padding-left: 3px;" id="firstPay"  value="0"/><span class="font_normal"></span> <!-- onblur="cacuMonthPay()" -->
               		<input type="hidden" id="month" value="3" />
               	</dd>
        </div>		
        <div class="product-button">
             <button id="confirmBuy" class="common-btn event-confirm-buy bg-fc" onclick="order(2)">
                <span class="product-span">立即领取</span>
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
                <li id="link2d12"><a href="freeCommentList/<s:property value="productQuery.productId" />.html">评论详情</a></li>
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