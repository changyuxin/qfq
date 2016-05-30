<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.cnt_td {padding: 7px 3px; text-align: center; line-height: 20px; vertical-align: top;}
		.link_a{margin-right: 5px;}
		.font_b{font-weight: 800;}
	</style>
	<script type="text/javascript">
		$(function(){
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="authCode.pageNo" />,
				total: <s:property value="authCode.total" />,
				callback: function(selectPage) {
					$("[name='authCode.pageNo']").val(selectPage);
					queryAuthCodeList();
				}
			});
			//点击确定触发
			$("#query").click(function(){
				queryAuthCodeList(1);
			});
		});
		// 删除补充资料
		function deleteCode(id){
			layer.confirm("确认删除该授权码吗?", function(){
				$.post("manage/manage!deleteCode.do", {
					"authCode.codeId" : id,
					"timestamp" : new Date().getTime()
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert("删除失败!"); 
					} else {
						close();
				}
				}, "json");
			});
		}
	</script>
</head>
<body>
	<form id="queryForm" method="post">
		<div class="rhead">
			姓名：<input type="text" name="authCode.name" value="<s:property value='authCode.name'/>" style="width:100px" /> 
			手机号：<input type="text" name="authCode.mobile" value="<s:property value='authCode.mobile'/>" style="width:100px" /> 
			&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="query" />
			<input type="hidden" name="authCode.pageNo"  value="<s:property value='authCode.pageNo'/>"/>
			<input type="hidden" name="authCode.pageTotal"  value="<s:property value='authCode.pageTotal'/>"/>
			<div class="clear"></div>
		</div>
		<table class="pn-ltable" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
			<thead class="pn-lthead">
				<tr>
					<th width="25">
						<input type="checkbox" />
					</th>
					<th>姓名</th>
					<th>推荐人姓名</th>
					<th>手机号</th>
					<th>授权码</th>
					<th>是否已用</th>
					<th>创建时间</th>
					<th>使用时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody class="pn-ltbody">
				<s:if test="authCodes.size() > 0">
					<s:iterator value="authCodes" id="authCode">
						<tr>
							<td class="cnt_td">
								<input type="checkbox" name="id" />
							</td>
							<td class="cnt_td">
								<s:property value="#authCode.name" />
							</td>
							<td class="cnt_td">
								<s:property value="#authCode.refereeName" />
							</td>
							<td class="cnt_td">
								<s:property value="#authCode.mobile" />
							</td>
							<td class="cnt_td">
								<s:property value="#authCode.code" />
							</td>
							<td class="cnt_td">
								<s:if test="#authCode.isUsed == 1">未使用</s:if>
								<s:if test="#authCode.isUsed == 2">已使用</s:if>
							</td>
							<td class="cnt_td">
								<s:date name="#authCode.createTime" format="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td class="cnt_td">
								<s:date name="#authCode.usedTime" format="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td class="cnt_td">
								<s:if test="#authCode.isUsed == 1">
									<input type="button" value="删除" onclick="deleteCode('<s:property value="#authCode.codeId" />')" class="btn-top" />
								</s:if>
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</tbody>
		</table>
		<div class="pagination list_content" style="text-align: center;">
			<div pageDiv class="msdn" style="float: left;"></div>
			<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="authCode.total" /> 条记录</div>
		</div>
	</form>
</body>
</html>





