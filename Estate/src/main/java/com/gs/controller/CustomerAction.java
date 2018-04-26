
package com.gs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.gs.pojo.Customer;
import com.gs.pojo.Employee;
import com.gs.service.CustomerService;
import com.gs.service.EmployeeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private Logger logger = Logger.getLogger(CustomerAction.class);
	private Customer customer;
	private CustomerService customerService;
	private EmployeeService employeeService;
	private Employee employee;
	private String FileName;
	private File upload;
	private String ContentType = "docx";
	private String ContentType1 = "zip";
	private int pageSize;
	private int pageNumber;
	private int total;//每页显示数
	private List<Customer> rows;//第几页
	private String employee_id;
	
	private List<Employee> employees;
	private String searchText;
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public String getEmployee_id(){
		return employee_id;
	}
	public void setEmployee_id(String employee_id){
		this.employee_id=employee_id;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}
	public Employee getEmployee(){
		return employee;
	}
	public void setEmployee(Employee employee){
		this.employee=employee;
	}
	public Customer getCustomer(){
		return customer;
	}

	public void setCustomer(Customer customer){
		this.customer=customer;
	}
	public int getTotal(){
		return total;
	}
	public void setTotal(int total){
		this.total=total;
	}
	public List<Customer> getRows(){
		return rows;
	}
	public void setRows(List<Customer> rows) {
		this.rows = rows;
	}
	public void setCustomerService(CustomerService customerService){
		this.customerService = customerService;
	}
	public String page(){
		return "page";
	}
	
	public String list(){
		return "list";
	}
	public String pager(){
		if(searchText!=null && !searchText.equals("")){
			rows = customerService.searchA(pageNumber, pageSize, searchText, employee_id);
			total = customerService.searchcountA(searchText, employee_id);
			return "pager";
		}else {
			rows=customerService.list(pageSize, pageNumber, employee_id);
			total=customerService.count(employee_id);
			return "pager";
		}
		
	}
	public String add() throws Exception{
//		Date now = new Date(); 
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
//		String create_time = dateFormat.format( now ); 
//		customer.setCreated_time(create_time);
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		FileName = dateString;
		HttpServletRequest request = ServletActionContext.getRequest();
		String realpath = request.getRealPath("/upload");
		if (upload != null) {
			File savefile = new File(new File(realpath), FileName + "." + ContentType);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile);
			ActionContext.getContext().put("message", "上传文件成功");
			String path = FileName;
			path += "." + ContentType;
			customer.setContract(path);
			
			File savefile1 = new File(new File(realpath), FileName + "." + ContentType1);
			if (!savefile1.getParentFile().exists())
				savefile1.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile1);
			ActionContext.getContext().put("message", "上传文件成功");
			String path1 = FileName;
			path1 += "." + ContentType1;
			customer.setArchives(path1);
		}
		customer.setCreated_time(new Date());
		customerService.add(customer);
		request.setAttribute("tip", "添加客户成功");
		return "add";
	}
	public String updatepage(){
		customer=customerService.queryById(customer.getId());
		return "updatepage";
	}
	public String update()throws Exception{
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		FileName = dateString;
		HttpServletRequest request = ServletActionContext.getRequest();
		String realpath = request.getRealPath("/upload");
		if (upload != null) {
			File savefile = new File(new File(realpath), FileName + "." + ContentType);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile);
			ActionContext.getContext().put("message", "上传文件成功");
			String path = FileName;
			path += "." + ContentType;
			customer.setContract(path);
			
			File savefile1 = new File(new File(realpath), FileName + "." + ContentType1);
			if (!savefile1.getParentFile().exists())
				savefile1.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile1);
			ActionContext.getContext().put("message", "上传文件成功");
			String path1 = FileName;
			path1 += "." + ContentType1;
			customer.setArchives(path1);
		}
		customerService.update(customer);
		customer=customerService.queryById(customer.getId());
		return "update";
	}
	public String look(){
		customer = customerService.queryById(customer.getId());
		employee = employeeService.queryById(customer.getEmployee_id());
		return "look";
	}
	public String status(){
		customer=customerService.queryById(customer.getId());
		customerService.valid(customer.getId(),customer.getStatus());
		return "status";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
	}
	//经销商管理
	private String agency_id;
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public String agencyList(){
		setAgency_id(agency_id);
		employees = customerService.listEmployee(agency_id);
		return "agencyList";
	}
	public String agencycustomer(){
		if(searchText==null || searchText.equals("")){
			rows = customerService.listEmp(agency_id, pageNumber, pageSize, employee_id);
			total = customerService.empCount(agency_id,employee_id);
			return "agencycustomer";			
		}else{
			rows = customerService.search(pageNumber, pageSize, searchText, agency_id);
			total = customerService.searchcount(searchText, agency_id);
			return "agencycustomer";			
		}
	
	}
	public String agencystatus(){
		customer=customerService.queryById(customer.getId());
		customerService.valid(customer.getId(),customer.getStatus());
		setAgency_id(agency_id);
		employees = customerService.listEmployee(agency_id);
		
		return "agencyList";
	}
	public String  agencyAddCustomer(){
		employees = customerService.listEmployee(agency_id);
		setAgency_id(agency_id);
		return "agencyAddCustomer";
	}
	public String agencyAddCustomerSave() throws Exception{
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		FileName = dateString;
		HttpServletRequest request = ServletActionContext.getRequest();
		String realpath = request.getRealPath("/upload");
		if (upload != null) {
			File savefile = new File(new File(realpath), FileName + "." + ContentType);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile);
			ActionContext.getContext().put("message", "上传文件成功");
			String path = FileName;
			path += "." + ContentType;
			customer.setContract(path);
			
			File savefile1 = new File(new File(realpath), FileName + "." + ContentType1);
			if (!savefile1.getParentFile().exists())
				savefile1.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile1);
			ActionContext.getContext().put("message", "上传文件成功");
			String path1 = FileName;
			path1 += "." + ContentType1;
			customer.setArchives(path1);
		}
		customer.setCreated_time(new Date());
		customerService.add(customer);
		request.setAttribute("msg", "新增成功");
		employees = customerService.listEmployee(agency_id);
		
		return "agencyAddCustomerSave";
	}
	//进入修改界面
	public String agencyCustomerUpdate(){
		customer=customerService.queryById(customer.getId());
		setAgency_id(agency_id);
		employees = customerService.listEmployee(agency_id);
		return "agencyCustomerUpdate";
	}
	public String agencyCustomerUpdateSave() throws Exception{
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		FileName = dateString;
		HttpServletRequest request = ServletActionContext.getRequest();
		String realpath = request.getRealPath("/upload");
		if (upload != null) {
			File savefile = new File(new File(realpath), FileName + "." + ContentType);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile);
			ActionContext.getContext().put("message", "上传文件成功");
			String path = FileName;
			path += "." + ContentType;
			customer.setContract(path);
			
			File savefile1 = new File(new File(realpath), FileName + "." + ContentType1);
			if (!savefile1.getParentFile().exists())
				savefile1.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile1);
			ActionContext.getContext().put("message", "上传文件成功");
			String path1 = FileName;
			path1 += "." + ContentType1;
			customer.setArchives(path1);
		}
		customerService.update(customer);
		setAgency_id(agency_id);
		employees = customerService.listEmployee(agency_id);
		return "agencyCustomerUpdateSave";
	}
}
