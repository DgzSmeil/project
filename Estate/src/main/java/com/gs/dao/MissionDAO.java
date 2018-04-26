package com.gs.dao;

import java.util.List;

import com.gs.pojo.Mission;


import com.gs.pojo.Employee;


public interface MissionDAO extends BaseDAO<String, Mission>{
	//修改员工任务
	public void updateOther(String id,Object other);
	//修改员工的完成量和公资
	public void updatesalary(String id,int sales,double salary);
	public List<Mission> search1(int pageNumber,int pageSize,String searchText,String id);
	public int searchcount1(String searchText,String id);
	
	public List<Employee> findEmployee(String agency_id);
	public List<Mission> findSalary(String agency_id,int Number,int pageSize,String employee_id ,String months);
	public int countSalary(String agency_id,String employee_id,String month);
	
	public List<Mission> search(int pageNumber,int pageSize,String searchText,String agency_id);
	public int searchcount(String searchText,String agency_id);
}
