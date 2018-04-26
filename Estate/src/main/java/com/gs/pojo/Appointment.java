package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

//购房预约表
public class Appointment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id ;//	varchar(36)	编号,UUID，主键
	private String emp_id ;//	varchar(36)	员工编号，外键字段，来源于t_employee表的id字段
	private String user_id ;//	varchar(36)	用户编号，外键字段，来源于t_user表的id字段
	private Date app_arrive_time ;//	datetime	预约看房时间
	private Date arrive_time ;//	datetime	真实看房时间
	private String house_id ;//	varchar(36)	户型编号，外键字段，来源于t_house表的id字段
	private String app_status ;//	varchar(20)	预约状态
	private Date created_time ;//	datetime	创建时间
	private String status ;//	varchar(2)	状态，激活或冻结
	//配置多对一
	private Employee employee;
	private House house;
	private User users;
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public House getHouse() {
		return house;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	public User getUsers() {
		return users;
	}
	public void setUsers(User users) {
		this.users = users;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getApp_arrive_time() {
		return app_arrive_time;
	}
	public void setApp_arrive_time(Date app_arrive_time) {
		this.app_arrive_time = app_arrive_time;
	}
	public Date getArrive_time() {
		return arrive_time;
	}
	public void setArrive_time(Date arrive_time) {
		this.arrive_time = arrive_time;
	}
	public String getHouse_id() {
		return house_id;
	}
	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
	public String getApp_status() {
		return app_status;
	}
	public void setApp_status(String app_status) {
		this.app_status = app_status;
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


}
