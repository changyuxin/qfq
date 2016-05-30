<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.cnt_td {padding-left:10px; text-align: left; line-height: 20px;}
	</style>
	<script type="text/javascript">
		$(function(){
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="contractQuery.pageNo" />,
				total: <s:property value="contractQuery.total" />,
				callback: function(selectPage) {
					$("[name='contractQuery.pageNo']").val(selectPage);
					queryContractList();
				}
			});
		});
		function showContractDetail(id){
			layer.open({
			    type: 2,
			    title: "查看合同",
			    shadeClose: true,
			    shade: 0.3,
			    area: ["1000px", "600px"],
			    content: "contract/contract!showContractDetail.do?contractQuery.contractId=" + id
			});
		}
		
		function verifyContract(id){
			$.ajax( {
				type : "POST",
				data : {"contractQuery.contractId":id},
				url : "contract/contract!verifyContract.do",
				dataType: "json",
				error: function(request) {
	                layer.alert("审核合同失败！");
		        },
				success : function(data) {
		           	if (data == 0) {
		           		layer.alert("审核成功!");
		           	} else {
		           		layer.alert("审核失败!");
		           		return;
		           	} 
				}
			});
		}
		//点击确定触发
		$("#queryContract").click(function(){
			queryContractList(1);
		});
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 合同 - 全部合同</div>
			<div class="clear"></div>
		</div>
		<!--  -->
		<form id="contractForm" method="post">		
			<div class="rhead">
				合同编号：<input type="text" name="contractQuery.code" value="<s:property value='contractQuery.code'/>" style="width:100px" /> 
				乙方姓名：<input type="text" name="contractQuery.belong" value="<s:property value='contractQuery.belong'/>" style="width:100px" />
				时间范围：<input style="width:135px;" id="startTime" type="text" class="Wdate one_bg" name="contractQuery.startTime"
		                    	onclick="WdatePicker({isShowClear:true,autoPickDate:true, readOnly:true, dateFmt:'yyyy-MM-dd HH:mm:ss', maxDate:'#F{$dp.$D(\'endTime\');}'})" 
		                    	value="<s:property value="#request.contractQuery.startTime" />"
		                    	/>
	            		<input style="width:135px;" id="endTime" type="text" class="Wdate one_bg2" name="contractQuery.endTime"
		                    	onclick="WdatePicker({isShowClear:true, autoPickDate:true, readOnly:true, dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'startTime\');}'})" 
		                    	value="<s:property value="#request.contractQuery.endTime" />"
		                    	/>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查询" id="queryContract"/>
					<input type="hidden" id="contract" name="contractQuery.contractStatus" value="<s:property value='contractQuery.contractStatus'/>"/>
					<input type="hidden" name="contractQuery.pageNo"  value="<s:property value='contractQuery.pageNo'/>"/>
					<input type="hidden" name="contractQuery.pageTotal"  value="<s:property value='contractQuery.pageTotal'/>"/>
					<div class="clear"></div>
			</div>
			<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox" />
						</th>
						<th>合同编号</th>
						<th>商品名称</th>
						<th>商品数量</th>
						<th>商品价格</th>
						<th>分期相关</th>
						<th>乙方相关</th>
						<th>创建时间</th>
						<th>状态</th>
						<th>操作选项</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="contractList.size() > 0">
						<s:iterator value="contractList" id="contract">
							<tr>
								<td align="center">
									<input type="checkbox" name="ids" value="5" />
								</td>
								<td align="center"><s:property value="#contract.code"/></td>
								
								<td align="left" style="padding-left: 5px;"><s:property value="#contract.productName"/></td>
								<td align="center"><s:property value="#contract.quantity"/></td>
								<td align="center"><s:property value="#contract.productPrice"/></td>
								<td class="cnt_td" >
									分期首付：<s:property value="#contract.firstPay"/>&nbsp;元<br/>
									分期月数：<s:property value="#contract.months"/>&nbsp;月<br/>
									分期月供：<s:property value="#contract.monthPay"/>&nbsp;元
								</td>
								<td class="cnt_td">
									姓名：<s:property value="#contract.belong"/><br/>
									电话：<s:property value="#contract.phone"/><br/>
								</td>
								<td align="center">
									<s:date name="#contract.createTime" format="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td align="center">
									<s:if test="#contract.contractStatus == 1">
										未审核
									</s:if>
									<s:if test="#contract.contractStatus == 2">
										已审核
									</s:if>
									<s:if test="#contract.contractStatus == 3">
										已取消
									</s:if>
								</td>
								<td align="center">
									<a href="javascript:showContractDetail('<s:property value="#contract.contractId"/>');">查看合同</a> &nbsp;|&nbsp; 
									<a href="javascript:verifyContract('<s:property value="#contract.contractId"/>');">审核合同</a> 
								
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="contractQuery.total" /> 条记录</div>
			</div>
		</form>
	<!--main end-->
	</body>
</html>





