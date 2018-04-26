package com.gs.service;

import java.util.List;

import com.gs.pojo.Comment;

public interface CommentService extends BaseService<String, Comment>{
	public int countByBuildings_id(String buildings_id);
	public List<Comment> builds(int first, int last,String buildings_id);
	public Comment queryId(String buildings_id,String user_id);
	public List<Comment> listByUser_id(int pageSize,int pageNumber,String user_id);
	public int countByUser_id(String user_id);
}
