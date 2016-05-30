<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<title>亲分期  - 我的帐单</title>
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
		<div class="my-Credit">
		    <p class="clearfix my-Credittitle">
		        <i class="inline-block"></i>
		        <span class="inline-block font1 font-size3">信用认证</span>
		    </p>
    <div class="mycredit-wrap">
        <p class="mycreditwrap-tit font-size2 font1 ">
            <span class="inline-block left">完成以下认证，<span class="font-red font-size4">10000元</span> 额度等你拿~</span>
					<span class="inline-block right">
						信用额度：<span class="font-red font-size4">￥${memberQuery.creditLimit }</span>
					</span>
        </p>
        <div class="mycredit-box">
            <p>
                <span class="font1 font-size3">基础认证 </span>
                <span class="font3">(审核通过即享额度：<span class="font-red font-size4">￥<s:property value="%{@com.qinfenqi.mall.util.PropertyUtil@get('credit_1')}"/></span>)</span>
            </p>
            <div class="mycreditbox-list clearfix">
                <div class="mycreditlist left mycreditlist-m1">
                    <i class="inline-block icon_1"></i>
                    <p class="inline-block">
                        <span class="block font-size2">身份学籍</span>
						<span class="block font-size0 font3">
							<s:if test="memberQuery.isIdOauth == 1">
								<i class="icon_not"></i>未认证
							</s:if>
							<s:if test="memberQuery.isIdOauth == 2">
								<i class="icon_commit"></i>审核中
							</s:if>
							<s:if test="memberQuery.isIdOauth == 3">
								<i class="icon_success"></i>通过
							</s:if>
							<s:if test="memberQuery.isIdOauth == 4">
								<i class="icon_fail"></i>未通过
								<img id="idOauthOpinion" src="../mall/images/message.gif" alt="message" 
									onmousemove="layer.tips('${memberQuery.idOauthOpinion}', '#idOauthOpinion')" onmouseout="layer.closeAll()"/>
							</s:if>
						</span>
                    </p>
                </div>
                <div class="mycreditlist left ">
                    <i class="inline-block icon_2"></i>
                    <p class="inline-block">
                        <span class="block font-size2">联系方式</span>
						<span class="block font-size0 font3">
							<s:if test="memberQuery.isContactOauth == 1">
								<i class="icon_not"></i>未认证
							</s:if>
							<s:if test="memberQuery.isContactOauth == 2">
								<i class="icon_commit"></i>审核中
							</s:if>
							<s:if test="memberQuery.isContactOauth == 3">
								<i class="icon_success"></i>通过
							</s:if>
							<s:if test="memberQuery.isContactOauth == 4">
								<i class="icon_fail"></i>未通过
								<img class="img-message" id="contactOauthOpinion" src="../mall/images/message.gif" alt="message" 
									onmousemove="layer.tips('${memberQuery.contactOauthOpinion}', '#contactOauthOpinion')" onmouseout="layer.closeAll()"/>
							</s:if>
						</span>
                    </p>
                </div>
                <div class="mycreditlist left ">
                     <img src="mall/images/none.png" class="icon_img mycreditlist_img" alt="银行卡绑定"/>
                     <p class="inline-block">
                        <span class="block font-size2"> 银行卡绑定</span>
						<span class="block font-size0 font3">
							<s:if test="memberQuery.isBkcardOauth == 1">
								<i class="icon_not"></i>未绑定
							</s:if>
							<s:if test="memberQuery.isBkcardOauth == 2">
								<i class="icon_commit"></i>审核中
							</s:if>
							<s:if test="memberQuery.isBkcardOauth == 3">
								<i class="icon_success"></i>通过
							</s:if>
							<s:if test="memberQuery.isBkcardOauth == 4">
								<i class="icon_fail"></i>未通过
								<img class="img-message" id="bkcardOauthOpinion" src="../mall/images/message.gif" alt="message" 
									onmousemove="layer.tips('${memberQuery.bkcardOauthOpinion}', '#bkcardOauthOpinion')" onmouseout="layer.closeAll()"/>
							</s:if>
						</span>
                    </p>
                </div>
                <div class="right mycreditlist-right">
                	<s:if test="memberQuery.isIdOauth != 3 || memberQuery.isContactOauth != 3 || memberQuery.isBkcardOauth != 3">
						<p class="font1"><a href="center/center!baseOauthPage.do" class="common-btn-blue">立即认证</a></p>
					</s:if>
					<s:if test="memberQuery.isIdOauth == 3 && memberQuery.isContactOauth == 3 && memberQuery.isBkcardOauth == 3">
						<p class="font1">获得额度：<span class="font-size3 font-red"> ￥<s:property value="%{@com.qinfenqi.mall.util.PropertyUtil@get('credit_1')}"/></span></p>
					</s:if>
                    
                </div>
            </div>
        </div>
        <div class="mycredit-box">
            <p>
                <span class="font1 font-size3 ">提升额度认证1 </span>
                <span class="font3">(最高可获得额度：<span class="font-red font-size4">￥<s:property value="%{@com.qinfenqi.mall.util.PropertyUtil@get('credit_2')}"/></span>)</span>
            </p>
            <div class="mycreditbox-list clearfix">
                <div class="mycreditlist left mycreditlist-m1">
                    <i class="inline-block icon_4"></i>
                    <p class="inline-block">
                        <span class="block font-size2">紧急联系方式</span>
						<span class="block font-size0 font3">
							<s:if test="memberQuery.isEcpOauth == 1">
								<i class="icon_not"></i>未认证
							</s:if>
							<s:if test="memberQuery.isEcpOauth == 2">
								<i class="icon_commit"></i>审核中
							</s:if>
							<s:if test="memberQuery.isEcpOauth == 3">
								<i class="icon_success"></i>通过
							</s:if>
							<s:if test="memberQuery.isEcpOauth == 4">
								<i class="icon_fail"></i>未通过
								<img class="img-message" id="ecpOauthOpinion" src="../mall/images/message.gif" alt="message" 
									onmousemove="layer.tips('${memberQuery.ecpOauthOpinion}', '#ecpOauthOpinion')" onmouseout="layer.closeAll()"/>
							</s:if>
                        </span>
                    </p>
                </div>
                <div class="mycreditlist left ">
                    <i class="inline-block icon_5"></i>
                    <p class="inline-block">
                        <span class="block font-size2">证件照认证</span>
						<span class="block font-size0 font3">
							<s:if test="memberQuery.isCardOauth == 1">
								<i class="icon_not"></i>未认证
							</s:if>
							<s:if test="memberQuery.isCardOauth == 2">
								<i class="icon_commit"></i>审核中
							</s:if>
							<s:if test="memberQuery.isCardOauth == 3">
								<i class="icon_success"></i>通过
							</s:if>
							<s:if test="memberQuery.isCardOauth == 4">
								<i class="icon_fail"></i>未通过
								<img class="img-message" id="cardOauthOpinion" src="../mall/images/message.gif" alt="message" 
									onmousemove="layer.tips('${memberQuery.cardOauthOpinion}', '#cardOauthOpinion')" onmouseout="layer.closeAll()"/>
							</s:if>
                        </span>
                    </p>
                </div>
                <div class="right mycreditlist-right">
					<s:if test="memberQuery.isIdOauth == 3 && memberQuery.isContactOauth == 3 && memberQuery.isBkcardOauth == 3">
					</s:if>
					<s:if test="memberQuery.isEcpOauth != 3 || memberQuery.isCardOauth != 3">
						<p class="font1"><a href="center/center!upgradeOauthPage1.do" class="common-btn-blue">立即认证</a></p>
					</s:if>
					<s:if test="memberQuery.isEcpOauth == 3 && memberQuery.isCardOauth == 3">
						<p class="font1">
							获得额度：<span class="font-size3 font-red"> ￥<s:property value="%{@com.qinfenqi.mall.util.PropertyUtil@get('credit_2')}"/></span>
						</p>
					</s:if>
                </div>
            </div>
        </div>
        <div class="mycredit-box">
            <p>
                <span class="font1 font-size3">提升额度认证2</span>
                <span class="font3">(最高可获得额度：<span class="font-red font-size4">￥<s:property value="%{@com.qinfenqi.mall.util.PropertyUtil@get('credit_3')}"/></span>)</span>
            </p>
            <div class="mycreditbox-list clearfix">
                <div class="mycreditlist left mycreditlist-m1">
                    <i class="inline-block icon_6"></i>
                    <p class="inline-block">
                    	<span class="block font-size2">银行卡流水认证</span>
						<span class="block font-size0 font3">
							<s:if test="memberQuery.isBkflowOauth == 1">
								<i class="icon_not"></i>未认证
							</s:if>
							<s:if test="memberQuery.isBkflowOauth == 2">
								<i class="icon_commit"></i>审核中
							</s:if>
							<s:if test="memberQuery.isBkflowOauth == 3">
								<i class="icon_success"></i>通过
							</s:if>
							<s:if test="memberQuery.isBkflowOauth == 4">
								<i class="icon_fail"></i>未通过
								<img class="img-message" id="bkflowOauthOpinion" src="../mall/images/message.gif" alt="message" 
									onmousemove="layer.tips('${memberQuery.bkflowOauthOpinion}', '#bkflowOauthOpinion')" onmouseout="layer.closeAll()"/>
							</s:if>
						</span>
                    </p>
                </div>
                <div class="right mycreditlist-right">
                
                	<s:if test="memberQuery.isEcpOauth == 3 && memberQuery.isCardOauth == 3">
						<s:if test="memberQuery.isBkflowOauth != 3">
							<p class="font1"><a href="center/center!bkflowOauthPage.do" class="common-btn-blue">立即认证</a></p>
						</s:if>
					</s:if>
					<s:if test="memberQuery.isBkflowOauth == 3">
						<p class="font1">
							获得额度：<span class="font-size3 font-red"> ￥<s:property value="%{@com.qinfenqi.mall.util.PropertyUtil@get('credit_3')}"/></span>
						</p>
					</s:if>
                </div>
            </div>
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