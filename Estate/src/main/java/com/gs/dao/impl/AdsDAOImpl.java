package com.gs.dao.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.AdsDAO;
import com.gs.pojo.Activity;
import com.gs.pojo.Ads;
import com.gs.pojo.Article;

public class AdsDAOImpl implements AdsDAO
{
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<Ads> adsPager(int pageNumber, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Ads a order by a.created_time desc");
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int adsCount() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(u.id) from Ads u");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<Ads> search(int pageNumber, int pageSize, Ads ads) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Ads a where 1=1";
		if(ads.getTitle()!=null && !ads.getTitle().equals(""))
		{
			hql+=" and a.title like '%"+ads.getTitle()+"%'";
		}
		hql+=" order by a.created_time desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Ads> adslist=q.list();
		return adslist;
	}

	@Override
	public int searchcount(Ads ads) {
		String hql="select count(a.id) from Ads a where 1=1";
		if(ads.getTitle()!=null && !ads.getTitle().equals(""))
		{
			hql+=" and a.title like '%"+ads.getTitle()+"%'";
		}
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public List<Ads> allsearch(int pageNumber, int pageSize, String searchText) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Ads a where ";
		hql+=" a.title like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}else if(searchText.equals("用")||searchText.equals("已"))
		{
			hql+=" or 1=1";
		}
		if(searchText.equals("不显示")||searchText.equals("不"))
		{
			hql+=" or a.show_status like '%N%'";
		}else if(searchText.equals("已显示")||searchText.equals("已")){
			hql+=" or a.show_status like '%Y%'";
		}else if(searchText.equals("显")||searchText.equals("示"))
		{
			hql+=" or 1=1";
		}
		hql+=" order by a.created_time desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Ads> activitylist=q.list();
		return activitylist;
	}

	@Override
	public int allsearchcount(String searchText) {
		String hql="select count(a.id) from Ads a where ";
		hql+=" a.title like '%"+searchText+"%'";
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
	public void active(String id) {
		String hql="update Ads a set a.status='Y' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}
	@Override
	public void inactive(String id) {
		String hql="update Ads a set a.status='N' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}

	@Override
	public Ads queryById(String id) {
		Session session = sessionFactory.openSession();
		Ads ads=session.get(Ads.class, id);
		return ads;
	}

	@Override
	public List<Ads> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Ads> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Ads t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Ads t) 
	{
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(Ads t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int maxTid() {
		String hql="select max(a.tId) from Ads a";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public Ads showAds(String id) {
		String hql="from Ads a where id='"+id+"'";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		Ads ads=(Ads)q.list().get(0);
		return ads;
	}

	@Override
	public List<Ads> builds(int first, int last) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Ads where status='Y' order by created_time desc");
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.list();
	}

}
