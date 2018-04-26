package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.RoomDAO;
import com.gs.pojo.Building;
import com.gs.pojo.Buildings;
import com.gs.pojo.Customer;
import com.gs.pojo.Employee;
import com.gs.pojo.House;
import com.gs.pojo.Room;
import com.gs.pojo.Sale;

public class RoomDAOImpl implements RoomDAO{
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Override
	public Room queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Room room = session.get(Room.class, id);
		return room;
	}

	@Override
	public List<Room> querylist(String id){
			Session session = sessionFactory.getCurrentSession();
			String hql = "from Room r where r.building_id=:id";
			Query query = session.createQuery(hql);
			query.setParameter("id", id);
			List<Room> roomlist = query.list();
			if(roomlist.size()>0){
				System.out.println(roomlist.get(0));
				return roomlist;
			}else {
				return null;
			}
			
	}

	@Override
	public List<Room> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Room t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Room t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
		session.flush();
		session.clear();
	}

	@Override
	public void delete(Room t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Room> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select DISTINCT a from Room as a,Building as b,Buildings as c where building_id=b.id and  b.buildings_id=c.id and c.agency_id = :agency_id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.house.name like '%"+searchText+"%'";
		hql+=" or a.building.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.sale_status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.sale_status like '%Y%' order by status desc";
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
		String hql="select count(DISTINCT a.id) from Room as a,Building as b,Buildings as c where building_id=b.id and  b.buildings_id=c.id and c.agency_id = :agency_id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.house.name like '%"+searchText+"%'";
		hql+=" or a.building.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or a.sale_status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.sale_status like '%Y%' order by status desc";
		}
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		return Integer.parseInt(query.uniqueResult().toString());
	}
	@Override
	public List<House> findHouse(String agency_id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<Employee> employees =null;
		query =  session.createQuery("select h from House as h,Buildings as s  where h.buildings_id =s.id and  s.agency_id = :id");
		query.setParameter("id", agency_id);
		return query.list();
	}
	@Override
	public int findcount(String agency_id, String building_id, String house_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query=null;
		Buildings builds = null;
		int count = 0;
		if((building_id==null || building_id.equals("")) && (house_id==null ||house_id.equals("")) ){
			query =  session.createQuery("select count(*) from Room as a,Building as b,Buildings as c where building_id=b.id and  b.buildings_id=c.id and c.agency_id = :agency_id");
			query.setParameter("agency_id", agency_id);
		}else if((building_id==null || building_id.equals("")) && (house_id!=null || !house_id.equals(""))){

			query =  session.createQuery("select count(*) from Room where house_id = :house_id");
			query.setParameter("house_id", house_id);
		}else if((building_id!=null || !building_id.equals("")) && (house_id==null || house_id.equals(""))){
			
			query =  session.createQuery("select count(*) from Room  where building_id = :building_id");
			query.setParameter("building_id",building_id);
		}else if((building_id!=null || !building_id.equals("")) && (house_id!=null || !house_id.equals(""))){
			
			query =  session.createQuery("select count(*) from Room  where building_id = :building_id and house_id = :house_id");
			query.setParameter("building_id",building_id);
			query.setParameter("house_id",house_id);
		}
			count =Integer.parseInt(query.uniqueResult().toString());
			return count;
	}
	@Override
	public List<Room> findRoom(String id, int pageSize, int pageNumber, String building_id, String house_id) {
		pageNumber=(pageNumber - 1) * pageSize;
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		if((building_id==null || building_id.equals("")) && (house_id==null ||house_id.equals("")) ){
			query =  session.createQuery("select a from Room as a,Building as b,Buildings as c where building_id=b.id and  b.buildings_id=c.id and c.agency_id = :agency_id");
			query.setParameter("agency_id", id);
		}else if((building_id==null || building_id.equals("")) && (house_id!=null || !house_id.equals(""))){

			query =  session.createQuery("from Room where house_id = :house_id");
			query.setParameter("house_id", house_id);
		}else if((building_id!=null || !building_id.equals("")) && (house_id==null || house_id.equals(""))){
			
			query =  session.createQuery(" from Room  where building_id = :building_id");
			query.setParameter("building_id",building_id);
		}else if((building_id!=null || !building_id.equals("")) && (house_id!=null || !house_id.equals(""))){
			
			query =  session.createQuery("from Room  where building_id = :building_id and house_id = :house_id");
			query.setParameter("building_id",building_id);
			query.setParameter("house_id",house_id);
		}
			query.setFirstResult(pageNumber);
			query.setMaxResults(pageSize);
			return  query.list();
	}
	@Override
	public List<Building> findBuilding(String agency_id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		query =  session.createQuery("select b from Building as b,Buildings as s  where b.buildings_id =s.id and  s.agency_id = :agency_id");
		query.setParameter("agency_id", agency_id);
		return query.list();
	}
	@Override
	public void updatestatus(String id, String sale_status) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Room ";
		if(sale_status.equals("销售中") || sale_status=="销售中"){
			hql+=" set sale_status='待售中' where id= :id";
		}else if (sale_status.equals("待售中")|| sale_status=="待售中") {
			hql+=" set sale_status='销售中' where id= :id";
		}
		Query q=session.createQuery(hql);
		q.setParameter("id", id);
		q.executeUpdate();
	}
	@Override
	public Building findBuild(String id) {
		Session session = sessionFactory.getCurrentSession();
		Building building = session.get(Building.class, id);
		return building;
	}
	@Override
	public List<Room> queryByRoom(int pageSize, int pageNumber, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1 ) * pageSize;
	    Query query = session.createQuery("select r from Room as r,Building as b where b.buildings_id=:buildings_id and b.id=r.building_id");
	    query.setParameter("buildings_id", buildings_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int querycount(String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(r.id) from Room as r,Building as b where b.buildings_id=:buildings_id and b.id=r.building_id";
		Query query = session.createQuery(hql);
		query.setParameter("buildings_id", buildings_id);
		int count =Integer.parseInt(query.uniqueResult().toString());
		System.out.println(count);
		return count;
	}
	@Override
	public List<Room> searchA(int pageNumber, int pageSize, String searchText, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select r from Room as r,Building as b where b.buildings_id=:buildings_id and b.id=r.building_id and";
		hql+=" (r.name like '%"+searchText+"%'";
		hql+=" or r.house.name like '%"+searchText+"%'";
		hql+=" or r.building.name like '%"+searchText+"%'";
		hql+=" or r.house.area like '%"+searchText+"%'";
		hql+=" or r.sale_status like '%"+searchText+"%'";
		hql+=" or r.house.unit_price like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		query.setParameter("buildings_id", buildings_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int searchcountA(String searchText, String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(r.id) from Room as r,Building as b where b.buildings_id=:buildings_id and b.id=r.building_id and";
		hql+=" (r.name like '%"+searchText+"%'";
		hql+=" or r.house.name like '%"+searchText+"%'";
		hql+=" or r.building.name like '%"+searchText+"%'";
		hql+=" or r.house.area like '%"+searchText+"%'";
		hql+=" or r.sale_status like '%"+searchText+"%'";
		hql+=" or r.house.unit_price like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		query.setParameter("buildings_id", buildings_id);
		int count =Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	@Override
	public void updatesale_status(String id, String sale_status) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Room r set r.sale_status=:sale_status where r.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("sale_status", sale_status);
		query.setParameter("id", id);
		System.out.println(sale_status);
		query.executeUpdate();
	}
	@Override
	public List<Room> query(String buildings_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select r from Room as r,Building as b where b.buildings_id=:buildings_id and b.id=r.building_id";
		Query query = session.createQuery(hql);
		query.setParameter("buildings_id", buildings_id);
		List<Room> roomlist = query.list();
		return roomlist;
	}


}
