<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="../common/head.jsp"%>
	<style type="text/css">
		.cnt_td {padding: 7px 3px; text-align: center; line-height: 20px; vertical-align: top;}
	</style>
	<title>亲分期后台-系统管理</title>
	<script type="text/javascript">
		$(function(){
			$("[nav]").click(function(){
				$("[nav]").css("color", ""); 
				$(this).css("color", "red");
			});
			$("[op]").each(function(){
				$(this).mouseover(function(){
       				$(this).find("span").show();
        		}).mouseout(function(){
        			$(this).find("span").hide();
        		});
			});
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="resourceQuery.pageNo" />,
				total: <s:property value="resourceQuery.total" />,
				pageSize : <s:property value="resourceQuery.pageSize" />,
				callback: function(selectPage) {
					$("[name='resourceQuery.pageNo']").val(selectPage);
					queryResourceList();
				}
			});
			//点击确定触发
			$("#query").click(function(){
				queryResourceList(1);
			});
		});
		
		function queryResource(pid){
			$("#parentId").val(pid);
			queryResourceList(1);
		}
		// 删除资源
		function deleteResource(id){
			layer.confirm("确认是否删除资源!", function(){
				$.post("system/resource!deleteResource.do", {
					"resourceQuery.resourceId" : id,
					"timestamp" : new Date().getTime() 
					}, function(data) {
						if (data.result == "FAILURE") {
							layer.alert("删除资源失败!");
						} else {
							close();
						}
					}, "json");
			});
		}
		
		
		function saveResourcePage(id){
			layer.open({
			    type: 2,
			    title: "保存资源",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["600px", "400px"],
			    content: "system/resource!saveResourcePage.do?resourceQuery.resourceId=" + id + "&resourceQuery.parentId=" + $("#parentId").val()
			});
		}
		
		// 启用、停用
		function enableResource(id, status, desc){
			$.post("system/resource!enableResource.do", {
				"resourceQuery.resourceId" : id,
				"resourceQuery.isEnable" : status,
				"timestamp" : new Date().getTime()
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert(desc + "资源失败!");
					} else {
						close();
					}
				}, "json");
		}
		
		// 关闭
		function close(){
			queryResourceList();
			layer.closeAll();
		}
	</script>
</head>
<body>
	<div class="div_mid">
		<div class="lttop">
			导航列表
		</div>
		<hr />
		<div id="resources" style="padding-left: 5px;">
			<ul class="mid_ul">
				<s:iterator value="navResources" id="resource">
	            	<li op>
            			<a <s:if test="#resource.resourceId == resourceQuery.parentId">style="color:red;"</s:if> href="javascript:queryResource('<s:property value="#resource.resourceId" />');">
            				<img src="img/icon_file.gif" alt="file"/>
	            			<s:property value="#resource.resourceName" />
	            		</a>
	            		<span style="display: none;">
	            			<a href="javascript:saveResourcePage('<s:property value="#resource.resourceId" />');">
	            				<img src="img/icon_edit.gif" alt="edit"/>
	            			</a><span class="mid_span">|</span>
	            			<a href="javascript:;"><img src="img/icon_delete.gif" alt="delete"/></a>
	            		</span>
	            	</li>
            	</s:iterator>
            </ul>
		</div>
	</div>
	<!--main-->
	<div class="special-body-box">
		<div class="rhead">
			<div class="rpos">当前位置: 系统管理 - 资源管理</div>
			<input type="button" class="ropt" value="添加资源" onclick="saveResourcePage(0)" />
			<div class="clear"></div>
		</div>
		<!--  -->
		<form id="queryForm" method="post">
			<div class="rhead">
				资源名称：<input type="text" name="resourceQuery.resourceName" value="<s:property value='resourceQuery.resourceName'/>" style="width:100px" /> 
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="query"/>
				<input type="hidden" name="resourceQuery.parentId" id="parentId"  value="<s:property value='resourceQuery.parentId'/>" />
				<input type="hidden" name="resourceQuery.pageNo"  value="<s:property value='resourceQuery.pageNo'/>" />
				<input type="hidden" name="resourceQuery.pageTotal"  value="<s:property value='resourceQuery.pageTotal'/>" />
				<div class="clear"></div>
			</div>
			<table class="pn-ltable" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox" />
						</th>
						<th>资源名称</th>
						<th>上级资源</th>
						<th>URL</th>
						<th>是否公共资源</th>
						<th>是否导航</th>
						<th>是否按钮</th>
						<th>是否启用</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="resourceList.size() > 0">
						<s:iterator value="resourceList" id="resource">
							<tr>
								<td class="cnt_td">
									<input type="checkbox" name="id" />
								</td>
								<td class="cnt_td">
									<s:property value="#resource.resourceName" />
								</td>
								<td class="cnt_td">
									<s:property value="#resource.parentName" />
								</td>
								<td class="cnt_td">
									<s:property value="#resource.url" />
								</td>
								<td class="cnt_td">
									<s:if test="#resource.isCommon == 1">是</s:if>
									<s:if test="#resource.isCommon == 0">否</s:if>
								</td>
								<td class="cnt_td">
									<s:if test="#resource.isNav == 1">是</s:if>
									<s:if test="#resource.isNav == 0">否</s:if>
								</td>
								<td class="cnt_td">
									<s:if test="#resource.isButton == 1">是</s:if>
									<s:if test="#resource.isButton == 0">否</s:if>
								</td>
								<td class="cnt_td">
									<s:if test="#resource.isEnable == 1">是</s:if>
									<s:if test="#resource.isEnable == 2">否</s:if>
								</td>
								<td class="cnt_td">
									<input type="button" value="编辑" onclick="saveResourcePage('<s:property value="#resource.resourceId" />')" />&nbsp;
									<input type="button" value="删除" onclick="deleteResource('<s:property value="#resource.resourceId" />')" />&nbsp;
									<input type="button" value="启用" onclick="enableResource('<s:property value="#resource.resourceId" />', 1, '启用')" />&nbsp;
									<input type="button" value="停用" onclick="enableResource('<s:property value="#resource.resourceId" />', 2, '停用')" />&nbsp;
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="resourceQuery.total" />  条记录</div>
			</div>
		</form>
	</div>
	<!--main end-->
	</body>
</html>





