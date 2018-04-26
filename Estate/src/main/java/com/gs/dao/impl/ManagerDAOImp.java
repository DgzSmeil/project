package com.gs.dao.impl;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.ManagerDao;
import com.gs.pojo.Activity;
import com.gs.pojo.Agency;
import com.gs.pojo.Manager;

import jdk.nashorn.internal.objects.annotations.Where;

public class ManagerDAOImp implements ManagerDao {
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Manager queryById(String id) {
		Session session = sessionFactory.openSession();
		Manager manager=session.get(Manager.class, id);
		return manager;
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
		Session session=sessionFactory.getCurrentSession();
		String hql="update Manager set name='"+t.getName()+"',email='"+t.getEmail()+"',phone='"+t.getPhone()+"',tel='"+t.getTel()+"' where id='"+t.getId()+"'";
		Query q=session.createQuery(hql);
		q.executeUpdate();
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
		String hql="from Manager m where m.name='"+name+"'"+" and m.pwd='"+password+"'";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		List<Manager> managerlist=q.list();
		if(managerlist.size()>0)
		{
			return managerlist.get(0);
		}else
		{
			return null;
		}
	}
	@Override
	public Manager phonelogin(String phone) {
		String hql="from Manager m where m.phone='"+phone+"'";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		List<Manager> managerlist=q.list();
		if(managerlist.size()>0)
		{
			return managerlist.get(0);
		}else
		{
			return null;
		}
	}
	@Override
	public void updatePwd(String pwd,String id) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Manager set pwd='"+pwd+"' where id='"+id+"'";
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}

	
}

	
	
	





