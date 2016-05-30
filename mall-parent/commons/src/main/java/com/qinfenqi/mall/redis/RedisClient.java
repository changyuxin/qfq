/**
 * 
 */
package com.qinfenqi.mall.redis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.Pipeline;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年6月29日 下午2:51:11
 * @author Chang Yuxin
 * @version 1.0 
 */
public class RedisClient {
	private JedisPool jedisPool;
	private Jedis jedis;
	
	private String auth;
	/**
	 * 初始化Jedis连接池
	 * 
	 * @param ip
	 * @param password
	 */
	public RedisClient(String host, String auth, JedisPoolConfig jedisPoolConfig) {
		jedisPool = new JedisPool(jedisPoolConfig, host);
		jedis = jedisPool.getResource();
		this.auth = auth;
		jedis.auth(auth);
	}

	/**
	 * @return Jedis
	 */
	public Jedis getJedis() {
		Jedis j = jedisPool.getResource();
		j.auth(auth);
		return j;
	}

	/**
	 * @return Pipeline
	 */
	public Pipeline getPipeline(int num) {
		jedis.select(num);
		Pipeline pipe = jedis.pipelined();
		return pipe;
	}

	/**
	 * 释放jedis资源
	 * 
	 * @param jedis
	 */
	public void releaseConnection(final Jedis jedis) {
		if (jedis != null) {
			jedisPool.returnResourceObject(jedis);
		}
	}
}
