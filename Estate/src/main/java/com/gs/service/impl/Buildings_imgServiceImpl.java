package com.gs.service.impl;

import java.util.List;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.Buildings_imgDAO;
import com.gs.pojo.BuildingsImg;
import com.gs.service.Buildings_imgService;

public class Buildings_imgServiceImpl implements Buildings_imgService{
	
	private Buildings_imgDAO buildings_imgDAO;
	public void setBuildings_imgDAO(Buildings_imgDAO buildings_imgDAO) {
		this.buildings_imgDAO = buildings_imgDAO;
	}

	@Override
	public BuildingsImg queryById(String id) {
		return buildings_imgDAO.queryById(id);
	}
	
	@Override
	public List<BuildingsImg> querylist(String id) {
		return buildings_imgDAO.querylist(id);
	}


	@Override
	public void update(BuildingsImg t) {
		buildings_imgDAO.update(t);
	}

	@Override
	public void add(BuildingsImg t) {
		buildings_imgDAO.add(t);
	}

	@Override
	public void delete(BuildingsImg t) {
		buildings_imgDAO.delete(t);
		
	}


	@Override
	public int count(String id) {
		return buildings_imgDAO.count(id);
	}

	@Override
	public List<BuildingsImg> list(int pageSize, int pageNumber, String id) {
		return buildings_imgDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public List<BuildingsImg> search(int pageNumber, int pageSize, String searchText, String id) {
		return buildings_imgDAO.search(pageNumber, pageSize, searchText, id);
	}

	@Override
	public int searchcount(String searchText, String id) {
		return buildings_imgDAO.searchcount(searchText, id);
	}

	@Override
	public List<BuildingsImg> builds(int first, int last, String buildings_id) {
		return buildings_imgDAO.builds(first, last, buildings_id);
	}

}
