package com.gs.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.gs.pojo.Buildings;
import com.gs.pojo.Comment;
import com.gs.pojo.User;
import com.gs.service.BuildingsService;
import com.gs.service.CommentService;
import com.gs.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport implements ServletRequestAware,SessionAware{

	private static final long serialVersionUID = -1023286493552312226L;
	private User user;
	private String user_id;
	private Buildings buildings;
	private String buildings_id;
	private Comment comment;
	
	private CommentService commentService;
	private UserService userService;
	private BuildingsService buildingsService;
	private Map session;
	HttpServletRequest request = ServletActionContext.getRequest();
	
	private int pageSize;//每页显示数
	private int pageNumber;//第几页
	private int total;//总记录数
	private List<Comment> rows;//所有记录
	private String msg;
	
	
	public String getMsg() {
		return msg;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public List<Comment> getRows() {
		return rows;
	}
	public void setRows(List<Comment> rows) {
		this.rows = rows;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Buildings getBuildings() {
		return buildings;
	}
	public void setBuildings(Buildings buildings) {
		this.buildings = buildings;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
	//所有评价页面
	public String all() throws Exception{
		user=(User)session.get("user");
		return "all";
	}
	public String all2() throws Exception{
		rows = commentService.builds(pageNumber, pageSize, buildings_id);
		total = commentService.countByBuildings_id(buildings_id);
		return "all2";
	}
	//添加评论
	public String add() throws Exception{
		String user_id=comment.getUser_id();
		String buildings = comment.getBuildings_id();
		String conment = comment.getContent();
		comment = commentService.queryId(buildings, user_id);
		if(comment==null){
			Comment comment1 = new Comment();
			comment1.setBuildings_id(buildings);
			comment1.setUser_id(user_id);
			comment1.setContent(conment);
			comment1.setComment_time(new Date());
			comment1.setStatus("Y");
			commentService.add(comment1);
			msg="点评成功";
			return "add";
		}else{
			msg = "亲，您已经点评过该楼盘了，去其他楼盘点评吧(*^_^*)";
			return "add";
		}
		
	} 
	//我的评价列表
	public String myall() throws Exception{
		user=(User)session.get("user");
		return "myall";
	}
	public String myall2() throws Exception{
		rows = commentService.listByUser_id(pageSize, pageNumber, user_id);
		total = commentService.countByUser_id(user_id);
		return "myall2";
	}
	public String del(){
		comment = commentService.queryById(comment.getId());
		commentService.delete(comment);
		msg = "已成功删除！";
		return "add";
	}

	
	
	
}
