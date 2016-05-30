/**
 * 
 */
package com.qinfenqi.mall.view.index;

import java.util.List;

import javax.annotation.Resource;

import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.manage.bean.FocusImage;
import com.qinfenqi.mall.manage.service.FocusService;
import com.qinfenqi.mall.product.bean.Category;
import com.qinfenqi.mall.product.query.ProductQuery;
import com.qinfenqi.mall.product.service.CategoryService;
import com.qinfenqi.mall.product.service.ProductService;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月30日 上午10:02:23
 * @author Chang Yuxin
 * @version 1.0
 */
public class IndexAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = 3986786326191338637L;
	@Resource
	private CategoryService categoryService;
	@Resource
	private ProductService productService;
	@Resource
	private FocusService focusService;

	protected List<ProductQuery> products;
	protected List<Category> categorys;
	protected List<FocusImage> focusImages;
	protected ProductQuery productQuery;

	private static final int CATEGORY_LEVEL = 2;
	private static final int PRODUCT_NUM = 4;

	/**
	 * 首页
	 * 
	 * @return
	 */
	public String indexPage() {
		categorys = categoryService.getCategoryListByLevel(CATEGORY_LEVEL);
		focusImages = focusService.getFocusImages();
		return "index";
	}

	/**
	 * 首页产品列表
	 * 
	 * @return
	 */

	public String getProductList() {
		productQuery.setIsIndex(1);
		products = productService.getProductListByCategoryId(productQuery, PRODUCT_NUM, getCurrentUser());
		return "prodlist";
	}

	/**
	 * 声明
	 * 
	 * @return
	 */
	public String statement() {
		return "statement";
	}

	/**
	 * @return the categorys
	 */
	public List<Category> getCategorys() {
		return categorys;
	}

	/**
	 * @param categorys
	 *            the categorys to set
	 */
	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}

	/**
	 * @return the productQuery
	 */
	public ProductQuery getProductQuery() {
		return productQuery;
	}

	/**
	 * @param productQuery
	 *            the productQuery to set
	 */
	public void setProductQuery(ProductQuery productQuery) {
		this.productQuery = productQuery;
	}

	/**
	 * @param products
	 *            the products to set
	 */
	public void setProducts(List<ProductQuery> products) {
		this.products = products;
	}

	/**
	 * @return the products
	 */
	public List<ProductQuery> getProducts() {
		return products;
	}

	/**
	 * @return the focusImages
	 */
	public List<FocusImage> getFocusImages() {
		return focusImages;
	}

	/**
	 * @param focusImages the focusImages to set
	 */
	public void setFocusImags(List<FocusImage> focusImages) {
		this.focusImages = focusImages;
	}

}
