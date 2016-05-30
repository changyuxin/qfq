package com.qinfenqi.mall.common.base;



/**
 * bean基类
 * 
 * @author WangDuo
 *
 */
public class BaseBean {
	
	/** 页码 */
	private int pageNo = 1;
	/** 每页条数 */
	private int pageSize = 10;
	/** 记录总数 */
	private int total;
	/** 总页数 */
	private int pageTotal;
	/** 排序方式 */
	private String orderField = "create_time";
	/** 是否翻页查询，false:返回全部 */
	private boolean isPage = true;
	/** 排序方式 */
	private String orderType = "desc";
	
	
	/**
	 * @return the pageNo
	 */
	public int getPageNo() {
		return pageNo;
	}

	/**
	 * @param pageNo
	 *            the pageNo to set
	 */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize
	 *            the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the total
	 */
	public int getTotal() {
		return total;
	}

	/**
	 * @param total
	 *            the total to set
	 */
	public void setTotal(int total) {
		this.total = total;
	}

	/**
	 * @return the pageTotal
	 */
	public int getPageTotal() {
		return pageTotal;
	}

	/**
	 * @param pageTotal
	 *            the pageTotal to set
	 */
	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	/**
	 * @return the orderField
	 */
	public String getOrderField() {
		return orderField;
	}

	/**
	 * @param orderField
	 *            the orderField to set
	 */
	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	/**
	 * @return the startNo
	 */
	public int getStartNo() {
		return getPageSize() * (getPageNo() - 1);
	}

	/**
	 * @return the isPage
	 */
	public boolean isPage() {
		return isPage;
	}

	/**
	 * @param isPage the isPage to set
	 */
	public void setPage(boolean isPage) {
		this.isPage = isPage;
	}

	/**
	 * @return the orderType
	 */
	public String getOrderType() {
		return orderType;
	}

	/**
	 * @param orderType the orderType to set
	 */
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	
}
