/**
 * 
 */
package com.qinfenqi.mall.redis;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Test;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2003 - 2014
 * @Company: iSoftStone Information Technology (Group) Co.,Ltd.
 * @bulid: 2015年4月16日 上午11:20:50
 * @author Chang Yuxin
 * @version 1.0
 */
public class TestMap extends RedisTest {

	/**
	 * redis操作Map
	 */
	@Test
	public void testMap() {
		// -----添加数据----------
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", "xinxin");
		map.put("age", "22");
		map.put("qq", "123456");
		jedis.hmset("user", map);
		// 取出user中的name，执行结果:[minxr]-->注意结果是一个泛型的List
		// 第一个参数是存入redis中map对象的key，后面跟的是放入map中的对象的key，后面的key可以跟多个，是可变参数
		List<String> rsmap = jedis.hmget("user", "name", "age", "qq");
		System.out.println(rsmap);

		// 删除map中的某个键值
		jedis.hdel("user", "age");
		System.out.println(jedis.hmget("user", "age")); // 因为删除了，所以返回的是null
		System.out.println(jedis.hlen("user")); // 返回key为user的键中存放的值的个数2
		System.out.println(jedis.exists("user"));// 是否存在key为user的记录 返回true
		System.out.println(jedis.hkeys("user"));// 返回map对象中的所有key
		System.out.println(jedis.hvals("user"));// 返回map对象中的所有value

		Iterator<String> iter = jedis.hkeys("user").iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			System.out.println(key + ":" + jedis.hmget("user", key));
		}
	}
}
