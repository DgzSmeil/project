package com.gs.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.BuildingDAO;
import com.gs.pojo.Building;
import com.gs.pojo.Buildings;
import com.gs.pojo.Employee;

public class BuildingDAOImpl implements BuildingDAO{
private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Building queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Building where id = :id");
		query.setParameter("id",id);
		Building building =(Building) query.uniqueResult();
		return building;
	}


	@Override
	public void update(Building t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Building t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}


	@Override
	public List<Building> queryByPager(int pageSize,int pageNumber, String agency_id,String building_id,String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query=null;
		if((building_id==null||building_id.equals("")) && (buildings_id==null||buildings_id.equals(""))){
			query = session.createQuery("select a from Building as a,Buildings as b where a.buildings_id =b.id and b.agency_id = :agency_id");
			query.setParameter("agency_id", agency_id);
		}else if((building_id==null||building_id.equals("")) && buildings_id!=null){
			query = session.createQuery("from Building  where  buildings_id = :buildings_id");
			query.setParameter("buildings_id", buildings_id);	
		}else if(building_id!=null && (buildings_id==null||buildings_id.equals(""))){
			query = session.createQuery("from Building  where id = :building_id");
			query.setParameter("building_id", building_id);	
		}else if((building_id!=null || building_id.equals("")) && (buildings_id!=null || !buildings_id.equals(""))){
			query = session.createQuery("from Building  where  id = :building_id and buildings_id = :buildings_id");
			query.setParameter("buildings_id", buildings_id);	
			query.setParameter("building_id", building_id);	
		}
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		List<Building> buildingList = query.list();
		return buildingList;
	}

	@Override
	public int count(String agency_id,String building_id,String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query=null;
		if((building_id==null || building_id.equals("")) && (buildings_id==null || buildings_id.equals(""))){
			query = session.createQuery("select count(*) from Building as a,Buildings as b where a.buildings_id =b.id and b.agency_id = :agency_id");
			query.setParameter("agency_id", agency_id);
		}else if((building_id!=null || !building_id.equals("")) && (buildings_id==null || buildings_id.equals(""))){
			query = session.createQuery("select count(*) from Building  where  id = :building_id");
			query.setParameter("building_id", building_id);
		}else if((building_id==null || building_id.equals("")) && (buildings_id!=null || !buildings_id.equals(""))){
			query = session.createQuery("select count(*) from Building  where buildings_id = :buildings_id");
			query.setParameter("buildings_id", buildings_id);
		}else if((building_id!=null || !building_id.equals("")) && (buildings_id!=null || !buildings_id.equals(""))){
			query = session.createQuery("select count(*) from Building  where id = :building_id and buildings_id= :buildings_id");
			query.setParameter("building_id", building_id);
			query.setParameter("buildings_id", buildings_id);
		}
		
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Building> querylist(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Building b where b.buildings_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Building> buildinglist = query.list();
		return buildinglist;
	}

	@Override
	public List<Building> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Building t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatestatus(String id, String status) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Building ";
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
	public void find(String name, String status) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from Building where ";
		if(status.equals("")){
			hql+=" name = : name ";
			Query q=session.createQuery(hql);
			q.setParameter("name", name);
			q.executeUpdate();
		}else if (status.equals("N")|| status=="N") {
			hql+=" set status='Y' where id= :id";
		}
		
	}

	@Override
	public int count(String id) {
		return 0;
	}

	@Override
	public List<Buildings> findbuildings(String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		List<Buildings> buildings=null;
		Query query = session.createQuery("from Buildings where agency_id = :agency_id");
		query.setParameter("agency_id",agency_id);
			buildings = query.list();
		return buildings;
	}

	@Override
	public List<Building> builds(String buildings_id,int first, int last) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Building where buildings_id=:id and status='Y' order by created_time desc");
		query.setParameter("id", buildings_id);
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.list();
	}

	@Override
	public List<Building> findbuilding(String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		List<Building> buildlist=null;
		Query query = session.createQuery("select b from Building as b,Buildings as s  where b.buildings_id = s.id and s.agency_id = :agency_id");
		query.setParameter("agency_id",agency_id);
		buildlist = query.list();
		return buildlist;
	}

	@Override
	public List<Building> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select DISTINCT a from Building as a,Buildings as b where a.buildings_id =b.id and b.agency_id = :agency_id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.total_floor like '%"+searchText+"%'";
		hql+=" or a.total_lift like '%"+searchText+"%'";
		hql+=" or a.floor_rooms like '%"+searchText+"%'";
		hql+=" or a.total_room like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
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
	public int searchcount(String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(DISTINCT a.id) from Building as a,Buildings as b where a.buildings_id =b.id and b.agency_id = :agency_id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.total_floor like '%"+searchText+"%'";
		hql+=" or a.total_lift like '%"+searchText+"%'";
		hql+=" or a.floor_rooms like '%"+searchText+"%'";
		hql+=" or a.total_room like '%"+searchText+"%'";
		hql+=" or a.buildings.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%' order by status desc";
		}
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		return Integer.parseInt(query.uniqueResult().toString());
	}

}
