<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/index.css" rel="stylesheet" type="text/css" />
	<title>亲分期 -大学生最喜爱的分期购物商城之一【分期电商平台 - qinfenqi.com】</title>
	<script type="text/javascript">
		$(function(){
			$("div[product]").each(function(){
				var id = $(this).attr("id").split("_");
				$(this).load("index/index!getProductList.do", {"productQuery.categoryId": id[1], "timestamp" : new Date().getTime()});		
			});
			$(window).scroll(function(){
				if($(window).scrollTop() > 100){
					$("#side-bar .gotop").fadeIn();	
				}
				else{
					$("#side-bar .gotop").hide();
				}
			});
			$("#side-bar .gotop").click(function(){
				$('html,body').animate({'scrollTop':0},500);
			});
		});
		
		function showStatement(){
			layer.open({
			    type: 2,
			    title: false,
			    shadeClose: true,
			    shade: 0.3,
			    area: ["800px", "600px"],
			    content: "index/statement.html"
			});
		}
		function headClose(){
			$("#headNotice").hide();
		}
	</script>
</head>
<body>
<!-- Save for Web Slices (index.png) -->
<div class="head-notice" id="headNotice">
	<a rel="nofollow" href="javascript:;" class="notice_a">
		友情提示! 亲分期商城不会以任何理由向您索取个人信息, 也不会向您收取签合同的佣金, 更不会作为套现中介为用户提供产品回购通道, 如发现以上行为，请及时联系亲分期客服。400-628-5159！
	</a>
	<p class="head_close" onclick="headClose()">x</p>
</div>
<div class="head">
	<%@include file="../common/top.jsp"%>
</div>
<!--导航-->
<div class="nav_class">
	<%@include file="../common/nav.jsp"%>
</div>
<!--焦点轮转-->
<div id="main_focus">
	<div class="focus" id="focus">
		<div id="focus_m" class="focus_m">
			<ul>
				<s:iterator value="focusImages" id="focusImage">
                	<a href="<s:property value="#focusImage.focusLink"/>" hidefocus="true">
                   		<li style="background:url(<s:property value="#focusImage.imageUrl"/>) center 0 no-repeat <s:property value="#focusImage.bgColor"/>;"></li>
                   	</a>
				</s:iterator>
			</ul>
		</div>
			<a href="javascript:;" class="focus_l" id="focus_l" hidefocus="true" title="上一张"><b></b><span></span></a>
			<a href="javascript:;" class="focus_r" id="focus_r" hidefocus="true" title="下一张"><b></b><span></span></a>
	</div>
