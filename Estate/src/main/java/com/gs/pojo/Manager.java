package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;

public class Manager implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -712203914881102771L;
	private String id;
	private String name;
	private String email;
	
	
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHeadicon() {
		return headicon;
	}
	public void setHeadicon(String headicon) {
		this.headicon = headicon;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String pwd;
	private String phone;	
	private String tel;
	private String headicon;
}
