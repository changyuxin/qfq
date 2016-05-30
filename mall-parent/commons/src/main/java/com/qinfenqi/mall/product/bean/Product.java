/**
 * 
 */
package com.qinfenqi.mall.product.bean;

import java.util.Date;

import com.qinfenqi.mall.common.base.BaseBean;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月28日 下午2:35:01
 * @author Chang Yuxin
 * @version 1.0
 */
public class Product extends BaseBean implements Comparable<Product>{

	private int productId;
	private int pcategoryId;
	private int productPid ;
	private int brandId;
	private int categoryId;
	private String productName;
	private int colorId;
	private int specId;
	private double marketPrice;
	private double salePrice;
	private double costPrice;
	private int viewCount;
	private int saleCount;
	private int stockCount;
	private int alertInventory;
	private Date createTime;
	private Date expireTime;
	private int onSale;
	private int isRecommend;
	private int isSpecial;
	private int isHotsale;
	private int isNewproduct;
	private int score;
	private String shareContent;
	private int lackRemind;
	private double liRun;
	
	
	private int productCode;
	private String productDesc;
	private String pageTitle;
	private String pageKeywords;
	private String pageDescription;
	private String detailImg;
	private String listImg;
	private String minImg;
	private String coverImg;
	private int weight;
	private String unit;
	private String productImgs;
	private String productImgDesc;
	private int isLimitTime;
	private Date limitTime;
	private double secKillPrice;
	
	private int exendedPrice;
	private int exendedMeasure;
	
