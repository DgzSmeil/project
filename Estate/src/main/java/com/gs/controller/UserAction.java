package com.gs.controller;


import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.gs.code.GetPhoneMessage;
import com.gs.pojo.Ads;
import com.gs.pojo.Agency;
import com.gs.pojo.Article;
import com.gs.pojo.Buildings;
import com.gs.pojo.User;
import com.gs.service.AdsService;
import com.gs.service.AgencyService;
import com.gs.service.ArticleService;
import com.gs.service.BuildingsService;
import com.gs.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class UserAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = 4172742928927458240L;
	
	private User user;
	private List<Buildings> buildingsList;
	private List<Buildings> List2;
	private List<Buildings> list3;
	private List<Buildings> list4;
	private List<Buildings> list5;
	private Map session;
	private List<Agency> agencielist;
	private List<Article> articlelist;
	private List<Ads> adslist;
	private List<Ads> adslist2;
	private AdsService adsService;
	private UserService userService;
	private BuildingsService buildingsService;
	private AgencyService agencyService;
	private ArticleService articleService;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	private String imageContentType = "jpg";
	private String imageFileName;
	private String realpath;
	private File upload;

	private int pageSize;
	private int pageNumber;
	private int total;//每页显示数
	private List<User> rows;//第几页
	private String searchText;
	private int vcode;
	private String msg;
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getVcode() {
		return vcode;
	}
	//首页
	public String homepage() throws Exception{
		user=(User)session.get("user");
		if(user.getId()!=null) {
			user=userService.queryById(user.getId());
			buildingsList=buildingsService.builds(0,6);
			List2=buildingsService.builds(6,6);
			list3=buildingsService.builds(12, 6);
			list4=buildingsService.builds(18, 6);
			list5=buildingsService.builds(24, 6);
			agencielist = agencyService.builds(0, 7);
			articlelist = articleService.builds(0, 4);
			adslist = adsService.builds(0, 3);
			adslist2 = adsService.builds(3, 2);
			return "homepage";
		}
		return "homepage";
	}
	//进入没有登录的首页
	public String home() throws Exception{
		user=(User)session.get("user");
		buildingsList=buildingsService.builds(0,6);
		List2=buildingsService.builds(6,6);
		list3=buildingsService.builds(12, 6);
		list4=buildingsService.builds(18, 6);
		list5=buildingsService.builds(24, 6);
		agencielist = agencyService.builds(0, 7);
		articlelist = articleService.builds(0, 4);
		adslist = adsService.builds(0, 3);
		adslist2 = adsService.builds(3, 2);
		return "homepage";
	}
	//注册
	public String registeredpage() throws Exception{
		user=(User)session.get("user");
		return "registered";
	}
	public String registered() throws Exception{
			if(user.getPhone()!=null || user.getPhone().equals("")) {
				User user2 = userService.queryforcheck(user.getPhone(),null);
				if(user2!=null) {
					request.setAttribute("msg", "该手机号码已注册");
					return "registered";
				}
			} 
			if(user.getEmail()!=null || user.getEmail().equals("")) {
				User user3= userService.queryforcheck(null,user.getEmail());
				if(user3!=null) {
					request.setAttribute("msg", "请填写有效的邮箱地址");
					return "registered";
				}
			}
			user.setStatus("Y");
			user.setHeadicon("head.png");
			userService.add(user);
			request.setAttribute("msg", "success");
			return "registered";
		
	}
	//登录
	public String loginPage() throws Exception{
		return "login";
	}
	
	public String login() throws Exception{	
		if(user!=null) {
		 if(user.getPhone()!=null && user.getPwd()==null ||!user.getPhone().equals("") && user.getPwd().equals("")){
				user.setStatus("Y");
				user= userService.login(user);
				if(user!=null) {
					buildingsList=buildingsService.builds(0,6);
					List2=buildingsService.builds(6,6);
					list3=buildingsService.builds(12, 6);
					list4=buildingsService.builds(18, 6);
					list5=buildingsService.builds(24, 6);
					agencielist = agencyService.builds(0, 7);
					articlelist = articleService.builds(0, 4);
					adslist = adsService.builds(0, 3);
					adslist2 = adsService.builds(3, 2);
					session.put("user", user);
					request.setAttribute("success", "登录成功");
					return "homepage";
				}else {
					request.setAttribute("loginerror", "请输入有效账号或密码");
					return "login";
				}
			}else if(user.getPhone()!=null && user.getPwd()!=null || !user.getPhone().equals("")&&!user.getPwd().equals("")) {
				user.setStatus("Y");
				user= userService.login(user);
				if(user!=null) {
					buildingsList=buildingsService.builds(0,6);
					List2=buildingsService.builds(6,6);
					list3=buildingsService.builds(12, 6);
					list4=buildingsService.builds(18, 6);
					list5=buildingsService.builds(24, 6);
					agencielist = agencyService.builds(0, 7);
					articlelist = articleService.builds(0, 4);
					adslist = adsService.builds(0, 3);
					adslist2 = adsService.builds(3, 2);
					session.put("user", user);
					request.setAttribute("success", "登录成功");
					return "homepage";
				}else {
					request.setAttribute("loginerror", "请输入有效账号或密码");
					return "login";
				}
			}else {
				request.setAttribute("loginerror", "请填写登录信息！");
				return "login";
			}
		}
		return "login";
	}
	//用户退出账号
	public String exited() throws Exception{
		session.clear();
		return "login";
	}
	//用户个人信息查看
	public String information() throws Exception{
		user=(User)session.get("user");
		return "information";
	}
	public String update() throws Exception{
		if(user.getPhone()==null || user.getPhone().equals("")) {
			request.setAttribute("msg", "请核对您的手机号码");
			return "information";
		}
		if(user.getEmail()==null || user.getEmail().equals("")) {
			request.setAttribute("msg", "请核对您的邮箱地址");
			return "information";
		}
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		imageFileName = dateString;
		realpath = request.getRealPath("/upload");
		if (upload != null) {
			File savefile = new File(new File(realpath), imageFileName + "." + imageContentType);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(upload, savefile);
			String path =imageFileName;
			path += "." + imageContentType;
			user.setHeadicon(path);
			
		} 
		user.setStatus("Y");
		userService.update(user);
		user = userService.queryById(user.getId());
		session.put("user", user);
		request.setAttribute("msg", "success");
		return "information";
	}
	//修改密码
	public String changePwd() throws Exception{
		user=(User)session.get("user");
		return "changePwd";
	}
	public String updatePwd() throws Exception{
		userService.updataPwd(user);
		request.setAttribute("msg", "密码修改成功！请妥善保管");
		user=userService.queryById(user.getId());
		session.put("user", user);
		return "changePwd";
	}
	public String look(){
		user=(User)session.get("user");
		return "look";
	}
	
	
