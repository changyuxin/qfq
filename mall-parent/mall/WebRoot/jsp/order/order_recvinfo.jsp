<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){   
		updateAddress();
		if(us == 2){
			$("#receiveAddress").attr("placeholder", "请输入详细收货地址，具体到门牌号。(50字以内)");
		}
	});
	function updateAddress(){
		$("#distpicker").distpicker({
			province: $("#provinceNum").val(),
			city: $("#cityNum").val(),
			district: $("#districtNum").val()
		});
	}
	function validate(){
		// 收货人
		var receiveName = $("#contacts").val();
		if(receiveName.length == 0){
			layer.alert("收货人不能为空！");
			return false;
		}
		// 手机号
		var mobile = $("#mobile").val();
		if(mobile.length == 0){
			layer.alert("手机号码不能为空！");
			return false;
		}
		// 省
		var province = $("#province").val();
		if(province.length == 0){
			layer.alert("省不能为空！");
			return false;
		}
		// 市
		var city = $("#city").val();
		if(city.length == 0){
			layer.alert("市不能为空！");
			return false;
		}
		// 区
		var district = $("#district").val();
		if(district.length == 0){
			layer.alert("区不能为空！");
			return false;
		}
		// 宿舍地址
		var receiveAddress = $("#receiveAddress").val();
		if(receiveAddress.length == 0){
			layer.alert("宿舍地址不能为空！");
			return false;
		}
		return true;
	}
	function saveAddress(){
		if(validate()){
			$.ajax( {
				type : "POST",
				data : {
					"shopAddress.addressId": $("#addressId").val(), 
					"shopAddress.receiveName": $("#contacts").val(), 
					"shopAddress.phoneNum": $("#mobile").val(),
					"shopAddress.provinceNum": $("#province").val(),
					"shopAddress.cityNum": $("#city").val(),
					"shopAddress.districtNum": $("#district").val(),
					"shopAddress.address": $("#receiveAddress").val(),
				},
				url : "center/center!updateAddress.do",
				dataType: "json",
				error: function(request) {
	                layer.alert("保存收货地址失败!");
		        },
				success : function(data) {
		           	if (data == 0) {
		           		location.reload();
		           		return;
		           	} else {
		           		layer.alert("保存收货地址失败!");
		           		return;
		           	} 
				}
			});
		}
	}
	
</script>
			  <div class="step-tt">
                  <strong>收货人信息</strong>
              </div>
              <div class="step-ctent">
                  <div class="item-info">
                      <label for="realName">收货人：</label>
                      <input class="air-order" id="contacts" placeholder="请务必填写真实姓名" maxlength="15" value="${address.receiveName}" type="text" />
                  </div>
                  <div class="item-info">
                      <label for="cardId">手机号码：</label>
                      <input class="air-order" id="mobile" placeholder="请务必填写真实手机号码" maxlength="11" value="${address.phoneNum}" type="text" />
                      <span class="font-error pl disnone" id="checkMobileMessage">
                      </span>
                  </div>
                  <div class="item-info" id="distpicker">
                      	<label>地址：</label>
                      	<select class="form-control air-order" id="province" name="address.provinceNum" onfocus="showMsg('#error1','')" ></select><span class="span_only">&nbsp;&nbsp;</span>
						<select class="form-control air-order" id="city" name="address.cityNum" onfocus="showMsg('#error2','')" ></select><span class="span_only">&nbsp;&nbsp;</span>
						<select class="form-control air-order" id="district" name="address.districtNum" onfocus="showMsg('#error3','')" ></select><span class="span_only">&nbsp;&nbsp;</span>
						<strong id="error1"></strong>
						<strong id="error2"></strong>
						<strong id="error3"></strong>
                  </div>
                  <div class="item-info">
                      <label>宿舍地址：</label>
                      <textarea class="air-order" id="receiveAddress" placeholder="请输入详细宿舍地址，具体到宿舍号。(50字以内)" style="height: 60px;">${address.address}</textarea>
                  </div>
                  <div class="item-info" style="margin-top: 40px;">
                      <label></label>
                      <input value="保存收货地址" class="bg-ea common-btn" onclick="saveAddress()" type="button" />
                  </div>
              </div>
