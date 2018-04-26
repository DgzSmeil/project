package com.gs.dao.impl;


import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.EmployeeDAO;
import com.gs.pojo.Buildings;
import com.gs.pojo.Employee;
import com.gs.pojo.House;

public class EmployeeDAOImpl implements EmployeeDAO{
	
private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Employee queryById(String id) {
		Session session=sessionFactory.getCurrentSession();
		Employee employee=session.get(Employee.class, id);
		return employee;
	}

	@Override
	public void update(Employee t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(Employee t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
		
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(id) from Employee where angency_id = :id");
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public List<Employee> querylist(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="from Employee e where e.angency_id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return query.list();
	}

	@Override
	public void delete(Employee t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
		
	}

	@Override
	public List<Employee> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Employee e where e.angency_id = :id order by status desc");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public void updateOther(String id, Object other) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Employee set basic_salary= :other where id= :id";
		Query q=session.createQuery(hql);
		q.setParameter("other", other);
		q.setParameter("id", id);
		q.executeUpdate();
		
	}

	@Override
	public void updateStatus(String id, String status) {
		Session session=sessionFactory.getCurrentSession();
		String hql="update Employee ";
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
	public Employee login(Employee employee) {
		Session session = sessionFactory.openSession();
		DetachedCriteria dc = DetachedCriteria.forClass(Employee.class);
		dc.add(Restrictions.eq("phone", employee.getPhone()));
		dc.add(Restrictions.eq("pwd", employee.getPwd()));
		Criteria cr = dc.getExecutableCriteria(session);
		@SuppressWarnings("unchecked")
		List<Employee> employeelist = cr.list();
		session.close();
		if(employeelist.size()>0){
			return employeelist.get(0);
		}else {
			return null;
		}
	}

	@Override
	public void updatePwd(Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Employee set pwd=:pwd where id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("pwd",employee.getPwd());
		query.setParameter("id",employee.getId());
		query.executeUpdate();
	}
	
	@Override
	public List<Employee> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select a from Employee as a where a.angency_id = :agency_id and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.email like '%"+searchText+"%'";
		hql+=" or a.phone like '%"+searchText+"%'";
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
		String hql="select count(a.id) from Employee as a  where angency_id = :agency_id  and ";
		hql+=" a.name like '%"+searchText+"%'";
		hql+=" or a.email like '%"+searchText+"%'";
		hql+=" or a.phone like '%"+searchText+"%'";
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
