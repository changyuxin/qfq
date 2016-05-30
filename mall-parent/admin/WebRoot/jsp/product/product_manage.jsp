<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript">
		$(function(){   
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="productQuery.pageNo" />,
				total: <s:property value="productQuery.total" />,
				pageSize: <s:property value="productQuery.pageSize" />,
				callback: function(selectPage) {
					$("[name='productQuery.pageNo']").val(selectPage);
					queryProductList();
				}
			});
			
			$(".pn-ltable tr").mouseover(function() {
				$(this).addClass("over");
			}).mouseout(function() {
				$(this).removeClass("over");
			});
			
			// $(".pn-ltable tr:even").addClass("alt");
			
			$("#isOnSale").click(
				function() {
					if ($(this).is(":checked")) {
						$("#isOnSale").val(1);
					} else {
						$("#isOnSale").val(0);
					}
				}
			);
			$("#isIndex").click(
				function() {
					if ($(this).is(":checked")) {
						$("#isIndex").val(1);
					} else {
						$("#isIndex").val(0);
					}
				}
			);
			$("#isRecommend").click(
				function() {
					if ($(this).is(":checked")) {
						$("#isRecommend").val(1);
					} else {
						$("#isRecommend").val(0);
					}
				}
			);
			
			if('${productQuery.onSale}' == 1){
				$("#isOnSale").attr("checked",'checked');
			}
			if('${productQuery.isIndex}' == 1){
				$("#isIndex").attr("checked",'checked');
			}
			if('${productQuery.isRecommend}' == 1){
				$("#isRecommend").attr("checked",'checked');
			}
			
		});
		
		function addProduct(pid, id){
			layer.open({
			    type: 2,
			    title: "添加商品",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["1000px", "800px"],
			    content: "product/product!saveProductPage.do"
			});
			// $("#main").load("product/product!saveProductPage.do");
		}
		
		function deleteProduct(prodId){
			if(confirm("确认删除该商品吗?")){
				$.post("product/product!deleteProduct.do", {
					"productQuery.productId" : prodId
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert("删除失败!"); 
					} else {
						location.href = "product/product!index.do";	
				}
				}, "json");
			}
		}

		function modifyProduct(prodId){
			layer.open({
			    type: 2,
			    title: "编辑商品",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["1000px", "800px"],
			    content: "product/product!saveProductPage.do?productQuery.productId=" + prodId
			});
			// $("#main").load("product/product!saveProductPage.do", {"productQuery.productId" : prodId});
		}
		
		function uploadProdCover(id){
			layer.open({
			    type: 2,
			    title: "上传商品图片",
			    shadeClose: true,
			    shade: 0.3,
			    area: ["700px", "650px"],
			    content: "product/product!uploadCoverPage.do?productQuery.productId=" + id
			});
		}
		
		function close(id){
			var msg = "";
			switch (id){
			  case 1: msg = "上传成功!";
			    break;
			  case 2: msg = "编辑服务费成功!";
			    break;
			   default: "提交成功!";
			 }
			layer.closeAll("iframe");
		}
		
		function closeAndFresh(){
			layer.closeAll();
			queryProductList();
		}
		
		function detail(prodId){
			layer.open({
			    type: 2,
			    title: "商品详情",
			    shadeClose: true,
			    shade: 0.3,
			    area: ["1000px", "800px"],
			    content: "product/product!detail.do?productQuery.productId=" + prodId
			});
			//$("#main").load("product/product!detail.do", {"productQuery.productId" : prodId, "timestamp" : new Date().getTime()});
		}
		
		function setServiceCharge(id){
			layer.open({
			    type: 2,
			    title: "设置商品服务费",
			    shadeClose: true,
			    shade: 0.3,
			    area: ["600px", "350px"],
			    content: "product/product!setServiceChargePage.do?productQuery.productId=" + id
			});
		}
		
		function addProdStyle(id){
			layer.open({
			    type: 2,
			    title: "添加商品款式",
			    shadeClose: true,
			    shade: 0.3,
			    area: ["700px", "500px"],
			    content: "product/product!addProdStylePage.do?productQuery.productId=" + id
			});
		}
		//点击确定触发
		$("#queryProduct").click(function(){
			queryProductList(1);
		});
	</script>

