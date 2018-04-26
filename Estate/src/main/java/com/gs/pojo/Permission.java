package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

//权限表
public class Permission implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id ;//varchar(36)	编号,UUID，主键
	private String name	;//varchar(500)	权限名称,not null
	private String des ;//varchar(50)	权限描述,not null
	private Date created_time ;//	datetime	创建时间
	private String status ;//	varchar(2)	状态，激活或冻结
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
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
