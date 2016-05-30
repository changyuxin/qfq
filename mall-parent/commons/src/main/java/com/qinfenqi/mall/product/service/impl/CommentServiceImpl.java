/**
 * 
 */
package com.qinfenqi.mall.product.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qinfenqi.mall.product.bean.Comment;
import com.qinfenqi.mall.product.dao.CommentDao;
import com.qinfenqi.mall.product.service.CommentService;


/**
 * @Title:
 * @Description:  
 * @Copyright: Copyright (c) 2015 - 2015 
 * @Company: Qinfenqi Technology Co.Ltd. Beijing
 * @bulid: 2016年5月6日 下午5:07:21
 * @author Sun Xiang
 * @version 1.0 
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService{
	
	@Resource
	private CommentDao commentDao;
	
	@Override
	public List<Comment> getCommentList(Comment comment) {
		List<Comment> list = new ArrayList<Comment>();
		if (null == comment) {
			comment = new Comment();
		}
		list = commentDao.getCommentList(comment);
		return list;
	}
	
	public List<Comment> checkCommentList(Comment comment) {
		List<Comment> list = new ArrayList<Comment>();
		if (null == comment) {
			comment = new Comment();
		}
		list = commentDao.checkCommentList(comment);
		return list;
	}
	
	@Override
	public void addComment(Comment comment) {
		commentDao.addComment(comment);
	}
	
	public void editCommentCover(Comment comment) {
		commentDao.editCommentCover(comment);
	}

//
//	public void editComment(Comment comment) {
//
//		//commentDao.editComment(Comment);
//
//	}


//	public boolean deleteComment(Comment comment) {
//		//return commentDao.deleteComment(Comment.getCommentId());
//	}

}
