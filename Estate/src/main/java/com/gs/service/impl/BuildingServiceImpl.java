package com.gs.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.BuildingDAO;
import com.gs.pojo.Building;
import com.gs.pojo.Buildings;
import com.gs.service.BuildingService;

public class BuildingServiceImpl implements BuildingService{
	
	BuildingDAO buildingDAO;
	
	public BuildingDAO getBuildingDAO() {
		return buildingDAO;
	}

	public void setBuildingDAO(BuildingDAO buildingDAO) {
		this.buildingDAO = buildingDAO;
	}

	@Override
	public Building queryById(String id) {
		return buildingDAO.queryById(id);
	}


	@Override
	public void update(Building t) {
		buildingDAO.update(t);
	}

	@Override
	public void add(Building t) {
		buildingDAO.add(t);
	}


	@Override
	public int count(String buildings_id) {
		
		return buildingDAO.count(buildings_id);
	}

	@Override
	public List<Building> queryByPager(int pageSize,int pageNumber, String agency_id,String name,String status) {
		return buildingDAO.queryByPager(pageSize, pageNumber, agency_id,name,status);
	}

	@Override
	public List<Building> querylist(String id) {
		return buildingDAO.querylist(id);
	}

	@Override
	public List<Building> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Building t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatestatus(String id, String status) {
		buildingDAO.updatestatus(id, status);
	}

	@Override
	public int count(String agency_id, String name, String status) {
		return buildingDAO.count(agency_id, name, status);
	}

	@Override
	public List<Buildings> findbuildings(String agency_id) {
		return buildingDAO.findbuildings(agency_id);
	}

	@Override
	public List<Building> findbuilding(String agency_id) {
		return buildingDAO.findbuilding(agency_id);
	}

	@Override
	public List<Building> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return  buildingDAO.search(pageNumber, pageSize, searchText, agency_id);
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		return buildingDAO.searchcount(searchText, agency_id);
	}
	
	@Override
	public List<Building> builds(String buildings_id, int first, int last) {
		return buildingDAO.builds(buildings_id, first, last);
	}

	
}
