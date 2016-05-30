/**
 * 使选中区域显示分页
 * 
 * options{
 * 	pageNo: 页码
 * 	pageSize：页大小 (默认为10)
 *	total: 数据总数
 *	callback: 点击页码后执行方法
 * }
 */
$.fn.pagination = function(options) {
	
	// 默认属性
	var opt = {pageNo: 1, pageSize: 10};
	// 填充参数
	$.extend(opt, options);
	opt.pageTotal = Math.ceil(opt.total / opt.pageSize);
	
	// 分页DOM
	var container = $(this);
	// container.addClass("pagination");
	
	selectPage(opt.pageNo);
	
	// 上一页点击事件
	container.find(".pagin_prev").click(function() {
		opt.pageNo = opt.pageNo - 1;
		selectPage(opt.pageNo);
		opt.callback(opt.pageNo);
	});
	
	// 下一页点击事件
	container.find(".pagin_next").click( function() {
		opt.pageNo = opt.pageNo + 1;
		selectPage(opt.pageNo);
		opt.callback(opt.pageNo);
	});
	
	// 页码点击事件
	container.find("[pageNo]").click(function() {
		opt.pageNo = parseInt($(this).text());
		selectPage(opt.pageNo);
		opt.callback(opt.pageNo);
	});
	
	// 选择页码
	function selectPage(pageNo) {
		container.html("");
		// 上一页
		if (opt.pageNo > 1) {
			container.append('<a class="pagin_prev" href="javascript:void(0)">上一页</a>');
		} else {
			container.append('<a class="prev-disabled" href="javascript:void(0)">上一页</a>');
		}
		// 中间显示页码
		var start = pageNo - 5 <= 1 ? 1 : pageNo - 5;
		var end = start + 9;
		if (end >= opt.pageTotal) {
			end = opt.pageTotal;
			start = end - 9 <= 1 ? 1 : end - 9;
		}
		for (var i = start; i <= end; i++) {
			if (i == pageNo) {
				container.append('<a href="javascript:void(0)" class="current">' + i + '</a>');
			} else {
				container.append('<a pageNo href="javascript:void(0)">' + i + '</a>');
			}
		}
		if (opt.pageNo < opt.pageTotal) {
			container.append('<a class="pagin_next" href="javascript:void(0)">下一页</a>');
		} else {
			container.append('<a class="prev-disabled" href="javascript:void(0)">下一页</a>');
		}
	}
};