package com.gs.dao;

import java.util.List;

import com.gs.pojo.Employee;
import com.gs.pojo.Hchart;
import com.gs.pojo.Sale;

public interface SaleDAO extends BaseDAO<String, Sale>{
	//修改状态
	public void valid(String id,String status);
	//查看某月销售记录
	public List findsale(String agency_id);
	public List querybysale(String emp_id);
	public List<Sale> search(int pageNumber,int pageSize,String searchText,String agency_id);
	public int searchcount(String searchText,String agency_id);
	//计算当月累计销售总和
	public double total_cost(String id);
	//查看某月员工销量
	public int findcount(String emp_id,String yearmonth);
	//条件查看销售记录
	public List<Sale> querylist1(String id);
	public List<Sale> searchA(int pageNumber,int pageSize,String searchText,String id);
	public int searchcountA(String searchText,String id);

	List<Employee> findEmployee(String agency_id);

	int salecount(String agency_id, String name, String employee_id);

	List<Sale> findSale(String agency_id, int pageSize, int pageNumber, String name, String employee_id);
	
	
	
	
}
