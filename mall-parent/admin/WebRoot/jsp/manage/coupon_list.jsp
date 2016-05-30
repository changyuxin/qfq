<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.cnt_td {text-align: center; }
		.link_a{margin-right: 5px;}
		.font_b{font-weight: 800;}
	</style>
	<script type="text/javascript">
		$(function(){
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="couponQuery.pageNo" />,
				total: <s:property value="couponQuery.total" />,
				callback: function(selectPage) {
					$("[name='couponQuery.pageNo']").val(selectPage);
					queryCouponList();
				}
			});
		});
		
		function deleteCoupon(id){
			layer.confirm("确认删除优惠券吗!", function(){
				$.post("manage/coupon!deleteCoupon.do", {
					"couponQuery.couponId" : id,
					"timestamp" : new Date().getTime() 
					}, function(data) {
						if (data.result == "FAILURE") {
							layer.alert("删除失败!");
						} else {
							queryCouponList();
							close();
						}
					}, "json");
			});
		}
		
		function enableCoupon(id, status){
			$.post("manage/coupon!enableCoupon.do", {
					"couponQuery.couponId" : id,
					"couponQuery.isEnable" : status,
					"timestamp" : new Date().getTime()
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert("保存失败!");
					} else {
						loadPage("manage/coupon!manage.do");
					}
			}, "json");
		}
	</script>
</head>
<body>
	<form id="queryForm" method="post">
		<!--  
		<div class="rhead">
			姓名：<input type="text" name="authCode.name" value="<s:property value='authCode.name'/>" style="width:100px" /> 
			手机号：<input type="text" name="authCode.mobile" value="<s:property value='authCode.mobile'/>" style="width:100px" /> 
			&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="query" />
		</div>
		-->
			<input type="hidden" name="couponQuery.pageNo"  value="<s:property value='couponQuery.pageNo'/>"/>
			<input type="hidden" name="couponQuery.pageTotal"  value="<s:property value='couponQuery.pageTotal'/>"/>
			<div class="clear"></div>
		<table class="pn-ltable" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
			<thead class="pn-lthead">
				<tr>
					<th width="25">
						<input type="checkbox" />
					</th>
					<th>优惠券ID</th>
					<th>优惠券名称</th>
					<th>优惠券金额</th>
					<th>优惠券总数</th>
					<th>优惠券类型</th>
					<th>每用户限领次数</th>
					<th>有效期</th>
					<th>是否启用</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="pn-ltbody">
				<s:if test="coupons.size() > 0">
					<s:iterator value="coupons" id="coupon">
						<tr>
							<td class="cnt_td">
								<input type="checkbox" name="id" />
							</td>
							<td class="cnt_td">
								<s:property value="#coupon.couponId" />
							</td>
							<td class="cnt_td">
								<s:property value="#coupon.couponName" />
							</td>
							<td class="cnt_td">
								<s:property value="#coupon.couponSums" /> 元
							</td>
							<td class="cnt_td">
								<s:property value="#coupon.couponTotal" /> 个
							</td>
							<td class="cnt_td">
								<s:if test="#coupon.couponType == 1" >帐单减免</s:if>
							</td>
							<td class="cnt_td">
								<s:property value="#coupon.userDraw" /> 个
							</td>
							<td class="cnt_td">
								<s:date name="#coupon.startTime" format="yyyy-MM-dd"/> 至 <s:date name="#coupon.endTime" format="yyyy-MM-dd"/>
							</td>
							<td class="cnt_td">
								<s:if test="#coupon.isEnable == 1"><font color="green"><b>启用</b></font></s:if>
								<s:if test="#coupon.isEnable == 2"><font color="red"><b>停用</b></font></s:if>
							</td>
							<td class="cnt_td">
								<s:date name="#coupon.createTime" format="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td class="cnt_td">
								<input type="button" value="启用" onclick="enableCoupon('<s:property value="#coupon.couponId" />', 1)" class="btn-top" />
								<input type="button" value="停用" onclick="enableCoupon('<s:property value="#coupon.couponId" />', 2)" class="btn-top" />
								<input type="button" value="编辑" onclick="saveCouponPage('<s:property value="#coupon.couponId" />')" class="btn-top" />
								<input type="button" value="删除" onclick="deleteCoupon('<s:property value="#coupon.couponId" />')" class="btn-top" />
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</tbody>
		</table>
		<div class="pagination list_content" style="text-align: center;">
			<div pageDiv class="msdn" style="float: left;"></div>
			<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="couponQuery.total" /> 条记录</div>
		</div>
	</form>
</body>
</html>





