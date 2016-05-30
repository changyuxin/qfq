/**
 * 
 */
package com.qinfenqi.mall.redis;

import org.junit.Test;

import redis.clients.jedis.Jedis;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2003 - 2014
 * @Company: iSoftStone Information Technology (Group) Co.,Ltd.
 * @bulid: 2015年4月16日 上午11:27:57
 * @author Chang Yuxin
 * @version 1.0
 */
public class TestSet extends RedisTest{
	Jedis jedis;

	/**
	 * jedis操作Set
	 */
	@Test
	public void testSet() {
		// 添加
		jedis.sadd("user", "liuling");
		jedis.sadd("user", "xinxin");
		jedis.sadd("user", "ling");
		jedis.sadd("user", "zhangxinxin");
		jedis.sadd("user", "who");
		// 移除noname
		jedis.srem("user", "who");
		System.out.println(jedis.smembers("user"));// 获取所有加入的value
		System.out.println(jedis.sismember("user", "who"));// 判断 who 是否是user集合的元素
		System.out.println(jedis.srandmember("user"));
		System.out.println(jedis.scard("user"));// 返回集合的元素个数
	}
}
