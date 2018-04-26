package com.gs.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.gs.pojo.Buildings;
import com.gs.pojo.Employee;
import com.gs.pojo.House;
import com.gs.pojo.User;
import com.gs.service.BuildingsService;
import com.gs.service.EmployeeService;
import com.gs.service.HouseService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class HouseAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	private House house;
	private HouseService houseService;
	private String agency_id;
	private int pageSize;
	private int pageNumber;
	private int total;
	private List<House> rows;
	private String buildings_id;
	private String id;
	private List list;
	private Buildings builds=null;
	private List<Employee> employeelist;
	private EmployeeService employeeService;
	private String house_id;
	private List<House> houses;
	private String searchText;
	private Map session;
	private User user;
	private List<Buildings> buildings;
	private BuildingsService buildingsService;
	private String imageFileName;
	private String imageContentType = "jpg";
	private File upload;
	private String msg;
	public String getMsg() {
		return msg;
	}
	public List<Employee> getEmployeelist() {
		return employeelist;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getHouse_id() {
		return house_id;
	}
	public List<House> getHouses() {
		return houses;
	}
	public void setHouses(List<House> houses) {
		this.houses = houses;
	}
	public List<Buildings> getBuildings() {
		return buildings;
	}
	public void setBuildings(List<Buildings> buildings) {
		this.buildings = buildings;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<House> getRows() {
		return rows;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public int getTotal() {
		return total;
	}
	public Buildings getBuilds() {
		return builds;
	}
	public void setBuilds(Buildings builds) {
		this.builds = builds;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setRows(List<House> rows) {
		this.rows = rows;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public House getHouse() {
		return house;
	}
	public List getList() {
		return list;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public void setList(List list) {
		this.list = list;
	}
	public void setHouseService(HouseService houseService) {
		this.houseService = houseService;
	}
	public String strap(){
		System.out.println("123");
		setAgency_id(agency_id);
		houses = houseService.findHouse(agency_id);
		buildings = houseService.findBuildings(agency_id);
		return "strap";
	}
	
	public String list() throws Exception{
		if (searchText!=null && !searchText.equals("")) {
			rows = houseService.search(pageNumber, pageSize, searchText, agency_id);
			total = houseService.searchcount(searchText, agency_id);
			return "list";
		}else{
			rows=houseService.findHouse(agency_id, pageSize, pageNumber, house_id, buildings_id);
			total=houseService.findcount(agency_id, house_id, buildings_id);
			return "list";
		}
			
		
	}
	
	//更改状态
		public String status(){
			house = houseService.queryById(house.getId());
			if(house.getStatus().equals("Y")){
				houseService.updatestatus(house.getId(),house.getStatus());
				msg="修改状态成功";
			}else{
				houseService.updatestatus(house.getId(),house.getStatus());
				msg="修改状态成功";
			}
			return "list";
		}
		
		//进入新增界面
		public String add(){
			System.out.println("正在进入");
			list = houseService.querylist(agency_id);
			return "add";
		}
		
		//新增成功
		public String addsave(){
			Date currentTime = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String dateString = formatter.format(currentTime);
			imageFileName = dateString;
			HttpServletRequest request = ServletActionContext.getRequest();
			String realpath = request.getRealPath("/upload");
			if (upload != null) {
				File savefile = new File(new File(realpath), imageFileName + "." + imageContentType);
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				try {
					FileUtils.copyFile(upload, savefile);
				} catch (IOException e) {
					e.printStackTrace();
				}
				ActionContext.getContext().put("message", "上传文件成功");
				String path = imageFileName;
				path += "." + imageContentType;
				request.setAttribute("msg", "新增成功");
				
				house.setLogo(path);
			}
			
			
			house.setCreated_time(new Date());
			house.setStatus("Y");
			houseService.add(house);
			rows=houseService.list(pageSize, pageNumber, agency_id);
			total=houseService.count(agency_id);
			houses = houseService.findHouse(agency_id);
			buildings = houseService.findBuildings(agency_id);
			return "addsave";
		}
		public File getUpload() {
			return upload;
		}
		public void setUpload(File upload) {
			this.upload = upload;
		}
		//进入修改界面
		public String update(){
			System.out.println(111);
			setHouse(houseService.queryById(id));
			return "update";
		}
		//修改成功
		public String updatesave(){
			Date currentTime = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String dateString = formatter.format(currentTime);
			imageFileName = dateString;
			HttpServletRequest request = ServletActionContext.getRequest();
			String realpath = request.getRealPath("/upload");
			if (upload != null) {
				File savefile = new File(new File(realpath), imageFileName + "." + imageContentType);
				if (!savefile.getParentFile().exists())
					savefile.getParentFile().mkdirs();
				try {
					FileUtils.copyFile(upload, savefile);
				} catch (IOException e) {
					e.printStackTrace();
				}
				ActionContext.getContext().put("message", "上传文件成功");
				String path = imageFileName;
				path += "." + imageContentType;
				house.setLogo(path);
				
			}
			
			houseService.update(house);
			rows=houseService.list(pageSize, pageNumber, agency_id);
			total=houseService.count(agency_id);
			request.setAttribute("msg", "资料修改成功");
			houses = houseService.findHouse(agency_id);
			buildings = houseService.findBuildings(agency_id);
			return "updatesave";
		}
	//manager start
		public String mgnhousepage() throws Exception {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			session.setAttribute("buildingsid",house.getBuildings_id());
			return "mgnhousepage";
		}
		public String mgnhousepager() throws Exception {
			rows=houseService.housepager(pageNumber, pageSize);
			total=houseService.housecount(pageNumber, pageSize);
			return "returnjson";
		}
		public String lookHouse(){
			house = houseService.queryById(id);
			return "lookHouse";
		}
		//前台页面显示所有户型
		public String all(){
			user=(User)session.get("user");
			rows = houseService.list(buildings_id);
			total = houseService.count2(buildings_id);
			buildings = buildingsService.builds(0, 4);
			return "all";
		}
		//前台查看单个户型
		public String look(){
			user=(User)session.get("user");
			house = houseService.queryById(house.getId());
			builds = buildingsService.queryById(house.getBuildings_id());
			employeelist = employeeService.querylist(builds.getAgency_id());
			buildings = buildingsService.builds(0, 4);
			return "look";
		}
		
}
