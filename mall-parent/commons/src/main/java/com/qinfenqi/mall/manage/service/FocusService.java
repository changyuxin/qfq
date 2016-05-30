/**
 * 
 */
package com.qinfenqi.mall.manage.service;

import java.util.List;

import com.qinfenqi.mall.manage.bean.FocusImage;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月9日 下午4:22:50
 * @author Chang Yuxin
 * @version 1.0
 */
public interface FocusService {
	/**
	 * @return
	 */
	List<FocusImage> getFocusImages();

	/**
	 * @param focusImage
	 * @return
	 */
	List<FocusImage> getFocusImageList(FocusImage focusImage);

	/**
	 * @param focusImage
	 * @return
	 */
	int getFocusImageCount(FocusImage focusImage);

	/**
	 * @param focusImage
	 * @return
	 */
	FocusImage getFocusImageById(FocusImage focusImage);

	/**
	 * @param focusImage
	 * @return
	 */
	boolean addFocusImage(FocusImage focusImage);

	/**
	 * @param focusImage
	 * @return
	 */
	boolean editFocusImage(FocusImage focusImage);

	/**
	 * @param focusImage
	 * @return
	 */
	boolean enableFocus(FocusImage focusImage);

	/**
	 * @param focusImage
	 * @return
	 */
	boolean deleteFocus(FocusImage focusImage);
}
