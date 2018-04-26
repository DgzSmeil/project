package com.gs.service.impl;

import java.util.Date;
import java.util.List;

import com.gs.dao.AppointmentDAO;
import com.gs.pojo.Appointment;
import com.gs.pojo.Employee;
import com.gs.pojo.House;
import com.gs.service.AppointmentService;

public class AppointmentServiceImpl implements AppointmentService{
	private AppointmentDAO appointmentDAO;
	public void setAppointmentDAO(AppointmentDAO appointmentDAO) {
		this.appointmentDAO = appointmentDAO;
	}
	@Override
	public Appointment queryById(String id) {
		return appointmentDAO.queryById(id);
	}

	@Override
	public List<Appointment> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Appointment> list(int pageSize, int pageNumber, String id) {
		return appointmentDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void update(Appointment t) {
		appointmentDAO.update(t);
	}

	@Override
	public void add(Appointment t) {
		appointmentDAO.add(t);
	}

	@Override
	public void delete(Appointment t) {
		appointmentDAO.delete(t);
	}

	@Override
	public int count(String id) {
		return appointmentDAO.count(id);
	}
	@Override
	public void valid(String id, String status) {
		appointmentDAO.valid(id, status);
		
	}
	@Override
	public void app_status(String id,Date arrive_time, String app_status) {
		appointmentDAO.app_status(id, arrive_time, app_status);
		
	}
	@Override
	public List<Appointment> search1(int pageNumber, int pageSize, String searchText, String id) {
		return appointmentDAO.search1(pageNumber, pageSize, searchText, id);
	}
	@Override
	public int searchcount1(String searchText, String id) {
		return appointmentDAO.searchcount1(searchText, id);
	}

	@Override
	public List<Appointment> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return appointmentDAO.search(pageNumber, pageSize, searchText, agency_id);
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		return appointmentDAO.searchcount(searchText, agency_id);
	}
	@Override
	public List<House> findHouse(String agency_id) {
		return appointmentDAO.findHouse(agency_id);
	}
	@Override
	public List<Employee> findEmployee(String agency_id) {
		return appointmentDAO.findEmployee(agency_id);
	}
	@Override
	public List<Appointment> findAppointment(String angency_id, int pageSize, int pageNumber, String employee_id,
			String house_id) {
		return appointmentDAO.findAppointment(angency_id, pageSize, pageNumber, employee_id, house_id);
	}
	@Override
	public int appointmentcount(String angency_id, String employee_id, String house_id) {
		return appointmentDAO.appointmentcount(angency_id, employee_id, house_id);
	}
	@Override
	public Appointment queryId(String house_id, String user_id) {
		return appointmentDAO.queryId(house_id, user_id);
	}
	@Override
	public List<Appointment> listByUser_id(int pageSize, int pageNumber, String user_id) {
		return appointmentDAO.listByUser_id(pageSize, pageNumber, user_id);
	}
	@Override
	public int countByUser_id(String user_id) {
		return appointmentDAO.countByUser_id(user_id);
	}
	
	
}
