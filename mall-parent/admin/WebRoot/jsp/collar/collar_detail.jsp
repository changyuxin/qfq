<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="../common/head.jsp"%>
		<script src="<%=basePath%>js/jquery.printFinal.js" type="text/javascript"></script>
		<title>亲分期后台-会员详情</title>
		<script type="text/javascript">
		$(function(){
			function print(preview){
	     		$("#detail").printFinal({
					preview: preview,//打印预览
					impcss: true//引入css文件						 
                });
	  		}
	  		$("#printbtn").click(function(){//打印按钮
	            print(false);   
	 		 });
		});
	</script>
	</head>
	<body style="overflow-x:hidden;" >
		<div style="border-bottom: 1px solid #ccc; padding: 5px; text-align: right;">
			<input id="printbtn" type="button" value="打印" />
		</div> 
		<div style="width:1000px; margin:0 auto;" id="detail">
			<style type="text/css" >
				body, button, input, select, textarea { font-family:'\5FAE\8F6F\96C5\9ED1', 'Hiragino Sans GB', Verdana;}
				table {border:1px thin #666;font-size:14px;}
				td {width:100px;height:50px;padding-left:10px;padding-right:10px;}
				.td-1 {width:200px;text-align:right;}
				.td-2 {width:300px;}
				.td-title {font-size:16px;}
			</style>
		    <table width="1000" border="1" cellpadding="1" cellspacing="0">
		        <tr>
		            <td colspan="6" style="text-align:center; font-size:18px;"><strong><s:property value="collarQuery.trueName" />的信息表</strong></td>
		        </tr>
		        <tr>
		            <td colspan="6"  class="td-title"><strong>客户基础信息</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>姓名：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.trueName" /></td>
		            <td colspan="1" class="td-1"><strong>性别：</strong></td>
		            <td colspan="2" class="td-2"><s:if test="collarQuery.sex == 1">男</s:if><s:else>女</s:else></td>
		        </tr>
		        <tr>
		          <td colspan="1" class="td-1"><strong>身份证号：</strong></td>
		          <td colspan="2" class="td-2"><s:property value="collarQuery.idCard" /></td>
		          <td colspan="3">&nbsp;</td>        
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>现居住地：</strong></td>
		            <td colspan="5" class="td-2">
		            	<span><s:property value="collarQuery.province" /></span>
		            	<span><s:property value="collarQuery.city" /></span>
		            	<span><s:property value="collarQuery.district" /></span>
		            	<span><s:property value="collarQuery.street" /></span>街（路）
		            	<span><s:property value="collarQuery.neighborhood" /></span>小区
		            	<span><s:property value="collarQuery.building" /></span>楼
		            	<span><s:property value="collarQuery.unit" /></span>单元
		            	<span><s:property value="collarQuery.floor" /></span>层
		            	<span><s:property value="collarQuery.room" /></span>室
		            </td>
		
		        </tr>
		        <tr>
		            <td colspan="6"  class="td-title"><strong>工作单位信息</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>工作单位：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.companyName" /></td>
		            <td colspan="1" class="td-1"><strong>公司性质：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="%{@com.qinfenqi.mall.common.constant.CompanyType@getName(collarQuery.companyType)}"/></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>工作部门：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.department" /></td>
		            <td colspan="1" class="td-1"><strong>工作职位：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.post" /></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>工作地址：</strong></td>
		            <td colspan="5" class="td-2"><s:property value="collarQuery.companyAddress" /></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>联系人：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.companyContactPerson" /></td>
		            <td colspan="1" class="td-1"><strong>固定电话：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.companyfixedTelephone" /></td>
		        </tr>
		        <tr>
		          <td colspan="1" class="td-1"><strong>手机号：</strong></td>
		          <td colspan="2" class="td-2"><s:property value="collarQuery.companyPhone" /></td>
		          <td colspan="3">&nbsp;</td>        
		        </tr>
		        <tr>
		            <td colspan="6"  class="td-title"><strong>邮寄地址以及联系方式</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>邮寄地址：</strong></td>
		            <td colspan="5" class="td-2">
		            	<span><s:property value="collarQuery.mailProvince" /></span>
		            	<span><s:property value="collarQuery.mailCity" /></span>
		            	<span><s:property value="collarQuery.mailDistrict" /></span>
		            	<span><s:property value="collarQuery.mailStreet" /></span>街（路）
		            	<span><s:property value="collarQuery.mailNeighborhood" /></span>小区
		            	<span><s:property value="collarQuery.mailBuilding" /></span>楼
		            	<span><s:property value="collarQuery.mailUnit" /></span>单元
		            	<span><s:property value="collarQuery.mailFloor" /></span>层
		            	<span><s:property value="collarQuery.mailRoom" /></span>室
		            </td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>本人联系方式：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.mailPhone" /></td>
		            <td colspan="1" class="td-1"><strong>QQ：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.mailQQ" /></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>微信：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.mailWeixin" /></td>
		            <td colspan="1" class="td-1"><strong>E-mail：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.mail" /></td>
		        </tr>
		        <tr>
		            <td colspan="6" class="td-title" ><strong>家庭及紧急联系人信息</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>父亲姓名：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.fatherName" /></td>
		            <td colspan="1" class="td-1"><strong>联系方式：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.fatherPhone" /></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>母亲姓名：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.motherName" /></td>
		            <td colspan="1" class="td-1"><strong>联系方式：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.motherPhone" /></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>夫妻或儿女姓名：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.wifeName" /></td>
		            <td colspan="1" class="td-1"><strong>联系方式：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.wifePhone" /></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>亲戚或朋友姓名：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.friendName" /></td>
		            <td colspan="1" class="td-1"><strong>联系方式：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.friendPhone" /></td>
		        </tr>
		        <tr>
		            <td colspan="6" class="td-title" ><strong>收入及其他信息</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>教育程度：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.educationLevel" /></td>
		            <td colspan="1" class="td-1"><strong>家庭收入：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.familyIncome" /></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>总工作时间：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.workingMonth" />月</td>
		            <td colspan="1" class="td-1"><strong>现单位工作时间：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.workingYearNow" />年</td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>个人月收入：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.monthIncome" /></td>
		            <td colspan="1" class="td-1"><strong>是否有社保：</strong></td>
		            <td colspan="2" class="td-2"><s:if test="collarQuery.socialSecurityStatus == 1">是</s:if><s:else>否</s:else></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>是否有住房：</strong></td>
		            <td colspan="2" class="td-2"><s:if test="collarQuery.housingStatus == 1">是</s:if><s:else>否</s:else></td>
		            <td colspan="1" class="td-1"><strong>每月生活支出额度：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.monthSpends" /></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>其他（担保人）联系人姓名：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.guaranteeName" /></td>
		            <td colspan="1" class="td-1"><strong>联系人电话：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.guaranteePhone" /></td>
		        </tr>
		        <tr>
		            <td colspan="6" class="td-title" ><strong>银行卡信息</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>银行卡开户行：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="%{@com.qinfenqi.mall.common.constant.Bank@getName(collarQuery.bankCard)}"/></td>
		            <td colspan="1" class="td-1"><strong>开户姓名：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="collarQuery.bankCardName"/></td>
		        </tr>
		        <tr>
		          <td colspan="1" class="td-1"><strong>账号：</strong></td>
		          <td colspan="2" class="td-2"><s:property value="collarQuery.bankCardId"/></td>
		          <td colspan="3">&nbsp;</td>        
		        </tr>
		        <tr>
		            <td colspan="6" class="td-title" ><strong>补充说明：</strong></td>
		        </tr>
		    </table>
		</div>
	</body>
</html>
