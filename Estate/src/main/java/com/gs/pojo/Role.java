package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

//角色表
public class Role implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id ;//varchar(36)	编号,UUID，主键
	private String iname ;//varchar(50)	角色名称,not null
	private String ides ;//varchar(50)	角色描述,not null
	private Date icreated_time ;//datetime	创建时间
	private String istatus ;//varchar(2)	状态，激活或冻结
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public String getIdes() {
		return ides;
	}
	public void setIdes(String ides) {
		this.ides = ides;
	}
	public Date getIcreated_time() {
		return icreated_time;
	}
	public void setIcreated_time(Date icreated_time) {
		this.icreated_time = icreated_time;
	}
	public String getIstatus() {
		return istatus;
	}
	public void setIstatus(String istatus) {
		this.istatus = istatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
