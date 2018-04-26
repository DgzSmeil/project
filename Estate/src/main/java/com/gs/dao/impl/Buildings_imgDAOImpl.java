package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.Buildings_imgDAO;
import com.gs.pojo.Activity;
import com.gs.pojo.BuildingsImg;

public class Buildings_imgDAOImpl implements Buildings_imgDAO{
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public BuildingsImg queryById(String id) {
		Session session = sessionFactory.openSession();
		BuildingsImg buildingsImg=session.get(BuildingsImg.class, id);
		return buildingsImg;
	}
	
	@Override
	public List<BuildingsImg> querylist(String id) {
		String hql="from BuildingsImg where buildings_id= :id";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", id);
		return q.list();
	}

	@Override
	public void update(BuildingsImg t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
		
	}

	@Override
	public void add(BuildingsImg t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
		
	}

	@Override
	public void delete(BuildingsImg t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
		
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from BuildingsImg e where e.buildings_id = :id");
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<BuildingsImg> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from BuildingsImg where buildings_id = :id");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public List<BuildingsImg> search(int pageNumber, int pageSize, String searchText,String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from BuildingsImg a where a.buildings_id = :id and ";
		hql+=" a.img_des like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int searchcount(String searchText,String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(a.id) from BuildingsImg a where a.buildings_id = :id and ";
		hql+=" a.img_des like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<BuildingsImg> builds(int first, int last, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from BuildingsImg where buildings_id=:id");
		query.setParameter("id", buildings_id);
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.list();
	}

}
