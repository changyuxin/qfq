<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    //加载信息列表
	$(function(){   
		// 分页处理
		$("[pageDiv]").pagination({
			pageNo: <s:property value="productQuery.pageNo" />,
			total: <s:property value="productQuery.total" />,
			callback: function(selectPage) {
				$("[name='productQuery.pageNo']").val(selectPage);
				queryProductList();;
			}
		});
		
		//信息量初始化 
		initCount();
		initAbovePagination();
	});
    
	//信息量初始化 
	function initCount() {

		var countHtml = "";
		var pageTotal = <s:property value="productQuery.pageTotal" />;
		if (pageTotal > 0) {
			countHtml = "<span>共" + pageTotal +"页</span>";
		}
		$(".pagin_go").html(countHtml);
		$("[name='productQuery.pageTotal']").val(pageTotal);
	}
	
	function initAbovePagination() {
		
		var pageNo = <s:property value="productQuery.pageNo" />;
		var pageTotal = <s:property value="productQuery.pageTotal" />;
		$("#above_page_no").html(pageNo);
		$("#above_page_total").html(pageTotal);
	}

</script>
<!--商品列表-->
<div class="list_content">
	<ul class="index-li fn-clear">
		<s:if test="prodList.size > 0">
			<s:iterator value="prodList" var="list">
		        <li class="js-product-item">
			        <div class="fn-text-center am-img">
					    <a href="products/<s:property value="productId"/>.html" target="_blank"><img width="180" height="180" src="<s:property value="coverImg"/>" /></a><em></em>
			        </div>                   
			        <p class="lis list_p_title" title="<s:property value="productName"/>">
			        	<s:if test="productName.length() > 36">
	            			<a href="products/<s:property value="productId"/>.html" target="_blank"><s:property value="productName.substring(0,36) + '...'"/></a>
	            		</s:if>
	            		<s:else>
	            			<a href="products/<s:property value="productId"/>.html" target="_blank"><s:property value="productName"/></a>
	            		</s:else>	
			        </p>
			        <p class="list_p_time">月供：<span style="font-size:20px; color:#F00">￥<s:property value="%{formatDouble(monthPay)}" /></span> x24期</p>
					<p class="list_p_money">售价：<s:property value="%{formatDouble(salePrice)}" /></p>
						
		        </li>
		    </s:iterator>
	    </s:if>
	    <s:else>
	    	 <!--没有搜索到商品-->
                <div class="error-page">
                    <div class="error-page-container">
                        <div class="error-page-main">
                            <img src="mall/images/error.png" width="137" height="200" class="error-page-img" />
                            <h3>对不起, 没找到相关的产品
                            </h3>
                            <div class="error-page-actions">
                                <div>
                                    <a href="/" class="error-page-a">点击返回首页</a>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
	    </s:else>
	</ul>
</div>

			