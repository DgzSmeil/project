package com.gs.controller;

import java.io.File;



import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
//import org.apache.jasper.tagplugins.jstl.core.Out;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.springframework.context.annotation.EnableLoadTimeWeaving;

import com.alibaba.fastjson.JSON;
import com.gs.code.GetPhoneMessage;
import com.gs.common.bean.Constants;
import com.gs.common.bean.ControllerResult;
import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;
import com.gs.pojo.User;
import com.gs.service.AgencyService;
import com.gs.service.BuildingsService;
import com.mysql.fabric.Response;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

//import net.sf.json.util.JSONStringer;

public class AgencyAction extends ActionSupport implements ServletRequestAware,SessionAware{

	private static final long serialVersionUID = 6236406160706437865L;
	
	private Agency agency;
	private List<Buildings> buildingslist;
	private BuildingsService buildingsService;
	private AgencyService agencyService;
	private String imageFileName;
	private File upload;
	private Map session;
	private User user;
	private HttpServletRequest request;  
	private int vcode;
	
	//manager start
	private int pageNumber;
	private List<Agency> rows;
	private ControllerResult controllerResult; 
	private String msg;
	//manager end
	private int pageSize;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	private String checked;
	private int total;
	private int page;
	private String searchText;
	HttpServletResponse response = ServletActionContext.getResponse();
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public int getVcode() {
		return vcode;
	}
    @Override  
    public void setServletRequest(HttpServletRequest request) {  
        this.request = request;  
    }
    @Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
		
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public File getUpload() {
		return upload;
	}
//manager start
	public int getTotal() {
		return total;
	}
	public List<Buildings> getBuildingslist() {
		return buildingslist;
	}

	public void setBuildingslist(List<Buildings> buildingslist) {
		this.buildingslist = buildingslist;
	}

	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setRows(List<Agency> rows) {
		this.rows = rows;
	}

	public List<Agency> getRows() {
		return rows;
	}

	public ControllerResult getControllerResult() {
		return controllerResult;
	}

	
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

//manager end
	public void setUpload(File upload) {
		this.upload = upload;
	}

	private String imageContentType = "jpg";

	public Agency getAgency() {
		return agency;
	}

	public void setAgency(Agency agency) {
		this.agency = agency;
	}

	public void setAgencyService(AgencyService agencyService) {
		this.agencyService = agencyService;
	}
	
	//首页
	public String homepage() {
		
		return "homepage";
	}
	public String shouye(){
		
		return "shouye";
	}
	//进入登陆页面
	public String login() {

		return "login";
	}
	//进入注册页面
	public String registered() {

		return "registered";
	}
	//退出
	public String exited() throws Exception{
		return "login";
	}
	public String yzm() throws Exception{
		GetPhoneMessage gpm = new GetPhoneMessage();
		vcode = Integer.parseInt(gpm.GetPhoneMessages(agency.getPhone()));
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(vcode);
		out.flush();
		out.close();
		return null;
	}

	//经销商注册
	public String add() throws IOException{
		if(agencyService.query(agency.getName(), null,null)!=null){
			request.setAttribute("error", "该公司名称已注册，请重新输入");
			return "registered";
		}else if(agencyService.query(null, agency.getEmail(),null)!=null){
			request.setAttribute("error", "该邮箱地址已注册，请重新输入");
			return "registered";
		}else if(agencyService.query(null, null,agency.getPhone())!=null){
			request.setAttribute("error", "该手机号码已注册，请重新输入");
			return "registered";
		}
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		imageFileName = dateString;
		HttpServletRequest request = ServletActionContext.getRequest();
		String realpath = request.getRealPath("/upload");
		if (upload != null) {
			File savefile = new File(new File(realpath), imageFileName + "." + imageContentType);
			if (!savefile.getParentFile().exists()) {
				savefile.getParentFile().mkdirs();
			}
			FileUtils.copyFile(upload, savefile);
			String path = imageFileName;
			path += "." + imageContentType;
			agency.setLogo(path);
			
		} 
		agency.setCreated_time(new Date());
		agency.setChecked_status("N");
		agency.setStatus("Y");
		agencyService.add(agency);
		request.setAttribute("success","注册成功，正在审核，请耐心等待...");
		return "add";
	}
	//登录
	public String loginInfo(){
		HttpSession session = request.getSession();  
        agency = agencyService.login(agency);  
        if (agency == null) {  
            request.setAttribute("error", "账号或密码有误，请确认");  
            return "login";  
        }else if(!agency.getChecked_status().equals("Y")){
        	 request.setAttribute("error", "账号未审核");  
             return "login";
        }else if(agency.getStatus().equals("N")){
        	 request.setAttribute("error", "账号已禁用");  
             return "login";
        }else {  
            session.setAttribute("agency", agency);  
            return "homepage";  
        }  
		
	}
	//手机登录
		public String loginphone(){
			HttpSession session = request.getSession();  
	        agency = agencyService.login(agency);  
	        if (agency == null) {  
	            request.setAttribute("error", "手机号码不存在，请确认");  
	            return "login";  
	        }else if(!agency.getChecked_status().equals("Y")){
	        	 request.setAttribute("error", "账号未审核");  
	             return "login";
	        }else if(agency.getStatus().equals("N")){
	        	 request.setAttribute("error", "账号已禁用");  
	             return "login";
	        }else {  
	            session.setAttribute("agency", agency);  
	            return "homepage";  
	        }  
			
		}
	
