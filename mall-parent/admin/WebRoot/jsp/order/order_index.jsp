<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../common/head.jsp"%>
<title>亲分期后台-订单管理</title>
	<script type="text/javascript">
		$(document).ready(function(){
			queryOrderList(1);
			$("[order]").click(function(){
				$("[order]").css("color",""); 
				$(this).css("color","blue");
			});
			init();
		});
		
		function init(){
			var c = '<s:property value="countStr"/>';
			var a = c.split(",");
			var all = 0;
			for(var i = 0; i < a.length; i++){
				var r = a[i].split("-");
				var id = "#status_" + r[0];
				$(id).html("（" + r[1] + "）");
				all += parseInt(r[1]);
			}
			$("#status_all").html("（" + all + "）");
		}
		
		//根据条件查询
	    function queryOrderList(index){
	    	//点击查询时,将页码置为1
			if(index == 1){
				$("[name='orderQuery.pageNo']").val(1);
			}
			$("#main").load("order/order!getOrdersPage.do",$("#orderForm").serializeArray()).html(loading);
	    }
		function showOrderList(id){
			document.getElementById("status").value = id;
			queryOrderList(1);
		}
	</script>
</head>
<body>
	<!--页头Begin-->
	<%@include file="../common/top.jsp"%>
	<!--页头End-->
	<div style="overflow:hidden;">
		<div class="div_l" id="left_nav">
			<div class="lttop difference_title">订单状态</div>
			<hr />
			<ul id="lmenu" class="lmenu">
				<li><a order href="javascript:showOrderList(0)" style="color: blue;">全部订单<span id="status_all" style="color: red;"></span></a></li>
				<li><a order href="javascript:showOrderList(1)">未签合同订单<span id="status_1" style="color: red;"></span></a></li>
				<li><a order href="javascript:showOrderList(2)">待审核订单<span id="status_2" style="color: red;"></span></a></li>
				<li><a order href="javascript:showOrderList(3)">审核通过订单<span id="status_3" style="color: red;"></span></a></li>
				<li><a order href="javascript:showOrderList(4)">已发货订单<span id="status_4" style="color: red;"></span></a></li>
				<li><a order href="javascript:showOrderList(5)">还款中订单<span id="status_5" style="color: red;"></span></a></li>
				<li><a order href="javascript:showOrderList(7)">已完成订单<span id="status_7" style="color: red;"></span></a></li>
				<li><a order href="javascript:showOrderList(6)">已取消订单<span id="status_6" style="color: red;"></span></a></li>
			</ul>
		</div>
		<div class="body-box" id="main">
		</div>
	</div>
	</body>
</html>





