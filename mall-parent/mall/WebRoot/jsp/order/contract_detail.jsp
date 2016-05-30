<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<%@include file="../common/head.jsp"%>
	<link  type="text/css"  href="<%=basePath%>css/order.css" rel="stylesheet"/>
	<script type="text/javascript" src="<%=basePath%>js/distpicker.data.js" ></script>
	<script type="text/javascript" src="<%=basePath%>js/distpicker.js" ></script>
	<title>亲分期 - 合同</title>
	<script type="text/javascript">
		$(function() {
			
			$("#acceptContract").click(
				function() {
					if ($(this).is(":checked")) {
						$("#paymentBtn").removeClass("bg-disable").addClass("bg-fc");
					} else {
						$("#paymentBtn").removeClass("bg-fc").addClass("bg-disable");
					}
			});
			$("#paymentBtn").click(function() {
				if ($(this).hasClass("bg-disable")) {
					return;
				}
				if ($(this).hasClass("bg-fc")) {
					submitContract();
					$(this).removeClass("bg-fc").addClass("bg-disable");
				}
			});
			$("#serviceCost").html(parseFloat($("#servicePay").val()).toFixed(2));
			$("#financialCost").html(parseFloat($("#financialPay").val()).toFixed(2));
			$("#totalCost").html(parseFloat($("#total").val()).toFixed(2));
		});
		
		
		function submitContract(html){
			$.ajax( {
				type : "POST",
				url : "<%=basePath%>order/contract!createContract.do?timestamp=" + new Date().getTime(),
				data : $("#contractForm").serialize(),
				dataType: "json",
				success : function(data) {
		           	if (data.result == "SUCCESS") {
		           		if($("#firstPay").val() > 0){
		           			payment($("#orderId").val(), 2);
		           		} else {
		           			window.location.href = "center/order.html";
		           		}
		           		// return;
		           	} else {
		           		var url = "center/credit.html";
						if(us == 2){
							url = "collar/infoPage.html";
						}
		           		layer.open({
						    type: 1,
						    title:"订单合同失败",
						    skin: "layui-layer-rim", //加上边框
						    area: ["400px", "190px"], //宽高
						    content: "<div style='font-size:14px; padding: 20px; text-align: left;'>" + data.msg + 
						    	"<br/>&nbsp;&nbsp;1、如果您未完成认证，请进行认证，<br/>&nbsp;&nbsp;2、如果已经分期购买过商品，请还款后再分期购买商品!" + 
						    	"</div><div style='text-align: center; padding-top: 10px;'><a class='common-btn bg-ea' href='" + url + "'>立即认证</a></div>" 
						});
		           	}
				}
			});
		}
	</script>
</head>

<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>

