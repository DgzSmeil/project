package com.gs.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.AppointmentDAO;
import com.gs.pojo.Appointment;
import com.gs.pojo.Employee;
import com.gs.pojo.House;

public class AppointmentDAOImpl implements AppointmentDAO{
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Appointment queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Appointment appointment = session.get(Appointment.class, id);
		return appointment;
	}

	@Override
	public List<Appointment> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Appointment> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber = (pageNumber-1)*pageSize;
		Query query = session.createQuery("from Appointment a where a.emp_id=:id order by status desc");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		List<Appointment> appointmentlist = query.list();
		return appointmentlist;
	}

	@Override
	public void update(Appointment t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Appointment t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(Appointment t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(id) from Appointment where emp_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = (int)(long)query.uniqueResult();
		return count;
	}
	@Override
	public void valid(String id, String status) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Appointment";
		if(status.equals("Y") || status=="Y"){
			hql += " set status='N' where id=:id";
		}else if(status.equals("N") || status=="N"){
			hql += " set status='Y' where id=:id";
		}
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.executeUpdate();
	}
	@Override
	public void app_status(String id,Date arrive_time, String app_status) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Appointment a set a.arrive_time=:arrive_time,a.app_status=:app_status where a.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("arrive_time", arrive_time);
		query.setParameter("app_status", app_status);
		query.setParameter("id", id);
		query.executeUpdate();
		
	}
	@Override
	public List<Appointment> search1(int pageNumber, int pageSize, String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Appointment a where a.emp_id = :id and ";
		hql+=" (a.employee.name like '%"+searchText+"%'";
		hql+=" or a.users.name like '%"+searchText+"%'";
		hql+=" or a.house.name like '%"+searchText+"%'";
		hql+=" or a.app_status like '%"+searchText+"%'";
		hql+=" or a.status like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int searchcount1(String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(a.id) from Appointment a where a.emp_id = :id and ";
		hql+=" (a.employee.name like '%"+searchText+"%'";
		hql+=" or a.users.name like '%"+searchText+"%'";
		hql+=" or a.house.name like '%"+searchText+"%'";
		hql+=" or a.app_status like '%"+searchText+"%'";
		hql+=" or a.status like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Appointment> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select DISTINCT a from  Appointment as a ,Employee as e where a.emp_id =e.id and e.angency_id = :agency_id and ";
		hql+=" a.employee.name like '%"+searchText+"%'";
		hql+=" or a.house.name like '%"+searchText+"%'";
		hql+=" or a.users.name like '%"+searchText+"%'";
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
		String hql="select count(DISTINCT a.id) from  Appointment as a ,Employee as e where a.emp_id =e.id and e.angency_id = :agency_id and ";
		hql+=" a.employee.name like '%"+searchText+"%'";
		hql+=" or a.house.name like '%"+searchText+"%'";
		hql+=" or a.users.name like '%"+searchText+"%'";
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
	public List<House> findHouse(String agency_id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		query =  session.createQuery("select h from House as h,Buildings as b  where h.buildings_id=b.id and  b.agency_id = :id  ");
		query.setParameter("id", agency_id);
		return query.list();
	}
	@Override
	public List<Employee> findEmployee(String agency_id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		query =  session.createQuery("from Employee where angency_id = :id  ");
		query.setParameter("id", agency_id);
		return query.list();
	}
	@Override
	public List<Appointment> findAppointment(String angency_id, int pageSize, int pageNumber, String employee_id,
			String house_id) {
		pageNumber=(pageNumber - 1) * pageSize;
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		if((house_id==null || house_id.equals("")) && (employee_id==null ||employee_id.equals("")) ){
			query =  session.createQuery("select a from Appointment as a,Employee as e where a.emp_id = e.id and  e.angency_id=:id");
			query.setParameter("id", angency_id);
		}else if((house_id==null || house_id.equals("")) && (employee_id!=null || !employee_id.equals(""))){
			query =  session.createQuery("from Appointment  where emp_id = :employee_id");
			query.setParameter("employee_id", employee_id);
		}else if((house_id!=null || !house_id.equals("")) && (employee_id==null || employee_id.equals(""))){
			query =  session.createQuery("from Appointment where   house_id = :house_id");
			query.setParameter("house_id",house_id);
		}else if((house_id!=null || !house_id.equals("")) && (employee_id!=null || !employee_id.equals(""))){
			query =  session.createQuery("from Appointment where emp_id = :employee_id and house_id = :house_id");
			query.setParameter("house_id",house_id);
			query.setParameter("employee_id",employee_id);
		}
			query.setFirstResult(pageNumber);
			query.setMaxResults(pageSize);
		return   query.list();
	}
	@Override
	public int appointmentcount(String angency_id, String employee_id, String house_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query=null;
		int count = 0;
		if((house_id==null || house_id.equals("")) && (employee_id==null ||employee_id.equals("")) ){
			query =  session.createQuery("select count(*) from Appointment as a,Employee as e where a.emp_id = e.id and  e.angency_id=:id");
			query.setParameter("id", angency_id);
		}else if((house_id==null || house_id.equals("")) && (employee_id!=null || !employee_id.equals(""))){
			query =  session.createQuery("select count(*) from Appointment  where emp_id = :employee_id");
			query.setParameter("employee_id", employee_id);
		}else if((house_id!=null || !house_id.equals("")) && (employee_id==null || employee_id.equals(""))){
			query =  session.createQuery("select count(*) from Appointment where   house_id = :house_id");
			query.setParameter("house_id",house_id);
		}else if((house_id!=null || !house_id.equals("")) && (employee_id!=null || !employee_id.equals(""))){
			query =  session.createQuery("select count(*) from Appointment where emp_id = :employee_id and house_id = :house_id");
			query.setParameter("house_id",house_id);
			query.setParameter("employee_id",employee_id);
		}
			count =Integer.parseInt(query.uniqueResult().toString());
			return count;
	}
	@Override
	public Appointment queryId(String house_id, String user_id) {
		Session session = sessionFactory.openSession();
		String hql = "from Appointment where user_id=:user_id and house_id=:house_id and status='Y'";
		Query<Appointment> query = session.createQuery(hql);
		query.setParameter("user_id",user_id);
		query.setParameter("house_id", house_id);
		return query.uniqueResult();
	}
	@Override
	public List<Appointment> listByUser_id(int pageSize, int pageNumber, String user_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Appointment where user_id = :id and status = 'Y' order by app_arrive_time desc");
		query.setParameter("id", user_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int countByUser_id(String user_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from Appointment e where e.user_id = :id and status = 'Y'");
		query.setParameter("id", user_id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
}
