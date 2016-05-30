<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
			var categoryId = $("#categoryId").val();
			var pcategoryId = $("#pcategoryId").val();
			$("#productQuery_categoryIds").val(pcategoryId + "-" + categoryId);
			$("#productQuery_brandId").val($("#brandId").val());
			$("#productQuery_productPid").val($("#productPid").val());
			$("#productQuery_colorId").val($("#colorId").val());
			$("#productQuery_specId").val($("#specId").val());
			$("input:radio[name='productQuery.exendedPrice']").each(function(){
				if($(this).val() == $("#exendedPrice").val()){
					$(this).attr("checked", "checked");
				}
			});
			$("input:radio[name='productQuery.exendedMeasure']").each(function(){
				if($(this).val() == $("#exendedMeasure").val()){
					$(this).attr("checked", "checked");
				}
			});
			if($("#onSale").val() == 1){
				$("#productQuery\\.onSale").attr("checked", "checked");
			}
			if($("#isIndex").val() == 1){
				$("#productQuery\\.isIndex").attr("checked", "checked");
			}
			if($("#isRecommend").val() == 1){
				$("#productQuery\\.isRecommend").attr("checked", "checked");
			}
			
		});	
		
		function getProds(o){
			$.post("product/product!getProductLists.do", {
					"productQuery.brandId" : $(o).val()
				}, function(json) {
					var productPid = $("#productQuery_productPid");
					productPid.html("<option value='-1'>-请选择-</option>");  
					for(var i = 0; i < json.length; i++){  
	            		productPid.append("<option value='" + json[i].productPid + "'>" + json[i].productPname + "</option>");  
					};
				}, "json");
		}
		
		function submitProduct(){
			if(checkSubmit()){
				// 更新ckeditor属性值
				for( instance in CKEDITOR.instances ){ 
					CKEDITOR.instances[instance].updateElement(); 
				}
				$("#productForm").attr("action", "product/product!saveProduct.do").submit();
			} else {
				return;
			}
		}
		function checkSubmit(){
			if($("#productQuery\\.productName").val().length == 0){
				alert("商品名称为空!");
				return false;
			}
			if($("#productQuery\\.productCode").val().length == 0){
				alert("商品编号为空!");
				return false;
			}
			if($("#productQuery_categoryIds").val() == "-"){
				alert("商品分类未选择!");
				return false;
			}
			if($("#productQuery_brandId").val() == ''){
				alert("品牌未选择!");
				return false;
			}
			if($("#productQuery\\.marketPrice").val().length == 0){
				alert("市场价为空!");
				return false;
			}
			if($("#productQuery\\.salePrice").val().length == 0){
				alert("销售价为空!");
				return false;
			}
			if($("#productQuery\\.costPrice").val().length == 0){
				alert("成本价为空!");
				return false;
			}
			if($("#productQuery\\.stockCount").val().length == 0){
				alert("商品库存为空!");
				return false;
			}
			if($("input:radio[name='productQuery.exendedPrice']:checked").val() == null){
				alert("价格范围未选择!");
				return false;
			}
			return true;
		}	
		// 返回列表
		function returnList(){
			window.location.href="product/product!index.do";
		}
	</script>
