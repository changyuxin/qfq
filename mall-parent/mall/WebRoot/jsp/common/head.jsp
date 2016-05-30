<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<base href="<%=basePath%>">
<basePath value="<%=basePath%>" id="basePath"></basePath>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<meta http-equiv="Pragma" CONTENT="no-cache" />
<meta http-equiv="Cache-Control" CONTENT="no-store, no-cache, must-revalidate" />
<meta http-equiv="Expires" CONTENT="-1" />
<meta name="keywords" content="亲分期,大学生,分期,分期购物,分期电商,分期电商平台,分期商城,大学生分期,大学生购物,分期购物平台,大学生分期购物 , 大学生分期付款,大学生分期购物,分期付款,iphone6分期付款,手机分期付款,0元首付,大学生分期消费,大学生商城"></meta>
<meta name="description" content="亲分期是国内最受大学生喜爱的分期购物平台，认证只需3分钟，正品保证，急速发货，大学生分期购物的天堂，让大学生，凭学生证、身份证即可办理,支持0元首付,轻松还款无压力"></meta>
<link href="<%=basePath %>css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.pagination.js"></script>	
<script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>	
<script type="text/javascript" src="<%=basePath%>js/jquery.timers-1.2.js" ></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.lazyload.js" ></script>
<script type="text/javascript">
	
	function loading(top){
		var loading = "<img src='mall/images/loading.gif' style='margin-top: " + top + "px; margin-left: 485px;' alt='正在加载数据中'/>";
		return loading;
	}
	
	// 1：学生;2：白领
	var us = '<s:property value="getUserStyle()" />';
	
	function tbr(){
		alert("此功能稍后开放，请耐心等待!");
	}
	// tab 切换
	function tabchange(obj, p, c, q, h) {
		$(obj).parent().find("li").attr("class", "" + q + "");
		$("#certificationType").val($(obj).attr("id"));
		$(obj).parents("." + p + "").find("." + c + "").hide();
		$(obj).attr("class", "" + h + "");
		var j = $(obj).index();
		$(obj).parents("." + p + "").find("." + c + ":eq(" + j + ")").show();
	}
	
	// 退出
	function logout(){
		$.post("<%=basePath%>login/login!logout.do", 
			function(data) {
				if (data.result == "SUCCESS") {
					window.location.href = "<%=basePath%>";	
				}
			}, 
		"json");
	}
	
	// 显示产品详情
	function showProDetail(pid){
		//window.location.href = "product/product!showProDetail.do?productQuery.productId=" + pid;
		window.location.href = "<%=basePath%>products/" + pid + ".html";
	}
	
	// 验证码
	function getValidateImages(){
		document.getElementById("validateImage").src="<%=basePath%>center/center!getValidateCode.do?rand=" + new Date().getTime();
	}

	//按照产品分类展示产品列表
	function showProdList(id){
		// window.location.href = "product/product!showProdList.do?productQuery.categoryId=" + id;
		window.location.href = "<%=basePath%>categories/" + id + ".html";
	}
	// 跳转到
	function to(url){
		window.location.href = url;
	}
	
	function searchProduct(keyword){
		if(keyword == null){
			keyword = $("#search_main").val();
			if(keyword.length == 0){
				layer.alert("请输入需要查询的商品名称!");
			}
		} 
		window.location.href = "<%=basePath%>product/product!showProdList.do?productQuery.keyword=" + keyword;
		// window.location.href = "search/" + encodeURIComponent(encodeURIComponent(keyword)) + ".html";
		//window.location.href = "search/" + keyword + ".html";
	}
	
	// 支付页面
	function payment(id, type){
		layer.open({
		    type: 2,
		    title: false,
		    shadeClose: false,
		    shade: 0.3,
		    cancel: function(index){ 
		    	window.location.href = "<%=basePath%>center/order.html";
		    },
		    area: ["500px", "200px"],
		    content: "<%=basePath%>pay/payment.html?payment.tradeType=" + type +  "&payment.tradeNo=" + id
		});
	}
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?ba09ac5e188ee484c5cea40b00d5e3cd";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	
</script>