</div>	
<!--main-->
<div class="mid">
    <!--左侧导航-->
    <div id="left_nav" class="nav_div_left">
    	<ul class="nav_ohter">
			<s:iterator value="categorys" id="category">
				<li>
					<a href="categories/<s:property value="#category.categoryId"/>.html" target="_blank">
						<img src="<s:property value="#category.categoryImg"/>" alt="<s:property value="#category.categoryName"/>"/>
						<span><s:property value="#category.categoryName"/></span>
					</a>
				</li>
			</s:iterator>  		
		</ul>
    </div>
    <!--左侧导航结束-->    
    <!--右侧图片-->
    <div id="text">
    	<a href="http://www.qinfenqi.com/products/1397.html"  target="_blank">
    		<img src="mall/images/text.png" class="text_img" alt="商品图片"/>
    	</a>
    </div>
    <!--右侧图结束片-->
	<!--右侧图结束片-->
	<div id="main_advantage">
		<ul class="advantage_ul">
        	<li>
	        	<a href="help/zeropay.html" target="_blank">
	        		<i class="advantage_bg1"></i>
	            	<p class="advantage_p_title">"0"首付</p>
	            	<p class="advantage_p_other">大学生专享<br/>"0"首付分期商城</p>
	            </a>
            </li>
            <li>
            	<a href="help/audit.html" target="_blank">
            		<i class="advantage_bg2"></i>
            		<p class="advantage_p_title">线上认证</p>
            		<p class="advantage_p_other">凭学生证和身份证即可办理</p>
            	</a>
            </li>
            <li>
            	<a href="help/promise.html" target="_blank">
            		<i class="advantage_bg3"></i>
            		<p class="advantage_p_title">品质保证</p>
            		<p class="advantage_p_other">品牌保证<br/>100%正品行货</p>
            	</a>
            </li>
            <li>
            	<a href="help/payment.html" target="_blank">
            		<i class="advantage_bg4"></i>
            		<p class="advantage_p_title">轻松还款</p>
            		<p class="advantage_p_other">在线随时还款<br/>提前还款免服务费</p>
            	</a>
            </li>
            <li>
            	<a href="javascript:;">
            		<i class="advantage_bg5"></i>
	            	<p class="advantage_p_title">会员专享</p>
	            	<p class="advantage_p_other">分期成功即可享有会员惊喜</p>
            	</a>
           </li>
        </ul>
	</div>
    <!--j精品列表-->
	<div id="jp_img1">
		<a href="http://www.qinfenqi.com/products/1397.html" target="_blank">
			<img src="mall/images/jp_1.png" alt="精品1" /> <!--300*380-->
		</a>
	</div>
	<div id="jp_img2">
		<a href="channel/free.html" target="_blank">
			<img src="mall/images/freeproduct/jp_2.png" alt="精品2" />  <!--600*200-->
		</a>
	</div>
	<div id="jp_img3">
		<a href="http://www.qinfenqi.com/products/1059.html" target="_blank">
			<img src="mall/images/jp_3.png" alt="精品3" /> <!--300*200-->
		</a>
	</div>
	<div id="jp_img4">
		<a href="http://www.qinfenqi.com/products/1050.html" target="_blank">
			<img src="mall/images/jp_4.png" alt="精品4" /> <!--300*200-->
		</a>
	</div>
	<div id="jp_img5">
		<a href="http://www.qinfenqi.com/products/1085.html" target="_blank">
			<img src="mall/images/jp_5.png" alt="精品5" /> <!--600*200-->
		</a>
	</div>   
    <!--精品结束-->
	
    <!--1F商品列表-->
    <s:iterator value="categorys" id="category">
	    <s:if test="#category.categoryListImg != null" >
			<div id="main_<s:property value="#category.categoryId"/>" class="main_floor">
				<img src="<s:property value="#category.categoryListImg"/>" alt="<s:property value="#category.categoryName"/>" />
				<p class="floor_more"><a href="categories/<s:property value="#category.categoryId"/>.html" class="floor_more_a">更多>></a></p>
			</div>
		    <div id="list_<s:property value="#category.categoryId"/>" product class="list_f">
				
			</div>
		</s:if>
	</s:iterator>

	<div id="pinpai">
		<%@include file="../common/brand.jsp"%>
	</div>   
</div>	

<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>
<!-- 右下角悬浮 -->
<div id="side-bar" class="side-pannel side-bar">
	<a href="javascript:;" class="gotop" style="display:none;"><s class="g-icon-top"></s></a>
	<a href="javascript:;" class="text"><s class="g-icon-qq1"></s>
  		<span>正品承诺</span>
  		<b>
			<p class="promise_p_title">
			<img src="../mall/images/text_1.png" width="24" height="24" class="promise_img" alt="正品承诺" />正品承诺</p>
			<p class="promise_p_normal">100%正品国行，真不二价，假一赔二</p>
			<p class="promise_p_normal">如发现非正品国行（如港行，翻新机，其他水货等）额外奖励1000元现金</p>
		</b>
	</a>
  	<a href="javascript:;" class="qr"><s class="g-icon-qr1"></s><i></i></a>
  	<a href="javascript:showStatement();" class="text survey"><s class="g-icon-survey1"></s><span>谨防欺诈</span></a>
</div>
<!-- End Save for Web Slices -->
<script src="<%=basePath%>js/focus.run.js" type="text/javascript"></script>
</body>
</html>