package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.CommentDAO;
import com.gs.pojo.Comment;
import com.gs.pojo.Message;

public class CommentDAOImpl implements CommentDAO{
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Comment queryById(String id) {
		Session session = sessionFactory.openSession();
		Comment comment=session.get(Comment.class, id);
		return comment;
	}

	@Override
	public List<Comment> querylist(String id) {
		return null;
	}

	@Override
	public List<Comment> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Comment c where c.user_id = :id  order by status desc");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public void update(Comment t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
		
	}

	@Override
	public void add(Comment t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(Comment t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Comment c where c.user_id = :id");
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public int countByBuildings_id(String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Comment c where c.buildings_id = :id and status='Y'");
		query.setParameter("id", buildings_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Comment> builds(int first, int last,String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment where status='Y' and buildings_id = :id order by comment_time desc");
		first=(first - 1) * last;
		query.setFirstResult(first);
		query.setMaxResults(last);
		query.setParameter("id", buildings_id);
		return query.list();
	}

	@Override
	public Comment queryId(String buildings_id, String user_id) {
		Session session = sessionFactory.openSession();
		String hql = "from Comment where user_id=:user_id and buildings_id=:buildings_id and status='Y'";
		Query<Comment> query = session.createQuery(hql);
		query.setParameter("user_id",user_id);
		query.setParameter("buildings_id", buildings_id);
		return query.uniqueResult();
	}

	@Override
	public List<Comment> listByUser_id(int pageSize, int pageNumber, String user_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Comment where user_id = :id and status = 'Y' order by comment_time desc");
		query.setParameter("id", user_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int countByUser_id(String user_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Comment e where e.user_id = :id and status = 'Y'");
		query.setParameter("id", user_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

}
