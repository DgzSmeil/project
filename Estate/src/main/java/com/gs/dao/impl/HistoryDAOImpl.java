package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.HistoryDAO;
import com.gs.pojo.Agency;
import com.gs.pojo.History;

public class HistoryDAOImpl implements HistoryDAO{
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public History queryById(String id) {
		Session session = sessionFactory.openSession();
		History history=session.get(History.class, id);
		return history;
	}

	@Override
	public List<History> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<History> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(History t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(History t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(History t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public History queryByid(String user_id, String buildings_id) {
		String hql = "from History where user_id= :user_id and buildings_id =:buildings_id";
		Session session = sessionFactory.getCurrentSession();
		Query<History> query = session.createQuery(hql);
		query.setParameter("user_id", user_id);
		query.setParameter("buildings_id", buildings_id);
		return query.uniqueResult();
	}

	@Override
	public List<History> listByUser_id(int pageSize, int pageNumber, String user_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from History where user_id = :id order by created_time desc");
		query.setParameter("id", user_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int countByUser_id(String user_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from History e where e.user_id = :id");
		query.setParameter("id", user_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

}
