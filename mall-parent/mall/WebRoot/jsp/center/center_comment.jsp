<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@include file="../common/head.jsp"%>
	<link href="<%=basePath%>css/center.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.md5.js" ></script>
	
	<style type="text/css">
		body 
		{
			background:#FFF
		}
	</style>
	<title>亲分期  - 商品订单</title>
	<script type="text/javascript">
		function checkComment()
		{
			var content = document.getElementById("content").value;
			
			if(content.length == 0){
				showMsg("#checkcontent","请输入内容评价！");
				content.focus();
				return false;
			}
			document.getElementById("uploadForm").submit();
		}
		
		/** Enter键提交 */
		$(document).keyup(function(event){
			var currKey = 0, e = e || event;
			if (e.keyCode == 13) {
				updatePass();
			}
		});
		
		function showMsg(id, msg){
			$(id).html(msg);
		}
	</script>
	<style>
		body{font-size:12px;}
		ul{padding:0;margin:0;}
		.star_rating {list-style:none;margin:-1px 0 0 -1px; padding:0; width:60px; height:12px; position:relative; background:url(../mall/images/star1.jpg) 0 0 repeat-x; overflow:hidden;font-size:0;}
		.star_rating li{padding:0;margin:0;float:left;}
		.star_rating li a{display:block;width:14px;height:12px;text-decoration:none;text-indent:-9000px;z-index:20;position:absolute;padding:0;margin:0;}
		.star_rating li a:hover{background:url(../mall/images/star.jpg) 0 12px;z-index:2;left:0;}
		.star_rating a.one_star{left:0;}
		.star_rating a.one_star:hover{width:12px;}
		.star_rating a.two_stars{left:12px;}
		.star_rating a.two_stars:hover{width:24px;}
		.star_rating a.three_stars{left:24px;}
		.star_rating a.three_stars:hover{width:36px;}
		.star_rating a.four_stars{left:36px;}
		.star_rating a.four_stars:hover{width:48px;}
		.star_rating a.five_stars{left:48px;}
		.star_rating a.five_stars:hover{width:60px;}
		.star_rating li.current_rating{background:url(../mall/images/star.jpg) 0 24px;position:absolute;height:12px;display:block;text-indent:-9000px;z-index:1;left:0;}
		#www_zzjs_net{margin:0 0 20px 20px;}
		#www_zzjs_net p{margin:20px 0 5px 0;}
		.pos_abs1
		{
			position:absolute;
			left:350px;
			top:150px
		}
		.pos_abs2
		{
			position:absolute;
			left:550px;
			top:120px
		}
		.pos_abs3
		{
			position:absolute;
			left:350px;
			top:250px
		}
		.pos_abs4
		{
			position:absolute;
			left:550px;
			top:280px
		}
		.pos_abs5
		{
			position:absolute;
			left:350px;
			top:280px
		}
		.pos_abs6
		{
			position:absolute;
			left:550px;
			top:310px
		}
		.pos_abs7
		{
			position:absolute;
			left:350px;
			top:310px
		}
		.pos_abs8
		{
			position:absolute;
			left:550px;
			top:340px
		}
		.pos_abs9
		{
			position:absolute;
			left:350px;
			top:340px
		}
		.pos_abs10
		{
			position:absolute;
			left:550px;
			top:370px
		}
		.pos_abs11
		{
			position:absolute;
			left:350px;
			top:370px
		}
		.pos_abs12
		{
			position:absolute;
			left:550px;
			top:400px
		}
		.pos_abs13
		{
			position:absolute;
			left:250px;
			top:200px
		}
		
	</style>
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
        <div class="user-right mu-ctxt">
			<div class="user-right-head">
            	<h2>添加评论</h2>
            </div>
            <div class="user-right-content">
 				<form id="uploadForm" method="post" enctype="multipart/form-data" action="center/center!uploadCommentImg.do">
					<div >
						<input type="hidden" class="form-control" value="<s:property value="getCurrentUser().userName" />" id="comment.username" name="comment.username"/>
						<input type="hidden" class="form-control" value="<s:property value="orderQuery.productId" />" id="comment.productId" name="comment.productId"/>
						<input type="hidden" class="form-control" value="5" id="comment.satisify" name="comment.satisify"/>
			        </div>
			        <div class="pos_abs1"><label  >评论内容</label></div>
			        <div class="pos_abs2">
				    	<textarea class="pos_abs" id="content" name="comment.content" style="width:400px;height:80px;"></textarea>
						<strong id="checkcontent" class="check-text"></strong>
					</div>
			        <div class="pos_abs3"><label >上传图片</label></div>
					<div class="pos_abs4">	
						<input type="file" id="upload" name="upload" />
			        </div>
			        <div class="pos_abs5"><label >上传图片</label></div>
					<div class="pos_abs6">	
						<input  type="file" size="20" id="upload" name="upload" />
			        </div>
			        <div class="pos_abs7"><label >上传图片</label></div>
					<div class="pos_abs8">
						<input type="file" size="20" id="upload" name="upload" />
			        </div>
			        <div class="pos_abs9"><label >上传图片</label></div>
					<div class="pos_abs10">
						<input type="file" size="20" id="upload" name="upload" />
			        </div>
			        <div class="pos_abs11"><label >上传图片</label></div>
					<div class="pos_abs12">
						<input type="file" size="20" id="upload" name="upload" />
			        </div>
					<div class="pos_abs13">
						<input class="pos_abs3" type="button" value="添加评论" class="btn2" onclick = "checkComment();" />
					</div>
					 <div id="www_zzjs_net" star_width="14">
						  <p>服务</p>
						  <ul class="star_rating">
						   <li style="display:none;">
						    <input type="text" name="comment.serviceStar" value="" />
						   </li>
						   <li class="current_rating">default level</li>
						   <li><a href="#" title="1 of 5 stars" class="one_star">1</a></li>
						   <li><a href="#" title="2 of 5 stars" class="two_stars">2</a></li>
						   <li><a href="#" title="3 of 5 stars" class="three_stars">3</a></li>
						   <li><a href="#" title="4 of 5 stars" class="four_stars">4</a></li>
						   <li><a href="#" title="5 of 5 stars" class="five_stars">5</a></li>
						  </ul>
						  <p>价格</p>
						  <ul class="star_rating">
						   <li style="display:none;">
						    <input type="text" name="comment.priceStar" value="" />
						   </li>
						   <li class="current_rating">default level</li>
						   <li><a href="#" title="1 of 5 stars" class="one_star">1</a></li>
						   <li><a href="#" title="2 of 5 stars" class="two_stars">2</a></li>
						   <li><a href="#" title="3 of 5 stars" class="three_stars">3</a></li>
						   <li><a href="#" title="4 of 5 stars" class="four_stars">4</a></li>
						   <li><a href="#" title="5 of 5 stars" class="five_stars">5</a></li>
						  </ul>
						  <p>质量</p>
						  <ul class="star_rating">
						   <li style="display:none;">
						    <input type="text" name="comment.qualityStar" value="" />
						   </li>
						   <li class="current_rating">default level</li>
						   <li><a href="#" title="1 of 5 stars" class="one_star">1</a></li>
						   <li><a href="#" title="2 of 5 stars" class="two_stars">2</a></li>
						   <li><a href="#" title="3 of 5 stars" class="three_stars">3</a></li>
						   <li><a href="#" title="4 of 5 stars" class="four_stars">4</a></li>
						   <li><a href="#" title="5 of 5 stars" class="five_stars">5</a></li>
						  </ul>
					</div>
				</form>
				<script type="text/javascript">

				function __start(){
				 var initialize_width=0;
				 if(document.getElelmentById){return false};
				 if(document.getElementsByTagName==null){return false;}
				 var startLevelObj=document.getElementById("www_zzjs_net")
				 if(startLevelObj==null){return false;}
				 initialize_width=parseInt(startLevelObj.getAttribute("star_width"),10);
				 if(isNaN(initialize_width) || initialize_width==0){return false;}
				 var ul_obj=startLevelObj.getElementsByTagName("ul");
				 if(ul_obj.length<1){return false;}
				 var length=ul_obj.length;
				 var li_length=0;
				 var a_length=0;
				 var li_obj=null;
				 var a_obj=null;
				 var defaultInputObj=null;
				 var defaultValue=null;
				 for(var i=0;i<length;i++){
				  li_obj=ul_obj[i].getElementsByTagName("li");
				  li_length=li_obj.length;
				  if(li_length<0){return false;}
				  //获取默认值
				  defaultInputObj=li_obj[0].getElementsByTagName("input");if(!defaultInputObj){return false;}
				  defaultValue=parseInt(defaultInputObj[0].value,10);
				  if(!isNaN(defaultValue) && defaultValue!=0){
				   //alert("有初始值!");
				   //li_obj[1].style.width=initialize_width*defaultValue+"px";
				   //defaultValue=0;
				  }
				  for(var j=0;j<li_length;j++){
				   a_obj=li_obj[j].getElementsByTagName("a");
				   if(a_obj.length<1){continue;}
				   if(a_obj[0].className.indexOf("star")>0){
				    a_obj[0].onclick=function(){
				     return give_value(this);
				    }
				    a_obj[0].onfocus=function(){
				     this.blur();
				    }
				   }
				  }
				 }
				}//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
				function give_value(obj){
				 var status=true;
				 var parent_obj=obj.parentNode;
				 var i=0;
				 while(status){
				  i++;
				  if(parent_obj.nodeName=="UL"){break;}
				  parent_obj=parent_obj.parentNode;
				  if(i>1000){break;}//防止找不到ul发生死循环
				 }
				 var hidden_input=parent_obj.getElementsByTagName("input")[0];
				 if(hidden_input.length<1){/*alert("sorry?\nprogram error!")*/;}
				 var txt=obj.firstChild.nodeValue;//确保不能存在空格哦，因为这里用的firstChild
				 if(isNaN(parseInt(txt,10))){/*alert('level error!')*/;return false;}
				 hidden_input.setAttribute("value",txt.toString());
				 //固定选中状态,先找到初始化颜色那个li
				 var current_li=parent_obj.getElementsByTagName("li");
				 var length=current_li.length;
				 var ok_li_obj=null;
				 for(var i=0;i<length;i++){
				  if(current_li[i].className.indexOf("current_rating")>=0){
				   ok_li_obj=current_li[i];break;//找到
				  }
				 }
				 __current_width=txt*14;
				 ok_li_obj.style.width=__current_width+"px";
				 return false;
				}//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
				__start();

				</script>
			</div>
		</div>
    </div>
</div>
<!--底部-->
<footer>
	<%@include file="../common/foot.jsp"%>
</footer>

</body>
</html>