/**
 * 
 */
package com.qinfenqi.mall.common.cache;

import java.util.HashMap;
import java.util.Map;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月21日 上午9:19:59
 * @author Chang Yuxin
 * @version 1.0
 */
public class Cache {

	/** 持久缓存 */
	private static Map<String, Object> CACHE_MAP = new HashMap<String, Object>();

	/**
	 * 放入缓存对象
	 * 
	 * @param key
	 * @param value
	 */
	public static void put(String key, Object value) {
		CACHE_MAP.put(key, value);
	}

	/**
	 * 取出缓存对象
	 * 
	 * @param key
	 * @return Object
	 */
	public static Object get(String key) {
		return CACHE_MAP.get(key);
	}

	/**
	 * 移除缓存对象
	 * 
	 * @param key
	 */
	public static void remove(String key) {
		CACHE_MAP.remove(key);
	}

	/**
	 * 是否存在缓存对象
	 * 
	 * @param key
	 */
	public static boolean containsKey(String key) {
		return CACHE_MAP.containsKey(key);
	}

	/**
	 * 
	 */
	public static void list() {
		System.out.println(CACHE_MAP);
	}
}
