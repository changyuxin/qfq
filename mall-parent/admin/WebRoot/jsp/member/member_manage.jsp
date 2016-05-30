<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<style type="text/css">
		.cnt_td {padding: 7px 5px; text-align: left; line-height: 20px; vertical-align: top;}
		.link_a{margin-right: 5px;}
		.font_b{font-weight: 800;}
 		.even {background-color: #cef;}  /* pale blue for even rows */ 
	</style>
	<script type="text/javascript">
		$(function() { 
			// 分页处理
			$("[pageDiv]").pagination({
				pageNo: <s:property value="memberQuery.pageNo" />,
				total: <s:property value="memberQuery.total" />,
				pageSize:<s:property value="memberQuery.pageSize" />,
				callback: function(selectPage) {
					$("[name='memberQuery.pageNo']").val(selectPage);
					queryMemberList();
				}
			});
			//点击确定触发
			$("#queryMember").click(function(){
				queryMemberList(1);
			});
			//点击确定触发
			$("#exportMember").click(function(){
				exportMembers();
			});
			//if($("#auditStatus").val() == 0){
			//	$("#exportMember").hide();
			//}
		});
		
		// 导出会员
		function exportMembers(){
			location.href = basePath + "member/member!exportMembers.do?memberQuery.auditStatus=" + $("#auditStatus").val();
		}
		
		
		// 编辑会员
		function modifyMemberIdInfo(id){
			layer.open({
			    type: 2,
			    title: "编辑会员身份信息",
			    shadeClose: true,
			    shade: 0.3,
			    area: ["500px", "350px"],
			    content: "member/member!modifyMemberIdInfo.do?memberQuery.memberId=" + id
			});
		}
		
		// 审核意见
		function auditPage(id, type, status){
			//if(status < 4){
				layer.open({
				    type: 2,
				    title: "审核意见",
				    shadeClose: false,
				    shade: 0.3,
				    area: ["400px", "200px"],
				    content: "member/member!auditPage.do?memberQuery.memberId=" + id + "&memberQuery.oauthType=" + type
				});
			//} else {
			//	layer.alert("已经审核不通过!无需重新审核!");
			//}
		}
		
		// 审核通过
		function auditPass(id, status, mask, flag){
			if(flag  == 3){
				layer.alert("已经审核通过!无需重新审核!");
			} else {
				layer.confirm("确认审核通过吗?", function(){
					var url = "member/member!auditPass.do?" + "memberQuery." + mask + "=" + status;
					$.post(url, {
						"memberQuery.memberId" : id,
						"memberQuery.oauthType" : mask,
						"timestamp" : new Date().getTime()
					}, function(data) {
						if (data.result == "SUCCESS") {
							close();
						} else {
							layer.alert("审核失败!");
						}
					}, "json");
				});
			}
		}
		
		// 上传补充资料
		function spyphoto(id){
			layer.open({
			    type: 2,
			    title: "补充会员资料",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["600px", "400px"],
			    content: "member/member!uploadSpyPage.do?memberQuery.memberId=" + id
			});
		}
		// 归档会员
		function archive(id){
			layer.confirm("确认归档会员吗?", function(){
				$.post("member/member!archive.do", {
					"memberQuery.memberId" : id
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert("会员归档失败!");
					} else {
						close();
					}
				}, "json");
			});
		}
		
		// 解除归档会员
		function unarchive(id){
			layer.confirm("确认解除归档会员吗?", function(){
				$.post("member/member!unarchive.do", {
					"memberQuery.memberId" : id
				}, function(data) {
					if (data.result == "FAILURE") {
						layer.alert("解除 会员归档失败!");
					} else {
						close();
					} 
				}, "json");
			});
			
			
		}
		
		
		// 查询黑名单
		function searchBlackList(name){
			layer.open({
			    type: 2,
			    title: "黑名单查询结果",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["700px", "400px"],
			    content: "member/member!searchBlackList.do?memberQuery.trueName=" + name
			});
		}
		
		// 查看会员详情
		function showDetail(id){
			layer.open({
			    type: 2,
			    title: "查看会员",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["1000px", "600px"],
			    content: "member/member!showMemberDetail.do?memberQuery.memberId=" + id
			});
		}
		
		// 审核记录
		function auditRecordPage(id){
			layer.open({
			    type: 2,
			    title: "审核记录",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["400px", "200px"],
			    content: "member/member!auditRecordPage.do?memberQuery.memberId=" + id
			});
		}
		
		function close(){
			queryMemberList();
			layer.closeAll();
		}
		
		// 删除补充资料
		function delSpy(id, url){
			layer.confirm("确认删除该资料吗?", function(){
				$.post("member/member!deleteSpy.do", {
					"memberQuery.memberId" : id,
					"memberQuery.url" : $.md5($.trim(url)),
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
		
		// 分配大使
		function distEmbasssy(eId, mId, school){
			layer.open({
			    type: 2,
			    title: "分配大使",
			    shadeClose: false,
			    shade: 0.3,
			    area: ["500px", "200px"],
			    content: "member/member!distEmbasssyPage.do?memberQuery.memberId=" + mId + "&embassyQuery.school=" + encodeURIComponent(school)
			});
		}
	</script>
</head>
<body>
	<!--main-->
		<div class="rhead">
			<div class="rpos">当前位置: 会员 - 大学生会员</div>
			<div class="clear">
			</div>
		</div>
		<!--  -->
		<form id="memberForm" method="post">
		<div class="rhead">
			<div>
				<!-- -->
			           用户名：<input type="text" name="memberQuery.username" value="<s:property value='memberQuery.username'/>" style="width:100px" />
				真实姓名：<input type="text" name="memberQuery.trueName" value="<s:property value='memberQuery.trueName'/>" style="width:100px" />
				时间范围：<input style="width:135px;" id="startTime" type="text" class="Wdate one_bg" name="memberQuery.startTime"
		                    	onclick="WdatePicker({isShowClear:true,autoPickDate:true, readOnly:true, dateFmt:'yyyy-MM-dd HH:mm:ss', maxDate:'#F{$dp.$D(\'endTime\');}'})" />
	            		<input style="width:135px;" id="endTime" type="text" class="Wdate one_bg2" name="memberQuery.endTime"
		                    	onclick="WdatePicker({isShowClear:true, autoPickDate:true, readOnly:true, dateFmt:'yyyy-MM-dd HH:mm:ss', minDate:'#F{$dp.$D(\'startTime\');}'})" 
		                    	value="<s:property value="#request.memberQuery.endTime" />" />
		     		&nbsp;&nbsp;<input type="button" value="查询" id="queryMember" style="cursor: pointer;" />
		     	<s:if test="isPermissionUrl('member/member!exportMembers.do')">
                	&nbsp;&nbsp;<input type="button" value="导出" id="exportMember" style="cursor: pointer;" />
                </s:if>
                &nbsp;&nbsp;||&nbsp;&nbsp;<b>查询黑名单</b> 姓名：<input type="text" id="tname" style="width:100px" /> &nbsp;&nbsp;<input type="button" value="查询" onclick="searchBlackList($('#tname').val())" style="cursor: pointer;" />
		    </div>
		    <!--  
				<br/>
			<div style="padding-top:5px;">
				身份学藉状态：
				<select id="isIdOauth" name="memberQuery.isIdOauth" style="width: 80px; text-align: center; font-size: 10px;">
                 		<option value="0" selected="selected">请选择</option>
                   		<option value="1" <s:if test="memberQuery.isIdOauth == 1"> selected="selected"</s:if>>未审核</option>
                   		<option value="2" <s:if test="memberQuery.isIdOauth == 2"> selected="selected"</s:if>>审核中</option>
                   		<option value="3" <s:if test="memberQuery.isIdOauth == 3"> selected="selected"</s:if>>审核通过</option>
                   		<option value="4" <s:if test="memberQuery.isIdOauth == 4"> selected="selected"</s:if>>审核不通过</option>
                 </select>
                                        联系方式状态：
				<select id="isContactOauth" name="memberQuery.isContactOauth" style="width: 80px; text-align: center; font-size: 10px;" >
                 		<option value="0" selected="selected">请选择</option>
                   		<option value="1" <s:if test="memberQuery.isContactOauth == '1'"> selected="selected"</s:if>>未审核</option>
                   		<option value="2" <s:if test="memberQuery.isContactOauth == 2"> selected="selected"</s:if>>审核中</option>
                   		<option value="3" <s:if test="memberQuery.isContactOauth == 3"> selected="selected"</s:if>>审核通过</option>
                   		<option value="4" <s:if test="memberQuery.isContactOauth == 4"> selected="selected"</s:if>>审核不通过</option>
                 </select>
                                        银行卡状态：
		 		<select id="isBkcardOauth" name="memberQuery.isBkcardOauth" style="width: 80px; text-align: center; font-size: 10px;" >
                 		<option value="0" selected="selected">请选择</option>
                   		<option value="1" <s:if test="memberQuery.isBkcardOauth == '1'"> selected="selected"</s:if>>未审核</option>
                   		<option value="2" <s:if test="memberQuery.isBkcardOauth == 2"> selected="selected"</s:if>>审核中</option>
                   		<option value="3" <s:if test="memberQuery.isBkcardOauth == 3"> selected="selected"</s:if>>审核通过</option>
                   		<option value="4" <s:if test="memberQuery.isBkcardOauth == 4"> selected="selected"</s:if>>审核不通过</option>
                 </select>
                                        紧急联系方式状态：
		 		<select id="isEcpOauth" name="memberQuery.isEcpOauth" style="width: 80px; text-align: center; font-size: 10px;">
                 		<option value="0" selected="selected">请选择</option>
                   		<option value="1" <s:if test="memberQuery.isEcpOauth == '1'"> selected="selected"</s:if>>未审核</option>
                   		<option value="2" <s:if test="memberQuery.isEcpOauth == 2"> selected="selected"</s:if>>审核中</option>
                   		<option value="3" <s:if test="memberQuery.isEcpOauth == 3"> selected="selected"</s:if>>审核通过</option>
                   		<option value="4" <s:if test="memberQuery.isEcpOauth == 4"> selected="selected"</s:if>>审核不通过</option>
                 </select>
                                        证件照片状态：
		 		<select id="isCardOauth" name="memberQuery.isCardOauth" style="width: 80px; text-align: center; font-size: 10px;">
                 		<option value="0" selected="selected">请选择</option>
                   		<option value="1" <s:if test="memberQuery.isCardOauth == '1'"> selected="selected"</s:if>>未审核</option>
                   		<option value="2" <s:if test="memberQuery.isCardOauth == 2"> selected="selected"</s:if>>审核中</option>
                   		<option value="3" <s:if test="memberQuery.isCardOauth == 3"> selected="selected"</s:if>>审核通过</option>
                   		<option value="4" <s:if test="memberQuery.isCardOauth == 4"> selected="selected"</s:if>>审核不通过</option>
                 </select>
                                          银行卡流水状态：
                 <select id="isBkflowOauth" name="memberQuery.isBkflowOauth" style="width: 80px; text-align: center; font-size: 10px;">
                 		<option value="0" selected="selected">请选择</option>
                   		<option value="1" <s:if test="memberQuery.isBkflowOauth == '1'"> selected="selected"</s:if>>未审核</option>
                   		<option value="2" <s:if test="memberQuery.isBkflowOauth == 2"> selected="selected"</s:if>>审核中</option>
                   		<option value="3" <s:if test="memberQuery.isBkflowOauth == 3"> selected="selected"</s:if>>审核通过</option>
                   		<option value="4" <s:if test="memberQuery.isBkflowOauth == 4"> selected="selected"</s:if>>审核不通过</option>
                 </select>
				</div>
                -->
               
					<input type="hidden" id="auditStatus" name="memberQuery.auditStatus"  value="<s:property value='memberQuery.auditStatus'/>"/>
					<input type="hidden" name="memberQuery.pageNo"  value="<s:property value='memberQuery.pageNo'/>"/>
					<input type="hidden" name="memberQuery.pageTotal"  value="<s:property value='memberQuery.pageTotal'/>"/>
					<div class="clear"></div>
		</div>
			<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0" id="data_table">
				<thead class="pn-lthead">
					<tr>
						<th width="25">
							<input type="checkbox" />
						</th>
						<!--  
						<th>用户名</th>
						-->
						<th>身份学藉信息</th>
						<th>联系方式</th>
						<th>银行卡信息</th>
						<th>紧急联系方式</th>
						<th>证件照片信息</th>
						<th>银行流水信息</th>
						<th>补充资料</th>
						<th>时间</th>
						<th>信用额度</th>
						<th>大使信息</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody class="pn-ltbody">
					<s:if test="members.size() > 0">
						<s:iterator value="members" id="member">
							<tr>
								<td align="center" rowspan="2">
									<input type="checkbox" name="id" />
								</td>
								<!--  
								<td align="center" rowspan="2">
									<s:property value="#member.username"/>
								</td>
								-->
								<td class="cnt_td" style="width: 220px;">
									<b>会员ID</b>：<s:property value="#member.memberId"/><br/>
									<b>用户名</b>：<s:property value="#member.username"/>（<a href="javascript: showUserInfo('<s:property value='#member.userId'/>')"><font color="blue">查看</font></a>）<br/>
									<hr/>
									真实姓名：<s:property value="#member.trueName"/>（<a href="javascript: searchBlackList('<s:property value='#member.trueName'/>')"><font color="blue">查询黑名单</font></a>）<br/>
									身份证号：<s:property value="#member.idCard"/><br/>
									身份证所在地：<s:property value="#member.idCardAddress"/><br/>
									所在地区：<s:property value="#member.province"/> <s:property value="#member.city"/> <s:property value="#member.district"/><br/>
									所在学校：<s:property value="#member.school"/><br/>
									所在寝室：<s:property value="#member.schoolBedroom"/><br/>
									毕业年份： <s:property value="#member.graduateYear"/> 年 <s:property value="#member.graduateMonth"/>  月<br/>
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<s:if test="#member.certificationType == 1"> 
											<b>学藉信息</b>：<br/>
											&nbsp;&nbsp;<img src="img/leaf.gif" width="16" height="16" /> 帐号：<s:property value="#member.xxAccount"/><br/>
											&nbsp;&nbsp;<img src="img/leaf.gif" width="16" height="16" /> 密码：<s:property value="#member.xxPassword"/><br/>
										</s:if>
										<s:if test="#member.certificationType == 2"> 
											<b>教务网信息</b>：<br/>
											&nbsp;&nbsp;<img src="img/leaf.gif" width="16" height="16" /> 帐号：<s:property value="#member.jwAccount"/><br/>
											&nbsp;&nbsp;<img src="img/leaf.gif" width="16" height="16" /> 密码：<s:property value="#member.jwPassword"/><br/>
											&nbsp;&nbsp;<img src="img/leaf.gif" width="16" height="16" /> 网址：<a href="<s:property value="#member.jwUrl"/>" target="_blank">教务网点击进入</a><br/>
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td" style="width: 200px;">
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										QQ号码：<s:property value="#member.QQ"/><br/>
										微信号：<s:property value="#member.weiXin"/><br/>
										同学姓名：<s:property value="#member.friendName"/><s:if test="#member.friendName != null && #member.friendName != ''">（<a href="javascript: searchBlackList('<s:property value='#member.friendName'/>')"><font color="blue">查询黑名单</font></a>）</s:if> <br/>
										同学手机号：<s:property value="#member.friendPhone"/><br/>
										同学手机号所在地：<s:property value="#member.friendPhoneAddress"/><br/>
									</s:if>
								</td>
								<td class="cnt_td" style="width: 200px;">
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										开户行：<s:property value="%{@com.qinfenqi.mall.common.constant.Bank@getName(#member.bankName)}"/><br/>
										银行卡号：<s:property value="#member.bankCard"/><br/>
										预留手机号：<s:property value="#member.bankPhone"/><br/>
										手机号所在地：<s:property value="#member.bankPhoneAddress"/><br/>
										姓名：<s:property value="#member.bankCustomerName"/><br/>
										身份证号：<s:property value="#member.bankCustomerCard"/><br/>
									</s:if>
								</td>
								<td class="cnt_td" style="width: 200px;">
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										父亲（母亲）姓名：<s:property value="#member.parentName"/><br/>
										父亲（母亲）电话：<s:property value="#member.parentPhone"/><br/>
										父亲（母亲）电话所在地：<s:property value="#member.parentPhoneAddress"/><br/>
										同学姓名：<s:property value="#member.motherName"/><s:if test="#member.motherName != null && #member.motherName != ''">（<a href="javascript: searchBlackList('<s:property value='#member.motherName'/>')"><font color="blue">查询黑名单</font></a>）</s:if><br/>
										同学电话：<s:property value="#member.motherPhone"/><br/>
										同学电话所在地：<s:property value="#member.motherPhoneAddress"/><br/>
									</s:if>
								</td>
								<td class="cnt_td" style="width: 180px;">
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<b>身份证</b>：<br/>
										&nbsp;&nbsp;身份证(正)：<s:if test="#member.idCardPhoto != null && #member.idCardPhoto != ''"><a href="<s:property value="#member.idCardPhoto.split(';')[0]" />" name="prev" target="_blank">查看</a></s:if><br/>
										&nbsp;&nbsp;身份证(反)：<s:if test="#member.idCardPhoto != null && #member.idCardPhoto != ''"><a href="<s:property value="#member.idCardPhoto.split(';')[1]" />" name="prev" target="_blank">查看</a></s:if><br/>
										<b>学生证</b>：<br/>
										<s:if test="#member.studentPhoto != null && #member.studentPhoto != ''">
											<s:if test="#member.studentPhoto.split(';')[0] != ''">
												&nbsp;&nbsp;学生证1：<a href="<s:property value="#member.studentPhoto.split(';')[0]"/>" name="prev" target="_blank">查看</a><br/>
		                               		</s:if>
		                               		<s:if test="#member.studentPhoto.split(';').length > 1">
		                               			&nbsp;&nbsp;学生证2：<a href="<s:property value="#member.studentPhoto.split(';')[1]"/>" name="prev" target="_blank">查看</a>
		                               		</s:if>
										</s:if><br/>
										<b>声明</b>：<br/>
										&nbsp;&nbsp;声明合照：<s:if test="#member.statementPhoto != null && #member.statementPhoto != ''"><a href="<s:property value="#member.statementPhoto"/>" name="prev" target="_blank">查看</a></s:if><br/>
										<b>其它资料</b>：<br/>
										<s:if test="otherPhotos.size() > 0">
											<s:iterator value="otherPhotos" id="other" status="L">
												&nbsp;&nbsp;资料<s:property value="#L.index + 1"/>：<a href="<s:property value="#other" />" name="prev" target="_blank">查看</a><br/>
											</s:iterator>
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td" style="width: 160px;">
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<b>银行流水</b>：<br/>
										<s:if test="#member.bkflowPhoto != null && #member.bkflowPhoto != ''"><a href="<s:property value="#member.bkflowPhoto"/>" name="prev" target="_blank">查看</a></s:if><br/>
									</s:if>
								</td>
								<td class="cnt_td" rowspan="2" style="vertical-align: top; padding-top: 10px; width: 130px;">
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<s:if test="spyPhotos.size() > 0">
											<s:iterator value="spyPhotos" id="spy" status="L">
												资料<s:property value="#L.index + 1"/>：<a href="<s:property value="#spy" />" name="prev" target="_blank">查看</a>
												 <s:if test="isPermissionUrl('member/member!deleteSpy.do')">
												 | <a href="javascript:delSpy('<s:property value="#member.memberId"/>', '<s:property value="#spy" />')" >删除</a><br/>
												 </s:if>
											</s:iterator>
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td" rowspan="2"  style="vertical-align: top; padding-top: 10px; width: 100px; line-height: 20px;">
									<b>创建时间</b>：<br/>
									&nbsp;<s:date name="#member.createTime" format="yyyy-MM-dd"/><br/>
									&nbsp;<s:date name="#member.createTime" format="HH:mm:ss"/><br/>
									<b>审核时间</b>：<br/>
									&nbsp;<s:date name="#member.auditTime" format="yyyy-MM-dd"/><br/>
									&nbsp;<s:date name="#member.auditTime" format="HH:mm:ss"/>
								</td>
								<td align="center" rowspan="2" style="vertical-align: top; padding-top: 10px; width: 70px;">
									<s:property value="%{formatDouble(#member.creditLimit)}" />
								</td>
								<td align="left" rowspan="2" style="vertical-align: top; padding-top: 10px; width: 80px;  line-height: 20px;">
									<b>大使姓名</b>：<br/>
										&nbsp;<s:property value="#member.embassyName" /><br/>
									<b>分配时间</b>：<br/>
										&nbsp;<s:date name="#member.distEmbaTime" format="yyyy-MM-dd"/><br/>
										&nbsp;<s:date name="#member.distEmbaTime" format="HH:mm:ss"/>
								</td>
								<td align="center" rowspan="2" style="vertical-align: top; padding-top: 10px; width: 70px;">
									<s:if test="#member.auditStatus == 1"><font color="orange"><b>待审核</b></font></s:if>
									<s:if test="#member.auditStatus == 2"><font color="blue"><b>重新审核</b></font></s:if>
									<s:if test="#member.auditStatus == 3"><font color="green"><b>审核通过</b></font></s:if>
									<s:if test="#member.auditStatus == 4"><font color="red"><b>审核不通过</b></font></s:if>
								</td>
								<td align="center" rowspan="2" style="line-height: 50px; vertical-align: top; padding-top: 8px; width: 120px;">
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<input type="button" value="查看会员" onclick="showDetail('<s:property value="#member.memberId"/>')" class="btn-top" /><br/>
									</s:if>
									<s:if test="isPermissionUrl('member/member!distEmbasssyPage.do')">
										<input type="button" value="指派大使" onclick="distEmbasssy('<s:property value="#member.embassyId"/>','<s:property value="#member.memberId"/>', '<s:property value="#member.school"/>')" class="btn-top" /><br/>
									</s:if>
									<s:if test="isPermissionUrl('member/member!uploadSpyPage.do')">
										<input type="button" value="补充资料" onclick="spyphoto('<s:property value="#member.memberId"/>')" class="btn-top" /><br/>
									</s:if>
									<s:if test="isPermissionUrl('member/member!archive.do')">
										<s:if test="#member.auditStatus != 99">
											<input type="button" value="归档会员" onclick="archive('<s:property value="#member.memberId"/>')" class="btn-top" /><br/>
										</s:if>
										<s:if test="#member.auditStatus == 99">
											<input type="button" value="解除归档" onclick="unarchive('<s:property value="#member.memberId"/>')" class="btn-top" /><br/>
										</s:if>
									</s:if>
									<s:if test="isPermissionUrl('member/member!auditRecordPage.do')">
										<input type="button" value="审核记录" onclick="auditRecordPage('<s:property value="#member.memberId"/>')" class="btn-top" /><br/>
									</s:if>
									<s:if test="isPermissionUrl('log/log!logList.do')">
										<input type="button" value="操作记录" onclick="showOpLog(3, '<s:property value="#member.memberId"/>')" class="btn-top" /><br/>
									</s:if>
									
								</td>
							</tr>
							
							<tr style="border-bottom: 1px solid #999;">
								<td class="cnt_td">
									<b>状态：</b>
									<span id="isIdOauth_<s:property value="#member.memberId"/>" class="font_b">
										<s:if test="#member.isIdOauth == 1"><font color="orange">未审核</font></s:if>
										<s:if test="#member.isIdOauth == 2"><font color="blue">审核中</font></s:if>
										<s:if test="#member.isIdOauth == 3"><font color="green">审核通过</font></s:if>
										<s:if test="#member.isIdOauth == 4"><font color="red">审核不通过</font></s:if>
									</span><br/>
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<b>审核：</b>
										<input type="button" value="通过" onclick="auditPass('<s:property value="#member.memberId"/>', '3', 'isIdOauth', '<s:property value="#member.isIdOauth"/>')" style="cursor: pointer;" />
										<input type="button" value="不通过" onclick="auditPage('<s:property value="#member.memberId"/>', 'isIdOauth', '<s:property value="#member.isIdOauth"/>')" style="cursor: pointer;" />
									</s:if>
								</td>
								<td class="cnt_td">
									<b>状态：</b>
									<span id="isContactOauth_<s:property value="#member.memberId"/>" class="font_b">
										<s:if test="#member.isContactOauth == 1"><font color="orange">未审核</font></s:if>
										<s:if test="#member.isContactOauth == 2"><font color="blue">审核中</font></s:if>
										<s:if test="#member.isContactOauth == 3"><font color="green">审核通过</font></s:if>
										<s:if test="#member.isContactOauth == 4"><font color="red">审核不通过</font></s:if>
									</span><br/>
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<b>审核：</b>
										<s:if test="#member.QQ != null && #member.weiXin != null && #member.friendName != null && #member.friendPhone != null">
											<input type="button" value="通过" onclick="auditPass('<s:property value="#member.memberId"/>', '3', 'isContactOauth', '<s:property value="#member.isContactOauth"/>')" style="cursor: pointer;" />
											<input type="button" value="不通过" onclick="auditPage('<s:property value="#member.memberId"/>', 'isContactOauth', '<s:property value="#member.isContactOauth"/>')" style="cursor: pointer;" />
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td">
									<b>状态：</b>
									<span id="isBkcardOauth_<s:property value="#member.memberId"/>" class="font_b">
										<s:if test="#member.isBkcardOauth == 1"><font color="orange">未审核</font></s:if>
										<s:if test="#member.isBkcardOauth == 2"><font color="blue">审核中</font></s:if>
										<s:if test="#member.isBkcardOauth == 3"><font color="green">审核通过</font></s:if>
										<s:if test="#member.isBkcardOauth == 4"><font color="red">审核不通过</font></s:if>
									</span><br/>
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<b>审核：</b>
										<s:if test="#member.bankName != null && #member.bankCard != null && #member.bankPhone != null && #member.bankCustomerName != null && #member.bankCustomerCard != null">
											<input type="button" value="通过" onclick="auditPass('<s:property value="#member.memberId"/>', '3', 'isBkcardOauth', '<s:property value="#member.isBkcardOauth"/>')" style="cursor: pointer;" />
											<input type="button" value="不通过" onclick="auditPage('<s:property value="#member.memberId"/>', 'isBkcardOauth', '<s:property value="#member.isBkcardOauth"/>')" style="cursor: pointer;" />
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td">
									<b>状态：</b>
									<span id="isEcpOauth_<s:property value="#member.memberId"/>" class="font_b">
										<s:if test="#member.isEcpOauth == 1"><font color="orange">未审核</font></s:if>
										<s:if test="#member.isEcpOauth == 2"><font color="blue">审核中</font></s:if>
										<s:if test="#member.isEcpOauth == 3"><font color="green">审核通过</font></s:if>
										<s:if test="#member.isEcpOauth == 4"><font color="red">审核不通过</font></s:if>
									</span><br/>
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<b>审核：</b>
										<s:if test="#member.parentPhone != null || #member.montherPhone != null">
											<input type="button" value="通过" onclick="auditPass('<s:property value="#member.memberId"/>', '3', 'isEcpOauth', '<s:property value="#member.isEcpOauth"/>')" style="cursor: pointer;" />
											<input type="button" value="不通过" onclick="auditPage('<s:property value="#member.memberId"/>', 'isEcpOauth', '<s:property value="#member.isEcpOauth"/>')" style="cursor: pointer;" />
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td">
									<b>状态：</b>
									<span id="isCardOauth_<s:property value="#member.memberId"/>" class="font_b">
										<s:if test="#member.isCardOauth == 1"><font color="orange">未审核</font></s:if>
										<s:if test="#member.isCardOauth == 2"><font color="blue">审核中</font></s:if>
										<s:if test="#member.isCardOauth == 3"><font color="green">审核通过</font></s:if>
										<s:if test="#member.isCardOauth == 4"><font color="red">审核不通过</font></s:if>
									</span><br/>
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<b>审核：</b>
										<s:if test="#member.idCardPhoto != null && #member.studentPhoto != null && #member.statementPhoto != null">
											<input type="button" value="通过" onclick="auditPass('<s:property value="#member.memberId"/>', '3', 'isCardOauth', '<s:property value="#member.isCardOauth"/>')" style="cursor: pointer;" />
											<input type="button" value="不通过" onclick="auditPage('<s:property value="#member.memberId"/>', 'isCardOauth', '<s:property value="#member.isCardOauth"/>')" style="cursor: pointer;" />
										</s:if>
									</s:if>
								</td>
								<td class="cnt_td">
									<b>状态：</b>
									<span id="isBkflowOauth_<s:property value="#member.memberId"/>" class="font_b">
										<s:if test="#member.isBkflowOauth == 1"><font color="orange">未审核</font></s:if>
										<s:if test="#member.isBkflowOauth == 2"><font color="blue">审核中</font></s:if>
										<s:if test="#member.isBkflowOauth == 3"><font color="green">审核通过</font></s:if>
										<s:if test="#member.isBkflowOauth == 4"><font color="red">审核不通过</font></s:if>
									</span><br/>
									<s:if test="isPermissionUrl('member/member!auditPass.do')">
										<b>审核：</b> 
										<s:if test="#member.bkflowPhoto != null">
											<input type="button" value="通过" onclick="auditPass('<s:property value="#member.memberId"/>', '3', 'isBkflowOauth', '<s:property value="#member.isBkflowOauth"/>')" style="cursor: pointer;" />
											<input type="button" value="不通过" onclick="auditPage('<s:property value="#member.memberId"/>', 'isBkflowOauth', '<s:property value="#member.isBkflowOauth"/>')" style="cursor: pointer;" />
										</s:if>
									</s:if>
								</td>	
							</tr>
							<tr>
								<td colspan="13"><hr /></td>
							</tr>
						</s:iterator>
					</s:if>
				</tbody>
			</table>
			<div class="pagination list_content" style="text-align: center;">
				<div pageDiv class="msdn" style="float: left;"></div>
				<div class="pagin_go" style="margin-left: 1px;">共 <s:property value="memberQuery.total" /> 条记录</div>
			</div>
		</form>
	<!--main end-->
	</body>
</html>





