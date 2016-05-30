/**
 * 
 */
package com.qinfenqi.mall.admin.product;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.joda.time.DateTime;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.common.constant.Encoding;
import com.qinfenqi.mall.product.bean.Brand;
import com.qinfenqi.mall.product.bean.Category;
import com.qinfenqi.mall.product.bean.Product;
import com.qinfenqi.mall.product.bean.ProductColor;
import com.qinfenqi.mall.product.bean.ProductList;
import com.qinfenqi.mall.product.bean.ServiceRate;
import com.qinfenqi.mall.product.bean.ProductSpec;
import com.qinfenqi.mall.product.query.ProductQuery;
import com.qinfenqi.mall.product.service.BrandService;
import com.qinfenqi.mall.product.service.CategoryService;
import com.qinfenqi.mall.product.service.ServiceRateService;
import com.qinfenqi.mall.product.service.ProductService;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年5月27日 下午8:18:46
 * @author Chang Yuxin
 * @version 1.0
 */
@Action(results = { @Result(name = "success", location = "product!index.do", type = "redirect") })
public class ProductAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -5723238975271837718L;

	@Resource
	private ProductService productService;
	@Resource
	private ServiceRateService productRateService;
	@Resource
	private BrandService brandService;
	@Resource
	private CategoryService categoryService;
	private List<Category> categoryList;
	private ProductQuery productQuery = new ProductQuery();;
	protected List<ProductQuery> productList;
	protected List<Brand> brandList;
	protected Product product;
	private List<ServiceRate> serviceRates;
	private List<ProductList> prods;
	private List<ProductColor> colors;
	private List<ProductSpec> specs;
	private List<String> productImages;

	/**
	 * 进入商品管理页
	 * 
	 * @return
	 */
	public String index() {
		return "index";
	}

	/**
	 * 获取商品分类
	 * 
	 * @return
	 */

	public String getCategorys() {
		categoryList = categoryService.getCategoryList();
		return "left";
	}

	/**
	 * 获取商品列表
	 * 
	 * @return
	 */
	public String getProducts() {
		// productList = productService.getProductList(productQuery);
		return "manage";
	}
	
	public String queryProductListByCon(){
		productQuery.setPageSize(25);
		productQuery.setOrderField("create_time");
		productList = productService.getProductListByCon(productQuery, getCurrentUser());
		double total = productService.getProductCount(productQuery);
		double pageSize = productQuery.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		productQuery.setPageTotal(pageTotal);
		productQuery.setTotal((int) total);
		return "manage";
	}
	
	/**
	 * 添加/编辑商品页面
	 * 
	 * @return
	 */
	public String saveProductPage() {
		if (null != productQuery) {
			int productId = productQuery.getProductId();
			if (productId > 0) {
				product = productService.getProductById(productId);
				prods = productService.getProdsByBrandId(product.getBrandId());
			} else {
				product = new Product();
				product.setProductCode(productService.getProductCode());
			}
		}

		specs = productService.getSpecs();
		categoryList = categoryService.getCategoryList();
		brandList = brandService.getBrandList();
		colors = productService.getColors();
		return "save";
	}

	/**
	 * 添加/编辑商品
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String saveProduct() throws IOException {
		PrintWriter out = response.getWriter();
		if (productQuery.getProductId() == 0) {
			productService.addProduct(productQuery);
		} else {
			productService.editProduct(productQuery);
		}
		response.setCharacterEncoding(Encoding.UTF_8);
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.closeAndFresh()");
		out.println("</script>");
		return null;
	}

	/**
	 * 删除商品
	 * 
	 * @return
	 */
	public String deleteProduct() {
		JSONObject json = new JSONObject();
		boolean result = productService.deleteProduct(productQuery);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}

	/**
	 * 上传图片页面
	 * 
	 * @return
	 */
	public String uploadCoverPage() {
		productQuery = productService.getProductDetailById(productQuery, getCurrentUser());
		return "upldcver";
	}

	/**
	 * 上传商品封面
	 * 
	 * @return String
	 * @throws IOException
	 */
	public String uploadCoverImg() throws IOException {
		PrintWriter out = response.getWriter();

		String coverImgUrl = uploadCoverImage(upload[0], uploadContentType[0]);
		productQuery.setCoverImg(coverImgUrl);

		File[] uploadFile = new File[upload.length - 1];

		for (int i = 1; i < upload.length; i++) {
			uploadFile[i - 1] = upload[i];
		}

		String[] uploadContentTypes = new String[uploadContentType.length - 1];
		for (int i = 1; i < uploadContentType.length; i++) {
			uploadContentTypes[i - 1] = uploadContentType[i];
		}

		String productImgs = uploadProductImgs(uploadFile, uploadContentTypes);

		productQuery.setProductImgs(StringUtil.removeLastComma(productImgs));

		productService.editProductCover(productQuery);

		response.setCharacterEncoding(Encoding.UTF_8);
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.close(1)");
		out.println("</script>");
		return null;
	}

	/**
	 * @param uploadContentTypes
	 * @param uploadFile
	 * @return
	 * @throws IOException
	 */
	private String uploadProductImgs(File[] uploadFiles, String[] uploadContentTypes) throws IOException {
		StringBuffer urls = new StringBuffer();
		for (int i = 0; i < uploadFiles.length; i++) {
			File uploadFile = uploadFiles[i];
			InputStream is = new FileInputStream(uploadFile);
			// 图片上传路径
			DateTime dt = new DateTime();
			String imgFilePath = "/images/product/" + dt.getYear() + "/" + dt.getMonthOfYear() + "/"
					+ dt.getDayOfMonth() + "/";
			String uploadPath = getWebRootDir() + imgFilePath;
			String fileName = java.util.UUID.randomUUID().toString(); // 采用时间+UUID的方式随即命名
			fileName += this.getExtandName(uploadContentType[i]);
			File file = new File(uploadPath);
			if (!file.exists()) { // 如果路径不存在，创建
				file.mkdirs();
			}
			File toFile = new File(uploadPath, fileName);
			OutputStream os = new FileOutputStream(toFile);
			byte[] buffer = new byte[1024];
			int length = 0;
			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
			is.close();
			os.close();
			urls.append(getBaseHost() + imgFilePath + fileName).append(",");
		}

		return urls.toString();
	}

	/**
	 * @param uploadContentType
	 * @return
	 * @throws IOException
	 */
	private String uploadCoverImage(File uploadFile, String uploadContentType) throws IOException {
		InputStream is = new FileInputStream(uploadFile);
		// 图片上传路径
		DateTime dt = new DateTime();
		String imgFilePath = "/images/product/" + dt.getYear() + "/" + dt.getMonthOfYear() + "/" + dt.getDayOfMonth()
				+ "/";
		String uploadPath = getWebRootDir() + imgFilePath;
		String fileName = java.util.UUID.randomUUID().toString(); // 采用时间+UUID的方式随即命名
		fileName += this.getExtandName(uploadContentType);
		File file = new File(uploadPath);
		if (!file.exists()) { // 如果路径不存在，创建
			file.mkdirs();
		}
		File toFile = new File(uploadPath, fileName);
		OutputStream os = new FileOutputStream(toFile);
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = is.read(buffer)) > 0) {
			os.write(buffer, 0, length);
		}
		is.close();
		os.close();
		return getBaseHost() + imgFilePath + fileName;
	}

	/**
	 * 设置服务费页面
	 * 
	 * @return
	 */
	public String setServiceChargePage() {
		serviceRates = productRateService.getServiceRates(productQuery);
		return "charge";
	}

	/**
	 * 设置服务费
	 * 
	 * @return
	 * @throws IOException
	 */
	public String setServiceCharge() throws IOException {
		PrintWriter out = response.getWriter();
		String[] periodNumStarts = request.getParameterValues("periodNumStart");
		String[] periodNumEnds = request.getParameterValues("periodNumEnd");
		String[] serviceRates = request.getParameterValues("serviceRate");

		productRateService.addProductRate(productQuery, periodNumStarts, periodNumEnds, serviceRates);

		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.close(2)");
		out.println("</script>");
		return null;
	}

	/**
	 * 商品详情
	 * 
	 * @return
	 */
	public String detail() {
		productQuery = productService.getProductDetailById(productQuery, getCurrentUser());
		serviceRates = productRateService.getServiceRates(productQuery);
		productImages = StringUtil.String2List(productQuery.getProductImgs());
		return "detail";
	}

	/**
	 * 根据品牌查看商品
	 */
	public void getProductLists() {
		prods = productService.getProdsByBrandId(productQuery.getBrandId());
		String json = JSONArray.fromObject(prods).toString();
		ajaxResponse(json);
	}

	/**
	 * @return the productList
	 */
	public List<ProductQuery> getProductList() {
		return productList;
	}

	/**
	 * @return the categoryList
	 */
	public List<Category> getCategoryList() {
		return categoryList;
	}

	/**
	 * @param categoryList
	 *            the categoryList to set
	 */
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
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
	 * @param productList
	 *            the productList to set
	 */
	public void setProductList(List<ProductQuery> productList) {
		this.productList = productList;
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
	 * @return the product
	 */
	public Product getProduct() {
		return product;
	}

	/**
	 * @param product
	 *            the product to set
	 */
	public void setProduct(Product product) {
		this.product = product;
	}


	/**
	 * @return the serviceRates
	 */
	public List<ServiceRate> getServiceRates() {
		return serviceRates;
	}

	/**
	 * @param serviceRates the serviceRates to set
	 */
	public void setServiceRates(List<ServiceRate> serviceRates) {
		this.serviceRates = serviceRates;
	}

	/**
	 * @return the prods
	 */
	public List<ProductList> getProds() {
		return prods;
	}

	/**
	 * @param prods
	 *            the prods to set
	 */
	public void setProds(List<ProductList> prods) {
		this.prods = prods;
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

}