</head>
<body>
	<!-- 
	<div class="rhead">
		<div class="rpos">当前位置: 商品 - 商品管理 - 编辑</div>
		<input type="button" value="返回列表" onclick="returnList()">
		<div class="clear"></div>
	</div>
 -->
	<form class="ropt">
			<input type="hidden" value="<s:property value="product.categoryId"/>" name="categoryId" id="categoryId" />
			<input type="hidden" value="<s:property value="product.pcategoryId"/>"  name="pcategoryId" id="pcategoryId" />	
			<input type="hidden" value="<s:property value="product.productPid"/>"  name="productPid" id="productPid" />
			<input type="hidden" value="<s:property value="product.colorId"/>"  name="colorId" id="colorId" />
			<input type="hidden" value="<s:property value="product.specId"/>"  name="specId" id="specId" />
			<input type="hidden" value="<s:property value="product.onSale"/>" name="onSale" id="onSale" />
			<input type="hidden" value="<s:property value="product.isIndex"/>" name="isIndex" id="isIndex" />
			<input type="hidden" value="<s:property value="product.isRecommend"/>" name="isRecommend" id="isRecommend" />
			<input type="hidden" value="<s:property value="product.brandId"/>" name="brandId" id="brandId" />	
			<input type="hidden" value="<s:property value="product.exendedPrice"/>" name="exendedPrice" id="exendedPrice" />	
			<input type="hidden" value="<s:property value="product.exendedMeasure"/>" name="exendedMeasure" id="exendedMeasure" />	
		</form>
	<!--不可动-->
	<form method="get" action="" id="productForm" enctype="multipart/form-data">
		<input type="hidden" value="<s:property value="product.productId"/>" name="productQuery.productId" id="productQuery.productId" />
		<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
			<tbody>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品名称：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<input type="text" maxlength="150" value="<s:property value="product.productName"/>" 
							name="productQuery.productName" id="productQuery.productName" style="width: 400px;"/>
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品编号:
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<input type="text" maxlength="150" value="<s:property value="product.productCode"/>" readonly="readonly"
							name="productQuery.productCode" id="productQuery.productCode" style="width: 400px;"/>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品分类：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<select name="productQuery.categoryIds" id="productQuery_categoryIds" >
							<option value="-" selected="selected">-请选择-</option>
							<s:iterator value="categoryList" id="category" >
								<option value="<s:property value="#category.pcategoryId"/>-<s:property value="#category.categoryId"/>">
									<s:property value="#category.categoryName"/></option>
								<s:if test="children.size() > 0">
		          					<s:iterator value="children" id="child">
										<option value="<s:property value="#category.categoryId"/>-<s:property value="#child.categoryId"/>">
											&nbsp;&nbsp;&gt;<s:property value="#child.categoryName"/></option>
									</s:iterator>
								</s:if>
							</s:iterator>
						</select>
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">是否上架:</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<input type="checkbox" name="productQuery.onSale" id="productQuery.onSale" value="1" /> 上架
						<input type="checkbox" name="productQuery.isIndex" id="productQuery.isIndex" value="1" /> 首页
						位置：<input type="text" name="productQuery.indexOrder" id="productQuery.indexOrder" value="<s:property value="product.indexOrder"/>" style="width: 40px;"/> 
						<input type="checkbox" name="productQuery.isRecommend" id="productQuery.isRecommend" value="1" /> 推荐
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>品牌：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<select name="productQuery.brandId" id="productQuery_brandId" onchange="getProds(this)">
							<option value="" selected="selected">-请选择-</option>
							<s:iterator value="brandList" id="brand">
								<option value="<s:property value="#brand.brandId"/>"><s:property value="#brand.brandName"/></option>
							</s:iterator>
						</select>
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">
						商品：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<select name="productQuery.productPid" id="productQuery_productPid">
							<option value="" selected="selected">-请选择-</option>
							<s:iterator value="prods" id="prod" >
								<option value="<s:property value="#prod.productPid"/>">
									<s:property value="#prod.productPname"/>
								</option>
							</s:iterator>
						</select>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						颜色：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<select name="productQuery.colorId" id="productQuery_colorId">
							<option value="" selected="selected">-请选择-</option>
							<s:iterator value="colors" id="color">
								<option value="<s:property value="#color.colorId"/>">
									<s:property value="#color.colorName"/>
								</option>
							</s:iterator>
						</select>
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">
						规格：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<select name="productQuery.specId" id="productQuery_specId">
							<option value="" selected>-请选择-</option>
							<s:iterator value="specs" id="spec" >
								<option value="<s:property value="#spec.specId"/>">
									<s:property value="#spec.specDesc"/>
								</option>
							</s:iterator>
						</select>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品价格：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						市场价：<input type="text" value="<s:property value="product.marketPrice"/>" 
							name="productQuery.marketPrice" id="productQuery.marketPrice" style="width:50px" /> &nbsp; 
						销售价：<input type="text" value="<s:property value="product.salePrice"/>" 
							name="productQuery.salePrice" id="productQuery.salePrice" style="width:50px" /> &nbsp; 
						成本价：<input type="text" value="<s:property value="product.costPrice"/>" 
							name="productQuery.costPrice" id="productQuery.costPrice" style="width:50px" /> &nbsp; 
					</td>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>商品库存：
					</td>
					<td colspan="1" width="38%" class="pn-fcontent">
						<input type="text" maxlength="10" value="<s:property value="product.stockCount"/>" 
							name="productQuery.stockCount" id="productQuery.stockCount" size="10" />
					</td>
				</tr>
				<!--  
				<tr>  
					<td width="12%" class="pn-flabel"><span class="pn-frequired">*</span>封面图片:</td>
					<td width="38%" class="pn-fcontent" colspan="1">
	        		<span id="ufc100">
	        			<input type="file" size="20" id="coverImgFile" name="coverImgFile">
	        		</span> 
					</td>
					<td class="pn-fbutton" colspan="2">
	            		<img style="width:100px; height:100px; background-color:#CCCCCC; border:1px solid #333" src="" alt="预览160*160" id="preCoverImg">
					</td>      
				</tr>
				-->
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>价格范围：
					</td>
					<td colspan="3" width="88%" class="pn-fcontent">
						<label><input type="radio" value="14" name="productQuery.exendedPrice" id="productQuery.exendedPrice" />0-1299</label>
						<label><input type="radio" value="15" name="productQuery.exendedPrice" id="productQuery.exendedPrice" />1300-1799</label>
						<label><input type="radio" value="16" name="productQuery.exendedPrice" id="productQuery.exendedPrice" />1800-2699</label>
						<label><input type="radio" value="17" name="productQuery.exendedPrice" id="productQuery.exendedPrice" />2700-5499</label>
						<label><input type="radio" value="18" name="productQuery.exendedPrice" id="productQuery.exendedPrice" />5500-9399</label>
						<label><input type="radio" value="19" name="productQuery.exendedPrice" id="productQuery.exendedPrice" />9400以上</label>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">
						尺寸：
					</td>
					<td colspan="3" width="88%" class="pn-fcontent">
						<label><input type="radio" value="18" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />4英寸及以下</label> 
						<label><input type="radio" value="19" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />4-5英寸</label> 
						<label><input type="radio" value="20" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />5-7英寸</label> 
						<label><input type="radio" value="21" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />7-9英寸</label> 
						<label><input type="radio" value="22" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />9-10英寸</label>		
						<label><input type="radio" value="23" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />10-12英寸</label> 
						<label><input type="radio" value="24" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />12-14英寸</label> 
						<label><input type="radio" value="25" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />14-16英寸</label> 
						<label><input type="radio" value="26" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />16-18英寸</label> 
						<label><input type="radio" value="27" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />18-20英寸</label> 
						<label><input type="radio" value="28" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />20-22英寸</label> 
						<label><input type="radio" value="29" name="productQuery.exendedMeasure" id="productQuery.exendedMeasure" />22英寸及以上</label>
					</td>
				</tr>
				<tr>
					<td width="12%" class="pn-flabel pn-flabel-h">商品描述:</td>
					<td colspan="3" width="88%" class="pn-fcontent">
						<textarea cols="80" rows="10" name="productQuery.detailImg" id="productQuery.detailImg"><s:property value="product.detailImg"/></textarea>
					</td>
				</tr>
				<!--提交重置按钮-->
				<tr>
					<td colspan="4" class="pn-fbutton">
						<input type="button" value="提交" onclick="submitProduct();" />&nbsp; 
						<input type="reset" value="重置" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<iframe frameborder="0" style="display:none; width:0px; height:0px;" border="0" name="hiddenIframe"></iframe>
	<form style="display:none;width:0px;height:0px;" target="hiddenIframe" enctype="multipart/form-data" method="post" id="uploadForm"></form>
	<ckeditor:replace replace="productQuery.detailImg" basePath="ckeditor/" />
</body>
</html>