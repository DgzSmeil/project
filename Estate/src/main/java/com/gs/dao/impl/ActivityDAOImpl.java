package com.gs.dao.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.ActivityDAO;
import com.gs.pojo.Activity;
import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;

public class ActivityDAOImpl implements ActivityDAO{
	
private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Activity queryById(String id) {
		Session session = sessionFactory.openSession();
		Activity activity=session.get(Activity.class, id);
		return activity;
	}
	
	@Override
	public List<Activity> querylist(String id) {
		String hql="from Activity where buildings_id= :id";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", id);
		return q.list();
	}

	@Override
	public void update(Activity t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Activity t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(Activity t) {
		Session session = sessionFactory.openSession();
		session.delete(t);
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Activity e where e.agency_id = :id");
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Activity> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Activity where agency_id = :id");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public void updateStatus(String id, String status) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Activity ";
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
	public List<Activity> activityPager(int pageSize, int pageNumber) {
		System.out.println("activityPager activityPager activityPager");
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Activity u where u.buildings_id is not null and u.agency_id is not null and u.buildings_id <> '' and u.agency_id <> '' order by u.logo desc");
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int activityCount() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(u.id) from Activity u where u.buildings_id is not null and u.agency_id is not null and u.buildings_id <> '' and u.agency_id <> ''");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<Activity> search(int pageNumber, int pageSize, Activity activity) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Activity a where 1=1";
		if(activity.getTitle()!=null && !activity.getTitle().equals(""))
		{
			hql+=" and a.title like '%"+activity.getTitle()+"%'";
		}
		if((activity.getStart_time()!=null && !activity.getStart_time().equals(""))||(activity.getEnd_time()!=null && !activity.getEnd_time().equals("")))
		{
			SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
			String date1="";
			String date2="";
			if(activity.getStart_time()==null)
			{
				date1="1990-1-1 01:01:01";
			}else{
				date1=sdf.format(activity.getStart_time());
			}
			if(activity.getEnd_time()==null)
			{
				date2="5000-1-1 01:01:01";
			}else{
				date2=sdf.format(activity.getEnd_time());
			}
			hql+=" and a.start_time between '"+date1+"' and '"+date2+"'";
		}
		hql+=" order by a.logo desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Activity> activitylist=q.list();
		return activitylist;
	}

	@Override
	public int searchcount(Activity activity) {
		String hql="select count(a.id) from Activity a where 1=1";
		if(activity.getTitle()!=null && !activity.getTitle().equals(""))
		{
			hql+=" and a.title like '%"+activity.getTitle()+"%'";
		}
		if(activity.getStart_time()!=null && !activity.getStart_time().equals(""))
		{
			hql+=" and a.start_time like '%"+activity.getStart_time()+"%'";
		}
		
		if(activity.getEnd_time()!=null && !activity.getEnd_time().equals(""))
		{
			hql+=" and a.end_time like '%"+activity.getEnd_time()+"%'";
		}
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public List<Activity> mgnactivityPager(int pageSize, int pageNumber) {
		System.out.println("mgnactivityPager mgnactivityPager mgnactivityPager");
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Activity u where (u.buildings_id is null or u.buildings_id='')  and (u.agency_id is null or u.agency_id='') order by u.logo desc");
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int mgnactivityCount() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(u.id) from Activity u where (u.buildings_id is null or u.buildings_id='') and (u.agency_id is null or u.agency_id='')");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public void mgnActvtActive(String id) {
		String hql="update Activity a set a.status='Y' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}

	@Override
	public void mgnActvtInactive(String id) {
		String hql="update Activity a set a.status='N' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}

	@Override
	public void mgnActvtEdit(Activity activity) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(activity);
	}

	@Override
	public List<Activity> list(int pageSize, int pageNumber, String agency_id, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Activity where agency_id = :id and buildings_id = :buildings_id order by status desc");
		query.setParameter("id", agency_id);
		query.setParameter("buildings_id", buildings_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int count(String agency_id, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Activity e where e.agency_id = :id and buildings_id = :buildings_id");
		query.setParameter("id", agency_id);
		query.setParameter("buildings_id", buildings_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	@Override
	public List<Activity> allsearch(int pageNumber, int pageSize, String searchText) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Activity a where ";
		hql+=" a.title like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by a.logo desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Activity> activitylist=q.list();
		return activitylist;
	}

	@Override
	public int allsearchcount(String searchText) {
		String hql="select count(a.id) from Activity a where ";
		hql+=" a.title like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
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
	public List<Activity> search(int pageNumber, int pageSize, String searchText, String id) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Activity a where a.agency_id = :id and";
		hql+=" a.title like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by status desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", id);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		return q.list();
	}

	@Override
	public int searchcount(String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(a.id) from Activity a where a.agency_id = :id and ";
		hql+=" a.title like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by status desc";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Activity> search(int pageNumber, int pageSize, String searchText, String id, String id2) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Activity a where a.agency_id = :id and a.buildings_id = :id2 and ";
		hql+=" a.title like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by status desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", id);
		q.setParameter("id2", id2);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		return q.list();
	}

	@Override
	public int searchcount(String searchText, String id, String id2) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(a.id) from Activity a where a.agency_id = :id and a.buildings_id = :id2 and ";
		hql+=" a.title like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setParameter("id2", id2);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Buildings> findBdsList() {
		String hql="from Buildings order by convert(name, 'gbk')";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		return q.list();
	}

	@Override
	public List<Agency> findAgencyList() {
		String hql="from Agency order by convert(name, 'gbk')";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		return q.list();
	}

	@Override
	public List<Activity> list2(int pageSize, int pageNumber, String agency_id, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Activity a where 1=1";
		if(agency_id==null||agency_id.equals("1"))
		{
			hql+="";
		}else
		{
			hql+=" and a.agency_id='"+agency_id+"'";
		}
		if(buildings_id==null||buildings_id.equals("1"))
		{
			hql+="";
		}else
		{
			hql+=" and a.buildings_id='"+buildings_id+"'";
		}
		System.out.println(hql);
		Query query = session.createQuery(hql);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int count2(String agency_id, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(a.id) from Activity a where 1=1";
		if(agency_id==null||agency_id.equals("1"))
		{
			hql+="";
		}else
		{
			hql+=" and a.agency_id='"+agency_id+"'";
		}
		if(buildings_id==null||buildings_id.equals("1"))
		{
			hql+="";
		}else
		{
			hql+=" and a.buildings_id='"+buildings_id+"'";
		}
		System.out.println(hql);
		Query q = session.createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public List<Activity> count(int pageSize, int pageNumber) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Activity where status='Y'");
		query.setFirstResult(pageSize);
		query.setMaxResults(pageNumber);
		return query.list();
	}

	@Override
	public int count() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Activity e where e.status='Y'");
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	
}
