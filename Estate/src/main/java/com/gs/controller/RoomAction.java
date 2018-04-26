package com.gs.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.gs.pojo.Building;

import com.gs.pojo.Employee;
import com.gs.pojo.House;
import com.gs.pojo.Room;
import com.gs.service.BuildingService;
import com.gs.service.EmployeeService;
import com.gs.service.RoomService;
import com.opensymphony.xwork2.ActionSupport;

public class RoomAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	HttpServletRequest request = ServletActionContext.getRequest();
	private Room room;
	public Room getRoom() {
		return room;
	}
	private List<House> houses;
	private List<Building> builds;
	private RoomService roomService;
	private String agency_id;
	private String emp_id;
	private String buildings_id;
	private String building_id;
	private String house_id;
	private String searchText;
	private Employee employee;
	private EmployeeService employeeService;
	private Building building;
	private BuildingService buildingService;
	private String msg;
	
	public String getMsg() {
		return msg;
	}

	public void setBuildingService(BuildingService buildingService) {
		this.buildingService = buildingService;
	}

	public String getBuildings_id() {
		return buildings_id;
	}

	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public void setBuilding(Building building) {
		this.building = building;
	}
	public Building getBuilding() {
		return building;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
	}
	public String getBuilding_id() {
		return building_id;
	}
	public String getHouse_id() {
		return house_id;
	}
	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
	public List<House> getHouses() {
		return houses;
	}
	public List<Building> getBuilds() {
		return builds;
	}
	private List<Room> rows;
	private int total;
	private int pageSize;
	private int pageNumber;
	
	public void setRoom(Room room) {
		this.room = room;
	}
	public void setHouses(List<House> houses) {
		this.houses = houses;
	}
	public void setBuilds(List<Building> builds) {
		this.builds = builds;
	}
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	//进入新增界面
	public String add(){
		houses = roomService.findHouse(agency_id);
		builds = roomService.findBuilding(agency_id);
		return "add";
	}
	//新增完毕更新数据库
	public String addsave(){
		room.setSale_status("待售中");
		roomService.add(room);
		request.setAttribute("msg", "新增成功");
		houses = roomService.findHouse(agency_id);
		builds = roomService.findBuilding(agency_id);
		
		return "addsave";
	}
	//进入修改界面
	public String update(){
		room = roomService.queryById(room.getId());
		setAgency_id(agency_id);
		return "update";
	}
	//修改完毕更新到数据库
	public String updatesave(){
		roomService.update(room);
		setAgency_id(agency_id);
		request.setAttribute("msg", "资料房号成功");
		houses = roomService.findHouse(agency_id);
		builds = roomService.findBuilding(agency_id);
		
		return "strap";
	}
	//自动新增房号
	public String selfadd(){
		houses = roomService.findHouse(agency_id);
		builds = roomService.findBuilding(agency_id);
		setAgency_id(agency_id);
		return "selfadd";
	}
	public String selfaddSave(){
		building = roomService.findBuild(room.getBuilding_id());
		for(int i=1;i<building.getTotal_floor();i++){
			for(int j=1;j<building.getFloor_rooms();j++){
				room.setName(building.getName()+"  "+i+"-"+j);
				room.setSale_status("待售中");
				roomService.add(room);
			}
		}
		request.setAttribute("msg", "新增成功");
		houses = roomService.findHouse(agency_id);
		builds = roomService.findBuilding(agency_id);
		return "selfaddSave";
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getAgency_id() {
		return agency_id;
	}
	public String strap(){
		setAgency_id(agency_id);
		houses = roomService.findHouse(agency_id);
		builds = roomService.findBuilding(agency_id);
		return "strap";
	}
	public String look(){
		if(buildings_id!=null){
			return "look";
		}else {
			setEmp_id(emp_id);
			employee = employeeService.queryById(emp_id);
			setBuildings_id(employee.getBuilding_id());
			return "look";
		}
		
	}
	public String looklist(){
		if (searchText!=null && !searchText.equals("")) {
			rows = roomService.searchA(pageNumber, pageSize, searchText, buildings_id);
			total = roomService.searchcountA(searchText, buildings_id);
			return "looklist";
		}else{
			rows= roomService.queryByRoom(pageSize, pageNumber, buildings_id);
			total = roomService.querycount(buildings_id);
			return "looklist";
		}
	}
	
	public String list(){
		if (searchText!=null && !searchText.equals("")) {
			rows = roomService.search(pageNumber, pageSize, searchText, agency_id);
			total = roomService.searchcount(searchText, agency_id);
			return "list";
		}else{
			rows= roomService.findRoom(agency_id, pageSize, pageNumber, building_id, house_id);
			total = roomService.findcount(agency_id, building_id, house_id);
			return "list";
		}
	}
	//修改销售状态
	public String updatesale_status(){
		roomService.updatesale_status(room.getId(), room.getSale_status());
		room = roomService.queryById(room.getId());
		building = buildingService.queryById(room.getBuilding_id());
		setBuildings_id(building.getBuildings_id());
		return "look1";
	}
	public String status(){
		room = roomService.queryById(room.getId());
		if(room.getSale_status().equals("销售中")){
			roomService.updatestatus(room.getId(),room.getSale_status());
			msg= "状态修改成功";
		}else{
			roomService.updatestatus(room.getId(),room.getSale_status());
			msg= "状态修改成功";
		}
		houses = roomService.findHouse(agency_id);
		builds = roomService.findBuilding(agency_id);
		return "list";
	}
	public String find(){
		
		return "find";
	}
	public List<Room> getRows() {
		return rows;
	}
	public String findroom(){
		
		return "findroom";
	}
	public void setRows(List<Room> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getPageNumber() {
		return pageNumber;
	}
}
