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

import com.gs.pojo.Article;
import com.gs.pojo.ArticleType;
import com.gs.pojo.Buildings;
import com.gs.pojo.User;
import com.gs.service.ArticleService;
import com.gs.service.BuildingsService;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = -1831113071665146064L;
	//文件上传
	private String imageFileName;
	private File upload;
	private String imageContentType = "jpg";
	private Map session;
	private User user;
	private int pageSize;
	
	private int pageNumber;
	private int total;//每页显示数
	private List<Article> rows;//第几页
	private String searchText;
	private Article article;
	private ArticleService articleService;
	private BuildingsService buildingsService;
	private List<Buildings> buildinglist;
	List<ArticleType> atcTypeList;
	private int page;
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	HttpServletRequest request = ServletActionContext.getRequest();
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public List<ArticleType> getAtcTypeList() {
		return atcTypeList;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public int getTotal() {
		return total;
	}
	public List<Article> getRows() {
		return rows;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public String articlePage() throws IOException{
		return "ArticlePage";
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
		
	}
	public List<Buildings> getBuildinglist() {
		return buildinglist;
	}
	public void setBuildinglist(List<Buildings> buildinglist) {
		this.buildinglist = buildinglist;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public String articlePager() throws IOException{
		HttpSession session1=request.getSession();
		if(session1.getAttribute("search")!=null)
		{
			Article searcharticle=(Article)session1.getAttribute("searcharticle");
			rows=articleService.search(pageNumber, pageSize, searcharticle);
			total=articleService.searchcount(searcharticle);
			session1.setAttribute("search",null);
			return "returnjson";
		}else if(searchText!=null&&!searchText.equals(""))
		{
			rows=articleService.allsearch(pageNumber, pageSize, searchText);
			total=articleService.allsearchcount(searchText);
			return "returnjson";
		}else{
			rows=articleService.articlePager(pageNumber, pageSize);
			total=articleService.articleCount();
			return "returnjson";
		}
	}
	public String articleAddPage() throws IOException{
		atcTypeList=articleService.findAtcTypeList();
		
		return "articleAddPage";
	}
	public String articleAdd() throws IOException{
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
			article.setLogo(path);
		}
		article.setStatus("Y");
		article.setCreated_time(new Date());
		articleService.add(article);
		return "ArticlePage";
	}
	public String articleEditPage() throws IOException{
		article=articleService.queryById(article.getId());
		request.setAttribute("article",article );
		atcTypeList=articleService.findAtcTypeList();
		return "articleEditPage";
	}
	public String articleEdit() throws IOException{
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
			article.setLogo(path);
		}
		articleService.update(article);
		return "ArticlePage";
		}
	public String articleLook() throws IOException{
		article=articleService.queryById(article.getId());
		request.setAttribute("article",article );
		return "articleLook";
	}
	public String search() throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("search","88");
		session.setAttribute("searcharticle", article);
		return "ArticlePage";
	}
	public String active() throws Exception {
		articleService.active(article.getId());
		msg = "该文章已启用！";
		return "returnjson";
	}
	public String inactive() throws Exception {
		articleService.inactive(article.getId());
		msg = "该文章已禁用！";
		return "returnjson";
	}
	//前台查看单个新闻
	public String look(){
		user=(User)session.get("user");
		article = articleService.queryById(article.getId());
		buildinglist = buildingsService.builds(0, 4);
		return "look";
	}
	//前台显示所有新闻
	public String all(){
		user=(User)session.get("user");
		rows = articleService.builds(0, 6);
		total = articleService.buildsCount();
		buildinglist = buildingsService.builds(0, 4);
		return "all";
	}
	public String all2() throws Exception{
		if(page<0) {
			page = 0;
		}
		int frist = (page-1)*6;
		rows = articleService.builds(frist, 6);
		return "all2";
	}

}
