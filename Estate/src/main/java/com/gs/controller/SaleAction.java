package com.gs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.eclipse.jdt.internal.compiler.lookup.ReductionResult;

import com.alibaba.fastjson.JSON;
import com.gs.pojo.Building;
import com.gs.pojo.Buildings;
import com.gs.pojo.Customer;
import com.gs.pojo.Employee;
import com.gs.pojo.Hchart;
import com.gs.pojo.House;
import com.gs.pojo.Room;
import com.gs.pojo.Sale;
import com.gs.service.BuildingService;
import com.gs.service.BuildingsService;
import com.gs.service.CustomerService;
import com.gs.service.EmployeeService;
import com.gs.service.HouseService;
import com.gs.service.RoomService;
import com.gs.service.SaleService;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.javafx.image.impl.IntArgb;

public class SaleAction extends ActionSupport implements ServletRequestAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private Sale sale;
	private Customer customer;
	private Employee employee;
	private Room room;
	private House house;
	private Buildings buildings;
	private List<Building> buildinglist;
	private List<Room> roomlist;
	
	public List<Room> getRoomlist() {
		return roomlist;
	}
	public void setRoomlist(List<Room> roomlist) {
		this.roomlist = roomlist;
	}
	private SaleService saleService;
	private CustomerService customerService;
	private EmployeeService employeeService;
	private RoomService roomService;
	private BuildingsService buildingsService;
	private String emp_id;
	private String agency_id;
	private HouseService houseService;
	
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public List<Building> getBuildinglist() {
		return buildinglist;
	}
	public void setBuildinglist(List<Building> buildinglist) {
		this.buildinglist = buildinglist;
	}
	
	public void setBuildings(Buildings buildings) {
		this.buildings = buildings;
	}
	public Buildings getBuildings() {
		return buildings;
	}
	private String angency_id;
	public String getAngency_id() {
		return angency_id;
	}
	public void setAngency_id(String angency_id) {
		this.angency_id = angency_id;
	}
	public void setHouseService(HouseService houseService) {
		this.houseService = houseService;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public House getHouse() {
		return house;
	}
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

	public void setRoom(Room room) {
		this.room = room;
	}
	public Room getRoom() {
		return room;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	private int pageSize;
	private int pageNumber;
	private int total;
	private List<Sale> rows;
	private String searchText;
	private List<Employee> employees;
	public List<Employee> getEmployees() {
		return employees;
	}
	private String customer_name;
	private String employee_id;
	
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public Sale getSale() {
		return sale;
	}
	public void setSale(Sale sale) {
		this.sale = sale;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setSaleService(SaleService saleService) {
		this.saleService = saleService;
	}
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTotal() {
		return total;
	}
	public void setRows(List<Sale> rows) {
		this.rows = rows;
	}
	public List<Sale> getRows() {
		return rows;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	public String strap(){
		employees =saleService.findEmployee(angency_id);
		setAngency_id(angency_id);
		return "strap";
	}
	public String agencysale(){
		if (searchText!=null && !searchText.equals("")) {
			rows =saleService.search(pageNumber, pageSize, searchText, angency_id);
			total = saleService.searchcount(searchText, angency_id);
			return "agencysale";
		}else{
			rows= saleService.findSale(angency_id, pageSize, pageNumber, customer_name, employee_id);
			total = saleService.salecount(angency_id, customer_name, employee_id);
			return "agencysale";
		}
	}
	
	public String addpage() throws Exception{
		customer=customerService.queryById(customer.getId());
		employee=employeeService.queryById(customer.getEmployee_id());
		roomlist = roomService.query(employee.getBuilding_id());
		
		List<Sale> salelist = saleService.querylist(customer.getId());
		if(salelist.size()>0){
			return "list1";
		}else{
			return "addpage";
		}
	
	}
	public String add(){ 
		Timestamp d = new Timestamp(System.currentTimeMillis());
		sale.setSale_time(d);
		
		room = roomService.queryById(sale.getRoom_id());
		house = houseService.queryById(room.getHouse_id());
		
		sale.setUnit_price(house.getUnit_price());
		if(sale.getDiscount()!=null && !sale.getDiscount().equals("")){
			sale.setTotal_cost((house.getUnit_price()*house.getArea())*(sale.getDiscount()));
		}else {
			sale.setTotal_cost(house.getUnit_price()*house.getArea());
		}

		Timestamp d1 = new Timestamp(System.currentTimeMillis());
		sale.setCreated_time(d1);
		
		saleService.add(sale);
		return "add";
	}
	public String list(){
		return "list";
	}
	public String pager() throws Exception{
		if(searchText!=null && !searchText.equals("")){
			rows = saleService.searchA(pageNumber, pageSize, searchText, emp_id);
			total = saleService.searchcountA(searchText, emp_id);
			return "pager";
		}else {
			rows = saleService.list(pageSize, pageNumber, emp_id);
			total = saleService.count(emp_id);
			return "pager";
		}
		
	}
	public String update(){
		room = roomService.queryById(sale.getRoom_id());
		house = houseService.queryById(room.getHouse_id());
		if(sale.getDiscount()!=null){
			sale.setTotal_cost((sale.getUnit_price()*house.getArea())*(sale.getDiscount()));	
		}else {
			sale.setTotal_cost(sale.getUnit_price()*house.getArea());
		}
		saleService.update(sale);
		sale = saleService.queryById(sale.getId());
		return "update";
	}
	public String look(){
		sale = saleService.queryById(sale.getId());
		customer = customerService.queryById(sale.getCustomer_id());
		employee = employeeService.queryById(sale.getEmp_id());
		return "look";
	}
	public String check(){
		sale = saleService.queryById(sale.getId());
		customer = customerService.queryById(sale.getCustomer_id());
		employee = employeeService.queryById(sale.getEmp_id());
		room = roomService.queryById(sale.getRoom_id());
		house = houseService.queryById(room.getHouse_id());
		buildings = buildingsService.queryById(employee.getBuilding_id());
		return "check";
	}
	public String status(){
		sale = saleService.queryById(sale.getId());
		saleService.valid(sale.getId(), sale.getStatus());
		return "status";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	//销售记录报表
	public String sale_chart(){
		setAgency_id(agency_id);
		return "sale_chart";
	}
	public String chart() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Hchart<Double>> l = new ArrayList<Hchart<Double>>();
		@SuppressWarnings("rawtypes")
		List list = saleService.findsale(agency_id);
		for(int i=0;i<list.size();i++){
			Hchart<Double> baobiao = new Hchart<Double>();
			Double d[]=new Double[12];
			Object [] object = (Object [])list.get(i);
			for(int j=0;j<12;j++){
				d[j]=Double.parseDouble(object[j+1].toString());
			}
			baobiao.setName(object[0].toString());
			baobiao.setData(d);
			l.add(baobiao);
		}
		out.print(JSON.toJSONString(l));
		return null;
	}
}
