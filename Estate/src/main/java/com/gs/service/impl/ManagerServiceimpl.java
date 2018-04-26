package com.gs.service.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.gs.common.bean.Pager4EasyUI;

import com.gs.dao.ManagerDao;
import com.gs.pojo.Agency;
import com.gs.pojo.Manager;
import com.gs.service.ManagerService;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class ManagerServiceimpl implements ManagerService {
	private ManagerDao managerDao;

	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	@Override
	public Manager queryById(String id) {
		// TODO Auto-generated method stub
		return managerDao.queryById(id);
	}

	@Override
	public List<Manager> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Manager> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Manager t) {
		managerDao.update(t);
	}

	@Override
	public void add(Manager t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Manager t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Manager login(String name, String password) {
		// TODO Auto-generated method stub
		return managerDao.login(name, password);
	}

	@Override
	public Manager phonelogin(String phone) {
		// TODO Auto-generated method stub
		return managerDao.phonelogin(phone);
	}

	@Override
	public void updatePwd(String pwd, String id) {
		managerDao.updatePwd(pwd, id);		
	}



}
