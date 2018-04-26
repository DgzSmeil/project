package com.gs.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;
import com.gs.pojo.Employee;
import com.gs.service.AgencyService;
import com.gs.service.BuildingsService;
import com.gs.service.EmployeeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAction extends ActionSupport implements ServletRequestAware{

	
	private static final long serialVersionUID = 4997036664719505680L;
	
	private Employee employee;
	private Agency agency;
	private Buildings buildings;
	public Buildings getBuildings() {
		return buildings;
	}
	public void setBuildings(Buildings buildings) {
		this.buildings = buildings;
	}
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	private EmployeeService employeeService;
	private BuildingsService buildingsService;
	private int pageSize;
	private int pageNumber;
	private int total;//每页显示数
	private List<Employee> rows;//第几页
	private String agency_id;
	private String id;
	private AgencyService agencyService;
	public String getMsg() {
		return msg;
	}
	private String searchText;
	private String msg;
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public List<Employee> getRows() {
		return rows;
	}
	public void setRows(List<Employee> rows) {
		this.rows = rows;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setAgencyService(AgencyService agencyService) {
		this.agencyService = agencyService;
	}
	private String imageFileName;
	private File upload;
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	private String imageContentType = "jpg";
	
	public int getTotal() {
		return total;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Agency getAgency() {
		return agency;
	}
	public void setAgency(Agency agency) {
		this.agency = agency;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	private HttpServletRequest request; 
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	//员工管理
	public String list(){
		return "list";
	}
	public String myemployees() {
		if (searchText!=null && !searchText.equals("")) {
			rows = employeeService.search(pageNumber, pageSize, searchText, agency_id);
			total = employeeService.searchcount(searchText, agency_id);
			return "myemployees";
		}else{
			rows=employeeService.list(pageSize, pageNumber, agency_id);
			total=employeeService.count(agency_id);
			return "myemployees";
		}
		
	}
	//进入添加员工页面
	public String add(){
		List<Buildings> buildingsList = new ArrayList<Buildings>();
		buildingsList=buildingsService.querylist(agency_id);
		request.setAttribute("buildingsList", buildingsList);
		return "add";
	}
	//添加员工
	public String employeesAdd(){
		employee.setPwd("123456");
		employee.setHeadicon("images/photos/photo3.png");
		employee.setGender("女");
		employee.setQq("暂未设置");
		employee.setWechat("暂未设置");
		employee.setDes("暂无");
		employee.setExp("暂无");
		employee.setAddress("暂无");
		employee.setIntro("暂无");
		employee.setStatus("Y");
		employee.setCreated_time(new Date());
		employeeService.add(employee);
		request.setAttribute("success", "新增成功");
		return "employeesAdd";
	}
	//进入经销商修改员工界面
	public String employeeUpdatePage(){
		List<Buildings> buildingsList = new ArrayList<Buildings>();
		buildingsList=buildingsService.querylist(agency_id);
		request.setAttribute("buildingsList", buildingsList);
		employee = employeeService.queryById(id);
		setAgency_id(agency_id);
		buildings = buildingsService.queryById(employee.getBuilding_id());
		return "employeeUpdatePage";
	}
	//经销商修改员工
	public String employeeUpdate(){
		employeeService.update(employee);
		setAgency_id(agency_id);
		request.setAttribute("success", "员工信息修改成功");
		return "list";
	}
	//改变状态(激活或修改)
	public String status(){
		employee=employeeService.queryById(employee.getId());
		if(employee.getStatus().equals("Y")){
			employeeService.updateStatus(employee.getId(), employee.getStatus());
			msg = "状态修改成功！";
			
		}else{
			employeeService.updateStatus(employee.getId(), employee.getStatus());
			msg = "状态修改成功！";
		}
		return "myemployees";
	}
	//查看单个员工
	public String look(){
		employee=employeeService.queryById(employee.getId());
		buildings = buildingsService.queryById(employee.getBuilding_id());
		return "look";
	}
	//加减薪水
	public String addmoney(){
		employeeService.updateOther(employee.getId(), employee.getBasic_salary());
		employee=employeeService.queryById(employee.getId());
		request.setAttribute("msg", "薪资修改成功");
		return "employeesAdd";
	}
	
	public String loginpage(){
		return "loginpage";
	}
	public String login(){ 
		HttpSession session = request.getSession(); 
		employee = employeeService.login(employee);
		if(employee==null){
			request.setAttribute("msg", "1");
			return "loginpage";
		}else if(!employee.getStatus().equals("Y")){
			request.setAttribute("msg", "2");
			return "loginpage";
		}else{
			session.setAttribute("employee", employee);
			ActionContext.getContext().getSession().put("employee", employee);
			return SUCCESS;
		}
	}
	public String exit(){
		HttpSession session = request.getSession(); 
		session.invalidate();
		return "loginpage";
	}
	public String success(){
		return SUCCESS;
	}
	public String changepwdpage(){
		employee = employeeService.queryById(employee.getId());
		return "changepwdpage";
	}
	public String changepwd(){
		employeeService.updatePwd(employee);
		request.setAttribute("msg", "修改密码成功！");
		return "changepwdpage";
	}
	public String employeepage(){
		employee = employeeService.queryById(employee.getId());
		agency = agencyService.queryById(employee.getAngency_id());
		buildings = buildingsService.queryById(employee.getBuilding_id());
		
		return "employeepage";
	}
	public String updatepage(){
		employee = employeeService.queryById(employee.getId());
		return "updatepage";
	}
	public String update() throws Exception{
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
			FileUtils.copyFile(upload, savefile);
			ActionContext.getContext().put("message", "上传文件成功");
			String path = imageFileName;
			path += "." + imageContentType;
			employee.setHeadicon(path);
			
		}
		employeeService.update(employee);
		employee = employeeService.queryById(employee.getId());
		agency = agencyService.queryById(employee.getAngency_id());
		buildings = buildingsService.queryById(employee.getBuilding_id());
		request.setAttribute("success", "个人信息修改成功");
		return "employeepage";

	}
	
}
