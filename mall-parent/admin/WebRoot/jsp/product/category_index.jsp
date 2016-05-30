<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<title>首页</title>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<!--left-->
	<div class="div_l">
		<div class="lttop">
			<a href="javascript:location.reload()">刷新</a>&nbsp;<a href="#">商品标签</a>
		</div>
		<hr />
		<div id="t" class="pn-tree"></div>
	</div>
	<!--left end-->
	<!--main-->
	<div class="body-box">
		<div class="rhead">
			<div class="rpos">当前位置: 商品 - 商品管理 - 列表</div>
			<form class="ropt">
				<div style="padding:5px 0 0 0">请选择商品分类</div>
			</form>
			<div class="clear"></div>
		</div>
		<div class="rhead">
			<form action="v_list.htm">
				<select name="typeId">
					<option value="">--商品分类--</option>
					<option value="1">数码</option>
					<option value="2">服装</option>
					<option value="3">鞋包配饰</option>
					<option value="4">日用百货</option>
					<option value="5">家居建材</option>
					<option value="6">珠宝手表</option>
					<option value="7">酒店</option>
					<option value="8">手机</option>
					<option value="9">笔记本</option>
				</select> 
				商品名称:<input type="text" name="productName" value="" style="width:100px" /> 
				品牌名称:<input type="text" name="brandName" value="" style="width:100px" /> 
				<label class="ckl"><input type="checkbox" id="isOnSale" name="isOnSale" value="true" />上架</label> 
				<label class="ckl"><input type="checkbox" id="isRecommend" name="isRecommend" value="true" />推荐</label> 
				<label class="ckl"> <input type="checkbox" id="isSpecial" name="isSpecial" value="true" />特价 </label> 
				<label class="ckl"><input type="checkbox" id="isHotsale" name="isHotsale" value="true" /> 热卖</label> 
				<label> <input type="checkbox" id="isNewProduct" name="isNewProduct" value="true" /> 新品 </label> 
				库存: <input type="text" name="startStock" value="" style="width:50px" /> &nbsp;至&nbsp;
					  <input type="text" name="endStock" value="" style="width:50px" /> 
					  <input type="submit" class="ropt" value="查询" />
			</form>
			<div class="clear"></div>
		</div>
		<form id="tableForm" method="post">
			<input type="hidden" name="pageNo" value="" /> 
			<input type="hidden" name="ctgId" value="" />
				<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
					<thead class="pn-lthead">
						<tr>
							<th width="20">
								<input type="checkbox" />
							</th>
							<th width="20">ID</th>
							<th>商品名称</th>
							<th>分类</th>
							<th>类型</th>
							<th>销售价</th>
							<th>商品库存</th>
							<th>品牌</th>
							<th>上架</th>
							<th>操作选项</th>
						</tr>
					</thead>
					<tbody class="pn-ltbody">
						<tr>
							<td>
								<input type="checkbox" name="ids" value="5" />
							</td>
							<td>5</td>
							<td>
								<a href="#" target="_blank">test</a>
							</td>
							<td>办公</td>
							<td>数码</td>
							<td>0.1</td>
							<td>97</td>
							<td></td>
							<td>是</td>
							<td align="center">
								<a href="#">修改</a> | 
								<a href="#" >删除</a>
							</td>
						</tr>
					</tbody>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td align="center" class="pn-sp">共 5 条&nbsp; 每页
								<input type="text" value="20" style="width:30px" />条&nbsp;
								<input type="button" value="首 页" disabled="disabled" />
								<input type="button" value="上一页" disabled="disabled" />
								<input type="button" value="下一页" disabled="disabled" />
								<input type="button" value="尾 页" disabled="disabled" />&nbsp;
									当前 1/1 页 &nbsp;转到第
								<input type="text" id="_goPs" style="width:50px" />页
								<input id="_goPage" type="button" value="转" disabled="disabled" />
							</td>
						</tr>
					</tbody>
				</table>
		</form>
	</div>
	<!--main end-->
</body>
</html>





