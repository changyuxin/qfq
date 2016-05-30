<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>首页</title>
</head>
<body>
<!--页头Begin-->
<div id="top">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
    	<tr>
      		<td width="272">
      			<a href="system/home!index.do"><img src="img/logo.jpg" border="0" /></a>
      		</td>
      		<td background="img/top_bg.jpg">
      			<table width="100%" border="0" cellspacing="0" cellpadding="0">
        			<tbody>
        				<tr>
          					<td height="35" align="right">
          						<table border="0" cellspacing="0" cellpadding="0">
	            					<tbody>
	            						<tr>
	            						 
						              		<td width="17" align="center"><img src="img/user.gif" border="0"></td>
						              		<td align="left"><span style="color:#FFF; padding:0 5px 0 5px;">您好，<s:property value="getCurrentUser().userName" /></span></td>
						             		<td width="17" align="center"><img src="img/ico.gif" width="10" height="10" border="0"></td>
						              		<td width="80" align="left"><a href="login!logout.do" class="channel">退出</a></td>
						               		<td width="50" align="left"><a href="http://www.qinfenqi.com" target="_blank" class="channel">商城首页</a></td>
	            						</tr>
         		   					</tbody>
         		  				</table>
         	   				</td>
           				</tr>
           				<tr>
          					<td height="32">
							  <table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tbody>
					            	<tr>
					            		<s:set name="resources" value="getCurrentUserResources()"/>
					            		<s:if test="#resources != null && #resources.size() > 0">
							            	<s:iterator value="resources" id="resource">
								              <td width="76" align="center">
								              	<a href="<s:property value="#resource.url" />">
								              		<s:property value="#resource.resourceName" />
								              	</a>
								              </td>
								              <td width="8"><img src="img/top-sep.jpg" border="0" /></td>
								            </s:iterator>
								          </s:if>
						              <td width="76" align="center"></td>
						              <td>&nbsp;</td>
					            	</tr>
					          	</tbody>
					          </table>
		  					</td>
        				</tr>
      				</tbody>
      			</table>
      		</td>
    	</tr>
  	</tbody>
  </table>
  <div style="border-top:1px solid #1879B0;"></div>
</div>
<!--页头End-->