package com.gs.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.gs.pojo.Activity;
import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;
import com.gs.pojo.User;
import com.gs.service.ActivityService;
import com.gs.service.BuildingsService;
import com.opensymphony.xwork2.ActionSupport;

public class ActivityAction extends ActionSupport implements ServletRequestAware,SessionAware{

	private static final long serialVersionUID = 2949935544261309637L;
	private HttpServletRequest request;
	private Activity activity;
	private Agency agency;
	private List<Buildings> buildingsList;
	private ActivityService activityService;
	private BuildingsService buildingsService;
	private User user;
	private Map session;
	private String msg;
	public String getMsg() {
		return msg;
	}
	//文件上传
	private String imageFileName;
	private File upload;
	private String imageContentType = "jpg";
	private int page;
	
	//分页所需
	private int pageSize;//每页显示数
	private int pageNumber;//第几页
	private int total;//总计路数
	private List<Activity> rows;//所有记录
	private String agency_id;
	private String actvt;//manager 添加
	private List<Agency> agencyList;
	private String searchText;
	private String buildings_id;
	HttpServletResponse response = ServletActionContext.getResponse();
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public List<Agency> getAgencyList() {
		return agencyList;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getAgency_id() {
		return agency_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setActvt(String actvt) {
		this.actvt = actvt;
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
	public int getTotal() {
		return total;
	}
	public List<Activity> getRows() {
		return rows;
	}
	public void setRows(List<Activity> rows) {
		this.rows = rows;
	}
	public List<Buildings> getBuildingsList() {
		return buildingsList;
	}
	public void setBuildingsList(List<Buildings> buildingsList) {
		this.buildingsList = buildingsList;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}
	public Activity getActivity() {
		return activity;
	}
	public Agency getAgency() {
		return agency;
	}
	public void setAgency(Agency agency) {
		this.agency = agency;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	
	//进入新增页面
	public String addInfo(){
		buildingsList=buildingsService.querylist(agency.getId());
		return "addInfo";
	}
	//新增
	public String add() throws Exception{
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
			String path = imageFileName;
			path += "." + imageContentType;
			activity.setLogo(path);
			
		}
		activity.setStatus("Y");
		activityService.add(activity);
		request.setAttribute("success", "新增成功");
		return "add";
	}
	//进入分页列表
	public String list1(){
		buildingsList=buildingsService.querylist(agency_id);
		return "list1";
	}
	//分页
	public String list(){
		if (searchText!=null && !searchText.equals("")) {
			rows = activityService.search(pageNumber, pageSize, searchText, agency_id);
			total = activityService.searchcount(searchText, agency_id);
			return "list";
		}else{
			rows=activityService.list(pageSize, pageNumber, agency_id);
			total=activityService.count(agency_id);
			return "list";
		}
		
	}
	//分页
	public String list2(){
		if (searchText!=null && !searchText.equals("")) {
			if(!buildings_id.equals("1")){
				rows=activityService.search(pageNumber, pageSize, searchText, agency_id, buildings_id);
				total=activityService.searchcount(searchText, agency_id, buildings_id);
			}else{
				rows = activityService.search(pageNumber, pageSize, searchText, agency_id);
				total = activityService.searchcount(searchText, agency_id);
			}
		}else{
			if(!buildings_id.equals("1")){
				rows=activityService.list(pageSize, pageNumber, agency_id,buildings_id);
				total=activityService.count(agency_id,buildings_id);
			}else{
				rows=activityService.list(pageSize, pageNumber, agency_id);
				total=activityService.count(agency_id);
			}
		}
		
		buildingsList=buildingsService.querylist(agency_id);
		return "list";
	}
	//修改状态
	public String status(){
		activity=activityService.queryById(activity.getId());
		if(activity.getStatus().equals("Y")){
			activityService.updateStatus(activity.getId(), activity.getStatus());
			msg="状态修改成功";
		}else{
			activityService.updateStatus(activity.getId(), activity.getStatus());
			msg="状态修改成功";
		}
		
		return "list";
	}
	//查看单个活动
	public String look(){
		activity=activityService.queryById(activity.getId());
		return "look";
	}
	//进入修改活动页面
	public String update(){
		activity=activityService.queryById(activity.getId());
		System.out.println(activity.getAgency_id());
		buildingsList=buildingsService.list(activity.getAgency_id());
		return "update";
	}
	//修改活动
	public String updateSave() throws Exception{
		System.out.println("logo="+activity.getLogo()+";upload="+upload);
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
			activity.setLogo(path);
			System.out.println("path="+path);
		
		}
		activityService.update(activity);
		request.setAttribute("success", "资料修改成功");
		activity=activityService.queryById(activity.getId());
		return "updateSave";
	}
	//前台所有楼盘
	public String all(){
		user=(User)session.get("user");
		rows = activityService.count(0, 6);
		total = activityService.count();
		buildingsList = buildingsService.builds(0, 4);
		return "all";
	}
	public String all2() throws Exception{
		if(page<0) {
			page = 0;
		}
		int frist = (page-1)*6;
		rows = activityService.count(frist, 6);
		return "all2";
	}
	//前台查看活动
	public String lookactivity(){
		activity = activityService.queryById(activity.getId());
		buildingsList = buildingsService.builds(0, 4);
		return "lookactivity";
	}
	
	
	//manager start
	public String mgnActivitypage() throws Exception{
		if(actvt.equals("mgn"))
		{
 			HttpSession session2=request.getSession();
			session2.setAttribute("actvt", "mgn");
		}else if(actvt.equals("agc")){
 			HttpSession session2=request.getSession();
			session2.setAttribute("actvt", "agc");
		}
		buildingsList=activityService.findBdsList();
		agencyList=activityService.findAgencyList();
		return "mgnactivitypage";
	}
	public String mgnActivitypager() throws Exception{
		HttpSession session1=request.getSession();
		if(session1.getAttribute("search")!=null)
		{
			session1.setAttribute("search",null);
			Activity activity1=(Activity)session1.getAttribute("searchactivity");
			rows=activityService.search(pageNumber, pageSize, activity1);
			total=activityService.searchcount(activity1);
			return "returnjson";
		}else if(searchText!=null&&!searchText.equals(""))
		{
			rows=activityService.allsearch(pageNumber, pageSize, searchText);
			total=activityService.allsearchcount(searchText);
			return "returnjson";
		}else if(session1.getAttribute("actvt").equals("mgn"))
		{
			rows=activityService.mgnactivityPager(pageSize, pageNumber);
			total=activityService.mgnactivityCount();
			return "returnjson";
		}else if(session1.getAttribute("actvt").equals("agc"))
		{
			rows=activityService.activityPager(pageSize, pageNumber);
			total=activityService.activityCount();
			return "returnjson";
		}
		rows=activityService.activityPager(pageSize, pageNumber);
		total=activityService.activityCount();
		return "returnjson";
	
	}
	public String mgnAgcActvtLook() throws Exception {
		activity=activityService.queryById(activity.getId());
		request.setAttribute("activity",activity );
		return "mgnAgcActvtLook";
	}
	public String search() throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("search","88");
		session.setAttribute("searchactivity", activity);
		return "mgnactivitypage";
	}
	public String mgnActvtAddPage() throws Exception {
		return "mgnActvtAddPage";
	}
	public String mgnActvtAdd() throws Exception {
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
			String path = imageFileName;
			path += "." + imageContentType;
			activity.setLogo(path);
		}
		activity.setStatus("Y");
		activityService.add(activity);
		return "mgnactivitypage";
	}
	public String mgnActvtActive() throws Exception {
		activityService.mgnActvtActive(activity.getId());
		msg = "该活动已启用！";
		return "returnjson";
	}
	public String mgnActvtInactive() throws Exception {
		activityService.mgnActvtInactive(activity.getId());
		msg = "该活动已禁用！";
		return "returnjson";
	}
	public String mgnActvtEditPage() throws Exception {
		activity=activityService.queryById(activity.getId());
		request.setAttribute("agency",agency );
		return "mgnActvtEditpage";
	}
	public String mgnActvtEdit() throws Exception {
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
			String path = imageFileName;
			path += "." + imageContentType;
			activity.setLogo(path);
		}
		activityService.mgnActvtEdit(activity);
		return "mgnactivitypage";
	}
	public String list3(){
		rows=activityService.list2(pageSize, pageNumber, agency_id,buildings_id);
		total=activityService.count2(agency_id,buildings_id);
		buildingsList=activityService.findBdsList();
		agencyList=activityService.findAgencyList();
		return "returnjson";
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
}
