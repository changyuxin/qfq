<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
<link href="<%=basePath%>css/list.css" rel="stylesheet" type="text/css" />
<title>亲分期 - 商品列表</title>
	<script type="text/javascript">
	    //加载信息列表
		$(function(){   
			init();
			//点击品牌列表触发
			$("[brand]").click(function() {
				$("[brand]").css("color",""); 
				$(this).css("color","#F60");
				$("#brandId").val($(this).attr("brand"));
				queryProductList(1);
			});
			//点击价格区间触发
			$("[exendedPrice]").click(function() {
				$("[exendedPrice]").css("color","");
				$("#minPrice").val("");
				$("#maxPrice").val("");
				$(this).css("color","#F60");
				$("#exendedPrice").val($(this).attr("exendedPrice"));
				queryProductList(1);
			});
			//点击确定触发
			$(".btn_submit").click(function(){
				$("[exendedPrice]").css("color","");
				$("#exendedPrice").val("0");
				queryProductList(1);
			});
			//点击排序方式触发
			$(".do_item").click(function(){
				
				$(".do_item").css("background",""); 
				$(this).css("background","lightgray");
				
				var order;
				if ($(this).attr("orderField") == $("#orderField").val()) {
					order = $("#orderType").val() == "asc" ? "desc" : "asc";
				} else {
					order = "desc";
				}
				$("#orderType").val(order);
				$("#orderField").val($(this).attr("orderField"));
				$(".do_item img").hide();
				$(this).find("img[" + order + "]").show();
				
				queryProductList(1);
			});
			queryProductList(1);
			getRecommends();
		});
		
		function getRecommends(){
			var v = $("#categoryId").val();
			if(v == null){
				v = 2;
			}
			if(v == 7)
			{
				$("#recomm_list").load("product/product!getFreeRecommends.do",{"productQuery.categoryId" : v, "timestampe" : new Date().getTime()});
			}
			$("#recomm_list").load("product/product!getRecommends.do",{"productQuery.categoryId" : v, "timestampe" : new Date().getTime()});
		}
		
	    //初始化
	    function init(){
	    	$("ul.classify_list:first li.classify_item:first a").css("color","#F60");
	    	$("ul.classify_list:eq(1) li.classify_item:first a").css("color","#F60");
	    	$(".do_item:first").css("background","lightgray");
	    	$("#orderField").val("create_time");
	    	$("#orderType").val("desc");
	    }
	    //根据条件查询
	    function queryProductList(index){
	    	//点击查询时,将页码置为1
			if(index == 1){
				$("[name='productQuery.pageNo']").val(1);
			}
	    	$("#productList").html(loading(100)).load("product/product!queryProductListByCon.do",$("#product_form").serializeArray());
	    }
		//点击上部分页中的上一页按钮
		function abovePreve() {
			var pageNo = $("[name='productQuery.pageNo']").val();
			if (pageNo > 1) {
				pageNo = pageNo - 1;
				$("[name='productQuery.pageNo']").val(pageNo);
				queryProductList();
			}
		}
		
		//点击上部分页中的下一页按钮
		function aboveNext() {
			var pageNo = $("[name='productQuery.pageNo']").val();
			var pageTotal = $("[name='productQuery.pageTotal']").val();
			if (pageNo < pageTotal) {
				pageNo = eval(pageNo) + 1;
				$("[name='productQuery.pageNo']").val(pageNo);
				queryProductList();
			}
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
<div class="list_content" id="list_container">
		<p class="top_nav">
			<s:if test="productQuery.keyword == null">
				<a href="/">首页</a> <span>&gt;&gt;</span>
				<a class="nav_active" href="javascript:;">${category.categoryName}</a>
			</s:if>
			<s:else>
				"<s:property value='productQuery.keyword'/>"搜索结果: 
			</s:else>
		</p>
		<form id="product_form">
			<input type="hidden" name="productQuery.pageNo"  value="<s:property value='productQuery.pageNo'/>"/>
			<input type="hidden" name="productQuery.pageTotal"  value="<s:property value='productQuery.pageTotal'/>"/>
			<input type="hidden" name="productQuery.keyword"  value="<s:property value='productQuery.keyword'/>"/>
			<input type="hidden" name="productQuery.onSale"  value="1"/>
			<s:if test="productQuery.keyword == null">
			<div  class="classify_nav" style="padding-bottom: 41px;">
				<input type="hidden" id="categoryId" name="productQuery.categoryId" value="${productQuery.categoryId}"/>
				<input type="hidden" id="brandId" name="productQuery.brandId" value="${productQuery.brandId}"/>
				<input type="hidden" id="exendedPrice" name="productQuery.exendedPrice" value="${productQuery.exendedPrice}"/>
				<input type="hidden" id="orderField" name="productQuery.orderField" value="${productQuery.orderField}"/>
				<input type="hidden" id="orderType" name="productQuery.orderType" value="${productQuery.orderType}"/>
				
				<h2 class="classify_header">商品筛选</h2>
				<ul class="classify_list ul_hight" >
					<li class="classify_title">品牌：</li>
					<li class="classify_item" ><a href="javascript:void(0);" brand="0">全部</a></li>
					<li class="classify_special">
						<ul class="classify_item_list" style="height: 28px;">
							<s:iterator value="brandList" var="list">
								<li class="classify_item" >
									<a href="javascript:void(0);"  id="<s:property value="brandName"/>" brand='<s:property value="brandId"/>'>
										<s:property value="brandName"/>
									</a>
								</li>
							</s:iterator>
						</ul>
					</li>
				</ul>
				<ul class="classify_list clearfix">
					<li class="classify_title">价格：</li>
					<li class="classify_item"><a class="do_active"  href="javascript:void(0)" exendedPrice="0">全部</a></li>
					<li class="classify_item"><a href="javascript:void(0)" exendedPrice="14">0-1299元以下</a></li>
					<li class="classify_item"><a href="javascript:void(0)" exendedPrice="15">1300-1799元</a></li>
					<li class="classify_item"><a href="javascript:void(0)" exendedPrice="16">1800-2699元</a></li>
					<li class="classify_item"><a href="javascript:void(0)" exendedPrice="17">2700-5499元</a></li>
					<li class="classify_item"><a href="javascript:void(0)" exendedPrice="18">5500-9399元</a></li>
					<li class="classify_item"><a href="javascript:void(0)" exendedPrice="19">9400元以上</a></li>
					<li class="classify_item">
						<input class="classify_serch" type="text" value="${productQuery.minPrice}" id="minPrice" name="productQuery.minPrice"/> 
							- 
						<input class="classify_serch" type="text" value="${productQuery.maxPrice}" id="maxPrice" name="productQuery.maxPrice"/> 
		                <a href="javascript:void(0);">
		                	<span class="btn_submit" id="priceRangeBtn">确定</span>
		                </a>
		        	</li>
				</ul>
				<div class="classify_nav_more event_nav_more">展开选项<i class="more"></i></div>
			</div>
			</s:if>
		</form>
		<div class="main_con">
        	<!--商品推荐 -->
			<div class="main_left">
				<div class="recomm_nav">
					<h2 class="recomm_header">商品推荐</h2>
					<ul class="recomm_list" id="recomm_list">
						<img src="mall/images/loading.gif" style="margin: 50px 50px 50px 66px;" alt="商品推荐" />
					</ul>
				</div>	
			</div>
			
			<div class="main_right">
			<div class="do_classify">
				<ul class="do_classify_list event-query-classify">
					<li class="do_item"  orderField="create_time"><a href="javascript:void(0);">默认</a>
							<img src="mall/images/up.gif" style="padding-left:5px;" asc alt="升序"/>
							<img src="mall/images/down.gif" style="padding-left:5px; display:none;" desc alt="降序"/>
					</li>
					<li class="do_item"  orderField="sale_count"><a href="javascript:void(0);">销量</a>
							<img src="mall/images/up.gif" style="padding-left:5px;display:none;" asc alt="升序"/>
							<img src="mall/images/down.gif" style="padding-left:5px;display:none;" desc alt="降序"/>
					</li>
					<li class="do_item"  orderField="sale_price"><a href="javascript:void(0);">价格</a>
							<img src="mall/images/up.gif" style="padding-left:5px;display:none;" asc alt="升序"/>
							<img src="mall/images/down.gif" style="padding-left:5px;display:none;" desc alt="降序"/>
					</li>
				</ul>
				<div class="do_info">
					<span id="above_page_no" class="red_color"></span>/<span id="above_page_total" class="num"></span>
					<a class="pagin_prev" href="javascript: abovePreve()">&lt;</a>
					<a class="pagin_next" href="javascript: aboveNext()">&gt;</a>
				</div>
			</div>
			<!--商品列表-->
			<div id="productList">
				<img src="mall/images/loading.gif" style="margin-top: 100px; margin-left: 485px;" alt="正在加载数据中"/>
            </div>
            <div class="pagination list_content">
				<div pageDiv class="msdn">
				</div>
				<div class="pagin_go">
	        	</div>
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