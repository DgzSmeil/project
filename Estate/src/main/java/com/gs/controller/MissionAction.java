package com.gs.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.alibaba.fastjson.JSON;
import com.gs.pojo.Employee;
import com.gs.pojo.Hchart;
import com.gs.pojo.Mission;
import com.gs.pojo.Sale;
import com.gs.service.EmployeeService;
import com.gs.service.MissionService;
import com.gs.service.SaleService;
import com.opensymphony.xwork2.ActionSupport;

public class MissionAction extends ActionSupport implements ServletRequestAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private Mission mission;
	private MissionService missionService;
	private String emp_id;
	private String id;
	
	private int pageSize;
	private int pageNumber;
	private int total;//每页显示数
	private List<Mission> rows;//第几页
	private Employee employee;
	private Sale sale;
	private SaleService saleService;
	private int sales;
	private Double salary;
	private List<Mission> missions;
	private List<Employee> employees;
	private String employee_id;
	private String months;
	
	
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
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
	private String searchText;
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	public List<Mission> getMissions() {
		return missions;
	}
	public void setMissions(List<Mission> missions) {
		this.missions = missions;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getSales() {
		return sales;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSaleService(SaleService saleService) {
		this.saleService = saleService;
	}
	public void setSale(Sale sale) {
		this.sale = sale;
	}
	public Sale getSale() {
		return sale;
	}
	private EmployeeService employeeService;
	private String agency_id;
	
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public Employee getEmployee() {
		return employee;
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
	public int getTotal() {
		return total;
	}
	public void setRows(List<Mission> rows) {
		this.rows = rows;
	}
	public List<Mission> getRows() {
		return rows;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setMissionService(MissionService missionService) {
		this.missionService = missionService;
	}
	public MissionService getMissionService() {
		return missionService;
	}
	public void setMission(Mission mission) {
		this.mission = mission;
	}
	public Mission getMission() {
		return mission;
	}
	
	public String addpage(){
		employee = employeeService.queryById(emp_id);
		List<Mission> missionlist = missionService.querylist(employee.getId());
		if(missionlist.size()>0){
			Calendar calendar=Calendar.getInstance();
			//获得当前时间的月份，月份从0开始所以结果要加1
			int monthes=calendar.get(Calendar.MONTH)+1;
			Mission m = null;
			for(int i=0;i<missionlist.size();i++){
				m = missionlist.get(i);
			}
			if(m.getMonthes()<monthes){
				return "addpage";
			}else{
				request.setAttribute("msg", "当月已有任务,无需重复指派");
				return "list";
			}
		}else{
			return "addpage";
		}
		
	}
	public String add(){
		Calendar calendar=Calendar.getInstance();
		//获得当前时间的月份，月份从0开始所以结果要加1
		int monthes=calendar.get(Calendar.MONTH)+1;
		mission.setMonthes(monthes);
		
		mission.setBonus_percent(mission.getBonus_percent()*0.01);
		
		employee = employeeService.queryById(mission.getEmp_id());
		salary = employee.getBasic_salary();
		mission.setSalary(salary);
		
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");//可以方便地修改日期格式
		String yearmonth = dateFormat.format( now ); 
		mission.setYearmonth(yearmonth);
		
		missionService.add(mission);
		mission = missionService.queryById(mission.getId());
		
		return "add";
	}
	public String list(){
		List<Mission> mission = missionService.querylist(emp_id);
		if(mission.size()>0){
			Calendar calendar=Calendar.getInstance();
			//获得当前时间的月份，月份从0开始所以结果要加1
			int monthes=calendar.get(Calendar.MONTH)+1;
			
			Mission m = null;
			for(int i=0;i<mission.size();i++){
				m = mission.get(i);
			}
			if(m.getMonthes()<=monthes){
				employee = employeeService.queryById(m.getEmp_id());
				List<Sale> salelist = saleService.querylist1(employee.getId());
				if(salelist.size()>0){
					Sale s = null;
					for(int i=0;i<salelist.size();i++){
					   s = salelist.get(i);
					}
					if(s.getSale_time().getMonth()+1!=monthes){
						System.out.println(s.getSale_time().getMonth()+1);
						return "list";
					}else {
						sales = saleService.findcount(employee.getId(), m.getYearmonth());
						salary = employee.getBasic_salary()+(saleService.total_cost(employee.getId())*m.getBonus_percent());
						missionService.updatesalary(m.getId(), sales, salary);
						return "list";
					}
				}else {
					System.out.println(m.getYearmonth());
					sales = saleService.findcount(employee.getId(), m.getYearmonth());
					salary = employee.getBasic_salary();
					missionService.updatesalary(m.getId(), sales, salary);
					return "list";
				}
			}else {
				return "list";
			}
		}else {
			return "list";
		}
	}
	public String pager(){
		if(searchText!=null && !searchText.equals("")){
			rows = missionService.search1(pageNumber, pageSize, searchText, emp_id);
			total = missionService.searchcount1(searchText, emp_id);
			return "pager";
		}else {
			rows=missionService.list(pageSize, pageNumber, emp_id);
			total=missionService.count(emp_id);
			return "pager";
		}
	}
	public String updatepage(){
		
		missionService.updateOther(mission.getId(), mission.getQuantity());
		mission = missionService.queryById(mission.getId());
		return "update";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
	//查看工资
	public String strap(){
		setAgency_id(agency_id);
		employees = missionService.findEmployee(agency_id);
		return "strap";
	}
	public String findSalary(){
		if (searchText!=null && !searchText.equals("")) {
			rows =missionService.search(pageNumber, pageSize, searchText, agency_id);
			total = missionService.searchcount(searchText, agency_id);
			return "findSalary";
		}else{
			rows =missionService.findSalary(agency_id, pageNumber, pageSize, employee_id,months);
			total = missionService.countSalary(agency_id, employee_id,months);
			return "findSalary";
		}
	}
	//单个员工销售记录报表
	public String emp_chart(){
		setEmp_id(emp_id);
		return "emp_chart";
	}
	public String chart() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = null;
		List<Hchart<Double>> temps = new ArrayList<Hchart<Double>>();
		@SuppressWarnings("rawtypes")
		List list = saleService.querybysale(emp_id);
		Hchart<Double> baobiao = new Hchart<>();
		Double d[]=new Double[12];
		Object [] object = (Object [])list.get(0);
		for(int j=0;j<12;j++){
			d[j]=Double.parseDouble(object[j+1].toString());
		}
		baobiao.setName(object[0].toString());
		baobiao.setData(d);
		temps.add(baobiao);
		
		out = response.getWriter();
		out.println(JSON.toJSONString(temps));
		return null;
	}
	
	
}
