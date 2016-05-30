<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<style type="text/css">
			.cnt_td {padding: 7px 3px; line-height: 20px; vertical-align: middle;}
		</style>
		<script type="text/javascript">
			$(document).ready(function() {
				init();
			});
			
			function init(){
				var recoms = '<s:property value="recoms"/>';
				var arr = recoms.split("#");
				for(var i = 0; i < arr.length; i++){
					var recom = arr[i].split("-");
					var id = "#position_" + recom[0];
					$(id).val(recom[1]);
				}
			}
		
			// 保存默认费率
			function saveRecom(pid, id){
				var eid = "#" + id;
				$.post("manage/manage!saveRecom.do?timestamp=" + new Date().getTime(), 
					{
						"productRecom.positionId" : pid,
						"productRecom.productId" : $(eid).val()
					},
					function(data) {
						if (data.result == "FAILURE") {
							layer.alert("保存失败!");
						} else {
							layer.alert("保存成功!");
							$("#main").load("manage/manage!prodRecom.do");
						}
				}, "json");
			}
		</script>
	</head>
	<body>
		<div class="rhead">
			<div class="rpos">当前位置: 配置管理 - 精品推荐</div>
			<div class="clear"></div>
		</div>
			<table class="pn-ltable" width="1000" cellspacing="1" cellpadding="0" border="0" id="data_table" style="float: left; margin: 20px;">
			  <tbody class="pn-ltbody">
				  <tr>
				    <td rowspan="2" class="cnt_td" width="340">
				    	产品编号：<input type="text" id="position_1" />&nbsp;&nbsp;
				    	<input type="button" value="保存" onclick="saveRecom('1', 'position_1')" />
				    </td>
				    <td class="cnt_td" width="330">
				    	产品编号：<input type="text" id="position_2" />&nbsp;&nbsp;
				    	<input type="button" value="保存" onclick="saveRecom('2', 'position_2')" />
				    </td>
				    <td width="330" class="cnt_td">
				    	产品编号：<input type="text" id="position_3" />&nbsp;&nbsp;
				    	<input type="button" value="保存" onclick="saveRecom('3', 'position_3')" />
				    </td>
				  </tr>
				  <tr>
				    <td width="330" class="cnt_td">
				    	产品编号：<input type="text" id="position_4" />&nbsp;&nbsp;
				    	<input type="button" value="保存" onclick="saveRecom('4', 'position_4')" />
				    </td>
    				<td width="330" class="cnt_td">
    					产品编号：<input type="text" id="position_5" />&nbsp;&nbsp;
    					<input type="button" value="保存" onclick="saveRecom('5', 'position_5')" />
    				</td>
				  </tr>
			  </tbody>
			</table>
	</body>
</html>





