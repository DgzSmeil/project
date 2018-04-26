package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.MissionDAO;
import com.gs.pojo.Buildings;
import com.gs.pojo.Employee;
import com.gs.pojo.House;
import com.gs.pojo.Mission;
import com.gs.pojo.Sale;

public class MissionDAOImpl implements MissionDAO{
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Mission queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Mission mission = session.get(Mission.class, id);
		return mission;
	}

	@Override
	public List<Mission> querylist(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Mission m where m.emp_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Mission> missionlist = query.list();
		return missionlist;
	}
	
	@Override
	public List<Mission> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber-1)*pageSize;
		Query query = session.createQuery("from Mission where emp_id=:id");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		List<Mission> missionlist = query.list();
		return missionlist;
	}

	@Override
	public void update(Mission t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void add(Mission t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(Mission t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(id) from Mission where emp_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = (int)(long)query.uniqueResult();
		return count;
	}
	@Override
	public void updateOther(String id, Object other) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Mission set quantity= :other where id= :id";
		Query q=session.createQuery(hql);
		q.setParameter("other", other);
		q.setParameter("id", id);
		q.executeUpdate();
	}
	@Override
	public void updatesalary(String id, int sales, double salary) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Mission m set m.sales=:sales,m.salary=:salary where id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("sales", sales);
		query.setParameter("salary", salary);
		query.setParameter("id", id);
		query.executeUpdate();
	}
	@Override
	public List<Mission> search1(int pageNumber, int pageSize, String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Mission m where m.emp_id = :id and";
		hql+=" (m.quantity like '%"+searchText+"%'";
		hql+=" or m.monthes like '%"+searchText+"%'";
		hql+=" or m.bonus_percent like '%"+searchText+"%'";
		hql+=" or m.sales like '%"+searchText+"%'";
		hql+=" or m.salary like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int searchcount1(String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(m.id) from Mission m where m.emp_id = :id and";
		hql+=" (m.quantity like '%"+searchText+"%'";
		hql+=" or m.monthes like '%"+searchText+"%'";
		hql+=" or m.bonus_percent like '%"+searchText+"%'";
		hql+=" or m.sales like '%"+searchText+"%'";
		hql+=" or m.salary like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
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
	public List<Mission> findSalary(String agency_id, int pageNumber, int pageSize, String employee_id,String month) {
		pageNumber=(pageNumber - 1) * pageSize;
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		if((employee_id==null || employee_id.equals("")) && (month==null ||month.equals("")) ){
			query =  session.createQuery("select m from Mission as m,Employee as e where m.emp_id=e.id and e.angency_id = :agency_id");
			query.setParameter("agency_id", agency_id);
		}else if((employee_id==null || employee_id.equals("")) && (month!=null || !month.equals(""))){
			query =  session.createQuery("from Mission  where yearmonth = :month");
			query.setParameter("month", month);
		}else if((employee_id!=null || !employee_id.equals("")) && (month==null || month.equals(""))){
			query =  session.createQuery("from Mission where   emp_id = :employee_id");
			query.setParameter("employee_id",employee_id);
		}else if((employee_id!=null || !employee_id.equals("")) && (month!=null || !month.equals(""))){
			query =  session.createQuery("from Mission where emp_id = :employee_id and yearmonth = :month");
			query.setParameter("employee_id",employee_id);
			query.setParameter("month",month);
		}
			query.setFirstResult(pageNumber);
			query.setMaxResults(pageSize);
		return  query.list();
	}
	@Override
	public int countSalary(String agency_id, String employee_id,String month) {
		Session session = sessionFactory.getCurrentSession();
		Query query=null;
		int count = 0;
		if((employee_id==null || employee_id.equals("")) && (month==null ||month.equals("")) ){
			query =  session.createQuery("select count(*) from Mission as m,Employee as e where m.emp_id=e.id and e.angency_id = :agency_id");
			query.setParameter("agency_id", agency_id);
		}else if((employee_id==null || employee_id.equals("")) && (month!=null || !month.equals(""))){
			query =  session.createQuery("select count(*) from Mission  where yearmonth = :month");
			query.setParameter("month", month);
		}else if((employee_id!=null || !employee_id.equals("")) && (month==null || month.equals(""))){
			query =  session.createQuery("select count(*) from Mission where   emp_id = :employee_id");
			query.setParameter("employee_id",employee_id);
		}else if((employee_id!=null || !employee_id.equals("")) && (month!=null || !month.equals(""))){
			query =  session.createQuery("select count(*) from Mission where emp_id = :employee_id and yearmonth = :month");
			query.setParameter("employee_id",employee_id);
			query.setParameter("month",month);
		}
			count =Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	@Override
	public List<Mission> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select DISTINCT m from Mission as m,Employee as e where m.emp_id=e.id and e.angency_id = :agency_id and ";
		hql+=" m.quantity like '%"+searchText+"%'";
		hql+=" or m.monthes like '%"+searchText+"%'";
		hql+=" or m.employee.name like '%"+searchText+"%'";
		hql+=" or m.salary like '%"+searchText+"%'";
		hql+=" or m.sales like '%"+searchText+"%'";
		hql+=" or m.bonus_percent like '%"+searchText+"%'";
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int searchcount(String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(DISTINCT m.id) from Mission as m,Employee as e where m.emp_id=e.id and e.angency_id = :agency_id and ";
		hql+=" m.quantity like '%"+searchText+"%'";
		hql+=" or m.monthes like '%"+searchText+"%'";
		hql+=" or m.employee.name like '%"+searchText+"%'";
		hql+=" or m.salary like '%"+searchText+"%'";
		hql+=" or m.sales like '%"+searchText+"%'";
		hql+=" or m.bonus_percent like '%"+searchText+"%'";
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		return Integer.parseInt(query.uniqueResult().toString());
	}
	
}
