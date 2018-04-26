package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

//用户表
public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id ;//	varchar(36)	编号,UUID，主键
	private String email ;//	varchar(50)	用户邮箱,not null
	private	String phone ;//	varchar(11)手机号,unique,not null
	private	String pwd ;//	varchar(20)密码,md5加密，not null
	private String qq ;//	varchar(20)	qq号
	private String wechat ;//	varchar(50)	微信号
	private String gender ;//	varchar(2)	性别
	private Date birthday ;//	date生日
	private String nickname ;//	varchar(50)	昵称
	private String name ; //	varchar(20)	真实姓名
	private String headicon ;//	varchar(500)用户头像，default
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHeadicon() {
		return headicon;
	}
	public void setHeadicon(String headicon) {
		this.headicon = headicon;
	}
	
}
