<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.cnt_td {padding: 7px 3px; text-align: left; line-height: 20px; vertical-align: top;}
		.link_a{margin-right: 5px;}
		.font_b{font-weight: 800;}
	</style>
	<script type="text/javascript">
		$(function() { 
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="collarQuery.pageNo" />,
				total: <s:property value="collarQuery.total" />,
				callback: function(selectPage) {
					$("[name='collarQuery.pageNo']").val(selectPage);
					queryCollarList();
				}
			});
			//点击确定触发
			$("#query").click(function(){
				queryCollarList(1);
			});
		});
		
		// 查看会员详情
		function showDetail(id){
			layer.open({
			    type: 2,
			    title: "查看会员",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["1000px", "600px"],
			    content: "collar/collar!showCollarDetail.do?collarQuery.collarId=" + id
			});
		}
		
		// 审核通过
		function auditPass(id, status){
			if(status == 3){
				layer.alert("已经审核通过!无需重新审核!");
			} else {
				$.post("collar/collar!auditPass.do", {
					"collarQuery.collarId" : id,
					"timestamp" : new Date().getTime()
				}, function(data) {
					if (data.result == "SUCCESS") {
						queryCollarList();
					} else {
						layer.alert("审核失败!");
					}
				}, "json");
			}
		}	
		
		// 审核不通过
		function auditPage(id, status){
			if(status < 4){
				layer.open({
				    type: 2,
				    title: "审核意见",
				    shadeClose: false,
				    shade: 0.3,
				    area: ["400px", "200px"],
				    content: "collar/collar!auditPage.do?collarQuery.collarId=" + id
				});
			} else {
				layer.alert("已经审核不通过!无需重新审核!");
			}
		}
		
		// 上传补充资料
		function spyphoto(id){
			layer.open({
			    type: 2,
			    title: "补充白领资料",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["600px", "600px"],
			    content: "collar/collar!uploadSpyPage.do?collarQuery.collarId=" + id
			});
		}
		// 删除补充资料
		function delSpy(id, url){
			layer.confirm("确认删除该资料吗?", function(){
				$.post("collar/collar!deleteSpy.do", {
					"collarQuery.collarId" : id,
					"collarQuery.url" : $.md5($.trim(url)),
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
		function close(){
			queryCollarList();
			layer.closeAll();
		}
		
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 会员 - 白领会员</div>
			<div class="clear">
			</div>
		</div>
		<!--  -->
		<form id="collarForm" method="post">
			<div class="rhead">
				<div>
				           用户名：<input type="text" name="collarQuery.username" value="<s:property value='collarQuery.username'/>" style="width:100px" />
					真实姓名：<input type="text" name="collarQuery.trueName" value="<s:property value='collarQuery.trueName'/>" style="width:100px" />
	                &nbsp;&nbsp;<input type="button" value="查询" id="query" style="cursor: pointer;" />
			    </div>
				<input type="hidden" name="collarQuery.auditStatus"  value="<s:property value='collarQuery.auditStatus'/>" id="auditStatus"/>
				<input type="hidden" name="collarQuery.pageNo"  value="<s:property value='collarQuery.pageNo'/>"/>
				<input type="hidden" name="collarQuery.pageTotal"  value="<s:property value='collarQuery.pageTotal'/>" />
			</div>
			<div class="clear"></div>
			<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox">
						</th>
						<!-- 
						<th>用户名</th>
						 -->
						<th style="width: 15%;">基础信息</th>
						<th style="width: 14%;">单位信息</th>
						<th style="width: 15%;">地址及联系方式</th>
						<th style="width: 9%;">紧急联系方式</th>
						<th style="width: 13%;">收入信息</th>
						<th style="width: 8%;">银行卡信息</th>
						<th style="width: 6%;">资料照片</th>
						<th style="width: 7%;">补充资料</th>
						<th style="width: 4%;">创建时间</th>
						<th style="width: 4%;">状态</th>
						<th style="width: 5%;">操作</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="collars.size() > 0">
						<s:iterator value="collars" id="collar">
							<tr>
								<td align="center">
									<input type="checkbox" name="id" />
								</td>
								<!--  
								<td align="center">
									<s:property value="#collar.username" />
								</td>
								-->
								<td class="cnt_td">
									<b>会员ID</b>：<s:property value="#collar.collarId"/><br/>
									<b>用户名</b>：<s:property value="#collar.username"/>（<a href="javascript: showUserInfo('<s:property value='#collar.userId'/>')"><font color="blue">查看</font></a>）<br/>
									<hr/>
									真实姓名：<s:property value="#collar.trueName" /><br/>
									性别：<s:if test="#collar.sex == 1">男</s:if><s:else>女</s:else><br/>
									身份证：<s:property value="#collar.idCard" /><br/>
									现居住地址：<s:property value="#collar.province" />
											   <s:property value="#collar.city" />
											   <s:property value="#collar.district" />
											   <s:property value="#collar.street" />街（路）
											   <s:property value="#collar.neighborhood" />小区
											   <s:property value="#collar.building" />号楼
											   <s:property value="#collar.unit" />单元
											   <s:property value="#collar.floor" />层
											   <s:property value="#collar.room" />室<br/>
								</td>
								<td class="cnt_td">
									单位名称：<s:property value="#collar.companyName" /><br/>
									单位性质：<s:property value="%{@com.qinfenqi.mall.common.constant.CompanyType@getName(#collar.companyType)}"/><br/>
									所在部门：<s:property value="#collar.department" /><br/>
									职务：<s:property value="#collar.post" /><br/>
									单位地址：<s:property value="#collar.companyAddress" /><br/>
									联系人：<s:property value="#collar.companyContactPerson" /><br/>
									固定电话：<s:property value="#collar.companyfixedTelephone" /><br/>
									手机：<s:property value="#collar.companyPhone" /><br/>
								</td>
								<td class="cnt_td">
									邮寄地址：<s:property value="#collar.mailProvince" />
											  <s:property value="#collar.mailCity" />
											  <s:property value="#collar.mailDistrict" />
											  <s:property value="#collar.mailStreet" />街（路）
											  <s:property value="#collar.mailNeighborhood" />小区
											  <s:property value="#collar.mailBuilding" />号楼
											  <s:property value="#collar.mailUnit" />单元
											  <s:property value="#collar.mailFloor" />层
											  <s:property value="#collar.mailRoom" />室<br/>
									本人联系方式： <s:property value="#collar.mailPhone" /><br/>
									QQ：<s:property value="#collar.mailQQ" /><br/>
									微信：<s:property value="#collar.mailWeixin" /><br/>
									E-mail：<s:property value="#collar.mail" /><br/>
								</td>
								<td class="cnt_td">
									父亲姓名：<s:property value="#collar.fatherName" /><br/> 
									联系方式：<s:property value="#collar.fatherPhone" /><br/>
									母亲姓名：<s:property value="#collar.motherName" /><br/> 
									联系方式：<s:property value="#collar.motherPhone" /><br/>
									夫妻或儿女姓名：<s:property value="#collar.wifeName" /><br/> 
									联系方式：<s:property value="#collar.wifePhone" /><br/>
									亲戚或朋友姓名：<s:property value="#collar.friendName" /><br/> 
									联系方式：<s:property value="#collar.friendPhone" /><br/>
								</td>
								<td class="cnt_td">
									教育程度：<s:property value="%{@com.qinfenqi.mall.common.constant.EduStatus@getName(#collar.educationLevel)}"/><br/>
									家庭收入：<s:property value="#collar.familyIncome" /><br/>
									总工作时间：<s:property value="#collar.workingMonth" />月<br/>
									现单位工作时间：<s:property value="#collar.workingYearNow" />年<br/>
									个人月收入：<s:property value="#collar.monthIncome" /><br/>
									是否有社保：<s:if test="#collar.socialSecurityStatus == 1">是</s:if><s:else>否</s:else><br/>
									是否有住房：<s:if test="#collar.housingStatus == 1">是</s:if><s:else>否</s:else><br/>
									每月生活支出额度：<s:property value="#collar.monthSpends" /><br/>
									其他（担保人）联系人姓名：<s:property value="#collar.guaranteeName" /><br/>
									 联系人电话：<s:property value="#collar.guaranteePhone" /><br/>
								</td>
								<td class="cnt_td">
									开户行：<s:property value="%{@com.qinfenqi.mall.common.constant.Bank@getName(#collar.bankCard)}"/><br/>
									开户姓名：<s:property value="#collar.bankCardName"/><br/>
									银行卡号：<br/><s:property value="#collar.bankCardId"/><br/>
								</td>
								<td class="cnt_td">
									<b>身份证</b>：<br/>
									&nbsp;&nbsp;正面：<s:if test="#collar.uploadCardDetail != null && #collar.uploadCardDetail != ''"><a href="<s:property value="#collar.uploadCardDetail.split(',')[0]" />" target="_blank">查看</a></s:if><br/>
									&nbsp;&nbsp;正面：<s:if test="#collar.uploadCardDetail != null && #collar.uploadCardDetail != ''"><a href="<s:property value="#collar.uploadCardDetail.split(',')[1]" />" target="_blank">查看</a></s:if><br/>
									<b>银行流水</b>：<br/>
									&nbsp;&nbsp;流水下载：<s:if test="#collar.uploadFlowDetail != null && #collar.uploadFlowDetail != ''"><a href="<s:property value="#collar.uploadFlowDetail" />" target="_blank">下载</a></s:if><br/>	
									<b>其它资料</b>：<br/>
									<s:if test="othersDetail.size() > 0">
										<s:iterator value="othersDetail" id="other" status="L">
											&nbsp;&nbsp;资料<s:property value="#L.index + 1"/>：<a href="<s:property value="#other" />" target="_blank">查看</a><br/>
										</s:iterator>
									</s:if>
								</td>
								<td style="text-align: center; vertical-align: top; padding-top: 7px;">
									<s:if test="spyPhotos.size() > 0">
										<s:iterator value="spyPhotos" id="spy" status="L">
											资料<s:property value="#L.index + 1"/>：<a href="<s:property value="#spy" />" name="prev" target="_blank">查看</a>
											<s:if test="isPermissionUrl('collar/collar!deleteSpy.do')">
											 | <a href="javascript:delSpy('<s:property value="#collar.collarId"/>', '<s:property value="#spy" />')">删除</a><br/>
											 </s:if>
										</s:iterator>
									</s:if>
								</td>
								<td style="text-align: center; vertical-align: top; padding-top: 7px;">
									<s:date name="#collar.createTime" format="yyyy-MM-dd"/><br/>
									<s:date name="#collar.createTime" format="HH:mm:ss"/>
								</td>
								<td class="cnt_td">
									<s:if test="#collar.auditStatus == 1"><font color="orange"><b>待审核</b></font></s:if>
									<s:if test="#collar.auditStatus == 2"><font color="blue"><b>重新审核</b></font></s:if>
									<s:if test="#collar.auditStatus == 3"><font color="green"><b>审核通过</b></font></s:if>
									<s:if test="#collar.auditStatus == 4"><font color="red"><b>审核不通过</b></font></s:if>
								</td>
								<td class="cnt_td">
									<input type="button" value="查看会员" onclick="javascript:showDetail('<s:property value="#collar.collarId"/>');" class="btn-top" /><br/>
									<s:if test="isPermissionUrl('collar/collar!uploadSpyPage.do')">
										<input type="button" value="补充资料" onclick="spyphoto('<s:property value="#collar.collarId"/>')" class="btn-top" /><br/>
									</s:if>
									<s:if test="isPermissionUrl('collar/collar!auditPass.do')">
										<s:if test="#collar.auditStatus != 3">
											<input type="button" value="审核通过" onclick="javascript:auditPass('<s:property value="#collar.collarId"/>', '<s:property value="#collar.auditStatus"/>');" class="btn-top" /><br/>
										</s:if>
									</s:if>
									<s:if test="isPermissionUrl('collar/collar!auditPage.do')">
										<input type="button" value="审核不通过" onclick="javascript:auditPage('<s:property value="#collar.collarId"/>', '<s:property value="#collar.auditStatus"/>');" class="btn-top" /><br/>
									</s:if>
									<s:if test="isPermissionUrl('log/log!logList.do')">
										<input type="button" value="操作记录" onclick="showOpLog(4, '<s:property value="#collar.collarId"/>');;" class="btn-top" /><br/>
									</s:if>
								</td>
							</tr>
							<tr>
								<td colspan="12"><hr /></td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="collarQuery.total" /> 条记录</div>
			</div>
		</form>
	<!--main end-->
	</body>
</html>