	private int isIndex;
	private int indexOrder;
	
	
	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}


	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * @return the productPid
	 */
	public int getProductPid() {
		return productPid;
	}


	/**
	 * @param productPid the productPid to set
	 */
	public void setProductPid(int productPid) {
		this.productPid = productPid;
	}


	/**
	 * @return the pcategoryId
	 */
	public int getPcategoryId() {
		return pcategoryId;
	}


	/**
	 * @param pcategoryId the pcategoryId to set
	 */
	public void setPcategoryId(int pcategoryId) {
		this.pcategoryId = pcategoryId;
	}


	/**
	 * @return the brandId
	 */
	public int getBrandId() {
		return brandId;
	}


	/**
	 * @param brandId the brandId to set
	 */
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}


	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}


	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}


	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}


	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the colorId
	 */
	public int getColorId() {
		return colorId;
	}


	/**
	 * @param colorId the colorId to set
	 */
	public void setColorId(int colorId) {
		this.colorId = colorId;
	}

	/**
	 * @return the specId
	 */
	public int getSpecId() {
		return specId;
	}


	/**
	 * @param specId the specId to set
	 */
	public void setSpecId(int specId) {
		this.specId = specId;
	}


	/**
	 * @return the marketPrice
	 */
	public double getMarketPrice() {
		return marketPrice;
	}


	/**
	 * @param marketPrice the marketPrice to set
	 */
	public void setMarketPrice(double marketPrice) {
		this.marketPrice = marketPrice;
	}


	/**
	 * @return the salePrice
	 */
	public double getSalePrice() {
		return salePrice;
	}


	/**
	 * @param salePrice the salePrice to set
	 */
	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}


	/**
	 * @return the costPrice
	 */
	public double getCostPrice() {
		return costPrice;
	}


	/**
	 * @param costPrice the costPrice to set
	 */
	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}


	/**
	 * @return the viewCount
	 */
	public int getViewCount() {
		return viewCount;
	}


	/**
	 * @param viewCount the viewCount to set
	 */
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}


	/**
	 * @return the saleCount
	 */
	public int getSaleCount() {
		return saleCount;
	}


	/**
	 * @param saleCount the saleCount to set
	 */
	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}


	/**
	 * @return the stockCount
	 */
	public int getStockCount() {
		return stockCount;
	}


	/**
	 * @param stockCount the stockCount to set
	 */
	public void setStockCount(int stockCount) {
		this.stockCount = stockCount;
	}


	/**
	 * @return the alertInventory
	 */
	public int getAlertInventory() {
		return alertInventory;
	}


	/**
	 * @param alertInventory the alertInventory to set
	 */
	public void setAlertInventory(int alertInventory) {
		this.alertInventory = alertInventory;
	}


	/**
	 * @return the createTime
	 */
	public Date getCreateTime() {
		return createTime;
	}


	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	/**
	 * @return the expireTime
	 */
	public Date getExpireTime() {
		return expireTime;
	}


	/**
	 * @param expireTime the expireTime to set
	 */
	public void setExpireTime(Date expireTime) {
		this.expireTime = expireTime;
	}


	/**
	 * @return the onSale
	 */
	public int getOnSale() {
		return onSale;
	}


	/**
	 * @param onSale the onSale to set
	 */
	public void setOnSale(int onSale) {
		this.onSale = onSale;
	}


	/**
	 * @return the isRecommend
	 */
	public int getIsRecommend() {
		return isRecommend;
	}


	/**
	 * @param isRecommend the isRecommend to set
	 */
	public void setIsRecommend(int isRecommend) {
		this.isRecommend = isRecommend;
	}


	/**
	 * @return the isSpecial
	 */
	public int getIsSpecial() {
		return isSpecial;
	}


	/**
	 * @param isSpecial the isSpecial to set
	 */
	public void setIsSpecial(int isSpecial) {
		this.isSpecial = isSpecial;
	}


	/**
	 * @return the isHotsale
	 */
	public int getIsHotsale() {
		return isHotsale;
	}


	/**
	 * @param isHotsale the isHotsale to set
	 */
	public void setIsHotsale(int isHotsale) {
		this.isHotsale = isHotsale;
	}


	/**
	 * @return the isNewproduct
	 */
	public int getIsNewproduct() {
		return isNewproduct;
	}


	/**
	 * @param isNewproduct the isNewproduct to set
	 */
	public void setIsNewproduct(int isNewproduct) {
		this.isNewproduct = isNewproduct;
	}


	/**
	 * @return the score
	 */
	public int getScore() {
		return score;
	}


	/**
	 * @param score the score to set
	 */
	public void setScore(int score) {
		this.score = score;
	}


	/**
	 * @return the shareContent
	 */
	public String getShareContent() {
		return shareContent;
	}


	/**
	 * @param shareContent the shareContent to set
	 */
	public void setShareContent(String shareContent) {
		this.shareContent = shareContent;
	}


	/**
	 * @return the lackRemind
	 */
	public int getLackRemind() {
		return lackRemind;
	}


	/**
	 * @param lackRemind the lackRemind to set
	 */
	public void setLackRemind(int lackRemind) {
		this.lackRemind = lackRemind;
	}


	/**
	 * @return the liRun
	 */
	public double getLiRun() {
		return liRun;
	}


	/**
	 * @param liRun the liRun to set
	 */
	public void setLiRun(double liRun) {
		this.liRun = liRun;
	}


	/**
	 * @return the productCode
	 */
	public int getProductCode() {
		return productCode;
	}


	/**
	 * @param productCode the productCode to set
	 */
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}


	/**
	 * @return the productDesc
	 */
	public String getProductDesc() {
		return productDesc;
	}


	/**
	 * @param productDesc the productDesc to set
	 */
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}


	/**
	 * @return the pageTitle
	 */
	public String getPageTitle() {
		return pageTitle;
	}


	/**
	 * @param pageTitle the pageTitle to set
	 */
	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}


	/**
	 * @return the pageKeywords
	 */
	public String getPageKeywords() {
		return pageKeywords;
	}


	/**
	 * @param pageKeywords the pageKeywords to set
	 */
	public void setPageKeywords(String pageKeywords) {
		this.pageKeywords = pageKeywords;
	}


	/**
	 * @return the pageDescription
	 */
	public String getPageDescription() {
		return pageDescription;
	}


	/**
	 * @param pageDescription the pageDescription to set
	 */
	public void setPageDescription(String pageDescription) {
		this.pageDescription = pageDescription;
	}


	/**
	 * @return the detailImg
	 */
	public String getDetailImg() {
		return detailImg;
	}


	/**
	 * @param detailImg the detailImg to set
	 */
	public void setDetailImg(String detailImg) {
		this.detailImg = detailImg;
	}


	/**
	 * @return the listImg
	 */
	public String getListImg() {
		return listImg;
	}


	/**
	 * @param listImg the listImg to set
	 */
	public void setListImg(String listImg) {
		this.listImg = listImg;
	}


	/**
	 * @return the minImg
	 */
	public String getMinImg() {
		return minImg;
	}


	/**
	 * @param minImg the minImg to set
	 */
	public void setMinImg(String minImg) {
		this.minImg = minImg;
	}


	/**
	 * @return the coverImg
	 */
	public String getCoverImg() {
		return coverImg;
	}


	/**
	 * @param coverImg the coverImg to set
	 */
	public void setCoverImg(String coverImg) {
		this.coverImg = coverImg;
	}


	/**
	 * @return the weight
	 */
	public int getWeight() {
		return weight;
	}


	/**
	 * @param weight the weight to set
	 */
	public void setWeight(int weight) {
		this.weight = weight;
	}


	/**
	 * @return the unit
	 */
	public String getUnit() {
		return unit;
	}


	/**
	 * @param unit the unit to set
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}


	/**
	 * @return the productImgs
	 */
	public String getProductImgs() {
		return productImgs;
	}


	/**
	 * @param productImgs the productImgs to set
	 */
	public void setProductImgs(String productImgs) {
		this.productImgs = productImgs;
	}


	/**
	 * @return the productImgDesc
	 */
	public String getProductImgDesc() {
		return productImgDesc;
	}


	/**
	 * @param productImgDesc the productImgDesc to set
	 */
	public void setProductImgDesc(String productImgDesc) {
		this.productImgDesc = productImgDesc;
	}


	/**
	 * @return the isLimitTime
	 */
	public int getIsLimitTime() {
		return isLimitTime;
	}


	/**
	 * @param isLimitTime the isLimitTime to set
	 */
	public void setIsLimitTime(int isLimitTime) {
		this.isLimitTime = isLimitTime;
	}


	/**
	 * @return the limitTime
	 */
	public Date getLimitTime() {
		return limitTime;
	}


	/**
	 * @param limitTime the limitTime to set
	 */
	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}


	/**
	 * @return the secKillPrice
	 */
	public double getSecKillPrice() {
		return secKillPrice;
	}


	/**
	 * @param secKillPrice the secKillPrice to set
	 */
	public void setSecKillPrice(double secKillPrice) {
		this.secKillPrice = secKillPrice;
	}
	
	/**
	 * @return the exendedPrice
	 */
	public int getExendedPrice() {
		return exendedPrice;
	}


	/**
	 * @param exendedPrice the exendedPrice to set
	 */
	public void setExendedPrice(int exendedPrice) {
		this.exendedPrice = exendedPrice;
	}


	/**
	 * @return the exendedMeasure
	 */
	public int getExendedMeasure() {
		return exendedMeasure;
	}


	/**
	 * @param exendedMeasure the exendedMeasure to set
	 */
	public void setExendedMeasure(int exendedMeasure) {
		this.exendedMeasure = exendedMeasure;
	}


	/**
	 * @return the isIndex
	 */
	public int getIsIndex() {
		return isIndex;
	}


	/**
	 * @param isIndex the isIndex to set
	 */
	public void setIsIndex(int isIndex) {
		this.isIndex = isIndex;
	}


	/**
	 * @return the indexOrder
	 */
	public int getIndexOrder() {
		return indexOrder;
	}


	/**
	 * @param indexOrder the indexOrder to set
	 */
	public void setIndexOrder(int indexOrder) {
		this.indexOrder = indexOrder;
	}


	@Override
	public String toString() {
		return "Product [brandId=" + brandId + ", categoryId=" + categoryId + ", productName=" + productName
				+ ", marketPrice=" + marketPrice + ", salePrice=" + salePrice + ", costPrice=" + costPrice + "]";
	}

	public int compareTo(Product p) {
		return p.productId - this.productId;
	}
}
