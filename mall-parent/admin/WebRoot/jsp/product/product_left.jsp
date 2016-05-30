<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script src="js/pony.js" type="text/javascript"></script>
	<script src="js/pony.tree.js" type="text/javascript"></script>
	<script type="text/javascript">
			$(document).ready(function(){
				$("[cate]").click(function(){
					$("[cate]").css("color",""); 
					$(this).css("color","red");
				});
			});
	</script>
</head>
<body>
		<div class="lttop">
			商品分类
		</div>
		<hr />
		<div id="t" class="pn-tree">
			<div id="t-0">
				<div id="t-0-s" onmouseover="Pn.Tree.lineOver(this)" onmouseout="Pn.Tree.lineOut(this)" onclick="Pn.Tree.lineSelected(this,'t');" isdisplay="true">
			        <img id="t-0-co" src="img/elbow-end-minus.gif" onclick="Pn.Tree.switchDisplay('t-0')" style="cursor:pointer;" />
			        <img id="t-0-cc" src="img/elbow-end-plus.gif" onclick="Pn.Tree.switchDisplay('t-0')" style="cursor:pointer; display:none;" />
			        <img id="t-0-fo" src="img/folder-open.gif" />
			        <img id="t-0-fc" src="img/folder.gif" style="display:none;" />
		        	<a href="javascript:;" onclick="Pn.Tree.switchDisplay('t-0',true)">所有分类</a>
		      	</div>
				<div id="t-0-" style="">
					<s:iterator value="categoryList" id="category">
		   				<div id="t-0-<s:property value="#category.categoryId"/>">
		           			<div id="t-0-<s:property value="#category.categoryId"/>-s" onmouseover="Pn.Tree.lineOver(this)" onmouseout="Pn.Tree.lineOut(this)" onclick="Pn.Tree.lineSelected(this,'t');" isdisplay="true" />
				          	 	 <img src="img/s.gif" width="15px" />
				           		 <img id="t-0-<s:property value="#category.categoryId"/>-co" src="img/elbow-minus.gif" onclick="Pn.Tree.switchDisplay('t-0-<s:property value="#category.categoryId"/>')" style="cursor:pointer;" />
				           		 <img id="t-0-<s:property value="#category.categoryId"/>-cc" src="img/elbow-plus.gif" onclick="Pn.Tree.switchDisplay('t-0-<s:property value="#category.categoryId"/>')" style="cursor:pointer;display:none;" />
				           		 <img id="t-0-<s:property value="#category.categoryId"/>-fo" src="img/folder-open.gif" />
				           		 <img id="t-0-<s:property value="#category.categoryId"/>-fc" src="img/folder.gif" style="display:none;" />
			           		 	 <a cate href="javascript: showProdList('<s:property value="#category.pcategoryId"/>', '<s:property value="#category.categoryId"/>');">
			           		 	 	<s:property value="#category.categoryName"/>
			           		 	 </a>
		          			</div>
		          			<div id="t-0-<s:property value="#category.categoryId"/>-" style="">
			          			<s:if test="children.size() > 0">
			          				<s:iterator value="children" id="child">
										<div id="t-0-<s:property value="#category.categoryId"/>-<s:property value="#child.categoryId"/>">
								    		<div id="t-0-<s:property value="#category.categoryId"/>-<s:property value="#child.categoryId"/>-s" onmouseover="Pn.Tree.lineOver(this)" onmouseout="Pn.Tree.lineOut(this)" onclick="Pn.Tree.lineSelected(this,'t');" isdisplay="true">
												<img src="img/s.gif" width="15px" />
												<img src="img/elbow-line.gif" />
												<img src="img/elbow.gif" />
												<img src="img/leaf.gif" />
												<a cate href="javascript: showProdList('<s:property value="#child.pcategoryId"/>', '<s:property value="#child.categoryId"/>')"  >
													<s:property value="#child.categoryName"/>
												</a>
											</div>
										</div>		
									</s:iterator>
								</s:if> 
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
</body>
</html>