//manager start
	public String mgnuserpage() throws Exception{
		return "mgnuser";
	}
	public String userpager() throws Exception{
		
		HttpSession session1=request.getSession();
		if(searchText!=null&&!searchText.equals(""))
		{
			rows=userService.allsearch(pageNumber, pageSize, searchText);
			total=userService.allsearchcount(searchText);
			return "returnjson";
		}else if(session1.getAttribute("search")!=null)
		{
			
			session1.setAttribute("search",null);
			User searchuser=(User)session1.getAttribute("searchuser");
			rows=userService.search(pageNumber,pageSize,searchuser);
			total=userService.searchcount(searchuser);
			
			return "returnjson";
		}else {
			rows=userService.userpager(pageSize, pageNumber);
			total=userService.usercount();
			return "returnjson";
		}
		
	}
	public String active() throws Exception {
		userService.active(user.getId());
		msg = "该用户已启用！";
		return "returnjson";
	}
	public String inactive() throws Exception {
		userService.inactive(user.getId());
		msg = "该用户已禁用！";
		return "returnjson";
	}
	public String userlook() throws Exception {
		user=userService.queryById(user.getId());
		request.setAttribute("user",user );
		return "mgnuserlook";
	}
	public String search() throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("search","88");
		session.setAttribute("searchuser", user);
		return "mgnuser";
	}
	//manager end
	
	
	public List<Buildings> getList2() {
		return List2;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getTotal() {
		return total;
	}
	public List<User> getRows() {
		return rows;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	
	public List<Buildings> getBuildingsList() {
		return buildingsList;
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
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public String yzm() throws Exception{
		System.out.println("11");
		if(user.getPhone()!=null){
			vcode = Integer.parseInt(new GetPhoneMessage().GetPhoneMessages(user.getPhone()));
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(vcode);
			out.flush();
			out.close();
			System.out.println("22");
		}
		return "yzm";
	
		}
	public void setAgencielist(List<Agency> agencielist) {
		this.agencielist = agencielist;
	}
	public List<Agency> getAgencielist() {
		return agencielist;
	}
	public void setAgencyService(AgencyService agencyService) {
		this.agencyService = agencyService;
	}
	public List<Article> getArticlelist() {
		return articlelist;
	}
	public void setArticlelist(List<Article> articlelist) {
		this.articlelist = articlelist;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public List<Buildings> getList3() {
		return list3;
	}
	public List<Buildings> getList4() {
		return list4;
	}
	public List<Buildings> getList5() {
		return list5;
	}
	public List<Ads> getAdslist() {
		return adslist;
	}
	public void setAdsService(AdsService adsService) {
		this.adsService = adsService;
	}
	public List<Ads> getAdslist2() {
		return adslist2;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

}
