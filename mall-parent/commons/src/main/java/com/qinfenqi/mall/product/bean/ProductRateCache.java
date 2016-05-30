/**
 * 
 */
package com.qinfenqi.mall.product.bean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年7月20日 上午11:38:47
 * @author Chang Yuxin
 * @version 1.0
 */
public class ProductRateCache {
	private int productId;
	private String rateKey;
	private String rateValue;

	/**
	 * @param productId
	 * @param rateKey
	 * @param rateValue
	 */
	public ProductRateCache(int productId, String rateKey, String rateValue) {
		super();
		this.productId = productId;
		this.rateKey = rateKey;
		this.rateValue = rateValue;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId
	 *            the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * @return the rateKey
	 */
	public String getRateKey() {
		return rateKey;
	}

	/**
	 * @param rateKey
	 *            the rateKey to set
	 */
	public void setRateKey(String rateKey) {
		this.rateKey = rateKey;
	}

	/**
	 * @return the rateValue
	 */
	public String getRateValue() {
		return rateValue;
	}

	/**
	 * @param rateValue
	 *            the rateValue to set
	 */
	public void setRateValue(String rateValue) {
		this.rateValue = rateValue;
	}

}
