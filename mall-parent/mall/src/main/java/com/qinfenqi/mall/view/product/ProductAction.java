/**
 * 
 */
package com.qinfenqi.mall.view.product;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.common.base.BaseAction;
import com.qinfenqi.mall.product.bean.Brand;
import com.qinfenqi.mall.product.bean.Category;
import com.qinfenqi.mall.product.bean.Comment;
import com.qinfenqi.mall.product.bean.ProductColor;
import com.qinfenqi.mall.product.bean.ProductSpec;
import com.qinfenqi.mall.product.query.ProductQuery;
import com.qinfenqi.mall.product.service.BrandService;
import com.qinfenqi.mall.product.service.CategoryService;
import com.qinfenqi.mall.product.service.CommentService;
import com.qinfenqi.mall.product.service.ProductService;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年6月2日 下午6:49:23
 * @author Chang Yuxin
 * @version 1.0
 */
public class ProductAction extends BaseAction {

	/**  */
	private static final long serialVersionUID = 1872357473754763361L;

	private List<String> productImages;

	@Resource
	private ProductService productService;
	@Resource
	private BrandService brandService;
	@Resource
	private CommentService commentService;
	
	private CategoryService categoryService;
	private Category category;
	/**
	 * @return the productService
	 */
	public ProductService getProductService() {
		return productService;
	}
	/**
	 * @param productService the productService to set
	 */
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	/**
	 * @return the brandService
	 */
	public BrandService getBrandService() {
		return brandService;
	}
	/**
	 * @param brandService the brandService to set
	 */
	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}
	/**
	 * @return the commentService
	 */
	public CommentService getCommentService() {
		return commentService;
	}
	/**
	 * @param commentService the commentService to set
	 */
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	/**
	 * @return the categoryService
	 */
	public CategoryService getCategoryService() {
		return categoryService;
	}
	/**
	 * @param categoryService the categoryService to set
	 */
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private ProductQuery productQuery;
	private List<ProductColor> colors;
	private List<ProductSpec> specs;
	private List<ProductQuery> prodList;
	private List<Brand> brandList;
	private Brand brand;
	private String keyword;
	/** 评论 */
	protected Comment comment;
	private List<Comment> commentList;
	/**
	 * 展示商品详情
	 * 
	 * @return String
	 */
	public String showProDetail() {
		productQuery = productService.getProductDetailById(productQuery, getCurrentUser());
		productImages = StringUtil.String2List(productQuery.getProductImgs());
		colors = productService.getProductColors(productQuery.getProductPid());
		specs = productService.getProductSpecs(productQuery.getProductPid());
		return "detail";
	}
	/**
	 * 展示免费商品详情
	 * 
	 * @return String
	 */
	public String showfreeProDetail() {
		productQuery = productService.getProductDetailById(productQuery, getCurrentUser());
		productImages = StringUtil.String2List(productQuery.getProductImgs());
		colors = productService.getProductColors(productQuery.getProductPid());
		specs = productService.getProductSpecs(productQuery.getProductPid());
		return "freeprodetail";
	}
	


	/**
	 * 商品推荐列表
	 * 
	 * @return
	 */
	public String getRecommends() {
		prodList = productService.getRecommends(productQuery, getCurrentUser());
		return "recomm";
	}
	
	/**
	 * 免费商品推荐列表
	 * 
	 * @return
	 */
	public String getFreeRecommends() {
		prodList = productService.getRecommends(productQuery, getCurrentUser());
		return "recommfree";
	}

	/**
	 * 产品列表
	 * 
	 * @return
	 */
	public String showProdList() {
		String keyword = productQuery.getKeyword();
		if (null == keyword || "".equals(keyword)) {
			brandList = brandService.getBrandList();
			category = categoryService.getCategoryById(productQuery.getCategoryId());
		}
		return "list";
	}

	/**
	 * 产品列表 根据条件查询产品列表
	 * 
	 * @return
	 */
	public String queryProductListByCon() {
		// 默认16
		productQuery.setPageSize(16);
		prodList = productService.getProductListByCon(productQuery, getCurrentUser());
		double total = productService.getProductCount(productQuery);
		
		double pageSize = productQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		productQuery.setPageTotal(pageTotal);
		productQuery.setTotal((int) total);
		return "bidlist";
	}

	public String queryProducts() {
		prodList = productService.getProdListByCid(productQuery);
		return "pdlist";
	}

	public String getRecommendProds() {

		return "recmdlist";
	}

	/**
	 * 查询商品
	 * 
	 * @return
	 */
	public String queryProduct() {
		JSONObject json = new JSONObject();
		productQuery = productService.queryProduct(productQuery);
		json.put("pid", productQuery.getProductId());
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 计算分期还款
	 * 
	 * @return
	 */
	public String cacuMonthPay() {
		JSONObject json = new JSONObject();
		productQuery = productService.cacuMonthPay(productQuery, getCurrentUser());
		json.put("principal", productQuery.getPrincipal());
		json.put("servicePay", productQuery.getServicePay());
		json.put("monthPay", productQuery.getMonthPay());
		json.put("rate", productQuery.getServiceRate());
		json.put("financialPay", productQuery.getFinancialPay());
		ajaxReturnValue = json.toString();
		return AJAX;

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
	 * @return the productImages
	 */
	public List<String> getProductImages() {
		return productImages;
	}

	/**
	 * @param productImages
	 *            the productImages to set
	 */
	public void setProductImages(List<String> productImages) {
		this.productImages = productImages;
	}

	/**
	 * @return the colors
	 */
	public List<ProductColor> getColors() {
		return colors;
	}

	/**
	 * @param colors
	 *            the colors to set
	 */
	public void setColors(List<ProductColor> colors) {
		this.colors = colors;
	}

	/**
	 * @return the specs
	 */
	public List<ProductSpec> getSpecs() {
		return specs;
	}

	/**
	 * @param specs
	 *            the specs to set
	 */
	public void setSpecs(List<ProductSpec> specs) {
		this.specs = specs;
	}

	/**
	 * @return the prodList
	 */
	public List<ProductQuery> getProdList() {
		return prodList;
	}

	/**
	 * @param prodList
	 *            the prodList to set
	 */
	public void setProdList(List<ProductQuery> prodList) {
		this.prodList = prodList;
	}

	/**
	 * @return the brandList
	 */
	public List<Brand> getBrandList() {
		return brandList;
	}

	/**
	 * @param brandList
	 *            the brandList to set
	 */
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}

	/**
	 * @return the category
	 */
	public Category getCategory() {
		return category;
	}

	/**
	 * @param category
	 *            the category to set
	 */
	public void setCategory(Category category) {
		this.category = category;
	}

	/**
	 * @return the brand
	 */
	public Brand getBrand() {
		return brand;
	}

	/**
	 * @param brand
	 *            the brand to set
	 */
	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	/**
	 * @return the keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * @param keyword
	 *            the keyword to set
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	/**
	 * 展示商品评论
	 * 
	 * @return String
	 */
	public String commentList(){
		productQuery = productService.getProductDetailById(productQuery, getCurrentUser());
		productImages = StringUtil.String2List(productQuery.getProductImgs());
		colors = productService.getProductColors(productQuery.getProductPid());
		specs = productService.getProductSpecs(productQuery.getProductPid());
		Comment comment = new Comment();
		comment.setProductId(productQuery.getProductId());
		commentList = commentService.getCommentList(comment);
		return "commentList";
	}
	

	/**
	 * @return the commentList
	 */
	public List<Comment> getCommentList() {
		return commentList;
	}

	/**
	 * @param commentList the commentList to set
	 */
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	/**
	 * 展示商品评论
	 * 
	 * @return String
	 */
	public String freeCommentList(){
		productQuery = productService.getProductDetailById(productQuery, getCurrentUser());
		productImages = StringUtil.String2List(productQuery.getProductImgs());
		colors = productService.getProductColors(productQuery.getProductPid());
		specs = productService.getProductSpecs(productQuery.getProductPid());
		Comment comment = new Comment();
		comment.setProductId(productQuery.getProductId());
		commentList = commentService.getCommentList(comment);
		return "freeCommentList";
	}
	

	/**
	 * @return the commentList
	 */
	public List<Comment> getFreeCommentList() {
		return commentList;
	}


	
	/**
	 * @return the comment
	 */
	public Comment getComment() {
		return comment;
	}

	/**
	 * @param comment the comment to set
	 */
	public void setComment(Comment comment) {
		this.comment = comment;
	}
}
