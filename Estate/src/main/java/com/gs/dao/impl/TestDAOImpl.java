package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.TestDAO;
import com.gs.pojo.Test;

public class TestDAOImpl implements TestDAO {
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Test queryById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Test> querylist(String id) {
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
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
		
	}

	@Override
	public void delete(Test t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}


	
}
