package com.gs.service;

import java.util.List;

import com.gs.pojo.Customer;
import com.gs.pojo.Employee;

public interface CustomerService extends BaseService<String, Customer>{
	//修改状态
	public void valid(String id,String status);
	
	//经销商员工管理
	public List<Customer> listEmp(String agency_id,int pageNumber,int pageSize,String employee_id);
	public int empCount(String agency_id,String employee_id);
	public List<Employee> listEmployee(String agency_id);
	public List<Customer> search(int pageNumber,int pageSize,String searchText,String agency_id);
	public int searchcount(String searchText,String agency_id);
	//通过手机号码查询
	public List<Customer> queryByphone(String phone);
	public List<Customer> searchA(int pageNumber,int pageSize,String searchText,String id);
	public int searchcountA(String searchText,String id);
}
