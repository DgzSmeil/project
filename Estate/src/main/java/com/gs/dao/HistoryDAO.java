package com.gs.dao;

import java.util.List;

import com.gs.pojo.History;

public interface HistoryDAO extends BaseDAO<String, History>{
	public History queryByid(String user_id,String buildings_id);
	public List<History> listByUser_id(int pageSize,int pageNumber,String user_id);
	public int countByUser_id(String user_id);
}
