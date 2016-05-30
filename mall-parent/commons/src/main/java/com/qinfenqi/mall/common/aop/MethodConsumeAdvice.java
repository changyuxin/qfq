/**
 * 
 */
package com.qinfenqi.mall.common.aop;

import java.util.HashSet;
import java.util.Set;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * <p>Title:</p> 
 * <p>Description:  </p>
 * <p>Copyright: Copyright (c) 2003 - 2008 </p>
 * <p>Company: Run Technology Co.Ltd. Beijing </p>
 * <p>bulid: 2013-12-10 下午04:45:02 </p>
 * @author Chang Yuxin
 * @version 1.0 
 */
public class MethodConsumeAdvice implements MethodInterceptor {
	
	private static Set<String> FILTER_CLASS = new HashSet<String>();
	
	static{
		FILTER_CLASS.add("com.run.ares.common.service.impl.MemoryServiceImpl");
	}
	
	/**
	 * 记录每个Service方法的执行时间
	 * 
	 * @param invocation
	 * @return Object
	 */
	public Object invoke(MethodInvocation invocation) throws Throwable {
		/** 获取当前类的日志对象 */
		Log log = LogFactory.getLog(invocation.getThis().getClass());
		long start = System.currentTimeMillis();
		Object result = invocation.proceed();
		String className = invocation.getThis().getClass().getName();
		if(FILTER_CLASS.contains(className) == false){
			if (log.isInfoEnabled()) {
				log.info("[Method]: " + invocation.getMethod().getName() + ", Consume: "
						+ (System.currentTimeMillis() - start) + " ms ");
			}
		}
		return result;
	}
}
