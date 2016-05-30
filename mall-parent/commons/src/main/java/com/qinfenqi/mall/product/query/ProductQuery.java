/**
 * 
 */
package com.qinfenqi.mall.product.query;

import com.qinfenqi.mall.product.bean.Product;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 下午2:41:17
 * @author Chang Yuxin
 * @version 1.0 
 */
public class ProductQuery extends Product{
	
	private String categoryIds;
	
	private String pcategoryName;
	
	private String categoryName;
	
	private String brandName;
	/** 月供 */
	private double monthPay ;
	/** 分期服务费率*/
	private double serviceRate;
	/** 服务费 */
	private double servicePay;
	/** 分期财务费率*/
	private double financialRate;
	/** 服务费 */
	private double financialPay;
	/** 本金 */
	private double principal;
	/** 首付 */
	private double firstPay;
	/** 还款月数 */
	private int months = 24;
	/** 最低价格 */
	private String minPrice;
	/** 最高价格 */
	private String maxPrice;
	/** 查询关键词 */
	private String keyword;
	
	
	/**
	 * @return the categoryIds
	 */
	public String getCategoryIds() {
		return categoryIds;
	}

	/**
	 * @param categoryIds the categoryIds to set
	 */
	public void setCategoryIds(String categoryIds) {
		this.categoryIds = categoryIds;
	}

	/**
	 * @return the pcategoryName
	 */
	public String getPcategoryName() {
		return pcategoryName;
	}

	/**
	 * @param pcategoryName the pcategoryName to set
	 */
	public void setPcategoryName(String pcategoryName) {
		this.pcategoryName = pcategoryName;
	}

	/**
	 * @return the categoryName
	 */
	public String getCategoryName() {
		return categoryName;
	}

	/**
	 * @param categoryName the categoryName to set
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	/**
	 * @return the brandName
	 */
	public String getBrandName() {
		return brandName;
	}

	/**
	 * @param brandName the brandName to set
	 */
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}


	/**
	 * @return the monthPay
	 */
	public double getMonthPay() {
		return monthPay;
	}

	/**
	 * @param monthPay the monthPay to set
	 */
	public void setMonthPay(double monthPay) {
		this.monthPay = monthPay;
	}

	/**
	 * @return the serviceRate
	 */
	public double getServiceRate() {
		return serviceRate;
	}

	/**
	 * @param serviceRate the serviceRate to set
	 */
	public void setServiceRate(double serviceRate) {
		this.serviceRate = serviceRate;
	}


	/**
	 * @return the servicePay
	 */
	public double getServicePay() {
		return servicePay;
	}

	/**
	 * @param servicePay the servicePay to set
	 */
	public void setServicePay(double servicePay) {
		this.servicePay = servicePay;
	}

	/**
	 * @return the financialPay
	 */
	public double getFinancialPay() {
		return financialPay;
	}

	/**
	 * @param financialPay the financialPay to set
	 */
	public void setFinancialPay(double financialPay) {
		this.financialPay = financialPay;
	}

	/**
	 * @return the financialRate
	 */
	public double getFinancialRate() {
		return financialRate;
	}

	/**
	 * @param financialRate the financialRate to set
	 */
	public void setFinancialRate(double financialRate) {
		this.financialRate = financialRate;
	}

	/**
	 * @return the principal
	 */
	public double getPrincipal() {
		return principal;
	}

	/**
	 * @param principal the principal to set
	 */
	public void setPrincipal(double principal) {
		this.principal = principal;
	}

	/**
	 * @return the firstPay
	 */
	public double getFirstPay() {
		return firstPay;
	}

	/**
	 * @param firstPay the firstPay to set
	 */
	public void setFirstPay(double firstPay) {
		this.firstPay = firstPay;
	}

	/**
	 * @return the months
	 */
	public int getMonths() {
		return months;
	}

	/**
	 * @param months the months to set
	 */
	public void setMonths(int months) {
		this.months = months;
	}

	/**
	 * @return the minPrice
	 */
	public String getMinPrice() {
		return minPrice;
	}

	/**
	 * @param minPrice the minPrice to set
	 */
	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}

	/**
	 * @return the maxPrice
	 */
	public String getMaxPrice() {
		return maxPrice;
	}

	/**
	 * @param maxPrice the maxPrice to set
	 */
	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}

	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * @param keyword the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}