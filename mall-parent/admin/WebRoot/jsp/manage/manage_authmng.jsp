<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript">
		$(function(){
			queryAuthCodeList(1);
		});
		
		//根据条件查询用户
	    function queryAuthCodeList(index){
	    	//点击查询时,将页码置为1
			if(index == 1){
				$("[name='authCode.pageNo']").val(1);
			}
			$("#content").load("manage/manage!getAuthCodeList.do", $("#queryForm").serializeArray());
	    }
	    
		function close(){
			queryAuthCodeList();
			layer.closeAll();
		}
		
		function createAuthCode(){
			var mobile = $.trim($("#mobile").val());
			var name = $.trim($("#name").val());
			var refereeName = $.trim($("#refereeName").val());
			if(refereeName.length == 0){
				layer.alert("推荐人姓名不能为空!");
				return;
			}
			if(name.length == 0){
				layer.alert("姓名不能为空!");
				return;
			}
			if(mobile.length == 0){
				layer.alert("手机号码不能为空!");
				return;
			}
			if(!mobile.match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/)){
				layer.alert("手机号码不合法!");
				return;
			}
		
			$.post("manage/manage!createAuthCode.do", {
				"authCode.name" : name,
				"authCode.refereeName" : refereeName,
				"authCode.mobile" : mobile,
				"timestamp" : new Date().getTime()
			}, function(data) {
				if (data.result == "FAILURE") {
					layer.alert(data.message);
				} else {
					$("#authCode").html(data.code); 
					queryAuthCodeList(1);
				}
			}, "json");
		}
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 系统管理 - 生成授权码</div>
			<div class="clear"></div>
		</div>
		<!--  -->
		<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
			<tbody>
				<tr>
					<td width="5%" class="pn-flabel pn-flabel-h">
						推荐人姓名：
					</td>
					<td width="9%" class="pn-fcontent">
						<input id="refereeName" type="text" maxlength="32" value="" style="width: 120px;"/>&nbsp;
					</td>
					<td width="4%" class="pn-flabel pn-flabel-h">
						姓名：
					</td>
					<td width="9%" class="pn-fcontent">
						<input id="name" type="text" maxlength="32" value="" style="width: 120px;"/>&nbsp;
					</td>
					<td width="4%" class="pn-flabel pn-flabel-h">
						手机号：
					</td>
					<td width="18%" class="pn-fcontent">
						<input id="mobile" type="text" maxlength="11" value="" style="width: 150px;"/>&nbsp;
						<input type="button" maxlength="150" value="生成授权码" onclick="createAuthCode()"/>
					</td>
					<td width="5%" class="pn-flabel pn-flabel-h">
						授权码：
					</td>
					<td width="70%" class="pn-fcontent" id="authCode" style="color: blue; font-weight: 800;">
						
					</td>
				</tr>
			</tbody>
		</table>
		<div id="content">
			
		</div>
	<!--main end-->
	</body>
</html>





