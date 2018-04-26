package com.gs.pojo;

import java.io.Serializable;
import java.sql.Timestamp;


public class Sale implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;//编号,UUID，主键
	private String customer_id;//客户编号，外键字段，来源于t_customer表的id字段 
	private Timestamp sale_time;//销售时间
	private Double unit_price;//销售单价
	private String room_id;//房屋编号
	private Double discount;//销售折扣
	private Double total_cost;//销售总价
	private String emp_id;//员工编号，外键字段，来源于t_employee表的id字段
	private Timestamp created_time;//创建时间
	private String status;//状态，激活或冻结
	//配置多对一
	private Employee employee;
	private Room room;
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	private Customer customer;
	public String getId() {
		return id;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public Timestamp getSale_time() {
		return sale_time;
	}
	public void setSale_time(Timestamp sale_time) {
		this.sale_time = sale_time;
	}
	public Double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(Double unit_price) {
		this.unit_price = unit_price;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Double getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(Double total_cost) {
		this.total_cost = total_cost;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public Timestamp getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Timestamp created_time) {
		this.created_time = created_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
