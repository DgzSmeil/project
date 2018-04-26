package com.gs.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.alibaba.fastjson.JSON;
import com.gs.pojo.Agency;
import com.gs.pojo.Article;
import com.gs.pojo.Building;
import com.gs.pojo.Buildings;
import com.gs.pojo.BuildingsImg;
import com.gs.pojo.Comment;
import com.gs.pojo.Hchart;
import com.gs.pojo.House;
import com.gs.pojo.User;
import com.gs.service.AgencyService;
import com.gs.service.ArticleService;
import com.gs.service.BuildingService;
import com.gs.service.BuildingsService;
import com.gs.service.Buildings_imgService;
import com.gs.service.CommentService;
import com.gs.service.HouseService;
import com.gs.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class BuildingsAction extends ActionSupport implements ServletRequestAware,SessionAware{

	private static final long serialVersionUID = 1299966305324721562L;
	
	private Buildings builds;
	private Agency agency;
	private List<House> houselist;
	private List<Article> articlelist;
	private List<Comment> commentlist;
	private List<BuildingsImg> buildingsImgs;
	private CommentService commentService;
	private List<Agency> agencielist;
	private ArticleService articleService;
	private BuildingsService buildingsService;
	private AgencyService agencyService;
	private Buildings_imgService buildings_imgService;
	private HouseService houseService;
	private String imageFileName;
	private String imageContentType = "jpg";
	private File upload;
	private HttpServletRequest request;
	private int pageSize;
	private int pageNumber;
	private int total;//每页显示数
	private List<Buildings> rows;//第几页
	private String agency_id;
	private String searchText;//manager opration
	private List<Buildings> buildslist ;
	private List<Buildings> buildinglist2;
	private int page;
	private String sort;
	public String getMsg() {
		return msg;
	}
	private User user;
	private Map session;
	private String msg;
	HttpServletResponse response = ServletActionContext.getResponse();
	public List<Agency> getAgencielist() {
		return agencielist;
	}
	public Agency getAgency() {
		return agency;
	}
	public void setAgency(Agency agency) {
		this.agency = agency;
	}
	public List<Comment> getCommentlist() {
		return commentlist;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public void setAgencielist(List<Agency> agencielist) {
		this.agencielist = agencielist;
	}
	public void setAgencyService(AgencyService agencyService) {
		this.agencyService = agencyService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	private String list;
	public String getList() {
		return list;
	}
	public void setList(String list) {
		this.list = list;
	}
	public void setBuildslist(List<Buildings> buildslist) {
		this.buildslist = buildslist;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public List<Buildings> getBuildslist() {
		return buildslist;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Buildings> getRows() {
		return rows;
	}
	public void setRows(List<Buildings> rows) {
		this.rows = rows;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public Buildings getBuilds() {
		return builds;
	}
	public void setBuilds(Buildings builds) {
		this.builds = builds;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	
	
	//进入添加楼盘页面
	public String addInfo(){
		return "addInfo";
	}
	
	//添加楼盘
	public String add() throws IOException{
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
			builds.setLogo(path);
			
		}
		
		builds.setCreated_time(new Date());
		builds.setStatus("Y");
		buildingsService.add(builds);
		request.setAttribute("msg", "新增成功");
		return "add";
	}
	//楼盘列表
	public String list(){
		if (searchText!=null && !searchText.equals("")) {
			rows = buildingsService.search(pageNumber, pageSize, searchText, agency_id);
			total = buildingsService .searchcount(searchText, agency_id );
			return "list";
		}else{
			rows=buildingsService.list(pageSize, pageNumber, agency_id);
			total=buildingsService.count(agency_id);
			return "list";
		}
	}
	
	public String list1(){
		return "list1";
	}
	
	//查看单个楼盘
	public String look(){
		builds=buildingsService.queryById(builds.getId());
		commentlist =buildingsService.findComment(builds.getId());
		return "look";
	}
	//进入修改楼盘页面
	public String update(){
		builds=buildingsService.queryById(builds.getId());
		return "update";
	}
	//修改楼盘
	public String updateSave(){
		buildingsService.update(builds);
		
		return "updateSave";
	}
	//修改状态(激活与冻结)
	public String status(){
		builds=buildingsService.queryById(builds.getId());
		if(builds.getStatus().equals("Y")){
			buildingsService.updateStatus(builds.getId(), builds.getStatus());
			msg = "该楼盘已禁用！";
		}else{
			buildingsService.updateStatus(builds.getId(), builds.getStatus());
			msg = "该楼盘已激活！";
		}
		
		return "list";
	}
	public String addimg(){
		return "addimg";
	}
	//前台界面所有楼盘
	public String allbuilds(){
		user=(User)session.get("user");
		int frist = (page-1)*9;
		agencielist = agencyService.builds(0, 7);
		buildslist = buildingsService.builds(frist, 9, sort);
		total = buildingsService.buildcount();
		return "allbuilds";
	}
	//前台搜索楼盘
	public String findbuildings(){
		user=(User)session.get("user");
		int frist = (page-1)*9;
		agencielist = agencyService.builds(0, 7);
		buildslist = buildingsService.findbuildings(frist, 9, builds.getName());
		total = buildingsService.findbuildingscount(builds.getName());
		return "allbuilds";
	}
	public String lookallbuilds() throws Exception{
		response.setContentType("text/json;charset=utf-8");
		if(page<0) {
			page = 0;
		}
		int frist = (page-1)*9;
		if(sort==null) {
			sort="create_time";
		}
		PrintWriter out = response.getWriter();
		rows = buildingsService.builds(frist, 9, sort);
		out.println(JSON.toJSONString(rows));
		return null;
	}
	//前台界面查看楼盘
	public String lookbuildings(){
		user=(User)session.get("user");
		buildingsImgs = buildings_imgService.builds(0, 4, builds.getId());
		builds=buildingsService.queryById(builds.getId());
		houselist = houseService.builds(builds.getId(), 0, 3);
		buildslist = buildingsService.builds(0, 3);
		buildinglist2 = buildingsService.builds(4, 4);
		articlelist = articleService.builds(0, 6);
		commentlist = commentService.builds(1, 3,builds.getId());
		page = commentService.countByBuildings_id(builds.getId());
		return "lookbuildings";
	}
	//前台页面查看经销商和它的所有楼盘
	public String lookagency(){
		user=(User)session.get("user");
		agency = agencyService.queryById(agency.getId());
		return "lookagency";
	}
	public String lookagency2(){
		if (searchText!=null && !searchText.equals("")) {
			rows = buildingsService.search(pageNumber, pageSize, searchText, agency_id);
			total = buildingsService .searchcount(searchText, agency_id );
			return "lookagency";
		}else{
			rows =buildingsService.list(pageSize, pageNumber, agency_id);
			total=buildingsService.count(agency_id);
			return "lookagency2";
		}
	}
	//贷款计算
		public String jisuan(){
			return "jisuan";
		}
	//manager start
	public String mngbuildpage(){
		return "mngbuildpage";
	}
	public String mngbuildpager(){
		HttpSession session1=request.getSession();
		if(session1.getAttribute("search")!=null)
		{
			session1.setAttribute("search",null);
			Buildings searchbuilds=(Buildings)session1.getAttribute("searchbuilds");
			rows=buildingsService.search(pageNumber, pageSize, searchbuilds);
			total=buildingsService.searchcount(searchbuilds);
			
			return "returnjson";
		}else  if(searchText!=null&&!searchText.equals(""))
		{
			rows=buildingsService.allsearch(pageNumber, pageSize, searchText);
			total=buildingsService.allsearchcount(searchText);
			return "returnjson";
		}
		rows=buildingsService.buildpager(pageSize, pageNumber);
		total=buildingsService.buildcount();
		return "returnjson";
	}
	
	public String buildingslook()
	{
		builds=buildingsService.queryById(builds.getId());
		request.setAttribute("builds",builds );
		return "buildingslook";
	}
	
	public String search() throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("search","88");
		session.setAttribute("searchbuilds", builds);
		return "mngbuildpage";
	}
	
	public String skimImg() throws Exception {
		return "mgnuser";
	}
	//manager end
	public String ditu(){
		buildslist =buildingsService.dituList(agency_id);
		list = JSON.toJSONString(buildslist);
		return "ditu";
	}
	
	
	
	public void setBuildings_imgService(Buildings_imgService buildings_imgService) {
		this.buildings_imgService = buildings_imgService;
	}
	public List<BuildingsImg> getBuildingsImgs() {
		return buildingsImgs;
	}
	public List<House> getHouselist() {
		return houselist;
	}
	public void setHouseService(HouseService houseService) {
		this.houseService = houseService;
	}
	public List<Buildings> getBuildinglist2() {
		return buildinglist2;
	}
	public List<Article> getArticlelist() {
		return articlelist;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
		//查看单个楼盘每月销售量
	public String sale_chart(){
		setBuilds(builds);
		return "sale_chart";
	}
	public String chart() throws Exception{
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
		String dateString = formatter.format(currentTime);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Hchart<Double>> l = new ArrayList<Hchart<Double>>();
		@SuppressWarnings("rawtypes")
		List list = buildingsService.findSale(builds.getId(),dateString);
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
