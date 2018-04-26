package com.gs.service;

import com.gs.pojo.Manager;

public interface ManagerService extends BaseService<String, Manager>{
	public Manager login(String name,String password);
	public Manager phonelogin(String phone);
	public void updatePwd(String pwd,String id);
}
