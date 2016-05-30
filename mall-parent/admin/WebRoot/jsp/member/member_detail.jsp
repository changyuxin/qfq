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
		            <td colspan="6" style="text-align:center; font-size:18px;"><strong>${memberQuery.trueName }的信息表</strong></td>
		        </tr>
		        <tr>
		            <td colspan="6"  class="td-title"><strong>身份学籍信息</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>用户名：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.phone }</td>
		            <td colspan="1" class="td-1"><strong>真实姓名：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.trueName }</td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>身份证号：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.idCard }</td>
		            <td colspan="1" class="td-1"><strong>所在地区：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.province } ${memberQuery.city }  ${memberQuery.district }</td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>所在学校：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.school }</td>
		            <td colspan="1" class="td-1"><strong>毕业年份：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.graduateYear } 年 ${memberQuery.graduateMonth } 月</td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>学信网账号：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.xxAccount }</td>
		            <td colspan="1" class="td-1"><strong>学信网密码：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.xxPassword }</td>
		        </tr>
		        <tr>
		            <td colspan="6"  class="td-title"><strong>联系方式</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>QQ号码：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.QQ }</td>
		            <td colspan="1" class="td-1"><strong>微信号码：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.weiXin }</td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>同学姓名：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.friendName }</td>
		            <td colspan="1" class="td-1"><strong>同学电话：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.friendPhone }</td>
		        </tr>
		        <tr>
		            <td colspan="6" class="td-title"><strong>银行卡信息</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"> <strong>开户银行：</strong></td>
		            <td colspan="2" class="td-2"><s:property value="%{@com.qinfenqi.mall.common.constant.Bank@getName(memberQuery.bankName)}"/></td>
		            <td colspan="1" class="td-1"><strong>银行卡号：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.bankCard }</td>
		        </tr>
		        <tr>
		          <td colspan="1" class="td-1"><strong>预留手机号：</strong></td>
		          <td colspan="2" class="td-2">${memberQuery.bankPhone }</td>
		          <td colspan="3">&nbsp;</td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>姓名：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.trueName }</td>
		            <td colspan="1" class="td-1"><strong>身份证号：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.idCard }</td>
		        </tr>
		        <tr>
		            <td colspan="6" class="td-title" ><strong>紧急联系方式</strong></td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>父亲（母亲）姓名：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.parentName }</td>
		            <td colspan="1" class="td-1"><strong>父亲（母亲）联系方式：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.parentPhone }</td>
		        </tr>
		        <tr>
		            <td colspan="1" class="td-1"><strong>同学姓名：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.motherName }</td>
		            <td colspan="1" class="td-1"><strong>同学电话：</strong></td>
		            <td colspan="2" class="td-2">${memberQuery.motherPhone }</td>
		        </tr>
		        <tr>
		            <td colspan="6" class="td-title" ><strong>补充说明：</strong></td>
		        </tr>
		    </table>
		</div>
	</body>
</html>