	//公司资料
	public String personal(){
		agency=agencyService.queryById(agency.getId());
		return "personal";
	}
	//修改资料
	public String update(){
		agencyService.update(agency);
		request.setAttribute("success", "修改成功！");
		agency=agencyService.queryById(agency.getId());
		return "personal";
	}
	//进入修改密码页面
	public String mima(){
		agency=agencyService.queryById(agency.getId());
		return "mima";
	}
	//修改密码
	public String updatemima(){
		agencyService.updataPwd(agency);
		request.setAttribute("success", "密码修改成功！请妥善保管");
		agency=agencyService.queryById(agency.getId());
		return "mima";
	}
	//前台显示所有经销商
	public String all(){
		user=(User)session.get("user");
		rows = agencyService.agencylist(pageNumber, 6);
		total = agencyService.agencycount();
		buildingslist = buildingsService.builds(0, 4);
		return "all";
	}
	public String all2() throws Exception{
		response.setContentType("text/json;charset=utf-8");
		if(page<0) {
			page = 0;
		}
		
		PrintWriter out = response.getWriter();
		rows = agencyService.agencylist(page, 6);
		out.println(JSON.toJSONString(rows));
		return null;
	}
	
	
	//manager start
	public String mgnagency(){
		HttpSession session2=request.getSession();
		if(checked.equals("Y"))
		{
			session2.setAttribute("checked", "Y");
			return "mgnagency";
		}else if(checked.equals("N"))
		{
			session2.setAttribute("checked", "N");
			return "mgnagency";
		}else if(checked.equals("F"));
		{
			session2.setAttribute("checked", "F");
			return "mgnagency";
		}
	}
	public String checkedpager() throws Exception {
		HttpSession session1=request.getSession();
		if(session1.getAttribute("search")!=null)
		{
			Agency searchagency=(Agency)session1.getAttribute("searchagency");
			rows=agencyService.search(pageNumber,pageSize,searchagency);
			total=agencyService.searchcount(searchagency);
			session1.setAttribute("search",null);
			return "returnjson";
		}else if(searchText!=null&&!searchText.equals(""))
		{
			rows=agencyService.allsearch(pageNumber, pageSize, searchText);
			total=agencyService.allsearchcount(searchText);
			return "returnjson";
		}else if(session1.getAttribute("checked").toString().equals("Y"))
		{
			rows=agencyService.agcCklist(pageNumber, pageSize,Constants.VALID_Y);
			total=agencyService.agcCKcount(Constants.VALID_Y);
			return "returnjson";
		}else if(session1.getAttribute("checked").toString().equals("N"))
		{
			rows=agencyService.agcCklist(pageNumber, pageSize,Constants.VALID_N);
			total=agencyService.agcCKcount(Constants.VALID_N);
			return "returnjson";
		}else if(session1.getAttribute("checked")==null)
		{
			rows=agencyService.agcCklist(pageNumber, pageSize,Constants.VALID_Y);
			total=agencyService.agcCKcount(Constants.VALID_Y);
			return "returnjson";
		}else if(session1.getAttribute("checked").toString().equals("F"));
		
		{
			rows=agencyService.agcCklist(pageNumber, pageSize,Constants.VALID_F);
			total=agencyService.agcCKcount(Constants.VALID_F);
			return "returnjson";
		}
		
	
	}
	public String agclook() throws Exception {
		agency=agencyService.queryById(agency.getId());
		request.setAttribute("agency",agency );
		return "mgnagclook";
	}
	public String agceditpage() throws Exception {
		agency=agencyService.queryById(agency.getId());
		request.setAttribute("agency",agency );
		return "mgnagcedit";
	}
	public String agcedit() throws Exception {
		agencyService.agencyupdate(agency);
		return "mgnagency";
	}
	public String active() throws Exception {
		agencyService.active(agency.getId());
		msg = "该经销商已启用！";
		return "returnjson";
	}
	public String inactive() throws Exception {
		agencyService.inactive(agency.getId());
		msg = "该经销商禁用！";
		return "returnjson";
	}
	public String checked() throws Exception {
		agencyService.checked(agency.getId());
		return "mgnagency";
	}
	public String unchecked() throws Exception {
		agencyService.unchecked(agency.getId(),agency.getChecked_reason());
		return "mgnagency";
	}
	public String search() throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("search","88");
		session.setAttribute("searchagency", agency);
		return "mgnagency";
	}
	public String delbytime() throws Exception {
		
		Date date =new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("createstart")); 
		Date date2 =new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("createend")); 
		//agencyService.delbytime(date, date2);
		return "mgnagency";
	}
	public String delbyid() throws Exception {
		//agencyService.delbyid(agency.getId());
		return "mgnagency";
	}
	//manager end

}