</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 商品 - 商品管理 - 列表</div>
			<input type="button" class="ropt" value="添加商品" onclick="addProduct()" />
			<div class="clear"></div>
		</div>
		<!-- --> 
		<form id="tableForm1" method="post">
			<div class="rhead">
					商品名称：<input type="text" name="productQuery.keyword" value="<s:property value='productQuery.keyword'/>" style="width:100px" /> 
					商品编号：
					<s:if test="productQuery.productCode == 0">
						<input type="text" name="productQuery.productCode" value="" style="width:100px" />
					</s:if>
					<s:else>
						<input type="text" name="productQuery.productCode" value="<s:property value='productQuery.productCode'/>" style="width:100px" />
					</s:else>
					<label class="ckl"><input type="checkbox" id="isOnSale" name="productQuery.onSale"  value="<s:property value='productQuery.onSale'/>" />上架</label> 
					<label class="ckl"><input type="checkbox" id="isIndex" name="productQuery.isIndex" value="<s:property value='productQuery.isIndex'/>"/>首页显示</label>
					<label class="ckl"><input type="checkbox" id="isRecommend" name="productQuery.isRecommend" value="<s:property value='productQuery.isRecommend'/>"/>推荐</label>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="queryProduct"/>
					<div class="clear"></div>
			</div>
			<input type="hidden" value="<s:property value='productQuery.pcategoryId'/>" name="productQuery.pcategoryId" id="productQuery.pcategoryId" />
			<input type="hidden" value="<s:property value='productQuery.categoryId'/>" name="productQuery.categoryId" id="productQuery.categoryId" />
			<input type="hidden" name="productQuery.pageNo"  value="<s:property value='productQuery.pageNo'/>"/>
			<input type="hidden" name="productQuery.pageTotal"  value="<s:property value='productQuery.pageTotal'/>"/>
				<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
					<thead class="pn-lthead">
						<tr>
							<th width="25">
								<input type="checkbox" />
							</th>
							<th width="30">ID</th>
							<th>商品名称</th>
							<th>商品编号</th>
							<th>分类</th>
							<!--  
							<th>类型</th>
							-->
							<th>市场价</th>
							<th>销售价</th>
							<th>商品库存</th>
							<th>品牌</th>
							<th>上架</th>
							<th>首页显示</th>
							<th>商品详情</th>
							<th>推荐</th>
							<th>操作选项</th>
						</tr>
					</thead>
					<tbody class="pn-ltbody">
						<s:if test="productList.size() > 0">
							<s:iterator value="productList" id="product">
								<tr>
									<td align="center">
										<input type="checkbox" name="ids" value="5" />
									</td>
									<td align="center"><s:property value="#product.productId"/></td>
									<td align="left" style="padding-left: 5px;">
										<!--  
										<a href="javascript: modifyProduct('<s:property value="#product.productId"/>')">
											
										</a>
										-->
										<a href="javascript: detail('<s:property value="#product.productId"/>');">
											<s:property value="#product.productName"/>	
										</a>
									</td>
									<td align="center">
										<s:if test="#product.productCode > 0">
											<s:property value="#product.productCode"/>
										</s:if>
									</td>
									<td align="center"><s:property value="#product.categoryName"/></td>
									<!--  
									<td align="center"><s:property value="#product.pcategoryName"/></td>
									-->
									<td align="center"><s:property value="#product.marketPrice"/></td>
									<td align="center"><s:property value="#product.salePrice"/></td>
									<td align="center"><s:property value="#product.stockCount"/></td>
									<td align="center"><s:property value="#product.brandName"/></td>
									<td align="center">
										<s:if test="#product.onSale == 1">
											是
										</s:if>
										<s:if test="#product.onSale == 0">
											否
										</s:if>
									</td>
									<td align="center">
										<s:if test="#product.isIndex == 1">
											是
										</s:if>
										<s:if test="#product.isIndex == 0">
											否
										</s:if>
									</td>
									<td align="center">
										<s:if test="test=#product.detailImg != null && !''.equals(#product.detailImg)">
											有
										</s:if>
										<s:else>
											无
										</s:else>
									</td>
									<td align="center">
										<s:if test="test=#product.isRecommend == 1">
											是
										</s:if>
										<s:else>
											否
										</s:else>
									</td>
									<td align="center">
										<a href="javascript: uploadProdCover('<s:property value="#product.productId"/>');">上传图片</a> &nbsp;|&nbsp; 
										<!--  
										<a href="javascript: addProdStyle('<s:property value="#product.productId"/>');">添加款式</a> &nbsp;|&nbsp; 
										-->
										<a href="javascript: setServiceCharge('<s:property value="#product.productId"/>')">设置服务费</a> &nbsp;|&nbsp; 
										<a href="javascript: detail('<s:property value="#product.productId"/>');">查看商品</a> &nbsp;|&nbsp; 
										<a href="javascript: modifyProduct('<s:property value="#product.productId"/>')">修改</a> &nbsp;|&nbsp; 
										<a href="javascript: deleteProduct('<s:property value="#product.productId"/>')">删除</a>
									</td>
								</tr>
							</s:iterator>
						</s:if>
					</tbody>
				</table>
				<div class="pagination list_content" style="text-align: center;">
					<div pageDiv class="msdn" style="float: left;"></div>
					<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="productQuery.total" /> 条记录</div>
				</div>
			</div>
			</form>
	<!--main end-->
	</body>
</html>





