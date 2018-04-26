package com.gs.service.impl;

import java.util.List;

import com.gs.dao.HouseDAO;
import com.gs.pojo.Buildings;
import com.gs.pojo.House;
import com.gs.service.HouseService;

public class HouseServiceImpl implements HouseService{

	HouseDAO houseDAO;
	

	public HouseDAO getHouseDAO() {
		return houseDAO;
	}


	public void setHouseDAO(HouseDAO houseDAO) {
		this.houseDAO = houseDAO;
	}


	@Override
	public House queryById(String id) {
		return houseDAO.queryById(id);
	}


	@Override
	public List querylist(String id) {
		return houseDAO.querylist(id);
	}


	@Override
	public List<House> list(int pageSize, int pageNumber, String id) {
		return houseDAO.list(pageSize, pageNumber, id);
	}


	@Override
	public void update(House t) {
		houseDAO.update(t);
	}


	@Override
	public void add(House t) {
		houseDAO.add(t);
	}


	@Override
	public void delete(House t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {

		return houseDAO.count(id);
	}


	@Override
	public void updatestatus(String id, String status) {
		houseDAO.updatestatus(id, status);
	}






	@Override
	public Buildings find(String name) {
		return houseDAO.find(name);
	}




	@Override
	public List findAgency(String id, int pageSize, int pageNumber) {
		return null;
	}


	@Override
	public List<House> findHouse(String id, int pageSize, int pageNumber, String name, String buildings_name) {
		return houseDAO.findHouse(id, pageSize, pageNumber, name, buildings_name);
	}

	@Override
	public int findcount(String agency_id, String name, String buildings_name) {
		return houseDAO.findcount(agency_id, name, buildings_name);
	}


	@Override
	public List<House> housepager(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return houseDAO.housepager(pageNumber, pageSize);
	}


	@Override
	public int housecount(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return houseDAO.housecount(pageNumber, pageSize);
	}


	@Override
	public List<Buildings> findBuildings(String agency_id) {
		return houseDAO.findBuildings(agency_id);
	}


	@Override
	public List<House> findHouse(String agency_id) {
		return houseDAO.findHouse(agency_id);
	}


	@Override
	public List<House> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return houseDAO.search(pageNumber, pageSize, searchText, agency_id);
	}
	@Override
	public List<House> builds(String buildings_id, int first, int last) {
		return houseDAO.builds(buildings_id, first, last);
	}


	@Override
	public int searchcount(String searchText, String agency_id) {
		return houseDAO.searchcount(searchText, agency_id);
	}


	@Override
	public List<House> list(String buildings_id) {
		return houseDAO.list(buildings_id);
	}


	@Override
	public int count2(String buildings_id) {
		return houseDAO.count2(buildings_id);
	}








}
