<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
	<title>亲分期  - 商品订单</title>
	<script type="text/javascript">
	
		function deleteAddress(id){
			$.ajax( {
				type : "POST",
				data : {"addressId" : id},
				url : "center/center!deleteAddress.do",
				dataType: "json",
				error: function(request) {
	                layer.alert("删除收货地址失败!");
		        },
				success : function(data) {
		           	if (data == 0) {
		           		window.location.href = "<%=basePath%>center/center!address.do";
		           		return;
		           	} else {
		           		layer.alert("删除收货地址失败!");
		           		return;
		           	} 
				}
			});
		}
		
		function gotoUpdateAddress(id,receiveName,provinceNum,cityNum,districtNum,address,phoneNum){
			
			$("#user-apply-form").show();
			
			$(".area-choose").distpicker({
				province: provinceNum,
				city: cityNum,
				district: districtNum
			});
			
			$("#receiveName").val(receiveName);
			$("#phoneNum").val(phoneNum);
			$("#address").val(address);
			$("#addressId").val(id);
			
		}
		
		function updateAddress(){
			
			var receiveName = $.trim($("#receiveName").val());
			var phoneNum = $.trim($("#phoneNum").val());
			var address = $.trim($("#address").val());
			var province = $.trim($("#province").val());
			var city = $.trim($("#city").val());
			var district = $.trim($("#district").val());
			
			if(province.length == 0){
				showMsg("#regionError1","请选择省");
				return;
			}
			if(city.length == 0){
				showMsg("#regionError2","请选择市");
				return;
			}
			if(district.length == 0){
				showMsg("#regionError3","请选择区");
				return;
			}
			if(receiveName.length == 0){
				showMsg("#receiveNameError","请填写收货人姓名");
				return;
			}
			if(phoneNum.length == 0){
				showMsg("#phoneNumError","请填写收货人手机号/电话号");
				return;
			}
			if(address.length == 0){
				showMsg("#addressError","请填写收货地址");
				return;
			}
			
			$("#receiveName").val(receiveName);
			$("#phoneNum").val(phoneNum);
			$("#address").val(address);
			$("#province").val(province);
			$("#city").val(city);
			$("#district").val(district);
			
			$.ajax( {
				type : "POST",
				data : $("#updateAddressFrom").serialize(),
				url : "<%=basePath%>center/center!updateAddress.do",
				dataType: "json",
				error: function(request) {
	                layer.alert("更新收货地址失败!");
		        },
				success : function(data) {
		           	if (data == 0) {
		           		window.location.href = "<%=basePath%>center/center!address.do";
		           		return;
		           	} else {
		           		layer.alert("更新收货地址失败!");
		           		return;
		           	} 
				}
			});
		}
		
		/** Enter键提交 */
		$(document).keyup(function(event){
			var currKey = 0, e = e || event;
			if (e.keyCode == 13) {
				updateAddress();
			}
		});
		
		function showMsg(id, msg){
			$(id).html(msg);
		}
		function setDefault(id, isDefault){
			$.ajax( {
				type : "POST",
				data : {"shopAddress.addressId" : id, "shopAddress.isDefault" : isDefault},
				url : "<%=basePath%>center/center!setDefault.do",
				dataType: "json",
				error: function(request) {
	                layer.alert("设置默认收货地址失败!");
		        },
				success : function(data) {
		           	if (data == 0) {
		           		window.location.href = "<%=basePath%>center/center!address.do";
		           		return;
		           	} else {
		           		layer.alert("设置默认收货地址失败!");
		           		return;
		           	} 
				}
			});
		}
	</script>
</head>
<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
<div class="mid">
    <div class="main-wrap">
    	<%@include file="center_leftnav.jsp"%>
    	<!--右侧-->
        <div class="user-right mu-ctxt">
			<div class="user-right-head">
            	<h2>我的收货地址</h2>
            </div>
            <div class="clear"></div>
            <div id="user-apply-form" class="user-right-content" style="display: none;">
            <form action="" id="updateAddressFrom" method="post" style="padding-bottom:20px;">
				<div class="area-choose">
					<label style="margin-right: 33px;"><span class="span-star">*</span>所在地区：</label>
					<select id="province" name="shopAddress.provinceNum" onfocus="showMsg('#regionError1','')" class="area-form-control" style="margin-left: -3px;"></select> 
					<select id="city" name="shopAddress.cityNum" onfocus="showMsg('#regionError2','')" class="area-form-control"></select>
					<select id="district" name="shopAddress.districtNum" onfocus="showMsg('#regionError3','')" class="area-form-control"></select>
					<strong id="regionError1"></strong>
					<strong id="regionError2"></strong>
					<strong id="regionError3"></strong>
				</div>
				<div>
					<label><span class="span-star">*</span>收货人：</label>
					<input type="text" placeholder="请填写收货人姓名" onfocus="showMsg('#receiveNameError','')" id="receiveName" name="shopAddress.receiveName" maxlength="15" />
					<strong id="receiveNameError"></strong>
				</div>
				<div>
					<label><span class="span-star">*</span>电话/手机：</label>
					<input type="text" placeholder="请填写收货人手机号/电话号" onfocus="showMsg('#phoneNumError','')" id="phoneNum" name="shopAddress.phoneNum" />
					<strong id="phoneNumError"></strong>
				</div>
				<div>
					<label><span class="span-star">*</span>详细地址：</label>
					<input type="text" id="address" name="shopAddress.address" onfocus="showMsg('#addressError','')" placeholder="请填写收货地址" maxlength="50" />
					<strong id="addressError"></strong>
				</div>
				<div class="savebutton">
					<input type="hidden" name="shopAddress.addressId" id="addressId" value="" />
					<a href="javascript:;" onclick="updateAddress()" class="common-btn-blue">修改</a>
				</div>
			</form>
			</div>
           	<div class="clear"></div>
           	<div class="user-right-content">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
		            <tbody>
			            <tr style="font-weight:bold">
			              <td align="center" width="134">收货人</td>
			              <td align="center" width="146">所在地区</td>
			              <td align="center" width="106">详细地址</td>
			              <td align="center" width="126">电话/手机</td>
			               <!-- 
			              <td align="center" width="119">操作</td>
			               -->
			            </tr>
			            <s:iterator value="addressList">
			            <tr class="font-size0">
			              <td>${ receiveName}</td>
			              <td>
			              	 ${ provinceNum} ${ cityNum} ${ districtNum}  
			              </td>
			              <td>${ address}</td>
			              <td>${ phoneNum}</td>
			              <!--  
			              <td>
				              <a href="javascript:gotoUpdateAddress('${addressId}','${ receiveName}',
				              	'${ provinceNum}','${ cityNum}','${ districtNum}','${ address}','${ phoneNum}')">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp; 
				              <a href="javascript:deleteAddress('${addressId}')">删除</a>
				              <s:if test="isDefault == 1">
				              	
				              </s:if>
				              <s:else>
					              <a href="javascript:setDefault('${addressId}','1')">设为默认</a>
				              </s:else>
			              </td>
			              -->
			            </tr>
			            </s:iterator>
		            </tbody>
	            </table>
			</div>
		</div>
    </div>
</div>

<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>