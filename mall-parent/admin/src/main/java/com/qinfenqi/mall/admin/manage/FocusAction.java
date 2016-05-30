/**
 * 
 */
package com.qinfenqi.mall.admin.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.qinfenqi.mall.admin.common.BaseActionEx;
import com.qinfenqi.mall.common.constant.Encoding;
import com.qinfenqi.mall.manage.bean.FocusImage;
import com.qinfenqi.mall.manage.service.FocusService;
import com.qinfenqi.mall.util.StringUtil;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年11月9日 下午4:18:40
 * @author Chang Yuxin
 * @version 1.0
 */
public class FocusAction extends BaseActionEx {

	/**  */
	private static final long serialVersionUID = -3024687397013725646L;
	
	@Resource
	private FocusService focusService;
	
	private List<FocusImage> focusImages;
	private FocusImage focusImage = new FocusImage();
	
	/**
	 * 设置首页轮播
	 * 
	 * @return
	 */
	public String manage() {
		return "manage";
	}

	/**
	 * 获取轮播图列表
	 * 
	 * @return
	 */
	public String getFocusImageList() {
		focusImages = focusService.getFocusImageList(focusImage);
		double total = focusService.getFocusImageCount(focusImage);
		double pageSize = focusImage.getPageSize();
		// 页数
		int pageTotal = (int) Math.ceil(total / pageSize);
		focusImage.setPageTotal(pageTotal);
		focusImage.setTotal((int) total);
		return "list";
	}

	/**
	 * 保存轮播图页面
	 * 
	 * @return
	 */
	public String saveFocusPage() {
		int focusId = focusImage.getFocusId();
		if (focusId > 0) {
			focusImage = focusService.getFocusImageById(focusImage);
		}
		return "save";
	}

	/**
	 * 保存轮播图
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String saveFocus() throws IOException {
		PrintWriter out = response.getWriter();
		int focusId = focusImage.getFocusId();
		String imageUrl = uploadPhoto(upload, uploadContentType, "focus");
		focusImage.setImageUrl(StringUtil.removeLastComma(imageUrl));
		if (focusId == 0) {
			focusService.addFocusImage(focusImage);
		} else {
			focusService.editFocusImage(focusImage);
		}
		response.setCharacterEncoding(Encoding.UTF_8);
		out.println("<script type=\"text/javascript\">");
		out.println("window.parent.close()");
		out.println("</script>");
		return null;

	}
	
	public String deleteFocus(){
		JSONObject json = new JSONObject();
		boolean result = focusService.deleteFocus(focusImage);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
	}
	
	
	/**
	 * 启用轮播图
	 * 
	 * @return
	 */
	public String enableFocus() {
		JSONObject json = new JSONObject();
		boolean result = false;
		result = focusService.enableFocus(focusImage);
		json.put("result", result ? SUCCESS : FAILURE);
		ajaxReturnValue = json.toString();
		return AJAX;
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
	public void setFocusImages(List<FocusImage> focusImages) {
		this.focusImages = focusImages;
	}

	/**
	 * @return the focusImage
	 */
	public FocusImage getFocusImage() {
		return focusImage;
	}

	/**
	 * @param focusImage the focusImage to set
	 */
	public void setFocusImage(FocusImage focusImage) {
		this.focusImage = focusImage;
	}
	
	
}
