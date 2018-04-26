package com.gs.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.gs.pojo.History;
import com.gs.pojo.User;
import com.gs.service.HistoryService;
import com.opensymphony.xwork2.ActionSupport;

public class HistoryAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 360683715196149161L;
	
	private History history;
	private User user;
	private String user_id;
	private HistoryService historyService;
	private String msg;
	
	private int pageSize;
	private int pageNumber;
	private int total;
	private List<History> rows;
	private Map session;
	
	
	
	public String add(){
		String user_id=history.getUser_id();
		String buildings_id=history.getBuildings_id();
		history = historyService.queryByid(user_id, buildings_id);
		if(history==null){
			History history1 = new History();
			history1.setBuildings_id(buildings_id);
			history1.setUser_id(user_id);
			history1.setCreated_time(new Date());
			historyService.add(history1);
			return "add";
		}else{
			return "add";
		}
		
	}
	//我的足迹
	public String myall(){
		user=(User)session.get("user");
		return "myall";
	}
	public String myall2(){
		rows = historyService.listByUser_id(pageSize, pageNumber, user_id);
		total = historyService.countByUser_id(user_id);
		return "myall2";
	}
	public String del(){
		history = historyService.queryById(history.getId());
		historyService.delete(history);
		msg = "已成功删除足迹";
		return "add";
	}
	
	
	
	
	
	
	
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public History getHistory() {
		return history;
	}
	public void setHistory(History history) {
		this.history = history;
	}
	public void setHistoryService(HistoryService historyService) {
		this.historyService = historyService;
	}
	public String getMsg() {
		return msg;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<History> getRows() {
		return rows;
	}
	public void setRows(List<History> rows) {
		this.rows = rows;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	
}
