package com.qinfenqi.mall.util;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * 属性文件取值工具类
 * 
 * @author WangDuo
 *
 */
@Component
public class PropertyUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext;
	
	/**
	 * 获取property文件中key对应的值
	 * 
	 * @param key
	 * @return 
	 */
	public static String get(String key) {
		return applicationContext.getMessage(key, null, null);
	}
	
	/**
	 * 当取不到值时，返回传入的默认值
	 * 
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static String get(String key, String defaultValue) {
		if (StringUtils.isEmpty(get(key))) {
			return defaultValue;
		}
		return get(key);
	}
	
	/**
	 * 获取property文件中key对应的值
	 * 
	 * @param key
	 * @return 
	 */
	public static int getInt(String key) {
		return Integer.parseInt(applicationContext.getMessage(key, null, null));
	}
	
	/**
	 * 获取property文件中key对应的值
	 * 
	 * @param key
	 * @return 
	 */
	public static int getInt(String key, int defaultValue) {
		if (StringUtils.isEmpty(get(key))) {
			return defaultValue;
		}
		return getInt(key);
	}
	
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		PropertyUtil.applicationContext = applicationContext;
	}
}
