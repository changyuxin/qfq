<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript">
			var row = 1;
			function addRow(){
				row++;
				var rowTmp = '<tr id="tr_' + row + '"><td>补充资料' + row + '：</td><td><input type="file" size="20" id="upload" name="upload" /></td><td><a href="javascript: delRow(' + row + ')">删除</a></td></tr>';
				 $(".pn-ltbody").append(rowTmp);
			}
			function delRow(id){
		      	$("#tr_"+ id).remove();
			}
			
			function check(){
				var v =	$("#upload").val();
				if(v == ""){
					layer.alert("请选择上传文件!");
					return false;
				} else {
					return true;
				}
			}
			
			function uploadPhoto(){
				if(check()){
					$("#uploadForm").submit();
				}
			}
			
		</script>
	</head>
	<body style="overflow:scroll;" > 
		<form id="uploadForm" method="post" enctype="multipart/form-data" action="collar/collar!uploadSpyPhoto.do">
			<table class="pn-ltable" style="width: 550px;" cellspacing="1" cellpadding="0" border="0" id="charge_table">
				<tbody class="pn-ltbody">
					<tr id="tr_1">
						<td>
							补充资料1：
						</td>
						<td>
							<input type="file" size="20" id="upload" name="upload" />
						</td>
						<td>
							<a href="javascript: delRow('1')">删除</a>
						</td>
					</tr>
				</tbody>
			</table>
			<div style="float: left; width: 99%">
				<div style="float: left; padding-left: 20px; width: 50%">
					<input type="button" size="20" value="增加一行" onclick="addRow()"/>
					<input type="hidden" value="<s:property value="collarQuery.collarId"/>" name="collarQuery.collarId" id="collarId"/>
				</div>
				<div style="float: left;text-align: right; width: 45%">
					<input type="button" size="20" value="提交" onclick="uploadPhoto()"/>
				</div>
			</div>
		</form>
	</body>
</html>
