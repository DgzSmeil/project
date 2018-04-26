package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

//留言表
public class Message implements Serializable{

	private static final long serialVersionUID = 1L;

	private String id ;// varchar(36)编号,UUID，主键
	private String content ;// text	留言内容
	private String buildings_id ;// varchar(36)	楼盘编号，外键字段，来源于t_buildings的id字段，如果此字段为空，则表示是由平台管理员发布的活动
	private String reply ;// text	回复内容
	private Date leave_time ;// datetime	留言时间
	private Date reply_time ;// datetime	回复时间
	private String user_id ;// varchar(36)	用户编号，外键字段，来源于t_user表的id字段
	private String status ;// varchar(2)	状态，激活或冻结
	private String agency_id;
	//多对一
	private Buildings buildings;
	private User user;
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public Buildings getBuildings() {
		return buildings;
	}
	public void setBuildings(Buildings buildings) {
		this.buildings = buildings;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getLeave_time() {
		return leave_time;
	}
	public void setLeave_time(Date leave_time) {
		this.leave_time = leave_time;
	}
	public Date getReply_time() {
		return reply_time;
	}
	public void setReply_time(Date reply_time) {
		this.reply_time = reply_time;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
