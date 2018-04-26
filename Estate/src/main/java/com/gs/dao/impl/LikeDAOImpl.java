package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.gs.dao.LikeDAO;
import com.gs.pojo.Like;

public class LikeDAOImpl implements LikeDAO{
	
	private SessionFactory sessionFactory ;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Override
	public Like queryById(String id) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.getTransaction();
		transaction.begin();
		Like like = session.get(Like.class, id);
		transaction.commit();
		session.close();
		return like;
	}


	@Override
	public void update(Like t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Like t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}


	@Override
	public void delete(Like t) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(t);
	}

	@Override
	public int count(String id) {
		String sql = "select count(*) from Like l where l.user_id=:id";
		Query q=sessionFactory.getCurrentSession().createQuery(sql);
		q.setParameter("id", id);
		return Integer.parseInt(q.uniqueResult().toString());
	}


	@Override
	public List<Like> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Like  where user_id =:id  order by created_time desc");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	
	@Override
	public List<Like> querylist(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Like where user_id = :id and status='Y'");
		query.setParameter("id", id);
		return query.list();
	}
	

	//查看是否有点赞记录
	@Override
	public Like likeCount(String user_id,String buildings_id) {
		Session session = sessionFactory.openSession();
		String hql = "from Like where user_id=:user_id and buildings_id=:buildings_id";
		Query<Like> query = session.createQuery(hql);
		query.setParameter("user_id",user_id);
		query.setParameter("buildings_id", buildings_id);
		return query.uniqueResult();
		
	}
	//判断点赞状态（Y:已赞；N：未赞）
	@Override
	public String queryStatus(String id) {
		String sql = "select status from Like l where l.id=:id";
		Query q=sessionFactory.getCurrentSession().createQuery(sql);
		q.setParameter("id", id);
		String status = q.uniqueResult().toString();
		return status;
	}
	//修改点赞状态
	@Override
	public void updatestatus(String status, String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Like ";
		if(status=="Y" || status.equals("Y")) {
			hql += "set status='N' where id=:id";
		}else if (status.equals("N")|| status=="N") {
			hql+=" set status='Y' where id= :id";
		}
		Query q=session.createQuery(hql);
		q.setParameter("id", id);
		q.executeUpdate();
	}

}
