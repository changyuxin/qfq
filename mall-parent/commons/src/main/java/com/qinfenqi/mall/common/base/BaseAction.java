package com.qinfenqi.mall.common.base;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.joda.time.DateTime;

import com.opensymphony.xwork2.ActionSupport;
import com.qinfenqi.mall.common.constant.Constant;
import com.qinfenqi.mall.common.constant.Encoding;
import com.qinfenqi.mall.system.bean.User;

/**
 * Action基类
 * 
 * @author WangDuo
 * 
 */
public class BaseAction extends ActionSupport implements SessionAware, ServletRequestAware, ServletResponseAware {

	private static final long serialVersionUID = -2424543480116894220L;
	public static final String SUCCESS = "SUCCESS";
	public static final String FAILURE = "FAILURE";

	/** ajax返回定位标示 */
	protected static final String AJAX = "ajax";
	/** AJAX返回值 **/
	public String ajaxReturnValue;

	protected static final String INDEX = "index";

	/** 当前请求URL **/
	public String currentUrl;

	public HttpServletRequest request;
	public HttpServletResponse response;
	public Map<String, Object> session;

	public File[] upload; // 文件
	public String[] uploadContentType; // 文件类型
	public String[] uploadFileName; // 文件名
	
	/** excel下载文件名称 */
	public String excelFileName;
	public InputStream excelStream;

	/**
	 * 获取当前Session中用户
	 * 
	 * @return User
	 */
	public User getCurrentUser() {
		return (User) session.get(Constant.CURRENT_USER);
	}
	
	/**
	 * 获取当前用户的ID
	 * 
	 * @return
	 */
	public long getUserId(){
		return ((User)session.get(Constant.CURRENT_USER)).getUserId();
	}
	
	/**
	 * 获取当前Session中用户标识
	 * 
	 * @return User
	 */
	public int getUserStyle() {
		return ((User) session.get(Constant.CURRENT_USER)).getUserStyle();
	}

	/**
	 * 在Session中设置但前用户
	 * 
	 * @param user
	 */
	public void setCurrentUser(User user) {
		session.put(Constant.CURRENT_USER, user);
	}

	/**
	 * @param d
	 * @return
	 */
	public static String formatDouble(double d) {
		DecimalFormat fmt = new DecimalFormat("###,##0.00");
		return fmt.format(d);
	}

	/**
	 * 获取当前url
	 * 
	 * @return String
	 */
	public String getCurrentUrl() {
		if (StringUtils.isBlank(currentUrl)) {
			HttpServletRequest request = ServletActionContext.getRequest();
			currentUrl = (String) request.getAttribute("struts.request_uri");
			String contextPath = request.getContextPath();
			if (currentUrl.startsWith(contextPath)) {
				currentUrl = currentUrl.replaceFirst(contextPath + "/", "");
			}
		}
		return currentUrl;
	}

	public String getWebRootDir() {
		return System.getProperty("user.dir").replace("bin", "webapps/");
	}

	/**
	 * 获取路径 http://www.qinfenqi.com:80/admin
	 * 
	 * @return
	 */
	public String getBasePath() {
		String bathPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
		session.put("bathPath", bathPath);
		return bathPath;
	}

	/**
	 * 获取路径 http://www.qinfenqi.com:80/
	 * 
	 * @return
	 */
	public String getBaseHost() {
		return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/";
	}

