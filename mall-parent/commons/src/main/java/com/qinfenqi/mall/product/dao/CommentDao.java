/**
 * 
 */
package com.qinfenqi.mall.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qinfenqi.mall.product.bean.Comment;

/**
 * @Title:
 * @Description:
 * @Copyright: Copyright (c) 2015 - 2015
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2016年5月10日 上午10:21:54
 * @author Chang Yuxin
 * @version 1.0
 */
@Repository
public interface CommentDao {
	public List<Comment> getCommentList(Comment comment);

	public List<Comment> checkCommentList(Comment comment);

	public void addComment(Comment comment);

	void editCommentCover(Comment comment);

}
