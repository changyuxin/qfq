/**
 * 
 */
package com.qinfenqi.mall.product.service;

import java.util.List;

import com.qinfenqi.mall.product.bean.Comment;

/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2016年5月6日 下午4:58:35
 * @author Sun xiang
 * @version 1.0 
 */
public interface CommentService {
	/**
	 * @param productQuery
	 * @return
	 */
	List<Comment> getCommentList(Comment comment);
	
	/**
	 * @param product
	 * @return 
	 */
	List<Comment> checkCommentList(Comment comment);
	/**
	 * @param product
	 * @return 
	 */
	void addComment(Comment comment);
	/**
	 * @param Comment
	 */
	void editCommentCover(Comment comment);
	/**
	 * @param product
	 */
	
//	void editComment(Comment comment);

	/**
	 * @param productQuery
	 * @return
	 */
	//boolean deleteComment(Comment comment);

	/**
	 * 
	 */

}
