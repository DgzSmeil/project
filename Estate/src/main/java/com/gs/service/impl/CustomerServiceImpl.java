package com.gs.service.impl;


import java.util.List;

import com.gs.dao.CustomerDAO;
import com.gs.pojo.Customer;
import com.gs.pojo.Employee;
import com.gs.pojo.Sale;
import com.gs.service.CustomerService;

public class CustomerServiceImpl implements CustomerService{
	private CustomerDAO customerDAO;

	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	@Override
	public Customer queryById(String id) {
		return customerDAO.queryById(id);
	}

	@Override
	public List<Customer> querylist(String id) {
		return customerDAO.querylist(id);
	}

	@Override
	public List<Customer> list(int pageSize, int pageNumber, String id) {
		return customerDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void update(Customer t) {
		customerDAO.update(t);
	}

	@Override
	public void add(Customer t) {
		customerDAO.add(t);
	}

	@Override
	public void delete(Customer t) {
		customerDAO.delete(t);
	}

	@Override
	public int count(String id) {
		return customerDAO.count(id);
	}

	@Override
	public void valid(String id, String status) {
		customerDAO.valid(id, status);
	}

	@Override
	public List<Customer> listEmp(String agency_id, int pageNumber, int pageSize,String employee_id) {
		return customerDAO.listEmp(agency_id, pageNumber, pageSize, employee_id);
	}

	@Override
	public int empCount(String agency_id,String employee_id) {
		return customerDAO.empCount(agency_id, employee_id);
	}

	@Override
	public List<Employee> listEmployee(String agency_id) {
		return customerDAO.listEmployee(agency_id);
	}

	@Override
	public List<Customer> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return customerDAO.search(pageNumber, pageSize, searchText, agency_id);
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		return customerDAO.searchcount(searchText, agency_id);
	}

	@Override
	public List<Customer> queryByphone(String phone) {
		return customerDAO.queryByphone(phone);
	}

	@Override
	public List<Customer> searchA(int pageNumber, int pageSize, String searchText, String id) {
		return customerDAO.searchA(pageNumber, pageSize, searchText, id);
	}

	@Override
	public int searchcountA(String searchText, String id) {
		return customerDAO.searchcountA(searchText, id);
	}
	

}
