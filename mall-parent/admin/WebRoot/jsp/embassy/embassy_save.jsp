<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
		<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
		<style type="text/css">
			.tr_h{height: 40px;}
		</style>
		<script type="text/javascript">
			$(function(){
				var province = '${embassyQuery.province}';
				var city = '${embassyQuery.city}';
				var district = '${embassyQuery.district}';
				if (province != '') {
					$("#area").distpicker({
						province : province,
						city : city,
						district : district
					});
				} else {
					$("#area").distpicker({
						autoSelect : false
					});
				}
				$("#province").val(province);
				$("#city").val(city);
				$("#district").val(district);
				$("#roleId").val('${userQuery.roleId}');
				$("#deptId").val('${userQuery.deptId}');
			});
			
			// 判断是否为空
			function checkNull(o){
				var label = o.attr("label");
				var value = o.val();
				if(value == ''){
					layer.alert(label + "不能为空!");
					return false;
				} else {
					return true;
				}
			}
			
			function checkLength(o, l){
				var label = o.attr("label");
				var value = o.val();
				if(value < l){
					layer.alert(label + "长度不能小于" + l + "位!");
					return false;
				} else {
					return true;
				}
			}
			
			// 选择学校
			function selectSchool(){
				layer.open({
				    type: 2,
				    title: "选择学校",
				    shadeClose: true,
				    shade: 0.3,
				    area: ["700px", "500px"],
				    content: "<%=basePath%>embassy/embassy!schools.do"
				});
			}
			
			function validate(){
				var serialNum = $("#serialNum");
				var trueName = $("#trueName");
				var province = $("#province");
				var city = $("#city");
				var district = $("#district");
				var phone = $("#phone");
				var idCard = $("#idCard");
				
				if(!checkNull(serialNum)){
					return false;
				}
				if(!checkNull(trueName)){
					return false;
				}
				if(!checkNull(idCard)){
					return false;
				}
				if(!checkNull(phone)){
					return false;
				}
				if(!checkNull(province)){
					return false;
				}
				if(!checkNull(city)){
					return false;
				}
				if(!checkNull(district)){
					return false;
				}
				return true;
			}
			
			// 保存大使
			function saveEmbassy(){
				if(validate()){
					$.ajax( {
					type : "POST",
					url : "<%=basePath%>embassy/embassy!idCardValid.do?embassyQuery.idCard=" + $("#idCard").val(),
					dataType: "json",
					success : function(data) {
			           	if (data == 1) {
			           		if(!$("#phone").val().match(/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/)){
								layer.alert("手机号码不合法!");
								return;
							}
			           		$.post("<%=basePath%>embassy/embassy!saveEmbassy.do?timestamp=" + new Date().getTime(), 
								$("#embassyForm").serializeArray(), 
								function(data) {
									if (data.result == "FAILURE") {
										layer.alert("保存大使失败!");
									} else {
										window.parent.close();
									}
							}, "json");
			           	} else {
			           		layer.alert("身份证号码不正确!");
			           		return false;
			           	} 
					}
				});
					
				}
			}
		</script>
		
	</head>
	<body style="overflow-x:hidden; overflow-y:hidden;" > 
		<form id="embassyForm" method="post">
			<table class="pn-ltable" style="" width="680" cellspacing="1" cellpadding="0" border="0">
				<tbody class="pn-ltbody">
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">大使编号：</td>
						<td width="48%" class="pn-fcontent">
							<input type="text" size="30" id="serialNum" maxlength="20" name="embassyQuery.serialNum" label="大使编号" value="<s:property value="embassyQuery.serialNum"/>" onblur="checkNull($(this))"/>
						</td>
						<td width="40%" class="pn-fcontent">
							
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">真实姓名：</td>
						<td width="58%" class="pn-fcontent">
			        		<input type="text" size="30" maxlength="20" id="trueName" label="真实姓名" name="embassyQuery.trueName" value="<s:property value="embassyQuery.trueName"/>" onblur="checkNull($(this))"/>
						</td>
						<td width="30%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">性别：</td>
						<td width="58%" class="pn-fcontent">
			        		<input type="radio" size="30" id="male" label="性别" name="embassyQuery.sex" value="1" <s:if test="embassyQuery.sex == 1">checked="checked" </s:if> /> <label for="male">男</label>
			        		<input type="radio" size="30" id="female" label="性别" name="embassyQuery.sex" value="2" <s:if test="embassyQuery.sex == 2">checked="checked" </s:if> /> <label for="female">女</label>
						</td>
						<td width="30%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">身份证号：</td>
						<td width="58%" class="pn-fcontent">
			        		<input type="text" size="30" maxlength="20" id="idCard" label="身份证号" name="embassyQuery.idCard" value="<s:property value="embassyQuery.idCard"/>" onblur="checkNull($(this))"/>
						</td>
						<td width="30%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">手机号码：</td>
						<td width="58%" class="pn-fcontent">
			        		<input type="text" size="30" maxlength="20" id="phone" label="手机号码" name="embassyQuery.phone" value="<s:property value="embassyQuery.phone"/>" onblur="checkNull($(this))"/>
						</td>
						<td width="30%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">地区：</td>
						<td width="48%" class="pn-fcontent">
							<div id="area">
				        		<select label="省" id="province" name="embassyQuery.province" class="area-form-control" style="width: 80px;" onblur="checkNull($(this))"></select>&nbsp;
								<select label="市" id="city" name="embassyQuery.city" class="area-form-control" style="width: 80px;" onblur="checkNull($(this))"></select>&nbsp;
								<select label="区" id="district" name="embassyQuery.district" class="area-form-control" style="width: 80px;" onblur="checkNull($(this))"></select>&nbsp;
							</div>
						</td>
						<td width="40%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">所在学校：</td>
						<td width="58%" class="pn-fcontent">
							<input id="schoolId"  type="hidden" />
			        		<input class="txt-normal card_width" placeholder="点击选择学校" labelName="所在学校" id="schoolName" value="<s:property value="embassyQuery.school"/>" name="embassyQuery.school" readonly onclick="selectSchool()" />
						</td>
						<td width="30%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">开户银行：</td>
						<td width="58%" class="pn-fcontent">
			        		<select style="width:200px;" id="bkcardName" name="embassyQuery.bkcardName" labelName="银行卡开户行">
	                        	<option value="">请选择</option>
	    						<option value="ICBC" <s:if test="embassyQuery.bkcardName == 'ICBC'"> selected="selected"</s:if>>工商银行</option>
	                            <option value="ABC" <s:if test="embassyQuery.bkcardName == 'ABC'"> selected="selected"</s:if>>农业银行</option>
	                            <option value="BOC" <s:if test="embassyQuery.bkcardName == 'BOC'"> selected="selected"</s:if>>中国银行</option>
	                            <option value="CCB" <s:if test="embassyQuery.bkcardName == 'CCB'"> selected="selected"</s:if>>建设银行</option>
	                            <option value="CMBCHINA" <s:if test="embassyQuery.bkcardName == 'CMBCHINA'"> selected="selected"</s:if>>招商银行</option>
	                            <option value="SPDB" <s:if test="embassyQuery.bkcardName == 'SPDB'"> selected="selected"</s:if>>浦发银行</option>
	                            <option value="CIB" <s:if test="embassyQuery.bkcardName == 'CIB'"> selected="selected"</s:if>>兴业银行</option>
	                            <option value="CEB" <s:if test="embassyQuery.bkcardName == 'CEB'"> selected="selected"</s:if>>光大银行</option>
	                            <option value="GDB" <s:if test="embassyQuery.bkcardName == 'GDB'"> selected="selected"</s:if>>广发银行</option>
	                            <option value="PINGAN" <s:if test="embassyQuery.bkcardName == 'PINGAN'"> selected="selected"</s:if>>平安银行</option>
	                            <option value="HXB" <s:if test="embassyQuery.bkcardName == 'HXB'"> selected="selected"</s:if>>华夏银行</option>
	                            <option value="CMBC" <s:if test="embassyQuery.bkcardName == 'CMBC'"> selected="selected"</s:if>>民生银行</option>
	                            <option value="SHB" <s:if test="embassyQuery.bkcardName == 'SHB'"> selected="selected"</s:if>>上海银行</option>
	                            <option value="ECITIC" <s:if test="embassyQuery.bkcardName == 'ECITIC'"> selected="selected"</s:if>>中信银行</option>
	                            <option value="BOCO" <s:if test="embassyQuery.bkcardName == 'BOCO'"> selected="selected"</s:if>>交通银行</option>
	                            <option value="POST" <s:if test="embassyQuery.bkcardName == 'POST'"> selected="selected"</s:if>>邮政储蓄银行</option>
	    					</select>
						</td>
						<td width="30%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel">银行卡号：</td>
						<td width="58%" class="pn-fcontent">
			        		<input class="txt-normal card_width" style="width: 300px;" placeholder="银行卡号" labelName="银行卡号" 
			        			id="bkcardNum" value="<s:property value="embassyQuery.bkcardNum"/>" name="embassyQuery.bkcardNum" />
						</td>
						<td width="30%" class="pn-fcontent">
						</td>
					</tr>
					<tr style="height: 40px;">  
						<td width="12%" class="pn-flabel"></td>
						<td width="48%" class="pn-fcontent">
			        		<input type="hidden" value="<s:property value="embassyQuery.embassyId"/>" name="embassyQuery.embassyId" id="embassyId"/>
			        		<input type="hidden" value="1" name="embassyQuery.status" id="status"/>
							<input type="button" value="保存" onclick="saveEmbassy()"/>
						</td>
						<td width="40%" class="pn-fcontent">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>





