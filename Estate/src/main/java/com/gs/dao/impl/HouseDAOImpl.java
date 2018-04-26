package com.gs.dao.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.gs.dao.HouseDAO;
import com.gs.pojo.Building;
import com.gs.pojo.Buildings;
import com.gs.pojo.House;
import com.gs.pojo.Sale;

public class HouseDAOImpl implements HouseDAO {
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public House queryById(String id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		query =  session.createQuery("from House where id=:id");
		query.setParameter("id", id);
		return (House) query.uniqueResult();
	}


	@Override
	public void update(House t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(House t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}


	@Override
	public int count(String id) {
	
		Session session = sessionFactory.getCurrentSession();
		Query query;
		int count = 0;
			query =  session.createQuery("select count(*) from House as h ,Buildings as b where h.buildings_id=b.id and b.agency_id= :id");
			query.setParameter("id", id);
			count =Integer.parseInt(query.uniqueResult().toString());
	        System.out .println(count);
	        
		return count;
	}




	@Override
	public List querylist(String id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<House> houses = null;
		query =  session.createQuery("from Buildings where agency_id=:id");
		query.setParameter("id", id);
		houses = query.list();
		return houses;
	}

	@Override
	public List<House> list(int pageSize, int pageNumber, String id) {
		pageNumber=(pageNumber - 1) * pageSize;
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<House> houses = null;
		query =  session.createQuery("select a from House as a,Buildings as b where a.buildings_id=b.id and b.agency_id=:id");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		houses = query.list();
		return  houses;
	}

	@Override
	public void delete(House t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatestatus(String id, String status) {
			Session session=sessionFactory.getCurrentSession();
			String hql="update House ";
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
	public List<House> findHouse(String id,int pageSize,int pageNumber,String house_id,String buildings_id) {
		pageNumber=(pageNumber - 1) * pageSize;
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<House> houses = null;
		if((house_id==null || house_id.equals("")) && (buildings_id==null ||buildings_id.equals("")) ){
			query =  session.createQuery("select a from House as a,Buildings as b where a.buildings_id=b.id and b.agency_id=:id");
			query.setParameter("id", id);
		}else if((house_id==null || house_id.equals("")) && (buildings_id!=null || !buildings_id.equals(""))){
			query =  session.createQuery("from House  where buildings_id = :buildings_id");
			query.setParameter("buildings_id", buildings_id);
		}else if((house_id!=null || !house_id.equals("")) && (buildings_id==null || buildings_id.equals(""))){
			query =  session.createQuery("from House where   id = :house_id");
			query.setParameter("house_id",house_id);
		}else if((house_id!=null || !house_id.equals("")) && (buildings_id!=null || !buildings_id.equals(""))){
			query =  session.createQuery("from House where buildings_id = :buildings_id and id = :house_id");
			query.setParameter("buildings_id",buildings_id);
			query.setParameter("house_id",house_id);
		}
			query.setFirstResult(pageNumber);
			query.setMaxResults(pageSize);
			houses = query.list();
		return  houses;
	}

	@Override
	public List<House> find(String name, String id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<House> houses = null;
		if(name!=null || id==null ){
			query =  session.createQuery("from House where name = :name");
			query.setParameter("name",name);
		}else if(name==null && id!=null){
			query =  session.createQuery("from House where id = :id");
			query.setParameter("id",id);
		}else{
			query =  session.createQuery("from House where buildings_id =: id and name = :name");
			query.setParameter("name",name);
			query.setParameter("id",id);
		}
		houses = query.list();
		return houses;
	}

	@Override
	public Buildings find(String name) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		Buildings builds = null;
		query =  session.createQuery("from Buildings where name=:name");
		query.setParameter("name", name);
		builds = (Buildings)query.uniqueResult();
		return builds;
	}

	@Override
	public int findcount(String agency_id,String house_id,String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query=null;
		Buildings builds = null;
		int count = 0;
		if((house_id==null || house_id.equals("")) && (buildings_id==null || buildings_id.equals(""))){
			query =  session.createQuery("select count(*) from House as h ,Buildings as b where h.buildings_id=b.id and b.agency_id= :id");
			query.setParameter("id", agency_id);
		}else if((house_id!=null || !house_id.equals("")) && (buildings_id==null || buildings_id.equals(""))){
			query =  session.createQuery("select count(*) from House  where id = :house_id");
			query.setParameter("house_id",house_id);
		}else if((house_id==null || house_id.equals("")) && (buildings_id!=null || !buildings_id.equals(""))){
			
			query =  session.createQuery(" select count(*) from House  where buildings_id = :id");
			query.setParameter("id",buildings_id);
		}else if((house_id!=null || !house_id.equals("")) && (buildings_id!=null || !buildings_id.equals(""))){
			query =  session.createQuery(" select count(*) from House  where buildings_id = :buildings_id and id = :house_id");
			query.setParameter("buildings_id",buildings_id);
			query.setParameter("house_id",house_id);
		}
			count =Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	@Override
	public List<House> housepager(int pageNumber,int pageSize) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1=request.getSession();
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from House u where u.buildings_id='"+session1.getAttribute("buildingsid")+"'";
		System.out.println(hql);
		Query query = session.createQuery(hql);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int housecount(int pageNumber,int pageSize) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1=request.getSession();
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(u.id) from House u where u.buildings_id='"+session1.getAttribute("buildingsid")+"'";
		Query query = session.createQuery(hql);
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<Buildings> findBuildings(String agency_id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<Buildings> buildings =null;
		query =  session.createQuery("from Buildings where agency_id = :id  ");
		query.setParameter("id", agency_id);
		buildings = query.list();
		return buildings;
	}

	@Override
	public List<House> findHouse(String agency_id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<House> houses =null;
		query =  session.createQuery("select a from House as a,Buildings as b where a.buildings_id=b.id and b.agency_id=:id");
		query.setParameter("id", agency_id);
		houses = query.list();
		return houses;
	}

	@Override
	public List<House> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select DISTINCT a from House as a,Buildings as b where a.buildings_id=b.id and b.agency_id = :agency_id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.intro like '%"+searchText+"%'";
		hql+=" or a.area like '%"+searchText+"%'";
		hql+=" or a.unit_price like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%' order by status desc";
		}
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public List<House> builds(String buildings_id, int first, int last) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from House where buildings_id=:id and status='Y' order by created_time desc");
		query.setParameter("id", buildings_id);
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.list();
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(DISTINCT a.id) from House as a,Buildings as b where a.buildings_id=b.id and b.agency_id = :agency_id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.intro like '%"+searchText+"%'";
		hql+=" or a.area like '%"+searchText+"%'";
		hql+=" or a.unit_price like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%' order by status desc";
		}
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<House> list(String buildings_id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query = session.createQuery("from House where buildings_id=:id");
		query.setParameter("id", buildings_id);
		return query.list();
	}

	@Override
	public int count2(String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(u.id) from House u where u.buildings_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", buildings_id);
		return Integer.parseInt(query.uniqueResult().toString());
	}

}
