package com.qinfenqi.mall.common.base;





/**
 * 查询基类
 * 
 * @author WangDuo
 *
 */
public class BaseQuery extends BaseBean {

	/** 页码 */
	private int pageNo = 1;
	
	/** 每页条数 */
	private int pageSize = 10;
	
	/** 是否翻页查询，false:返回全部 */
	private boolean isPage = true;
	
	/** 记录总数 */
	private int total;
	
	/** 排序字段 */
	private String orderField; 
	
	/** 排序方式 */
	private String orderType;
	
	/** 
	 * 数据库分页开始行
	 * @return
	 */
	public int getMinnum() {
		return getPageSize() * (getPageNo() - 1) ;
	}
	
	/**
	 * 数据库分页结束行
	 * @return
	 */
	public int getMaxnum() {
		return getPageSize() * getPageNo();
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public boolean isPage() {
		return isPage;
	}

	public void setPage(boolean isPage) {
		this.isPage = isPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
}
