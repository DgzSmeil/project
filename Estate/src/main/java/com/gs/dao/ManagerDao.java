package com.gs.dao;

import java.util.List;

import com.gs.pojo.Manager;

public interface ManagerDao  extends BaseDAO<String, Manager>{
	public Manager login(String name,String password);
	public Manager phonelogin(String phone);
	public void updatePwd(String pwd,String id);
	
}
