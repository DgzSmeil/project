package com.gs.service.impl;

import java.util.List;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.TestDAO;
import com.gs.pojo.Test;
import com.gs.service.TestService;

public class TestServiceImpl implements TestService {
	
	private TestDAO testDAO;
	
	public void setTestDAO(TestDAO testDAO) {
		this.testDAO = testDAO;
	}

	@Override
	public Test queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Test> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Test t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void add(Test t) {
		testDAO.add(t);
		
	}
	@Override
	public List<Test> querylist(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Test t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String hql) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}