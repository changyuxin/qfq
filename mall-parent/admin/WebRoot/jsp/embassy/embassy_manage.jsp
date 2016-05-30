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
				pageNo: <s:property value="embassyQuery.pageNo" />,
				total: <s:property value="embassyQuery.total" />,
				pageSize: <s:property value="embassyQuery.pageSize" />,
				callback: function(selectPage) {
					$("[name='embassyQuery.pageNo']").val(selectPage);
					queryEmbassyList();
				}
			});
			var province = '${embassyQuery.province}';
			var city = '${embassyQuery.city}';
			if(province != ''){
				$(".area-choose").distpicker({
					province: province,
					city:city
				 });
			}else {
				$(".area-choose").distpicker({
					autoSelect: false 
				 });
			}
			$("#province").val(province);
			$("#city").val(city);
			
			//点击确定触发
			$("#queryEmbassy").click(function(){
				queryEmbassyList(1);
			});
		});
		
		// 关闭
		function close(){
			layer.closeAll("iframe");
			queryEmbassyList(1);
		}
		
		// 保存大使页面
		function saveEmbassyPage(id){
			layer.open({
			    type: 2,
			    title: "保存大使",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["800px", "600px"],
			    content: "embassy/embassy!saveEmbassyPage.do?embassyQuery.embassyId=" + id
			});
		}	
		
		// 转为正式
		function trunFormal(status, id){
			if(status == 1){
				layer.alert("已为正式大使，无需转正!");
			} else {
				layer.open({
				    type: 2,
				    title: "转为正式大使",
				    shadeClose: false,
				    shade: 0.3,
				    area: ["800px", "600px"],
				    content: "embassy/embassy!trunFormalPage.do?embassyQuery.embassyId=" + id + "&embassyQuery.status=1"
				});
			}
		}
		// 编辑大使
		function modifyEmbassy(status, id){
			layer.open({
			    type: 2,
			    title: "编辑大使",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["800px", "600px"],
			    content: "embassy/embassy!trunFormalPage.do?embassyQuery.embassyId=" + id + "&embassyQuery.status=1"
			});
		}
		
		// 注销大使
		function destroyEmbassy(id, status){
			if(status == 3){
				layer.alert("已注销!");
			} else {
				layer.confirm("确认是否注销大使吗!", function(){
					$.post("embassy/embassy!destroyEmbassy.do", {
						"embassyQuery.embassyId" : id,
						"timestamp" : new Date().getTime() 
						}, function(data) {
							if (data.result == "FAILURE") {
								layer.alert("注销大使失败!");
							} else {
								layer.alert("注销大使成功!");
								queryEmbassyList();
								layer.closeAll();
							}
						}, "json");
				});
			}
		}
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 大使管理 - 全部大使</div>
			<s:if test="isPermissionUrl('embassy/embassy!saveEmbassyPage.do')">
				<input type="button" class="ropt" value="添加大使" onclick="saveEmbassyPage(0)" />
			</s:if>
			<div class="clear"></div>
		</div>
		<!--  -->
		<form id="embassyForm" method="post">		
			<div class="rhead">
				真实姓名：<input type="text" name="embassyQuery.trueName" value="<s:property value='embassyQuery.trueName'/>" style="width:100px" /> 
				电话：<input type="text" name="embassyQuery.phone" value="<s:property value='embassyQuery.phone'/>" style="width:100px" />
				<span class="area-choose">
					<label style="margin-left: 50px; margin-right: 33px;">所在地区：</label>
					<select id="province" name="embassyQuery.province" class="area-form-control" style="width: 117px;"></select>&nbsp;&nbsp; 
					<select id="city" name="embassyQuery.city" class="area-form-control" style="width: 117px;"></select>&nbsp;&nbsp;
				</span>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="queryEmbassy"/>
				<input type="hidden" id="embassy" name="embassyQuery.status" value="<s:property value='embassyQuery.status'/>"/>
				<input type="hidden" name="embassyQuery.pageNo"  value="<s:property value='embassyQuery.pageNo'/>"/>
				<input type="hidden" name="embassyQuery.pageTotal"  value="<s:property value='embassyQuery.pageTotal'/>"/>
				<div class="clear"></div>
			</div>
			<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox" />
						</th>
						<th>大使编号</th>
						<th>真实姓名</th>
						<th>性别</th>
						<th>电话</th>
						<th>身份证</th>
						<th>所在学校</th>
						<th>创建时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="embassyList.size() > 0">
						<s:iterator value="embassyList" id="embassy">
							<tr>
								<td class="cnt_td">
									<input type="checkbox" name="ids" value="5" />
								</td>
								<td class="cnt_td">
									<s:property value="#embassy.serialNum" />
								</td>
								<td class="cnt_td">
									<s:property value="#embassy.trueName" />
								</td>
								<td class="cnt_td">
									<s:if test="#embassy.sex == 1">男</s:if>
									<s:if test="#embassy.sex == 2">女</s:if>
								</td>
								<td class="cnt_td">
									<s:property value="#embassy.phone" />
								</td>
								<td class="cnt_td">
									<s:property value="#embassy.idCard" />
								</td>
								<td class="cnt_td">
									<s:property value="#embassy.province" />
									<s:property value="#embassy.city" /> 
									<s:property value="#embassy.district" /> 
									<s:property value="#embassy.school" />
								</td>
								<td class="cnt_td">
									<s:date name="#embassy.createTime" format="yyyy-MM-dd"/>
								</td>
								<td class="cnt_td">
									<s:if test="#embassy.status == 1">
										<font color="green"><b>正式大使</b></font>
									</s:if>
									<s:if test="#embassy.status == 2">
										<font color="blue"><b>非正式大使</b></font>
									</s:if>
									<s:if test="#embassy.status == 3">
										<font color="orange"><b>已注消大使</b></font>
									</s:if>
								</td>
								<td class="cnt_td">
									<s:if test="isPermissionUrl('embassy/embassy!trunFormalPage.do')">
										<s:if test="#embassy.status != 1">
											<input type="button" value="转正大使" onclick="javascript:trunFormal('<s:property value="#embassy.status" />', '<s:property value="#embassy.embassyId" />');" />&nbsp;
										</s:if>
										<s:if test="#embassy.status == 1">
											<input type="button" value="编辑大使" onclick="javascript:modifyEmbassy('<s:property value="#embassy.status" />', '<s:property value="#embassy.embassyId" />');" />&nbsp;
										</s:if>
									</s:if>
									<!--  
									<input type="button" value="查看大使" onclick="javascript:;" />&nbsp;
									-->
									<s:if test="isPermissionUrl('embassy/embassy!destroyEmbassy.do')">
										<input type="button" value="注消大使" onclick="javascript:destroyEmbassy('<s:property value="#embassy.embassyId" />','<s:property value="#embassy.status" />')" />&nbsp;
									</s:if>
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="embassyQuery.total" /> 条记录</div>
			</div>
		</form>
	<!--main end-->
	</body>
</html>





