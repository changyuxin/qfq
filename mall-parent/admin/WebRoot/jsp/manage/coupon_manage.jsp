<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript">
		$(function(){
			queryCouponList(1);
		});
		
		//根据条件查询用户
	    function queryCouponList(index){
	    	//点击查询时,将页码置为1
			if(index == 1){
				$("[name='couponQuery.pageNo']").val(1);
			}
			$("#content").load("manage/coupon!queryCouponList.do", $("#queryForm").serializeArray());
	    }
	    
		function close(){
			queryCouponList();
			layer.closeAll();
		}
		
		// 保存轮播图
		function saveCouponPage(id){
			layer.open({
			    type: 2,
			    title: "保存优惠券",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["600px", "400px"],
			    content: "manage/coupon!saveCouponPage.do?couponQuery.couponId=" + id
			});
		}
		
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 系统管理 - 优惠券管理</div>
			<input type="button" class="ropt" value="添加优惠券" onclick="saveCouponPage(0)" />
			<div class="clear"></div>
		</div>
		<div id="content">
		</div>
	<!--main end-->
	</body>
</html>