	/**
	 * @param name
	 * @param srcEncoding
	 * @param destEncoding
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getString(String name, String srcEncoding, String destEncoding) throws UnsupportedEncodingException {
		return new String(request.getParameter(name).getBytes(srcEncoding), destEncoding);
	}

	public String uploadImg() throws IOException {
		response.setCharacterEncoding(Encoding.UTF_8);
		PrintWriter out = response.getWriter();
		// CKEditor提交的很重要的一个参数
		String callback = request.getParameter("CKEditorFuncNum");
		String expandedName = ""; // 文件扩展名
		if (uploadContentType[0].equals("image/pjpeg") || uploadContentType[0].equals("image/jpeg")) {
			// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
			expandedName = ".jpg";
		} else if (uploadContentType[0].equals("image/png") || uploadContentType[0].equals("image/x-png")) {
			// IE6上传的png图片的headimageContentType是"image/x-png"
			expandedName = ".png";
		} else if (uploadContentType[0].equals("image/gif")) {
			expandedName = ".gif";
		} else if (uploadContentType[0].equals("image/bmp")) {
			expandedName = ".bmp";
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
			out.println("</script>");
			return null;
		}
		if (upload[0].length() > 2 * 1024 * 1024) {
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," + "'文件大小不得大于2MB');");
			out.println("</script>");
			return null;
		}

		InputStream is = new FileInputStream(upload[0]);
		// 图片上传路径
		DateTime dt = new DateTime();
		String imgFilePath = "/images/product/" + dt.getYear() + "/" + dt.getMonthOfYear() + "/" + dt.getDayOfMonth() + "/";
		String uploadPath = getWebRootDir() + imgFilePath;
		String fileName = java.util.UUID.randomUUID().toString(); // 采用时间+UUID的方式随即命名
		// String fileName = uploadFile.getName();
		fileName += expandedName;
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
		// 返回"图像"选项卡并显示图片 request.getContextPath()为web项目名
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + getBaseHost() + imgFilePath + fileName + "','')");
		out.println("</script>");
		return null;
	}

	/**
	 * @param upldContxtType
	 * @return String
	 */
	public String getExtandName(String upldContxtType) {
		String expandedName = "";
		if (upldContxtType.equals("image/pjpeg") || upldContxtType.equals("image/jpeg")) {
			// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
			expandedName = ".jpg";
		} else if (upldContxtType.equals("image/png") || upldContxtType.equals("image/x-png")) {
			// IE6上传的png图片的headimageContentType是"image/x-png"
			expandedName = ".png";
		} else if (upldContxtType.equals("image/gif")) {
			expandedName = ".gif";
		} else if (upldContxtType.equals("image/bmp")) {
			expandedName = ".bmp";
		} else if (upldContxtType.equals("application/octet-stream")) {
			expandedName = ".rar";
		} else if (upldContxtType.equals("application/x-zip-compressed")) {
			expandedName = ".zip";
		}
		return expandedName;
	}

	/**
	 * @param uploadContentTypes
	 * @param uploadFile
	 * @return
	 * @throws IOException
	 */
	public String uploadPhoto(File[] uploadFiles, String[] uploadContentTypes, String biz) throws IOException {
		StringBuffer urls = new StringBuffer("");
		if (null != uploadFiles) {
			for (int i = 0; i < uploadFiles.length; i++) {
				File uploadFile = uploadFiles[i];
				InputStream is = new FileInputStream(uploadFile);
				// 图片上传路径
				DateTime dt = new DateTime();
				String imgFilePath = "images/" + biz + "/" + dt.getYear() + "/" + dt.getMonthOfYear() + "/" + dt.getDayOfMonth() + "/";
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
		}

		return urls.toString();
	}

	/**
	 * @param user
	 */
	public void getUserLoginInfo(User user) {
		// 记录当前登录IP地址
		user.setCurrentLoginIp(request.getRemoteAddr());
		// 记录登录次数
		user.setLoginCount(user.getLoginCount() + 1);
		// 记录当前登陆时间
		user.setCurrentLoginTime(new Date());
	}

	/**
	 * 返回JSON对象.
	 * 
	 * @param response
	 */
	// FIXME 修改为使用页面返回，用于session失效及系统错误等功能的统一跳转
	public void ajaxResponse(String result) {
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Expires", "0");
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 对下载文件名进行编码
	 * 
	 * @param name
	 * @return String
	 */
	public String encodeDownloadName(String name) {
		try {
			if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {
				return URLEncoder.encode(name, Encoding.UTF_8);
			} else {
				return new String(name.getBytes(Encoding.UTF_8), Encoding.ISO_8859_1);
			}
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}

	public String getAjaxReturnValue() {
		return ajaxReturnValue;
	}

	public void setAjaxReturnValue(String ajaxReturnValue) {
		this.ajaxReturnValue = ajaxReturnValue;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * @return the upload
	 */
	public File[] getUpload() {
		return upload;
	}

	/**
	 * @param upload
	 *            the upload to set
	 */
	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	/**
	 * @return the uploadContentType
	 */
	public String[] getUploadContentType() {
		return uploadContentType;
	}

	/**
	 * @param uploadContentType
	 *            the uploadContentType to set
	 */
	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * @return the uploadFileName
	 */
	public String[] getUploadFileName() {
		return uploadFileName;
	}

	/**
	 * @param uploadFileName
	 *            the uploadFileName to set
	 */
	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	/**
	 * @return the excelFileName
	 */
	public String getExcelFileName() {
		return excelFileName;
	}

	/**
	 * @param excelFileName the excelFileName to set
	 */
	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}

	/**
	 * @return the excelStream
	 */
	public InputStream getExcelStream() {
		return excelStream;
	}

	/**
	 * @param excelStream the excelStream to set
	 */
	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}
	
}
