package com.gs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.gs.pojo.Buildings;
import com.gs.pojo.Message;
import com.gs.pojo.User;
import com.gs.service.BuildingsService;
import com.gs.service.MessageService;
import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport implements ServletRequestAware,SessionAware{

	private static final long serialVersionUID = 1733670842010298838L;
	
	private HttpServletRequest request;
	private Message message;
	
	//分页所需
	private int pageSize;//每页显示数
	private int pageNumber;//第几页
	private int total;//总计路数
	private List<Message> rows;//所有记录
	private String buildings_id;
	private String agency_id;
	private String searchText;
	private List<Buildings> buildingsList;
	private BuildingsService buildingsService;
	private MessageService messageService;
	private String msg;
	private User user;
	private String user_id;
	private Map session;
	
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
	public String getMsg() {
		return msg;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<Message> getRows() {
		return rows;
	}
	public void setRows(List<Message> rows) {
		this.rows = rows;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public List<Buildings> getBuildingsList() {
		return buildingsList;
	}
	public void setBuildingsList(List<Buildings> buildingsList) {
		this.buildingsList = buildingsList;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setBuildingsService(BuildingsService buildingsService) {
		this.buildingsService = buildingsService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
		
	}
	
	//分页
	public String list1(){
		buildingsList=buildingsService.querylist(agency_id);
		return "list1";
	}
	//分页
	public String list(){
		if (searchText!=null && !searchText.equals("")){
			rows=messageService.search(pageNumber, pageSize, searchText, agency_id);
			total=messageService.searchcount(searchText, agency_id);
		}else{
			rows=messageService.list(pageSize, pageNumber, agency_id);
			total=messageService.count(agency_id);
		}
		return "list";
	}
	//分页
	public String list2(){
		if (searchText!=null && !searchText.equals("")){
			if(!buildings_id.equals("1")){
				rows=messageService.search(pageNumber, pageSize, searchText, agency_id, buildings_id);
				total=messageService.searchcount(searchText, agency_id, buildings_id);
			}else{
				rows=messageService.search(pageNumber, pageSize, searchText, agency_id);
				total=messageService.searchcount(searchText, agency_id);
			}
		}else{
			if(!buildings_id.equals("1")){
				rows=messageService.list(pageSize, pageNumber, agency_id,buildings_id);
				total=messageService.count(agency_id,buildings_id);
			}else{
				rows=messageService.list(pageSize, pageNumber, agency_id);
				total=messageService.count(agency_id);
			}
		}
		
		buildingsList=buildingsService.querylist(agency_id);
		return "list";
	}
	//修改状态
	public String status(){
		message=messageService.queryById(message.getId());
		if(message.getStatus().equals("Y")){
			messageService.updateStatus(message.getId(), message.getStatus());
			msg = "状态修改成功";
		}else{
			messageService.updateStatus(message.getId(), message.getStatus());
			msg = "状态修改成功";
		}
		
		return "status";
	}
	//进入回复页面
	public String update(){
		message=messageService.queryById(message.getId());
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		return "update";
	}
	//回复
	public String updateSave(){
		message.setLeave_time(message.getLeave_time());
		message.setReply_time(new Date());
		messageService.update(message);
		buildingsList=buildingsService.querylist(message.getAgency_id());
		agency_id=message.getAgency_id();
		return "updateSave";
	}
	//查看
	public String look(){
		message=messageService.queryById(message.getId());
		return "look";
	}
	//前台留言
	public String add(){
		String user_id = message.getUser_id();
		String buildings_id = message.getBuildings_id();
		String agency_id = message.getAgency_id();
		String content = message.getContent();
		message = messageService.queryId(buildings_id, user_id);
		if (message==null) {
			Message message1 = new Message();
			message1.setLeave_time(new Date());
			message1.setStatus("Y");
			message1.setUser_id(user_id);
			message1.setBuildings_id(buildings_id);
			message1.setAgency_id(agency_id);
			message1.setContent(content);
			messageService.add(message1);
			msg="十分感谢您的留言";
			return "add";
		}else{
			msg = "亲，您已经点评过该楼盘了，去其他楼盘点评吧(*^_^*)";
			return "add";
		}
		
		
	}
	//前台删除留言
	public String del(){
		message = messageService.queryById(message.getId());
		messageService.delete(message);
		msg="已成功删除留言";
		return "del";
	}
	//前台留言分页
	public String myall(){
		user=(User)session.get("user");
		return "myall";
	}
	public String myall2(){
		rows = messageService.listByUser_id(pageSize, pageNumber, user_id);
		total = messageService.countByUser_id(user_id);
		return "myall2";
	}
}
