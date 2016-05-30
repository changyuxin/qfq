<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
	</head>
	<body style="overflow-x:scroll;" > 
		<form id="uploadForm" method="post" enctype="multipart/form-data" action="product/product!uploadCoverImg.do">
			<table class="pn-ltable" style="" width="480" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
					<tr>  
						<td width="12%" class="pn-flabel">封面图片:</td>
						<td width="38%" class="pn-fcontent">
			        		<span id="ufc100">
			        			<input type="file" size="20" id="upload" name="upload" />
			        		</span> 
						</td>
					</tr>
					<tr>  
						<td width="12%" class="pn-flabel">当前封面:</td>
						<td width="38%" class="pn-fcontent">
							<img src="<s:property value="productQuery.coverImg" />" alt="" />
						</td>
					</tr>
					<tr>  
						<td width="12%" class="pn-flabel">商品图片:</td>
						<td width="38%" class="pn-fcontent">
			        		<span id="ufc100">
			        			<input type="file" size="20" id="upload" name="upload" />
			        		</span>
			        		<span id="ufc100">
			        			<input type="file" size="20" id="upload" name="upload" />
			        		</span> 
			        		<span id="ufc100">
			        			<input type="file" size="20" id="upload" name="upload" />
			        		</span> 
			        		<span id="ufc100">
			        			<input type="file" size="20" id="upload" name="upload" />
			        		</span> 
			        		<span id="ufc100">
			        			<input type="file" size="20" id="upload" name="upload" />
			        		</span> 
						</td>
					</tr>
					<tr>  
						<td width="12%" class="pn-flabel">当前商品图片:</td>
						<td width="38%" class="pn-fcontent">
							
						</td>
					</tr>
					<tr>  
						<td width="12%" class="pn-flabel"></td>
						<td width="38%" class="pn-fcontent">
			        		<input type="hidden" value="<s:property value="productQuery.productId"/>" 
								name="productQuery.productId" id="productQuery.productId"/>
							<input type="submit" value="上传图片" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>





