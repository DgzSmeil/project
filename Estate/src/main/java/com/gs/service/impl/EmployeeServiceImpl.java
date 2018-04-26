package com.gs.service.impl;

import java.util.List;

import com.gs.dao.EmployeeDAO;
import com.gs.pojo.Employee;
import com.gs.service.EmployeeService;

public class EmployeeServiceImpl implements EmployeeService{
	

	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	private EmployeeDAO employeeDAO;

	@Override
	public Employee queryById(String id) {
		return employeeDAO.queryById(id);
	}

	
	@Override
	public void update(Employee t) {
		employeeDAO.update(t);
		
	}

	@Override
	public void add(Employee t) {
		employeeDAO.add(t);
		
	}

	@Override
	public int count(String id) {
		return employeeDAO.count(id);
	}

	@Override
	public List<Employee> querylist(String id) {
		return employeeDAO.querylist(id);
	}

	@Override
	public void delete(Employee t) {
		employeeDAO.delete(t);
	}

	@Override
	public List<Employee> list(int pageSize, int pageNumber, String id) {
		return employeeDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void updateOther(String id, Object other) {
		employeeDAO.updateOther(id, other);
	}

	@Override
	public void updateStatus(String id, String status) {
		employeeDAO.updateStatus(id, status);
		
	}

	@Override
	public Employee login(Employee employee) {
		return employeeDAO.login(employee);
	}

	@Override
	public void updatePwd(Employee employee) {
		employeeDAO.updatePwd(employee);
	}
	
	@Override
	public List<Employee> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return employeeDAO.search(pageNumber, pageSize, searchText, agency_id);

	}

	public int searchcount(String searchText, String agency_id) {
		return employeeDAO.searchcount(searchText, agency_id);
	}

}
