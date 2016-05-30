<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="../common/head.jsp"%>
	<style type="text/css">
		.td_bottom {border-bottom: 1px solid #CCC; height: 30px; text-align: left;}
	</style>
	<script type="text/javascript">
			// var pid = document.getElementById("productQuery.pcategoryId").value;
			// var id = document.getElementById("productQuery.categoryId").value;
			// alert(document.getElementById("productQuery.pcategoryId").value + "-" + document.getElementById("productQuery.categoryId").value);
		$(function(){
			
		});	

		// 返回列表
		function returnList(){
			window.location.href=basePath + "product/product!index.do";
		}
	</script>
</head>
<body>
	<!--不可动
	<div class="rhead">
		<div class="rpos">当前位置: 商品 - 商品管理 - 查看商品</div>
		<form class="ropt">
			<input type="button" value="返回列表" onclick="returnList()">
		</form>
		<div class="clear"></div>
	</div>
	-->
		<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
			<tbody>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品名称：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<s:property value="productQuery.productName"/>
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">是否上架:</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<s:if test="productQuery.onSale == 1">
							是
						</s:if>
						<s:if test="productQuery.onSale == 0">
							否
						</s:if>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品分类：
					</td>
					<td colspan="3" width="38%" class="pn-fcontent">
						<s:property value="productQuery.categoryName"/>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>品牌：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<s:property value="productQuery.brandName"/>
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<s:property value="productQuery.productPid"/>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>颜色：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<s:property value="productQuery.colorId"/>
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>容量：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<s:if test="productQuery.memoryId == 1">
							8G
						</s:if>
						<s:if test="productQuery.memoryId == 2">
							16G
						</s:if>
						<s:if test="productQuery.memoryId == 3">
							32G
						</s:if>
						<s:if test="productQuery.memoryId == 4">
							64G
						</s:if>
						<s:if test="productQuery.memoryId == 5">
							128G
						</s:if>
					</td>
				</tr>
				
				
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品价格：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						市场价：<s:property value="productQuery.marketPrice"/> &nbsp; 
						销售价：<s:property value="productQuery.salePrice"/> &nbsp; 
						成本价：<s:property value="productQuery.costPrice"/> &nbsp; 
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品库存：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<s:property value="productQuery.stockCount"/>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品服务费：
					</td>
					<td colspan="3" width="38%" class="pn-fcontent">
						<table width="20%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
							<tbody>
								<tr>
									<td class="pn-flabel pn-flabel-h"  style="text-align: center;">
										起始期数
									</td>
									<td class="pn-flabel pn-flabel-h"  style="text-align: center;">
										结束期数
									</td>
									<td class="pn-flabel pn-flabel-h"  style="text-align: center;">
										服务费
									</td>
								</tr>
								<s:iterator value="serviceRates" id="rate" status="L">
									<tr>
										<td class="pn-flabel pn-flabel-h"  style="text-align: center;">
											<s:property value="#rate.periodNumStart"/>
										</td>
										<td class="pn-flabel pn-flabel-h"  style="text-align: center;">
											<s:property value="#rate.periodNumEnd"/>
										</td>
										<td class="pn-flabel pn-flabel-h"  style="text-align: center;">
											<s:property value="#rate.serviceRate"/>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>  
					<td width="12%" class="pn-flabel"><span class="pn-frequired">*</span>封面图片:</td>
					<td width="38%" class="pn-fcontent" colspan="3">
						<img style="width:100px; height:100px; background-color:#CCCCCC; border:1px solid #333" 
							src="<s:property value="productQuery.coverImg"/>" alt="预览160*160" id="preCoverImg">
					</td>
				</tr>
				<tr>  
					<td width="12%" class="pn-flabel"><span class="pn-frequired">*</span>商品图片:</td>
					<td width="38%" class="pn-fcontent" colspan="3">
						<s:iterator value="productImages" id="imageUrl">
							<img style="width:100px; height:100px; background-color:#CCCCCC; border:1px solid #333" 
								src="<s:property value="imageUrl"/>" />
						</s:iterator>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>价格范围：
					</td>
					<td colspan="3" width="88%" class="pn-fcontent">
						<s:if test="productQuery.exendedPrice == 14">
							0-699
						</s:if>
						<s:if test="productQuery.exendedPrice == 15">
							700-1299
						</s:if>
						<s:if test="productQuery.exendedPrice == 16">
							1300-1799
						</s:if>
						<s:if test="productQuery.exendedPrice == 17">
							1800-2699
						</s:if>
						<s:if test="productQuery.exendedPrice == 18">
							2700-5499
						</s:if>
						<s:if test="productQuery.exendedPrice == 19">
							5500-9399
						</s:if>
						<s:if test="productQuery.exendedPrice == 20">
							9400以上
						</s:if>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>尺寸：
					</td>
					<td colspan="3" width="88%" class="pn-fcontent">
						<s:if test="productQuery.exendedMeasure == 18">
							4英寸及以下
						</s:if>
						<s:if test="productQuery.exendedMeasure == 19">
							4-5英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 20">
							5-7英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 21">
							7-9英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 22">
							9-10英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 23">
							11-12英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 24">
							13-14英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 25">
							15-16英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 26">
							17-18英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 27">
							19-20英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 28">
							21-22英寸
						</s:if>
						<s:if test="productQuery.exendedMeasure == 29">
							23英寸及以上
						</s:if>
					</td>
				</tr>
				
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">商品描述:</td>
					<td colspan="3" width="88%" class="pn-fcontent">
						${productQuery.detailImg}
					</td>
				</tr>
				
			</tbody>
		</table>
</body>
</html>