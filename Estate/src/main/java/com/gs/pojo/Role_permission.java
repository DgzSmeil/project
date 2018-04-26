package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

//角色权限表
public class Role_permission implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id ;//varchar(36)	编号,UUID，主键
	private String role_id ;//varchar(500)	角色编号，外键字段，来源于t_role表的id字段
	private String permission_id ;//varchar(50)	权限编号，外键字段，来源于t_permission表的id字段
	private Date created_time ;//datetime	创建时间
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public String getPermission_id() {
		return permission_id;
	}
	public void setPermission_id(String permission_id) {
		this.permission_id = permission_id;
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
