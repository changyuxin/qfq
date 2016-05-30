<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 商品订单</title>
	<script type="text/javascript">
		var type = '<s:property value="orderQuery.orderTypes" />';
		$(function(){
			var status = <s:property value="orderQuery.orderStatus" />;
			for(var i = 1; i <= status; i++){
				$("#" + i).removeClass("step-no").addClass("step-after");
			}
			if(status >= 5){
				$("#" + 5).removeClass("step-last").addClass("step-last-on");
			}
			var deliverCode = $("#deliverCode").val();
			if(deliverCode.length > 0){
				$("#deliver_info").html(loading(0)).load("<%=basePath%>order/order!deliverInfo.do", 
					{
						"orderQuery.deliverCode": $.trim(deliverCode),
						"orderQuery.deliverName": $.trim($("#deliverName").val())
					});
			} else {
				$("#deliver_info").html("暂无物流信息!");
			}
			if(type == 2){
				$("#instalment").hide();
				$("#steps").hide();
			}
		});
	</script>
</head>
<body>
<!-- Save for Web Slices (index.png) -->
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
<div class="mid">
    <div class="main-wrap">
    	<%@include file="center_leftnav.jsp"%>
    	<!--右侧-->
		<div class="apply-all">
            <div class="apply-wrap">
                <div class="apply-tt">
                    <!--
                    	一共有四个状态
				                    待支付  ----- 去支付
				                    待签订合同 ---- 签订合同
				                    待收货 -----确认收货
				                    待还款  ---- 去还款
				                    已完成
                    -->
                    <h3>订单号:<s:property value="orderQuery.orderCode" /> 
                    	<span class="pl">订单状态：</span>
                    	<span class="font-fc">
                    		<s:property value="%{@com.qinfenqi.mall.common.constant.OrderStatus@getName(orderQuery.orderStatus)}"/>
                    	</span>
					</h3>
                </div>
                <div class="apply-steps">
                    <!-- 购买人信息 -->
                    <div class="step-wrap nobt" style="padding-top: 20px;" id="steps">
                        <div class="clearfix"></div>
                        <!--两个状态条：一个是含有首付款，一个是没有首付款 还有一种是取消订单  取消的话是全部是空的-->
                        <ul class="status-step small-status">
                            <li>
                                <div class="step-name">提交订单</div>
                                <div class="step-img step-first" id=""></div>
                            </li>
                            <li>
                                <div class="step-name">签订合同</div>
                                <div class="step-img step-no" id="1">1</div>
                            </li>
                            <li>
                                <div class="step-name">待审核</div>
                                <div class="step-img step-no" id="2">2</div>
                                <div class="step-time"></div>
                            </li>
                            <li>
                                <div class="step-name">审核通过</div>
                                <div class="step-img step-no" id="3">3</div>
                                <div class="step-time"></div>
                            </li>
                            <li>
                                <div class="step-name">待收货</div>
                                <div class="step-img step-no" id="4">4</div>
                                 <div class="step-time"></div>
                            </li>
                            <li>
                                <div class="step-name">还款中</div>
                                <div class="step-img step-last" id="5">5</div>
                                <div class="step-time"></div>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="step-wrap">
                        <div class="step-tt">
                            <input type="hidden" id="deliverCode" value="<s:property value="orderQuery.deliverCode" />" />
                            <input type="hidden" id="deliverName" value="<s:property value="orderQuery.deliverName" />" />
                            <s:if test="orderQuery.deliverName != null && 'ziti'.equals(orderQuery.deliverName)">
                            	<strong>取货方式：</strong>
                            	（自提）
                            </s:if>
                            <s:else>
                            	<strong>物流信息：</strong>
                            	（<s:property value="%{@com.qinfenqi.mall.common.constant.Deliver@getName(orderQuery.deliverName)}"/> - <s:property value="orderQuery.deliverCode" />）
                            	<div class="step-ctent" id="deliver_info">
                        		</div>
                            </s:else>
                        </div>
                    </div>
                    <!--商品清单信息开始-->
                    <div class="step-wrap">
                        <div class="step-tt">
                            <strong>商品清单：</strong>
                        </div>
                        <div class="step-ctent buy-goods">
                            <table cellpadding="0" cellspacing="1" width="100%" border="0">
                                <tbody><tr>
                                    <th width="60%">商品</th>
                                    <th>价格</th>
                                    <th>数量</th>
                                    <!--<th>库存状态</th>-->
                                </tr>
                                <tr>
	                                <td class="goods-info">
	                                	<a href="products/<s:property value="orderQuery.productId" />.html" target="_blank">
	                                 		<div>
	                                 			<img src="<s:property value="orderQuery.productCovimg" />" />
	                                 		</div>
	                                        <p>
	                                        	<span><s:property value="orderQuery.productName" /></span>
	                                        </p>
	                                    </a>
	                                </td>    
	                                <td>￥<s:property value="orderQuery.productPrice" /></td>    
	                                <td><s:property value="orderQuery.quantity" /></td>    
	                             </tr>   
	                          </tbody>
                          </table>
                        </div>
                    </div>
                    <!--商品清单信息结束-->
                    <div class="step-wrap">
                        <div class="step-tt">
                            <strong>收货人信息：</strong>
                        </div>
                        <div class="step-ctent">
                            <div class="item-info">
                                <label for="realName">姓名：
                                </label>
                                <span for="realName"><s:property value="orderQuery.receiveName" /></span>
                            </div>
                            <div class="item-info">
                                <label for="addressId">地址：
                                </label>
                                <span for="idCard"><s:property value="orderQuery.receiveAddress" /></span>
                            </div>
                            <div class="item-info">
                                <label for="idCard">手机号码：
                                </label>
                                <span for="idCard"><s:property value="orderQuery.receiveMobile" /></span>
                            </div>
                        </div>
                    </div><!-- 购买人信息 -->
                    <!--分期方式信息开始-->
                    <div class="step-wrap " id="instalment">
                        <div class="step-tt">
                            <strong>分期情况：</strong>
                        </div>
                        <div class="step-ctent">
                            <div class="item-info ">
                                <label for="paypre">首付：</label>
                                <span>￥<s:property value="orderQuery.firstPay" /></span>
                            </div>
                            <div class="item-info  pay-info nomb">
                                <label for="paynum">分期月数：</label>
                                <span><s:property value="orderQuery.months" /> 个月</span>
                            </div>
                            <div class="item-info  pay-info nomb">
                                <label for="">本金：</label>
                                <span>￥${orderQuery.productPrice - orderQuery.firstPay }</span>
                            </div>
                            <div class="item-info  pay-info nomb">
                                <label for="">服务费：</label>
                                <span>￥${orderQuery.servicePay}</span>
                            </div>
                            <s:if test="getUserStyle() == 2">
                             <div class="item-info  pay-info nomb">
                                <label for="">财务费：</label>
                                <span>￥${orderQuery.financialPay}</span>
                            </div>
                            </s:if>
                            <div class="item-info  pay-info nomb">
                                <label for="yuegong ">月供：</label>
                                <span>￥${orderQuery.monthPay }</span>
                            </div>
                        </div>
                    </div>
                    <!--分期方式信息结束-->
                </div>
            </div>
		</div>
    </div>
</div>
<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body></html>