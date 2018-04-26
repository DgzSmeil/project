package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.MessageDAO;
import com.gs.pojo.Activity;
import com.gs.pojo.Appointment;
import com.gs.pojo.Message;

public class MessageDAOImpl implements MessageDAO{
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Message queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Message message=session.get(Message.class, id);
		return message;
	}

	@Override
	public List<Message> querylist(String id) {
		String hql="from Message where agency_id= :id";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", id);
		return q.list();
	}

	@Override
	public List<Message> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Message where agency_id = :id");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public void update(Message t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Message t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(Message t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Message e where e.agency_id = :id");
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public void updateStatus(String id, String status) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Message ";
		if(status.equals("Y") || status=="Y"){
			hql+=" set status='N' where id= :id";
		}else if (status.equals("N")|| status=="N") {
			hql+=" set status='Y' where id= :id";
		}
		Query q=session.createQuery(hql);
		q.setParameter("id", id);
		q.executeUpdate();
	}

	@Override
	public List<Message> list(int pageSize, int pageNumber, String agency_id, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Message where agency_id = :id and buildings_id = :buildings_id");
		query.setParameter("id", agency_id);
		query.setParameter("buildings_id", buildings_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int count(String agency_id, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Message e where e.agency_id = :id and buildings_id = :buildings_id");
		query.setParameter("id", agency_id);
		query.setParameter("buildings_id", buildings_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Message> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Message a where a.agency_id = :id and";
		hql+=" a.user.nickname like '%"+searchText+"%'";
		hql+=" or a.content like '%"+searchText+"%'";
		hql+=" or a.reply like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by status desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", agency_id);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		return q.list();
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(a.id) from Message a where a.agency_id = :id and ";
		hql+=" a.user.nickname like '%"+searchText+"%'";
		hql+=" or a.content like '%"+searchText+"%'";
		hql+=" or a.reply like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by status desc";
		Query query = session.createQuery(hql);
		query.setParameter("id", agency_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Message> search(int pageNumber, int pageSize, String searchText, String agency_id,
			String buildings_id) {
		String hql="from Message a where a.agency_id = :id and a.buildings_id = :id2 and ";
		hql+=" a.user.nickname like '%"+searchText+"%'";
		hql+=" or a.content like '%"+searchText+"%'";
		hql+=" or a.reply like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by status desc";
		System.out.println(hql);
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", agency_id);
		q.setParameter("id2", buildings_id);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		return q.list();
	}

	@Override
	public int searchcount(String searchText, String agency_id, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(a.id) from Message a where a.agency_id = :id and a.buildings_id = :id2 and ";
		hql+=" a.user.nickname like '%"+searchText+"%'";
		hql+=" or a.content like '%"+searchText+"%'";
		hql+=" or a.reply like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		Query query = session.createQuery(hql);
		query.setParameter("id", agency_id);
		query.setParameter("id2", buildings_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Message> listByUser_id(int pageSize, int pageNumber, String user_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Message where user_id = :id and status = 'Y' order by leave_time desc");
		query.setParameter("id", user_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int countByUser_id(String user_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Message e where e.user_id = :id and status = 'Y'");
		query.setParameter("id", user_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public Message queryId(String buildings_id, String user_id) {
		Session session = sessionFactory.openSession();
		String hql = "from Message where user_id=:user_id and buildings_id=:buildings_id";
		Query<Message> query = session.createQuery(hql);
		query.setParameter("user_id",user_id);
		query.setParameter("buildings_id", buildings_id);
		return query.uniqueResult();
	}

}
