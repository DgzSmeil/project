package com.gs.pojo;

import java.io.Serializable;
import java.util.Date;



public class Customer implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;//	编号,UUID，主键
	private String name;//	姓名
	private String gender;//	性别
	private Date birthday;//生日
	private String identity_id;//	身份证号
	private String email;//	邮箱,not null
	private String phone;//手机号，not null,unique
	private String address;//	联系地址,not null
	private String customer_type;//	客户类型，如预约客户，预定客户，购房客户
	private String together;//	共同购房人姓名，多个姓名用英文逗号隔开
	private String contract;//	电子版购房合同路径
	private String archives;//zip版电子档案路径
	private String employee_id; //员工编号，外键字段，来源于t_employee表的id字段
	private Date created_time;//	创建时间
	private String status;//	状态，激活或冻结
	//配置多对一  多个客户对一个员工
	private Employee employee;
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getContract() {
		return contract;
	}
	public void setContract(String contract) {
		this.contract = contract;
	}
	public String getArchives() {
		return archives;
	}
	public void setArchives(String archives) {
		this.archives = archives;
	}
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
	public String getIdentity_id() {
		return identity_id;
	}
	public void setIdentity_id(String identity_id) {
		this.identity_id = identity_id;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCustomer_type() {
		return customer_type;
	}
	public void setCustomer_type(String customer_type) {
		this.customer_type = customer_type;
	}
	public String getTogether() {
		return together;
	}
	public void setTogether(String together) {
		this.together = together;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
