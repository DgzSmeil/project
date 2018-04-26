package com.gs.service.impl;

import java.util.List;

import com.gs.dao.CommentDAO;
import com.gs.pojo.Comment;
import com.gs.service.CommentService;

public class CommentServiceImpl implements CommentService{
	
	private CommentDAO commentDAO;

	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	@Override
	public Comment queryById(String id) {
		return commentDAO.queryById(id);
	}

	@Override
	public List<Comment> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> list(int pageSize, int pageNumber, String id) {
		return commentDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void update(Comment t) {
		commentDAO.update(t);
		
	}

	@Override
	public void add(Comment t) {
		commentDAO.add(t);
	}

	@Override
	public void delete(Comment t) {
		commentDAO.delete(t);
	}

	@Override
	public int count(String id) {
		return commentDAO.count(id);
	}

	@Override
	public int countByBuildings_id(String buildings_id) {
		return commentDAO.countByBuildings_id(buildings_id);
	}

	@Override
	public List<Comment> builds(int first, int last,String buildings_id) {
		return commentDAO.builds(first, last,buildings_id);
	}

	@Override
	public Comment queryId(String buildings_id, String user_id) {
		return commentDAO.queryId(buildings_id, user_id);
	}

	@Override
	public List<Comment> listByUser_id(int pageSize, int pageNumber, String user_id) {
		return commentDAO.listByUser_id(pageSize, pageNumber, user_id);
	}

	@Override
	public int countByUser_id(String user_id) {
		return commentDAO.countByUser_id(user_id);
	}

}
