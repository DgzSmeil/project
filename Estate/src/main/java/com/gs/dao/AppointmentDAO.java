package com.gs.dao;

import java.util.Date;
import java.util.List;

import com.gs.pojo.Appointment;
import com.gs.pojo.Employee;
import com.gs.pojo.House;

public interface AppointmentDAO extends BaseDAO<String, Appointment>{
	//修改状态
	public void valid(String id,String status);
	public void app_status(String id,Date arrive_time,String app_status);
	
	public List<Appointment> search(int pageNumber,int pageSize,String searchText,String agency_id);
	public int searchcount(String searchText,String agency_id);
	
	public List<Appointment> search1(int pageNumber,int pageSize,String searchText,String id);
	public int searchcount1(String searchText,String id);
	
	public List<House> findHouse(String agency_id);
	public List<Employee> findEmployee(String agency_id);
	public List<Appointment> findAppointment(String angency_id,int pageSize,int pageNumber, String employee_id,String house_id);
	public int appointmentcount(String angency_id, String employee_id,String house_id);
	public Appointment queryId(String house_id,String user_id);
	
	public List<Appointment> listByUser_id(int pageSize,int pageNumber,String user_id);
	public int countByUser_id(String user_id);
}
