package com.gs.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.gs.pojo.Building;
import com.gs.pojo.Buildings;
import com.gs.service.BuildingService;
import com.opensymphony.xwork2.ActionSupport;


public class BuildingAction extends ActionSupport{
	
	private static final long serialVersionUID = -4730850336004316237L;
	Building building;
	BuildingService buildingService;
	int total;//总记录数
	List<Building> rows;//所有数据
	int pageSize;//每页显示数
	int pageNumber;//第几页
	String id;
	String name;
	String status;
	String agency_id;
	List<Buildings> buildings;
	List<Building> buildList;
	String building_id;
	String searchText;
	String msg;
	public String getMsg() {
		return msg;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getBuilding_id() {
		return building_id;
	}

	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
	}

	public List<Building> getBuildList() {
		return buildList;
	}

	public void setBuildList(List<Building> buildList) {
		this.buildList = buildList;
	}

	public String getAgency_id() {
		return agency_id;
	}

	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	HttpServletRequest request = ServletActionContext.getRequest();
	public void setName(String name) {
		this.name = name;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setId(String id) {
		this.id = id;
	}
	private String buildings_id;//楼盘id
	
	public List<Building> getRows() {
		return rows;
	}

	public void setRows(List<Building> rows) {
		this.rows = rows;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}

	public Building getBuilding() {
		return building;
	}
	public void setBuilding(Building building) {
		this.building = building;
	}
	public void setBuildingService(BuildingService buildingService) {
		this.buildingService = buildingService;
	}
	//进入主页
	public String strap(){
		setAgency_id(agency_id);
		setBuildings(buildingService.findbuildings(agency_id));
		setBuildList(buildingService.findbuilding(agency_id));
		return "strap";
	}
	//进入新增界面
	public String add(){
		setBuildings(buildingService.findbuildings(agency_id));
		setAgency_id(agency_id);
		return "add";
	}
	
	public List<Buildings> getBuildings() {
		return buildings;
	}

	public void setBuildings(List<Buildings> buildings) {
		this.buildings = buildings;
	}

	//新增成功
	public String addsave(){
		building.setCreated_time(new Date());
		building.setStatus("Y");
		buildingService.add(building);
		setAgency_id(agency_id);
		request.setAttribute("msg", "新增成功");
		setBuildings(buildingService.findbuildings(agency_id));
		setBuildList(buildingService.findbuilding(agency_id));
		return "addsave";
	}
	//进入修改界面
	public String update(){
		System.out.println(111);
		setBuilding(buildingService.queryById(id));
		setAgency_id(agency_id);
		return "update";
	}
	
	public String updatesave(){
		buildingService.update(building);
		building =buildingService.queryById(building.getId());
		setAgency_id(agency_id);
		setBuildings(buildingService.findbuildings(agency_id));
		setBuildList(buildingService.findbuilding(agency_id));
		request.setAttribute("msg", "资料修改成功");
		return "updatesave";
	}
	//主页返回处理
	public String list(){
		if (searchText!=null && !searchText.equals("")) {
			rows =buildingService.search(pageNumber, pageSize, searchText, agency_id);
			total =buildingService.searchcount(searchText, agency_id);
			return "list";
		}else{
			rows=buildingService.queryByPager(pageSize, pageNumber, agency_id,building_id,buildings_id);
			total=buildingService.count(agency_id,building_id,buildings_id);
			return "list";
		}
			
	}
	//更改状态
	public String status(){
		building =buildingService.queryById(building.getId());
		if(building.getStatus().equals("Y")){
			buildingService.updatestatus(building.getId(), building.getStatus());
			msg = "状态修改成功！";
		}else{
			buildingService.updatestatus(building.getId(), building.getStatus());
			msg = "状态修改成功！";
		}
		
		return "list";
	}
	
	
}
