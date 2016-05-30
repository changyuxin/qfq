<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript">
		$(function(){
			queryFocusImageList(1);
		});
		
		//根据条件查询用户
	    function queryFocusImageList(index){
	    	//点击查询时,将页码置为1
			if(index == 1){
				$("[name='focusImage.pageNo']").val(1);
			}
			$("#content").load("manage/focus!getFocusImageList.do", $("#queryForm").serializeArray());
	    }
	    
		function close(){
			queryFocusImageList();
			layer.closeAll();
		}
		// 保存轮播图
		function saveFocusPage(id){
			layer.open({
			    type: 2,
			    title: "保存轮播图",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["600px", "400px"],
			    content: "manage/focus!saveFocusPage.do?focusImage.focusId=" + id
			});
		}
		
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 系统管理 - 生成授权码</div>
			<input type="button" class="ropt" value="添加轮播图" onclick="saveFocusPage(0)" />
			<div class="clear"></div>
		</div>
		<div id="content">
		</div>
	<!--main end-->
	</body>
</html>





