package com.gs.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.alibaba.fastjson.JSON;
import com.gs.pojo.Like;
import com.gs.pojo.User;
import com.gs.service.LikeService;
import com.gs.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class LikeAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = -2685400491154402413L;
	private User user;
	private Like like;
	private String buildings_id;
	private List<Like> likes;
	private String msg;
	private Map session;
	private UserService userService;
	private LikeService likeService;
	//分页所需
	private int pageSize;//每页显示数
	private int pageNumber;//第几页
	private int total;//总计路数
	private List<Like> rows;//所有记录
	private String user_id;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	

	// 点赞
	public String addLike() throws Exception {
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		like = likeService.likeCount(user.getId(), buildings_id);
		if (like!=null) {
			msg="该楼盘已点赞";
			out.println(JSON.toJSONString(msg));
			return null;
		}else{
			Like like1 = new Like();
			like1.setUser_id(user.getId());
			like1.setBuildings_id(buildings_id);
			like1.setCreated_time(new Date());
			like1.setStatus("Y");
			likeService.add(like1);
			msg="点赞成功！";
			out.println(JSON.toJSONString(msg));
			return null;
		}
		
	}

	// 查看点赞记录
	public String likelist() throws Exception{
		PrintWriter out = response.getWriter();
		likes = likeService.querylist(user.getId());
		out.println(JSON.toJSONString(likes));
		return null;
	}
	//前台用户中心查看所有点赞记录
	public String  all(){
		user=(User)session.get("user");
		return "all";
	}
	public String all2(){
		rows=likeService.list(pageSize, pageNumber, user_id);
		total=likeService.count(user_id);
		return "all2";
	}
	//查看是否点赞
	public String findlike() throws Exception{
		PrintWriter out = response.getWriter();
		like = likeService.likeCount(user.getId(), buildings_id);
		out.println(JSON.toJSONString(like));
		return null;
	}
	//删除
	public String del(){
		like = likeService.queryById(like.getId());
		likeService.delete(like);
		msg = "已成功删除";
		return "del";
	}
	
	
	
	
	public String getMsg() {
		return msg;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Like getLike() {
		return like;
	}
	public void setLike(Like like) {
		this.like = like;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setLikeService(LikeService likeService) {
		this.likeService = likeService;
	}
	public List<Like> getLikes() {
		return likes;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Like> getRows() {
		return rows;
	}
	public void setRows(List<Like> rows) {
		this.rows = rows;
	}
	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
}
