<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
	<div class="rhead">
		<div class="rpos">当前位置: 首页</div>
		<div class="clear"></div>
	</div>
	<div class="we-txt">
		<p>
			欢迎进入亲分期后台管理系统！<br>
			服务器操作系统：<span style="color:#0078ff;">${systemInfo.systemVersion}</span>&nbsp;&nbsp;&nbsp;&nbsp;<br>
                                剩余内存：<span style="color:#ff8400;">${systemInfo.systemFreeMemory}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                最大内存：<span style="color:#00ac41;">${systemInfo.systemTotalMemory}</span><br>
            Java虚拟机：<span style="color:#0078ff;">${systemInfo.jvmVersion}</span><br>
                               虚拟机内存：<span style="color:#0078ff;">${systemInfo.jvmTotalMemory}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                               虚拟机剩余内存：<span style="color:#ff8400;">${systemInfo.jvmFreeMemory}</span>&nbsp;&nbsp;&nbsp;&nbsp;
                               虚拟机最大内存 ：<span style="color:#00ac41;">${systemInfo.jvmMaxMemory}</span>               
        </p>
	</div>
</body>
</html>





