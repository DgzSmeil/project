package com.gs.pojo;

import java.io.Serializable;

public class Mission implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;//编号,UUID，主键
	private int quantity;//员工任务量
	private int monthes;//月份
	private String emp_id;//员工编号，外键字段，来源于t_employee表的id字段
	private Double bonus_percent;//销售提成百分比
	private int sales;//销售数量
	private Double salary;//该月工资
	private String yearmonth;//哪年哪月
	public String getYearmonth() {
		return yearmonth;
	}
	public void setYearmonth(String yearmonth) {
		this.yearmonth = yearmonth;
	}
	//配置多对一
	private Employee employee;
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getSales() {
		return sales;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public Double getSalary() {
		return salary;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Employee getEmployee() {
		return employee;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getMonthes() {
		return monthes;
	}
	public void setMonthes(int monthes) {
		this.monthes = monthes;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public Double getBonus_percent() {
		return bonus_percent;
	}
	public void setBonus_percent(Double bonus_percent) {
		this.bonus_percent = bonus_percent;
	}

}
