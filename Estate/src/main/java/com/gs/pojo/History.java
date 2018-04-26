package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

//历史记录表
public class History implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id ;//varchar(36)	编号,UUID，主键
	private String user_id ;//varchar(50)	客户编号，外键字段，来源于t_customer表的id字段 
	private String buildings_id ;//	varchar(36)	楼盘编号，外键字段，来源于t_buildings的id字段
	private Date created_time ;//	datetime	创建时间
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBuildings_id() {
		return buildings_id;
	}
	public void setBuildings_id(String buildings_id) {
		this.buildings_id = buildings_id;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
