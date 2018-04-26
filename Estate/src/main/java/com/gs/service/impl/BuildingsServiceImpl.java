package com.gs.service.impl;

import java.util.List;

import com.gs.dao.BuildingsDAO;
import com.gs.pojo.Buildings;
import com.gs.pojo.Comment;
import com.gs.service.BuildingsService;

public class BuildingsServiceImpl implements BuildingsService{
	
	private BuildingsDAO buildingsDAO;

	public void setBuildingsDAO(BuildingsDAO buildingsDAO) {
		this.buildingsDAO = buildingsDAO;
	}

	@Override
	public Buildings queryById(String id) {
		return buildingsDAO.queryById(id);
	}

	@Override
	public void update(Buildings t) {
		buildingsDAO.update(t);
		
	}

	@Override
	public void add(Buildings t) {
		buildingsDAO.add(t);
		
	}

	@Override
	public List<Buildings> list(int pageSize,int pageNumber,String id) {
		List<Buildings> buildings=buildingsDAO.list(pageSize,pageNumber,id);
		return buildings;
	}

	@Override
	public List<Buildings> querylist(String id) {
		return buildingsDAO.querylist(id);
	}

	@Override
	public void delete(Buildings t) {
		buildingsDAO.delete(t);
		
	}

	@Override
	public int count(String id) {
		return buildingsDAO.count(id);
	}

	@Override
	public void updateStatus(String id, String status) {
		buildingsDAO.updateStatus(id, status);
		
	}

	@Override
	public List<Buildings> list(String id) {
		return buildingsDAO.list(id);
	}

	@Override
	public List<Buildings> buildpager(int pageSize, int pageNumber) {
		return buildingsDAO.buildpager(pageSize, pageNumber);
	}

	@Override
	public int buildcount() {
		return buildingsDAO.buildcount();
	}

	@Override
	public List<Buildings> search(int pageNumber, int pageSize, Buildings buildings) {
		return buildingsDAO.search(pageNumber, pageSize, buildings);
	}

	@Override
	public int searchcount(Buildings buildings) {
		return buildingsDAO.searchcount(buildings);
	}

	@Override
	public List<Buildings> builds(int first, int last) {
		return buildingsDAO.builds(first, last);
	}

	@Override
	public List<Buildings> allsearch(int pageNumber, int pageSize, String searchText) {
		return buildingsDAO.allsearch(pageNumber, pageSize, searchText);
	}

	@Override
	public int allsearchcount(String searchText) {
		return buildingsDAO.allsearchcount(searchText);
	}

	@Override
	public List<Buildings> search(int pageNumber, int pageSize, String searchText, String id) {
		return buildingsDAO.search(pageNumber, pageSize, searchText, id);
	}

	@Override
	public int searchcount(String searchText, String id) {
		return buildingsDAO.searchcount(searchText, id);
	}

	@Override
	public List<Buildings> dituList(String agency_id) {
		return buildingsDAO.dituList(agency_id);
	}

	@Override
	public List<Buildings> builds(int first, int last, String param) {
		return buildingsDAO.builds(first, last, param);
	}

	@Override
	public List<Comment> findComment(String Buildings_id) {
		return buildingsDAO.findComment(Buildings_id);
	}

	@Override
	public List<Buildings> findbuildings(int first, int last, String name) {
		return buildingsDAO.findbuildings(first, last, name);
	}

	@Override
	public int findbuildingscount(String name) {
		return buildingsDAO.findbuildingscount(name);
	}

	@Override
	public List findSale(String buildings_id, String date) {
		return buildingsDAO.findSale(buildings_id, date);
	}
}
