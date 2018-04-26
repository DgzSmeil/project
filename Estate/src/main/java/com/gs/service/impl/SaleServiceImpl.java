package com.gs.service.impl;

import java.util.List;

import com.gs.dao.SaleDAO;
import com.gs.pojo.Employee;
import com.gs.pojo.Hchart;
import com.gs.pojo.Sale;
import com.gs.service.SaleService;

public class SaleServiceImpl implements SaleService{
	private SaleDAO saleDAO;
	public void setSaleDAO(SaleDAO saleDAO) {
		this.saleDAO = saleDAO;
	}
	@Override
	public Sale queryById(String id) {
		return saleDAO.queryById(id);
	}

	@Override
	public List<Sale> querylist(String id) {
		return saleDAO.querylist(id);
	}

	@Override
	public List<Sale> list(int pageSize, int pageNumber, String id) {
		return saleDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void update(Sale t) {
		saleDAO.update(t);
	}

	@Override
	public void add(Sale t) {
		saleDAO.add(t);
	}

	@Override
	public void delete(Sale t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		return saleDAO.count(id);
	}
	@Override
	public void valid(String id, String status) {
		saleDAO.valid(id, status);
	}
	@Override
	public double total_cost(String id) {
		return saleDAO.total_cost(id);
	}
	@Override
	public List<Sale> querylist1(String id) {
		return saleDAO.querylist1(id);
	}
	@Override
	public List<Sale> searchA(int pageNumber, int pageSize, String searchText, String id) {
		return saleDAO.searchA(pageNumber, pageSize, searchText, id);
	}
	@Override
	public List<Sale> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return saleDAO.search(pageNumber, pageSize, searchText, agency_id);
	}
	@Override
	public int searchcountA(String searchText, String id) {
		return saleDAO.searchcountA(searchText, id);
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		return saleDAO.searchcount(searchText, agency_id);
	}
	@Override
	public List<Employee> findEmployee(String agency_id) {
		return saleDAO.findEmployee(agency_id);
	}
	@Override
	public int salecount(String agency_id, String name, String employee_id) {
		return saleDAO.salecount(agency_id, name, employee_id);
	}
	@Override
	public List<Sale> findSale(String agency_id, int pageSize, int pageNumber, String name, String employee_id) {
		return saleDAO.findSale(agency_id, pageSize, pageNumber, name, employee_id);
	}
	@Override
	public List findsale(String agency_id) {
		return saleDAO.findsale(agency_id);
	}
	@Override
	public int findcount(String emp_id, String yearmonth) {
		return saleDAO.findcount(emp_id, yearmonth);
	}
	@Override
	public List querybysale(String emp_id) {
		return saleDAO.querybysale(emp_id);
	}

}
