package com.gs.service.impl;

import java.sql.Date;
import java.util.List;

import com.gs.dao.AgencyDAO;
import com.gs.pojo.Agency;
import com.gs.service.AgencyService;

public class AgencyServiceImpl implements AgencyService {
	
	private AgencyDAO agencyDAO;
	
	public void setAgencyDAO(AgencyDAO agencyDAO) {
		this.agencyDAO = agencyDAO;
	}

	public Agency queryById(String id) {
		return agencyDAO.queryById(id);
	}

	public void update(Agency t) {
		agencyDAO.update(t);
		
	}

	public void add(Agency t) {
		agencyDAO.add(t);
		
	}

	@Override
	 public Agency login(Agency agency) {  
		return agencyDAO.login(agency);
    }

	@Override
	public void updataPwd(Agency t) {
		agencyDAO.updataPwd(t);
	}

	@Override
	public List<Agency> querylist(String id) {
		return agencyDAO.querylist(id);
	}


	@Override
	public void delete(Agency t) {
		agencyDAO.delete(t);
		
	}

	

	@Override
	public int count(String id) {
		return agencyDAO.count(id);
	}

	@Override
	public Agency query(String name, String email, String phone) {
		return agencyDAO.query(name, email, phone);
	}

	@Override
	public List<Agency> list(int pageSize, int pageNumber, String id) {
		return agencyDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public List<Agency> agencylist(int pageNumber, int pageSize) {
		return agencyDAO.agencylist(pageNumber, pageSize);
	}

	@Override
	public int agencycount() {
		return agencyDAO.agencycount();
	}

	@Override
	public void agencyupdate(Agency agency) {
		agencyDAO.agencyupdate(agency);
	}

	@Override
	public List<Agency> agcCklist(int pageNumber, int pageSize, String checked) {
		return agencyDAO.agcCklist(pageNumber, pageSize, checked);
	}

	@Override
	public int agcCKcount(String checked) {
		return agencyDAO.agcCKcount(checked);
	}

	@Override
	public void active(String id) {
		agencyDAO.active(id);
	}

	@Override
	public void inactive(String id) {
		agencyDAO.inactive(id);
	}

	@Override
	public void checked(String id) {
		agencyDAO.checked(id);
	}

	@Override
	public void unchecked(String id,String reason) {
		agencyDAO.unchecked(id,reason);
	}

	@Override
	public List<Agency> search(int pageNumber, int pageSize, Agency agency) {
		return agencyDAO.search(pageNumber, pageSize, agency);
	}

	@Override
	public int searchcount(Agency agency) {
		return agencyDAO.searchcount(agency);
	}

	@Override
	public void delbytime(Date starttime, Date endtime) {
		agencyDAO.delbytime(starttime, endtime);
	}

	@Override
	public void delbyid(String id) {
		agencyDAO.delbyid(id);
	}

	@Override
	public List<Agency> allsearch(int pageNumber, int pageSize, String searchText) {
		return agencyDAO.allsearch(pageNumber, pageSize, searchText);
	}

	@Override
	public int allsearchcount(String searchText) {
		return agencyDAO.allsearchcount(searchText);
	}

	@Override
	public List<Agency> builds(int first, int last) {
		return agencyDAO.builds(first, last);
	}
	

}
