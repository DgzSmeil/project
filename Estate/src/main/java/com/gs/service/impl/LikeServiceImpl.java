package com.gs.service.impl;

import java.util.List;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.LikeDAO;
import com.gs.pojo.Like;
import com.gs.service.LikeService;

public class LikeServiceImpl implements LikeService{
	
	private LikeDAO likeDAO;
	
	public void setLikeDAO(LikeDAO likeDAO) {
		this.likeDAO = likeDAO;
	}

	@Override
	public Like queryById(String id) {
		return likeDAO.queryById(id);
	}


	@Override
	public void update(Like t) {
		likeDAO.update(t);
	}

	@Override
	public void add(Like t) {
		likeDAO.add(t);
	}


	@Override
	public List<Like> querylist(String hql) {
		return likeDAO.querylist(hql);
	}

	@Override
	public List<Like> list(int pageSize, int pageNumber, String id) {
		return likeDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public Like likeCount(String user_id,String buildings_id) {
		return likeDAO.likeCount(user_id, buildings_id);
	}
	@Override
	public String queryStatus(String id) {
		return likeDAO.queryStatus(id);
	}
	@Override
	public void updatestatus(String status, String id) {
		likeDAO.updatestatus(status, id);
	}

	@Override
	public void delete(Like t) {
		likeDAO.delete(t);
	}

	@Override
	public int count(String id) {
		return likeDAO.count(id);
	}

}
