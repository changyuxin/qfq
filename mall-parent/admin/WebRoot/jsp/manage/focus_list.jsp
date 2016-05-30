<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.cnt_td {text-align: center; }
		.link_a{margin-right: 5px;}
		.font_b{font-weight: 800;}
	</style>
	<script type="text/javascript">
		$(function(){
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="focusImage.pageNo" />,
				total: <s:property value="focusImage.total" />,
				callback: function(selectPage) {
					$("[name='focusImage.pageNo']").val(selectPage);
					queryFocusImageList();
				}
			});
		});
		
		function enableFocus(id, status){
			$.post("manage/focus!enableFocus.do", 
				{
					"focusImage.focusId" : id,
					"focusImage.isEnable" : status,
					"timestamp" : new Date().getTime()
				},
				function(data) {
					if (data.result == "FAILURE") {
						layer.alert("保存失败!");
					} else {
						loadPage("manage/focus!manage.do");
					}
			}, "json");
		}
		
		function deleteFocus(id){
			layer.confirm("确认删除轮播图吗!", function(){
				$.post("manage/focus!deleteFocus.do", {
					"focusImage.focusId" : id,
					"timestamp" : new Date().getTime() 
					}, function(data) {
						if (data.result == "FAILURE") {
							layer.alert("删除失败!");
						} else {
							queryFocusImageList();
							close();
						}
					}, "json");
			});
		}
		
	</script>
</head>
<body>
	<form id="queryForm" method="post">
		<!--  
		<div class="rhead">
			姓名：<input type="text" name="authCode.name" value="<s:property value='authCode.name'/>" style="width:100px" /> 
			手机号：<input type="text" name="authCode.mobile" value="<s:property value='authCode.mobile'/>" style="width:100px" /> 
			&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="query" />
		</div>
		-->
			<input type="hidden" name="focusImage.pageNo"  value="<s:property value='focusImage.pageNo'/>"/>
			<input type="hidden" name="focusImage.pageTotal"  value="<s:property value='focusImage.pageTotal'/>"/>
			<div class="clear"></div>
		<table class="pn-ltable" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
			<thead class="pn-lthead">
				<tr>
					<th width="25">
						<input type="checkbox" />
					</th>
					<th>轮播图ID</th>
					<th>轮播图描述</th>
					<th>轮播图顺序</th>
					<th>轮播图链接</th>
					<th>轮播图片</th>
					<th>背景色</th>
					<th>是否启用</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="pn-ltbody">
				<s:if test="focusImages.size() > 0">
					<s:iterator value="focusImages" id="focusImage">
						<tr>
							<td class="cnt_td">
								<input type="checkbox" name="id" />
							</td>
							<td class="cnt_td">
								<s:property value="#focusImage.focusId" />
							</td>
							<td class="cnt_td">
								<s:property value="#focusImage.focusDesc" />
							</td>
							<td class="cnt_td">
								<s:property value="#focusImage.focusOrder" />
							</td>
							<td class="cnt_td">
								<s:property value="#focusImage.focusLink" />
							</td>
							<td class="cnt_td">
								<s:property value="#focusImage.imageUrl" />
							</td>
							<td class="cnt_td" style="background-color: <s:property value="#focusImage.bgColor" />;">
								<s:property value="#focusImage.bgColor" />
							</td>
							<td class="cnt_td">
								<s:if test="#focusImage.isEnable == 1"><font color="green"><b>启用</b></font></s:if>
								<s:if test="#focusImage.isEnable == 2"><font color="red"><b>停用</b></font></s:if>
							</td>
							<td class="cnt_td">
								<s:date name="#focusImage.createTime" format="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td class="cnt_td">
								<input type="button" value="启用" onclick="enableFocus('<s:property value="#focusImage.focusId" />', 1)" class="btn-top" />
								<input type="button" value="停用" onclick="enableFocus('<s:property value="#focusImage.focusId" />', 2)" class="btn-top" />
								<input type="button" value="编辑" onclick="saveFocusPage('<s:property value="#focusImage.focusId" />')" class="btn-top" />
								<input type="button" value="删除" onclick="deleteFocus('<s:property value="#focusImage.focusId" />')" class="btn-top" />
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</tbody>
		</table>
		<div class="pagination list_content" style="text-align: center;">
			<div pageDiv class="msdn" style="float: left;"></div>
			<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="focusImage.total" /> 条记录</div>
		</div>
	</form>
</body>
</html>





