package com.gs.service.impl;

import java.util.List;

import com.gs.dao.MissionDAO;
import com.gs.pojo.Employee;
import com.gs.pojo.Mission;
import com.gs.service.MissionService;

public class MissionServiceImpl implements MissionService{
	private MissionDAO missionDAO;
	public void setMissionDAO(MissionDAO missionDAO) {
		this.missionDAO = missionDAO;
	}
	@Override
	public Mission queryById(String id) {
		return missionDAO.queryById(id);
	}

	@Override
	public List<Mission> querylist(String id) {
		return missionDAO.querylist(id);
	}

	@Override
	public List<Mission> list(int pageSize, int pageNumber, String id) {
		return missionDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void update(Mission t) {
		missionDAO.update(t);
	}

	@Override
	public void add(Mission t) {
		missionDAO.add(t);
	}

	@Override
	public void delete(Mission t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		return missionDAO.count(id);
	}
	@Override
	public void updateOther(String id, Object other) {
		missionDAO.updateOther(id, other);
		
	}
	@Override
	public void updatesalary(String id, int sales, double salary) {
		missionDAO.updatesalary(id, sales, salary);
	}
	@Override
	public List<Mission> search1(int pageNumber, int pageSize, String searchText, String id) {
		return missionDAO.search1(pageNumber, pageSize, searchText, id);
	}
	@Override
	public int searchcount1(String searchText, String id) {
		return missionDAO.searchcount1(searchText, id);
	}

	@Override
	public List<Employee> findEmployee(String agency_id) {
		return missionDAO.findEmployee(agency_id);
	}
	@Override
	public List<Mission> findSalary(String agency_id, int Number, int pageSize, String employee_id,String month) {
		return missionDAO.findSalary(agency_id, Number, pageSize, employee_id,month);
	}
	@Override
	public int countSalary(String agency_id, String employee_id,String month) {
		return missionDAO.countSalary(agency_id, employee_id, month);
	}
	@Override
	public List<Mission> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return missionDAO.search(pageNumber, pageSize, searchText, agency_id);
	}
	@Override
	public int searchcount(String searchText, String agency_id) {
		return missionDAO.searchcount(searchText, agency_id);
	}
}