<div class="mid">
 

	<!--信用支付-->
	<div class="apply-all " id="">
		<div class="apply-wrap">
			<div class="apply-tt">
				<h3><strong>合同确认</strong></h3>
			</div>
			<div id="contractContent" style="width: 1000px;">
				<form id="contractForm">
					<input type="hidden" name="contract.belong" value="${memberQuery.trueName}${collarQuery.trueName}" />
					<input type="hidden" name="contract.orderId" value="${orderQuery.orderId}" id="orderId" />
					<input type="hidden" name="contract.code" value="${contract.code}" />
					<input type="hidden" name="contract.idCard" value="${memberQuery.idCard}${collarQuery.idCard}" />
					<input type="hidden" name="contract.phone" value="${memberQuery.phone}${collarQuery.phone}" />
					<input type="hidden" name="contract.productName" value="${orderQuery.productName}" />
					<input type="hidden" name="contract.quantity" value="${orderQuery.quantity}" />
					<input type="hidden" name="contract.productPrice" value="${orderQuery.productPrice}" />
					<input type="hidden" name="contract.firstPay" value="${orderQuery.firstPay}" id="firstPay" />
					<input type="hidden" name="contract.months" value="${orderQuery.months}" />
					<input type="hidden" name="contract.monthPay" value="${orderQuery.monthPay}" />
					<input type="hidden" name="contract.serviceRate" value="${orderQuery.serviceRate}" />
					<input type="hidden" name="contract.financialRate" value="${orderQuery.financialRate}" />
					<input type="hidden" name="contract.paymentDay" value="${day}" />
					
					<input type="hidden" name="memberQuery.creditLimit" value="${memberQuery.creditLimit}" />
					<input type="hidden" name="memberQuery.memberId" value="${memberQuery.memberId}" />
					
					<input type="hidden" name="collarQuery.collarId" value="${collarQuery.collarId}" />
					<input type="hidden" name="collarQuery.creditLimit" value="${collarQuery.creditLimit}" />
					
				</form>
		        <!--合同-->
         		<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" style="padding-left:20px;padding-right:20px;">
					<tbody>
    					<tr>
    						<td>
            					<table border="0" cellpadding="0" cellspacing="0" width="100%">
                        			<tbody>
                        				<tr>
                            				<td width="100%"><p style="text-align:right; height: 40px;">合同编号：${contract.code}</p></td>
                        				</tr>
                        				<tr>
                            				<td width="100%"><P style="width:100%; font-size:30px; text-align:center; height: 80px;">分&nbsp;期&nbsp;合&nbsp;同</P></td>
                        				</tr>
                        				<tr>
                            				<td width="100%"><p style="text-align:left; font-size: 11pt;"><b>第一条 平台服务</b> </p></td>
                        				</tr>
                        			</tbody>
                    		</table>
        				</td>
    					</tr>
    					<tr>
    						<td>
        						<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" style="font-size: 10.5pt;">
            						<tbody>
                         				<tr>
                                			<td colspan="2" width="350px" height="40px" align="left">甲方：亲分期（北京）科技有限公司</td>
                                			<td colspan="3" width="350px" height="40px" align="left">公司地址：北京市石景山区实兴大街30号院17号楼4层</td>
                                			<td colspan="3" width="250px" height="40px" align="center">客服电话：400-628-5159</td>
                            			</tr>
                         				<tr>
                                			<td colspan="2" width="350px" height="40px" align="left">乙方：${memberQuery.trueName}${collarQuery.trueName}</td>
                                			<td colspan="3" width="350px" height="40px" align="left">身份证号：${memberQuery.idCard}${collarQuery.idCard}</td>
                                			<td colspan="3" width="250px" height="40px" align="center">手机号码：${memberQuery.phone}${collarQuery.phone}</td>
                            			</tr>   
                         				<tr>
                            				<td colspan="10" height="40px" ><p style="padding: 20px 0px;">甲方运营管理亲分期网站（www.qinfenqi.com），乙方为亲分期网站注册用户，甲乙双方经协商一致，根据《中华人民共和国合同法》等法律法规，就乙方通过甲方运营管理的网站平台购买商品，甲方为乙方提供的一系列平台服务的相关事宜达成如下协议：</p></td>
                         				</tr>
                					</tbody>
            					</table>
        					</td>
    					</tr>
    					<tr>
      						<td>
    							<table border="1" cellpadding="0" cellspacing="0" width="100%">
           							<tbody>
                         				<tr>
                             				<td colspan="5" width="620px" height="40px" align="center">甲方购买的商品/服务名称</td>
                             				<td colspan="1" width="130px" height="40px" align="center">数量</td>
                             				<td colspan="2" width="150px" height="40px" align="center">价款</td>
                         				</tr>
                         				<tr>
                             				<td colspan="5" align="center" height="40px"><b>${orderQuery.productName}</b></td>
                             				<td colspan="1" align="center" height="40px"><b>${orderQuery.quantity}</b></td>
                             				<td colspan="2" align="center" height="40px"><b>${orderQuery.productPrice}元</b></td>
                         				</tr>
                                        <tr>
                                             <td colspan="1" width="16%" height="40px" align="center">首付金额</td>
                                             <td colspan="1" width="16%" height="40px" align="center"><strong>${orderQuery.firstPay}</strong>元</td>
                                             <td colspan="1" width="16%" height="40px" align="center">分期月数</td>
                                             <td colspan="2" width="16%" height="40px" align="center"><strong>${orderQuery.months}</strong>个月</td>
                                             <td colspan="1" width="20%" height="40px" align="center">每月付款金额</td>
                                             <td colspan="2" width="16%" height="40px" align="center"><strong>${orderQuery.monthPay}</strong>元</td>
                                         </tr>
                                        <tr>
                                             <td colspan="2" align="center" height="40px">每月还款日</td>
                                             <td colspan="1" width="150px"  height="40px" align="center">每月<strong>${day}</strong>日</td>
                                             <td colspan="2" width="100px"  height="40px" align="center">首次还款日</td>
                                             <td colspan="3" align="center" height="40px"><strong>${year}</strong>年<strong>${month + 1 }</strong>月<strong>${day1}</strong>日</td>
                                         </tr>
                                        <tr>
                                             <td colspan="5" align="left" height="40px">&nbsp;&nbsp;乙方扣除首付款以后的应付款总额（以下简称“应付款总额”）</td>
                                             <td colspan="3" width="120px"  height="40px" align="center">
                                             	<input type="hidden" value="${orderQuery.monthPay * orderQuery.months}" id="total" />
                                             	<strong id="totalCost">${orderQuery.monthPay * orderQuery.months}</strong>元
                                             </td>
                                         </tr>
                                        <tr>
                                             <td colspan="5" align="left" height="40px">&nbsp;&nbsp;乙方应付款总额中包含的甲方收取的服务费，第三方融资平台收取的月服务费（由甲方代收）</td>
                                             <td colspan="3" width="120px"  height="40px" align="center">
                                             	<input type="hidden" value="${(orderQuery.productPrice - orderQuery.firstPay ) * orderQuery.serviceRate}" id="servicePay" />
                                             	<strong id="serviceCost"></strong>元
                                             </td>
                                     	</tr>
                                        <s:if test="getUserStyle() == 2">
                                        <tr>
                                             <td colspan="5" align="left" height="40px">&nbsp;&nbsp;乙方应付款总额中包含的甲方收取的财务费，第三方融资平台收取的月财务费（由甲方代收）</td>
                                             <td colspan="3" width="120px"  height="40px" align="center">
                                             	<input type="hidden" value="${(orderQuery.productPrice - orderQuery.firstPay ) * orderQuery.financialRate}" id="financialPay" />
                                             	<strong id="financialCost"></strong>元
                                             </td>
                                         </tr>
                                         </s:if>
                         			</tbody>             
      							</table>
        					</td>
     					 </tr>  
                        <tr>
                            <td style="font-size:14px;line-height:30px !important;">
                             <p style="text-align:left; font-size: 11pt;"><b>第二条 甲方权利和义务</b></p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;1、甲方应按照本合同约定为乙方提供亲分期网站的相关服务。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;2、妥善保管乙方在甲方所运营的亲分期网站上注册登记的个人信息。</p>
                             <p style="text-align:left; font-size: 11pt;"><b>第三条 乙方权利和义务</b></p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;1、乙方应向甲方支付第一条所述首付（如有）。</p>
 			     			 <p>&nbsp;&nbsp;&nbsp;&nbsp;2、乙方有权申请提前还款，申请提前还款成功的，余下期数未发生的月服务费按50%收取，只需要还清应付款总额减去已经偿还的金额再减去余下期数月服务费的金额即可。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;3、乙方应将本合同第一条所约定的每月还款金额在每月还款日前足额支付给甲方。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;4、乙方应提供有效期内的本人证件以及其他甲方要求的信息，由甲方工作人员核对。</p>
                             <p style="text-align:left; font-size: 11pt;"><b>第四条 违约责任</b></p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;1、如果乙方逾期支付本协议第一条所约定的款项，按该期款项×1%×实际逾期天数的计算方式向甲方支付滞纳金。乙方逾期支付所约定的款项超过30天的，除应支付滞纳金外，还应从逾期支付之日起计算，按每天2%比例支付违约金。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;2、如果乙方逾期支付本协议第一条所约定的款项超过30天，或甲方发现乙方出现逃避付款、拒绝沟通或者恶意拖欠货款等情形，甲方有权将乙方的“逾期行为”计入个人征信系统，甲方不承担任何法律责任。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;3、如果乙方逾期支付本协议第一条所约定的款项超过30天，或连续逾期两期及以上，或甲方发现乙方出现逃避付款、拒绝沟通或恶意拖欠货款等情形，甲方有权将乙方违约的相关信息及乙方信息向所在学校及相关管理机构披露，甲方不承担任何法律责任。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;4、违约的一方应承担因违约造成的另外一方的损失及产生的费用，包括但不限于诉讼费、律师费、因处理本违约事务而产生的差旅费等。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;5、如果乙方发生违约，乙方同意甲方或其聘请的第三方机构以直接上门、网络、邮件、电话或其他方式向乙方发出提示或者进行追索欠款，乙方不得提出任何异议或提出任何诉讼，由此产生的一切费用均由乙方承担。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;6、违约方应承担守约方因违约方的违约行为而产生的所有费用和损失，包括但不限于调查费用、诉讼费、公告费、执行费、律师费、差旅费等。</p>
                             <p style="text-align:left; font-size: 11pt;"><b>第五条 授权委托</b></p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;1、现乙方委托甲方在由第三方平台上向第三方平台出借人（以下简称“出借人”）融资，融资金额即为签订本合同时乙方尚未支付的金额（“应付款项”）。融资款项仅限于支付该应付款项，甲方指定乙方作为融资款项的收款人。同时甲方在此过程中为乙方提供咨询、办理融资申请、还款管理等服务。经甲方推荐且前述融资匹配成功后，甲方、乙方、第三方平台、出借人等将以电子文本形式签订《借款协议》。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;2、乙方同意，在上述第三方平台融资的过程中，委托并不可撤销地授权甲方及/或第三方平台以甲方名字开立并管理有关第三方平台账户。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;3、乙方委托并授权甲方及/或第三方平台公开甲方在第三方平台融资所需的个人信息，包括但不限于：性别、年龄、所在学校、年级、专业等，并视情况为该等借款引入增信措施；如在前述借款信息发布之日起2个工作日后仍未能实现借款匹配，授权甲方独立判断是否取消已经发布的借款信息。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;4、乙方同意，在融资匹配完成后，由甲方代为接收融资本金。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;5、授权甲方及/或第三方平台在约定还款日期代扣应支付给出借人的本金、利息以及支付给第三方平台的费用，并按《借款协议》约定的还款日代付给相关个人及公司。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;6、授权甲方及/或第三方平台在相关机构（包括但不限于金融机构、税务、工商、征信机构、人民法院等）查询、确认乙方的相关征信信息。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;7、乙方同意采用电子文本形式制作《借款协议》（注：具体见网站所公布的《借款协议》范本，乙方确认已经仔细阅读及不可撤销地同意《借款协议》的全部条款），授权甲方及/或第三方平台通过该第三方平台操作，以乙方的名义代为签署《借款协议》电子文本，并代为保管《借款协议》。一经甲方及/或第三方平台通过该第三方平台账户在第三方平台对《借款协议》进行确认，相关协议即对乙方发生效力，乙方同意受《借款协议》相关内容的约束。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;8、授权甲方代为接收第三方平台向乙方发送的相关信息（包括但不限于借款协议电子文本、债权转让通知等），该等信息在甲方接收时即视为已送达乙方。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;9、授权甲方可将上述委托事项的部分或者全部进行转委托。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;10、委托期限：自本合同生效之日起至甲方或第三方平台代乙方在第三方平台签署的电子文本形式的《借款协议》项下乙方的义务全部履行完毕之日止。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;11、特别委托：乙方在此不可撤销的承诺，乙方在《借款协议》项下的义务未全部履行完毕之前，不得单方解除或终止上述对甲方及/或第三方平台的委托。</p>
                             <p style="text-align:left; font-size: 11pt;"><b>第六条 退换货政策</b></p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;1、商品未拆封，7天之内无理由退换，甲方不收取商品折价费，收取上门取件费15元。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;2、商品已拆封、且商品无人为损坏，7天之内可以退货，甲方收取15%的商品折价费。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;3、商品超过7天，无法退换货。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;4、商品有人为损坏，不可退换货。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;5、商品出现质量问题，经第三方机构检测确认以后，7天内可以退货，不收取上门取件费和商品折价费。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;6、苹果品牌商品，激活以后，无法退换货。</p>
                             <p style="text-align:left; font-size: 11pt;"><b>第七条 争议解决</b></p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;1、本协议在履行中发生争议，双方应协商解决；协商不成，甲乙双方均可向甲方所在地的法院起诉。</p>
                             <p style="text-align:left; font-size: 11pt;"><b>第八条 合同生效</b></p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;1、本协议以电子文本形式生成。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;2、本协议的任何修改、补充均须以甲方平台电子文本形式做出。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;3、乙方委托甲方保管所有与本协议有关的书面文件或电子信息。</p>
                             <p>&nbsp;&nbsp;&nbsp;&nbsp;4、双方确认，本协议由乙方通过甲方运营管理的网站（http://www.qinfenqi.com）以网络在线点击确认的方式进行签署，乙方完成点击，本协议立即生效。</p>
                            </td>
                        </tr>
					 </tbody>
				</table>
			</div>
		</div>

		<div class="clearfix"></div>
		<div class="fr " style="margin: 20px 0">
			<input type="checkbox" id="acceptContract" />
			<label for="acceptContract" class="pr">接受合同</label>
			<button class="bg-disable common-btn" id="paymentBtn">信用支付</button>
		</div>
		<div class="clearfix"></div>
	</div>
</div>

<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</div>

</body>
</html>