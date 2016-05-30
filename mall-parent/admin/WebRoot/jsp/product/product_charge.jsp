<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript">
			var row = 24;
			function addRow(){
				row++;
				var rowTmp = '<tr id="tr_' + row + '"><td><input type="text" name="periodNumStart" /></td><td><input type="text" name="periodNumEnd" /></td><td><input type="text" name="serviceRate" /></td><td><a href="javascript: delRow(' + row + ')">删除</a></td></tr>';
				 $(".pn-ltbody").append(rowTmp);
			}
			function delRow(id){
		      	$("#tr_"+ id).remove();
			}
		</script>
	</head>
	<body style="overflow:scroll;overflow-y:hidden" > 
		<form id="chargeForm" method="post" enctype="multipart/form-data" action="product/product!setServiceCharge.do">
			<table class="pn-ltable" style="width: 550px;" cellspacing="1" cellpadding="0" border="0" id="charge_table">
				<tbody class="pn-ltbody">
					<tr>
						<td width="25">
							起始期数
						</td>
						<td width="25">
							结束期数
						</td>
						<td width="25">
							费率
						</td>
						<td width="25">
							操作
						</td>
					</tr>
					<s:iterator value="serviceRates" id="rate" status="L">
						<tr id="tr_<s:property value="#L.index + 1"/>">
							<td>
								<input type="text" name="periodNumStart" value="<s:property value="#rate.periodNumStart"/>" />
							</td>
							<td>
								<input type="text" name="periodNumEnd" value="<s:property value="#rate.periodNumEnd"/>" />
							</td>
							<td>
								<input type="text" name="serviceRate" value="<s:property value="#rate.serviceRate"/>" />
							</td>
							<td>
								<a href="javascript: delRow(<s:property value="#L.index + 1"/>)">删除</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<div style="float: left; width: 99%">
				<div style="float: left; padding-left: 20px; width: 50%">
					<input type="button" size="20" value="增加一行" onclick="addRow()"/>
					<input type="hidden" value="<s:property value="productQuery.productId"/>" 
								name="productQuery.productId" id="productQuery.productId"/>
				</div>
				<div style="float: left;text-align: right; width: 45%">
					<input type="submit" size="20" value="提交"/>
				</div>
			</div>
		</form>
	</body>
</html>





