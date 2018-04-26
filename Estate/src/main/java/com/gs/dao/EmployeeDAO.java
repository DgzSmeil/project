package com.gs.dao;


import java.util.List;

import com.gs.pojo.Employee;

public interface EmployeeDAO extends BaseDAO<String, Employee>{
	//加减基本工资
	public void updateOther(String id,Object other);
	//状态
	public void updateStatus(String id,String status);
	//员工登录
	public Employee login(Employee employee);
	//修改密码
	public void updatePwd(Employee employee);
	
	public List<Employee> search(int pageNumber,int pageSize,String searchText,String agency_id);
	public int searchcount(String searchText,String agency_id);

}
