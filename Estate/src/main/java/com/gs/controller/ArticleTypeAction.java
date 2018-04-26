package com.gs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;

import com.gs.pojo.Agency;
import com.gs.pojo.ArticleType;
import com.gs.pojo.House;
import com.gs.service.ArticleTypeService;
import com.gs.service.HouseService;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.xml.internal.serializer.ElemDesc;

public class ArticleTypeAction extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9043460357303873580L;
	private int pageSize;
	private int pageNumber;
	private int total;//每页显示数
	private List<ArticleType> rows;//第几页
	private String searchText;
	private ArticleType articleType;
	private ArticleTypeService articleTypeService;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public List<ArticleType> getRows() {
		return rows;
	}
	public ArticleType getArticleType() {
		return articleType;
	}
	public void setArticleType(ArticleType articleType) {
		this.articleType = articleType;
	}
	public int getTotal() {
		return total;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setArticleTypeService(ArticleTypeService articleTypeService) {
		this.articleTypeService = articleTypeService;
	}
	public String articleTypePage() throws IOException{
		
		return "ArticleTypePage";
	}
	public String articleTypePager() throws IOException{
		HttpSession session1=request.getSession();
		if(session1.getAttribute("search")!=null)
		{
			ArticleType searchArticleType=(ArticleType)session1.getAttribute("searchArticleType");
			rows=articleTypeService.search(pageNumber, pageSize, searchArticleType);
			total=articleTypeService.searchcount(searchArticleType);
			session1.setAttribute("search",null);
			return "returnjson";
		}else if(searchText!=null&&!searchText.equals(""))
		{
			rows=articleTypeService.allsearch(pageNumber, pageSize, searchText);
			total=articleTypeService.allsearchcount(searchText);
			System.out.println("total==="+total);
			return "returnjson";
		}else{
			rows=articleTypeService.articleTypePager(pageNumber, pageSize);
			total=articleTypeService.articleTypeCount();
			return "returnjson";
		}
		
	}
	public String articleTypeAddPage() throws IOException{
		
		return "articleTypeAddPage";
	}
	public String articleTypeAdd() throws IOException{
		articleType.setStatus("Y");
		articleTypeService.add(articleType);
		return "ArticleTypePage";
	}
	public String active() throws Exception {
		articleTypeService.active(articleType.getId());
		msg = "该文章类别已启用！";
		return "returnjson";
	}
	public String inactive() throws Exception {
		articleTypeService.inactive(articleType.getId());
		msg = "该文章类别已禁用！";
		return "returnjson";
	}
	public String articleTypeEditPage() throws IOException{
		articleType=articleTypeService.queryById(articleType.getId());
		request.setAttribute("articleType",articleType );
		return "articleTypeEditPage";
	}
	public String articleTypeEdit() throws IOException{
		System.out.println(articleType.getStatus());
		articleTypeService.update(articleType);
		return "ArticleTypePage";
		}
	public String articleTypeLook() throws IOException{
		articleType=articleTypeService.queryById(articleType.getId());
		request.setAttribute("articleType",articleType );
		return "articleTypeLook";
		}
	public String search() throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("search","88");
		session.setAttribute("searchArticleType", articleType);
		return "ArticleTypePage";
	}

}
