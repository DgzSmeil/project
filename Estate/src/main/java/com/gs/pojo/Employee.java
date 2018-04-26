package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;//员工编号,UUID，主键
	private String name;//员工名称
	private String email;//邮箱，unique
	private String pwd;//密码,自动生成，使用默认密码not null
	private String phone;//手机号,用于登录账号，unique，not null
	private String qq;//qq号
	private String wechat;//微信号
	private String gender;//性别
	private String exp;//工作经验描述
	private String des;//最多50个字的个人说明
	private String address;//地址
	private Double basic_salary;//基本工资，not null
	private String headicon;//头像，default
	private String intro;//简介
	private String angency_id;//员工所属经销商,外键字段，来源于t_angency的id字段
	private String building_id;//负责的楼盘，外键字段，来源于t_buildings的id字段
	
	private Date created_time;//创建时间
	private String status;//状态，激活或冻结
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public String getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getWechat() {
		return wechat;
	}
	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getExp() {
		return exp;
	}
	public void setExp(String exp) {
		this.exp = exp;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getBasic_salary() {
		return basic_salary;
	}
	public void setBasic_salary(Double basic_salary) {
		this.basic_salary = basic_salary;
	}
	public String getHeadicon() {
		return headicon;
	}
	public void setHeadicon(String headicon) {
		this.headicon = headicon;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getAngency_id() {
		return angency_id;
	}
	public void setAngency_id(String angency_id) {
		this.angency_id = angency_id;
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
