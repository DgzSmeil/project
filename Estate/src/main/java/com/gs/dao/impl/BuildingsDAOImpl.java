package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.gs.dao.BuildingsDAO;
import com.gs.pojo.Buildings;
import com.gs.pojo.Comment;
import com.gs.pojo.User;

public class BuildingsDAOImpl implements BuildingsDAO{
	
private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Buildings queryById(String id) {
		Session session=sessionFactory.getCurrentSession();
		Buildings buildings=session.get(Buildings.class, id);
		return buildings;
	}
	@Override
	public List<Buildings> querylist(String id){
		String hql="from Buildings where agency_id= :id";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", id);
		return q.list();
	}
	
	@Override
	public void update(Buildings t) {
		Session session=sessionFactory.getCurrentSession();
		session.update(t);
		
	}
	@Override
	public void updateStatus(String id,String status){
		Session session=sessionFactory.getCurrentSession();
		String hql="update Buildings ";
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
	public void delete(Buildings t){
		Session session=sessionFactory.getCurrentSession();
		session.delete(t);
	}
	
	@Override
	public void add(Buildings t) {
		Session session=sessionFactory.getCurrentSession();
		session.save(t);
		
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Buildings e where e.agency_id = :id");
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	@Override
	public List<Buildings> list(int pageSize,int pageNumber,String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Buildings e where e.agency_id = :id  order by status desc");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public List<Buildings> list(String id) {
		String hql="select id,name from Buildings where agency_id= :id";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", id);
		return q.list();
	}

	@Override
	public List<Buildings> buildpager(int pageSize, int pageNumber) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Buildings a order by a.created_time desc");
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int buildcount() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(u.id) from Buildings u");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<Buildings> search(int pageNumber, int pageSize, Buildings buildings) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Buildings a where 1=1";
		if(buildings.getName()!=null && !buildings.getName().equals(""))
		{
			hql+=" and a.name like '%"+buildings.getName()+"%'";
		}
		if(buildings.getBuilding_area()!=null && !buildings.getBuilding_area().equals(""))
		{
			hql+=" and a.building_area like '%"+buildings.getBuilding_area()+"%'";
		}
		
		if(buildings.getAddress()!=null && !buildings.getAddress().equals(""))
		{
			hql+=" and a.address like '%"+buildings.getAddress()+"%'";
		}
	
		if(buildings.getCompany()!=null && !buildings.getCompany().equals(""))
		{
			hql+=" and a.company like '%"+buildings.getCompany()+"%'";
		}
	
		hql+=" order by a.created_time desc";
		
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Buildings> buildingslist=q.list();
		return buildingslist;
	}

	@Override
	public int searchcount(Buildings buildings) {
		String hql="select count(a.id) from Buildings a where 1=1";
		if(buildings.getName()!=null && !buildings.getName().equals(""))
		{
			hql+=" and a.name='"+buildings.getName()+"'";
		}
		if(buildings.getBuilding_area()!=null && !buildings.getBuilding_area().equals(""))
		{
			hql+=" and a.building_area='"+buildings.getBuilding_area()+"'";
		}
		
		if(buildings.getAddress()!=null && !buildings.getAddress().equals(""))
		{
			hql+=" and a.address='"+buildings.getAddress()+"'";
		}
	
		if(buildings.getCompany()!=null && !buildings.getCompany().equals(""))
		{
			hql+=" and a.company='"+buildings.getCompany()+"'";
		}
	
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public List<Buildings> builds(int first, int last) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Buildings where status='Y' order by created_time desc");
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.list();
	}

	@Override
	public List<Buildings> allsearch(int pageNumber, int pageSize, String searchText) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Buildings a where ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.area like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		hql+=" or a.floor_area like '%"+searchText+"%'";
		hql+=" or a.house_type like '%"+searchText+"%'";
		hql+=" or a.building_type like '%"+searchText+"%'";
		hql+=" or a.company like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" order by a.created_time desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Buildings> buildingsList=q.list();
		return buildingsList;
	}

	@Override
	public int allsearchcount(String searchText) {
		String hql="select count(a.id) from Buildings a where ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.area like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		hql+=" or a.floor_area like '%"+searchText+"%'";
		hql+=" or a.house_type like '%"+searchText+"%'";
		hql+=" or a.building_type like '%"+searchText+"%'";
		hql+=" or a.company like '%"+searchText+"%'";
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
	public List<Buildings> search(int pageNumber, int pageSize, String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Buildings a where a.agency_id = :id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.area like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		hql+=" or a.floor_area like '%"+searchText+"%'";
		hql+=" or a.building_area like '%"+searchText+"%'";
		hql+=" or a.house_type like '%"+searchText+"%'";
		hql+=" or a.building_type like '%"+searchText+"%'";
		hql+=" or a.company like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%' order by status desc";
		}
		hql+=" order by status desc";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int searchcount(String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(a.id) from Buildings a where a.agency_id = :id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.area like '%"+searchText+"%'";
		hql+=" or a.address like '%"+searchText+"%'";
		hql+=" or a.floor_area like '%"+searchText+"%'";
		hql+=" or a.building_area like '%"+searchText+"%'";
		hql+=" or a.house_type like '%"+searchText+"%'";
		hql+=" or a.building_type like '%"+searchText+"%'";
		hql+=" or a.company like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Buildings> dituList(String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select tel,logo,address,longitude,latitude,intro,name from Buildings where agency_id = :agency_id");
		query.setParameter("agency_id", agency_id);
		return query.list();
	}

	//楼盘排序查看
	@Override
	public List<Buildings> builds(int first, int last, String param) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Buildings.class);
		if(param!=null && param.equals("avg_price")) {
			criteria.addOrder(Order.asc("avg_price"));
		}else if(param!=null && param.equals("avg_price2")) {
			criteria.addOrder(Order.desc("avg_price"));
		}else if(param!=null && param.equals("open_date")) {
			criteria.addOrder(Order.asc("open_date"));
		}else if(param!=null && param.equals("open_date2")) {
			criteria.addOrder(Order.desc("open_date"));
		}
		criteria.setFirstResult(first);
		criteria.setMaxResults(last);
		return criteria.list();
	}

	@Override
	public List<Comment> findComment(String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment where buildings_id = :buildings_id");
		query.setParameter("buildings_id", buildings_id);
		return query.list();
	}

	@Override
	public List<Buildings> findbuildings(int first, int last, String name) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Buildings where status='Y' and name like '%"+name+"%' order by created_time desc");
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.list();
	}

	@Override
	public int findbuildingscount(String name) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(id) from Buildings where status='Y' and name like '%"+name+"%'");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List findSale(String buildings_id, String date) {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select b.name,";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=1),";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=2), ";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=3), ";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=4), ";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=5), ";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=6), ";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=7), "; 
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=8), ";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=9), ";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=10), ";
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=11), "; 
					hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=12)";
					hql+="from  Sale as t,Employee as e, Buildings as b where  t.emp_id=e.id and e.building_id=b.id and b.id =:buildings_id group by b.id ";
					Query query = session.createQuery(hql);
					query.setParameter("buildings_id", buildings_id);
					List list = query.list();
					return list;
	}
}
