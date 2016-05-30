/**
 * 
 */
package com.qinfenqi.mall.manage.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.manage.bean.FocusImage;
import com.qinfenqi.mall.manage.dao.FocusDao;
import com.qinfenqi.mall.manage.service.FocusService;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2015年11月9日 下午4:23:02
 * @author Chang Yuxin
 * @version 1.0 
 */
@Service("focusService")
public class FocusServiceImpl implements FocusService{
	
	@Resource
	private FocusDao focusDao;
	
	@Override
	public List<FocusImage> getFocusImages() {
		return focusDao.getFocusImages();
	}

	@Override
	public List<FocusImage> getFocusImageList(FocusImage focusImage) {
		return focusDao.getFocusImageList(focusImage);
	}

	@Override
	public int getFocusImageCount(FocusImage focusImage) {
		return focusDao.getFocusImageCount(focusImage);
	}

	@Override
	public FocusImage getFocusImageById(FocusImage focusImage) {
		return focusDao.getFocusImageById(focusImage);
	}

	@Override
	public boolean addFocusImage(FocusImage focusImage) {
		focusImage.setCreateTime(new Date());
		return focusDao.createFocusImage(focusImage);
	}

	@Override
	public boolean editFocusImage(FocusImage focusImage) {
		focusImage.setModifyTime(new Date());
		return focusDao.modifyFocusImage(focusImage);
	}

	@Override
	public boolean enableFocus(FocusImage focusImage) {
		return focusDao.enableFocus(focusImage);
	}

	@Override
	public boolean deleteFocus(FocusImage focusImage) {
		return focusDao.deleteFocus(focusImage);
	}

}
