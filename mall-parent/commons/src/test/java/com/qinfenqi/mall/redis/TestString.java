/**
 * 
 */
package com.qinfenqi.mall.redis;

import org.junit.Test;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2003 - 2014
 * @Company: iSoftStone Information Technology (Group) Co.,Ltd.
 * @bulid: 2015年4月16日 上午10:46:18
 * @author Chang Yuxin
 * @version 1.0
 */
public class TestString extends RedisTest {

	/**
	 * redis存储字符串
	 */
	@Test
	public void testString() {
		// -----添加数据----------
		//jedis.set("name", "xinxin");// 向key-->name中放入了value-->xinxin
		System.out.println(jedis.get("115-24"));// 执行结果：xinxin

		//jedis.append("name", " is my lover"); // 拼接
		//System.out.println(jedis.get("name"));

		//jedis.del("name"); // 删除某个键
		//System.out.println(jedis.get("name"));
		// 设置多个键值对
		//jedis.mset("name", "liuling", "age", "23", "qq", "476777389");
		//jedis.incr("age"); // 进行加1操作
		//System.out.println(jedis.get("name") + "-" + jedis.get("age") + "-" + jedis.get("qq"));

	}
}
