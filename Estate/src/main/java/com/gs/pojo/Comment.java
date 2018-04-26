package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

//评价表
public class Comment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id ;//varchar(36)	编号,UUID，主键
	private String content ;//text	评价内容
	private String buildings_id ;//varchar(36)	楼盘编号，外键字段，来源于t_buildings的id字段，如果此字段为空，则表示是由平台管理员发布的活动
	private Date comment_time ;//datetime	评价时间
	private String user_id ;//varchar(36)	用户编号，外键字段，来源于t_user表的id字段
	private String status ;//varchar(2)	状态，激活或冻结
	//多对一
	private User user;
	private Buildings buildings;
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
	public Date getComment_time() {
		return comment_time;
	}
	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
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
