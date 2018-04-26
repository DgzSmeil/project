package com.gs.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.SessionAware;

import com.gs.pojo.Appointment;
import com.gs.pojo.Customer;
import com.gs.pojo.Employee;
import com.gs.pojo.House;
import com.gs.pojo.User;
import com.gs.service.AppointmentService;
import com.gs.service.CustomerService;
import com.gs.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class AppointmentAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	private String angency_id;
	private int pageSize;
	private int pageNumber;
	private int total;
	private List<Appointment> rows;
	private String house_id;
	private String employee_id;
	private AppointmentService appointmentService;
	
	private List<House> houses;
	private List<Employee> employees;
	private String msg;
	private Map session;
	private String user_id;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMsg() {
		return msg;
	}
	public String getSearchText() {
		return searchText;
	}
	public List<House> getHouses() {
		return houses;
	}
	public void setHouses(List<House> houses) {
		this.houses = houses;
	}
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	public int getTotal() {
		return total;
	}
	public List<Appointment> getRows() {
		return rows;
	}

	public void setAppointmentService(AppointmentService appointmentService) {
		this.appointmentService = appointmentService;
	}
	public String getHouse_id() {
		return house_id;
	}
	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public void setRows(List<Appointment> rows) {
		this.rows = rows;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	public String getAngency_id() {
		return angency_id;
	}
	public void setAngency_id(String angency_id) {
		this.angency_id = angency_id;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public String strap(){
		setAngency_id(angency_id);
		houses = appointmentService.findHouse(angency_id);
		employees = appointmentService.findEmployee(angency_id);
		return "strap";
	}
	
	public String listagency(){
		if (searchText!=null && !searchText.equals("")) {
			rows = appointmentService.search(pageNumber, pageSize, searchText, angency_id);
			total = appointmentService.searchcount(searchText, angency_id);
			return "listagency";
		}else{
			rows = appointmentService.findAppointment(angency_id, pageSize, pageNumber, employee_id, house_id);
			total = appointmentService.appointmentcount(angency_id, employee_id, house_id);
			return "listagency";
		}
		
	}
	
	//guanliyuan
	private HttpServletRequest request;
	private Appointment appointment;
	private User user;
	private CustomerService customerService;
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	private UserService userService;
	private String searchText;
	
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	private String emp_id;
	
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public AppointmentService getAppointmentService() {
		return appointmentService;
	}
	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}
	public Appointment getAppointment() {
		return appointment;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	//判断是否为已添加客户
	public String judge(){
		appointment = appointmentService.queryById(appointment.getId());
		user = userService.queryById(appointment.getUser_id());
		List<Customer> customer = customerService.queryByphone(user.getPhone());
		if(customer!=null){
			System.out.println(appointment.getEmp_id());
			return "list1";
		}else {
			return "judge";
		}
		
	}
	public String list(){
		return "list";
	}
	public String pager(){
		if(searchText!=null && !searchText.equals("")){
			rows = appointmentService.search1(pageNumber, pageSize, searchText, emp_id);
			total = appointmentService.searchcount1(searchText, emp_id);
			return "pager";
		}else {
			rows=appointmentService.list(pageSize, pageNumber, emp_id);
			total=appointmentService.count(emp_id);
			return "pager";
		}
	}
	public String update(){
		appointmentService.app_status(appointment.getId(), appointment.getArrive_time(), appointment.getApp_status());
		appointment = appointmentService.queryById(appointment.getId());
		return "update";
	}
	public String status(){
		appointment = appointmentService.queryById(appointment.getId());
		appointmentService.valid(appointment.getId(), appointment.getStatus());
		return "status";
	}
	//添加预约
	public String add(){
		String house_id=appointment.getHouse_id();
		String user_id=appointment.getUser_id();
		String emp_id=appointment.getEmp_id();
		Date time= appointment.getApp_arrive_time();
		appointment = appointmentService.queryId(house_id, user_id);
		if(appointment==null){
			Appointment appointment1 = new Appointment();
			appointment1.setHouse_id(house_id);
			appointment1.setUser_id(user_id);
			appointment1.setEmp_id(emp_id);
			appointment1.setApp_arrive_time(time);
			appointment1.setApp_status("已预约");
			appointment1.setStatus("Y");
			appointment1.setCreated_time(new Date());
			appointmentService.add(appointment1);
			msg="预约成功！";
			return "add";
		}else{
			msg="亲，您已经预约该楼盘了(*^_^*)";
			return "add";
		}
		
	}
	//我的预约
	public String myall() throws Exception{
		user=(User)session.get("user");
		return "myall";
	}
	public String myall2() throws Exception{
		rows = appointmentService.listByUser_id(pageSize, pageNumber, user_id);
		total = appointmentService.countByUser_id(user_id);
		return "myall2";
	}
	public String del(){
		appointmentService.valid(appointment.getId(), "Y");
		msg = "已成功取消预约";
		return "add";
	}
	
	
	
	
	
}
