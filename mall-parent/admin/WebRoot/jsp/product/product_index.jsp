<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<%@include file="../common/head.jsp"%>
	<title>亲分期后台-商品管理</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#left_nav").load("product/product!getCategorys.do");
				//$("#main").load("product/product!getProducts.do");
				queryProductList(1);
			});
			
			// 显示商品列表
			function showProdList(pid, id){
				document.getElementById("productQuery.pcategoryId").value = pid;
				document.getElementById("productQuery.categoryId").value = id;
				//$("#main").load("product/product!getProducts.do",{"productQuery.pcategoryId": pid, "productQuery.categoryId" : id});
				queryProductList(1);
			}
			//根据条件查询
		    function queryProductList(index){
		    	//点击查询时,将页码置为1
				if(index == 1){
					$("[name='productQuery.pageNo']").val(1);
				}
		    	$("#main").load("product/product!queryProductListByCon.do",$("#tableForm1").serializeArray()).html(loading);
		    }
		</script>
	</head>
	<body>
		<!--页头Begin-->
		<%@include file="../common/top.jsp"%>
		<!--页头End-->
		<div style="overflow:hidden;">
			<div class="div_l" id="left_nav">
			</div>
			<div class="body-box" id="main">
			</div>
		</div>
	</body>
</html>





