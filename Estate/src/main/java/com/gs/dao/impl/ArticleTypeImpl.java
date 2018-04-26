package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.ArticleTypeDAO;
import com.gs.pojo.Agency;
import com.gs.pojo.ArticleType;
import com.gs.pojo.User;

public class ArticleTypeImpl implements ArticleTypeDAO 
{
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public ArticleType queryById(String id) {
		Session session = sessionFactory.openSession();
		ArticleType articleType=session.get(ArticleType.class, id);
		return articleType;
	}

	@Override
	public List<ArticleType> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ArticleType> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(ArticleType t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
		
	}

	@Override
	public void add(ArticleType t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(ArticleType t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ArticleType> articleTypePager(int pageNumber, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from ArticleType u");
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int articleTypeCount() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(u.id) from ArticleType u");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public void active(String id) {
		String hql="update ArticleType a set a.status='Y' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}

	@Override
	public void inactive(String id) {
		String hql="update ArticleType a set a.status='N' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}

	@Override
	public List<ArticleType> allsearch(int pageNumber, int pageSize, String searchText) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from ArticleType a where ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.des like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		System.out.println(hql);
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<ArticleType> articleTypelist=q.list();
		return articleTypelist;
	}

	@Override
	public int allsearchcount(String searchText) {
		String hql="select count(a.id) from ArticleType a where ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.des like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		System.out.println(hql);
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public List<ArticleType> search(int pageNumber, int pageSize, ArticleType articletype) {
		
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from ArticleType a where 1=1";
		if(articletype.getName()!=null && !articletype.getName().equals(""))
		{
			hql+=" and a.name like '%"+articletype.getName()+"%'";
		}
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<ArticleType> articleTypeList=q.list();
		return articleTypeList;
	}

	@Override
	public int searchcount(ArticleType articletype) {
		String hql="select count(a.id) from ArticleType a where 1=1";
		if(articletype.getName()!=null && !articletype.getName().equals(""))
		{
			hql+=" and a.name like '%"+articletype.getName()+"%'";
		}
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

}
