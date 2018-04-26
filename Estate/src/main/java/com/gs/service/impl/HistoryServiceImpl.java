package com.gs.service.impl;

import java.util.List;

import com.gs.dao.HistoryDAO;
import com.gs.pojo.History;
import com.gs.service.HistoryService;

public class HistoryServiceImpl implements HistoryService{

	private HistoryDAO historyDAO;
	public void setHistoryDAO(HistoryDAO historyDAO) {
		this.historyDAO = historyDAO;
	}
	@Override
	public History queryById(String id) {
		return historyDAO.queryById(id);
	}

	@Override
	public List<History> querylist(String id) {
		return historyDAO.querylist(id);
	}

	@Override
	public List<History> list(int pageSize, int pageNumber, String id) {
		return historyDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void update(History t) {
		historyDAO.update(t);
	}

	@Override
	public void add(History t) {
		historyDAO.add(t);
	}

	@Override
	public void delete(History t) {
		historyDAO.delete(t);
	}

	@Override
	public int count(String id) {
		return historyDAO.count(id);
	}
	@Override
	public History queryByid(String user_id, String buildings_id) {
		return historyDAO.queryByid(user_id, buildings_id);
	}
	@Override
	public List<History> listByUser_id(int pageSize, int pageNumber, String user_id) {
		return historyDAO.listByUser_id(pageSize, pageNumber, user_id);
	}
	@Override
	public int countByUser_id(String user_id) {
		return historyDAO.countByUser_id(user_id);
	}

}
