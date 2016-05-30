/**
 * 
 */
package com.qinfenqi.mall.manage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.manage.bean.FocusImage;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.,Ltd. Beijing
 * @bulid: 2015年7月9日 上午10:32:58
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface FocusDao {
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
	boolean createFocusImage(FocusImage focusImage);

	/**
	 * @param focusImage
	 * @return
	 */
	boolean modifyFocusImage(FocusImage focusImage);

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
