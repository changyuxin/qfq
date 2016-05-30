<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<style type="text/css">
			.cnt_td {padding: 7px 3px; text-align: center; line-height: 20px; vertical-align: top;}
		</style>
		<script type="text/javascript">
			var row = 24;
			function addRow(){
				row++;
				var rowTmp = '<tr id="tr_' + row + '"><td class="cnt_td"><input type="text" name="periodNumStart" /></td><td class="cnt_td"><input type="text" name="periodNumEnd" /></td><td class="cnt_td"><input type="text" name="serviceRate" /></td><td class="cnt_td"><a href="javascript: delRow(' + row + ')">删除</a></td></tr>';
				 $(".pn-ltbody").append(rowTmp);
			}
			function delRow(id){
		      	$("#tr_"+ id).remove();
			}
			
			// 保存默认费率
			function saveDefRate(){
				$.post("manage/manage!saveDefRate.do?timestamp=" + new Date().getTime(), 
					$("#rateForm").serializeArray(), 
					function(data) {
						if (data.result == "FAILURE") {
							layer.alert("设置默认费率失败!");
						} else {
							layer.alert("设置默认费率成功!");
							$("#main").load("manage/manage!defaultRatePage.do");
						}
				}, "json");
			}
		</script>
	</head>
	<body>
		<div class="rhead">
			<div class="rpos">当前位置: 配置管理 - 默认费率</div>
			<div class="clear"></div>
		</div>
		<form id="rateForm" method="post">
			<table class="pn-ltable" width="40%" cellspacing="1" cellpadding="0" border="0" id="data_table" style="float: left;">
				<thead class="pn-lthead">
					<tr>
						<th width="30%">
							起始期数
						</th>
						<th width="30%">
							结束期数
						</th>
						<th width="30%">
							费率
						</th>
						<th width="10%">
							操作
						</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:iterator value="defRates" id="rate" status="L">
						<tr id="tr_<s:property value="#L.index + 1"/>">
							<td class="cnt_td">
								<input type="text" name="periodNumStart" value="<s:property value="#rate.periodNumStart"/>" />
							</td>
							<td class="cnt_td">
								<input type="text" name="periodNumEnd" value="<s:property value="#rate.periodNumEnd"/>" />
							</td>
							<td class="cnt_td">
								<input type="text" name="serviceRate" value="<s:property value="#rate.serviceRate"/>" />
							</td>
							<td class="cnt_td">
								<a href="javascript: delRow(<s:property value="#L.index + 1"/>)">删除</a>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<div style="width: 40%;">
				<div style="float: left; padding-left: 20px; width: 50%;  margin-top: 5px;">
					<input type="button" size="20" value="增加一行" onclick="addRow()"/>
				</div>
				<div style="float: left;text-align: right; width: 45%;  margin-top: 5px;">
					<input type="button" size="20" value="保存" onclick="saveDefRate()"/>
				</div>
			</div>
		</form>
	</body>
</html>





