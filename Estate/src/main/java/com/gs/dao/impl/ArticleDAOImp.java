package com.gs.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.ArticleDAO;
import com.gs.pojo.Article;
import com.gs.pojo.ArticleType;

public class ArticleDAOImp implements ArticleDAO
{
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Article queryById(String id) {
		Session session = sessionFactory.openSession();
		Article article=session.get(Article.class, id);
		return article;
	}

	@Override
	public List<Article> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Article> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Article t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Article t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(Article t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Article> articlePager(int pageNumber, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Article a order by a.created_time desc");
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int articleCount() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(u.id) from Article u");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<Article> allsearch(int pageNumber, int pageSize, String searchText) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Article a where";
		hql+=" a.title like '%"+searchText+"%'";
		hql+=" or a.abstracts like '%"+searchText+"%'";
		if(searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by a.created_time desc";
		System.out.println(hql);
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Article> articlelist=q.list();
		return articlelist;
	}

	@Override
	public int allsearchcount(String searchText) {
		String hql="select count(a.id) from Article a where";
		hql+="  a.title like '%"+searchText+"%'";
		hql+=" or a.abstracts like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public List<Article> search(int pageNumber, int pageSize, Article article) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Article a where 1=1";
		if(article.getTitle()!=null && !article.getTitle().equals(""))
		{
			hql+=" and a.title like '%"+article.getTitle()+"%'";
		}
		hql+=" order by a.created_time desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Article> articleList=q.list();
		return articleList;
	}

	@Override
	public int searchcount(Article article) {
		String hql="select count(a.id) from Article a where 1=1";
		if(article.getTitle()!=null && !article.getTitle().equals(""))
		{
			hql+=" and a.title like '%"+article.getTitle()+"%'";
		}
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public void active(String id) {
		String hql="update Article a set a.status='Y' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}

	@Override
	public void inactive(String id) {
		String hql="update Article a set a.status='N' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}
	@Override
	public List<ArticleType> findAtcTypeList() {
		String hql="from ArticleType where status='Y'";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		List<ArticleType> atcTypeList=q.list();
		return atcTypeList;
	}

	@Override
	public List<Article> builds(int first, int last) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Article where status='Y' order by created_time desc");
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.list();
	}

	@Override
	public int buildsCount() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(u.id) from Article u where u.status='Y'");
		return Integer.parseInt(query.uniqueResult().toString());
	}
}
