/**
 * 
 */
package com.qinfenqi.mall.redis;

import org.junit.Before;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2003 - 2014
 * @Company: iSoftStone Information Technology (Group) Co.,Ltd.
 * @bulid: 2015年4月16日 上午11:30:42
 * @author Chang Yuxin
 * @version 1.0
 */
public class RedisTest {
	Jedis jedis;

	@Before
	public void setup() {
		// 池基本配置
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxIdle(5);
		config.setTestOnBorrow(false);
		RedisClient client = new RedisClient("101.200.234.70", "Qinfenqi@2015", config);
		jedis = client.getJedis();
//		System.out.println(jedis);
	}
}
