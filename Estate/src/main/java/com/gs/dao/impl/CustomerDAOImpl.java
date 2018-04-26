package com.gs.dao.impl;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.CustomerDAO;
import com.gs.pojo.Customer;
import com.gs.pojo.Employee;

public class CustomerDAOImpl implements CustomerDAO{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Customer queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Customer customer = session.get(Customer.class, id);
		return customer;
	}
	@Override
	public void update(Customer t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void add(Customer t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}
	
	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(id) from Customer c where c.employee_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = (int)(long)query.uniqueResult();
		System.out.println("count="+count);
		return count;
	}
	@Override
	public List<Customer> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from Customer c where c.employee_id=:id order by status desc");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public void valid(String id, String status) {
		Session session = sessionFactory.getCurrentSession();
		String hql="update Customer";
		if(status.equals("Y") || status=="Y"){
			hql+=" set status='N' where id= :id";
		}else if (status.equals("N") || status=="N") {
			hql+=" set status='Y' where id= :id";
		}
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.executeUpdate();
	}
	@Override
	public List<Customer> querylist(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Customer c where c.employee_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<Customer> customerlist = query.list();
		return customerlist;
	}
	@Override
	public void delete(Customer t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
		
	}
	
	//经销商查看客户
	@Override
	public List<Customer> listEmp(String agency_id, int pageNumber, int pageSize,String employee_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query =null;
		if(employee_id==null || employee_id.equals("")){
			query = session.createQuery("select c from Customer as c,Employee as e where c.employee_id = e.id and e.angency_id = :agency_id");
			query.setParameter("agency_id", agency_id);
		}else{
			query = session.createQuery("select c from Customer as c,Employee as e where c.employee_id = e.id and e.angency_id = :agency_id and c.employee_id = :employee_id");
			query.setParameter("agency_id", agency_id);
			query.setParameter("employee_id", employee_id);
		}
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int empCount(String agency_id,String employee_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="";
		Query query =null;
		if(employee_id==null || employee_id.equals("")){
			 hql = "select count(*) from Customer as c,Employee as e where c.employee_id = e.id and e.angency_id = :agency_id";
			 query = session.createQuery(hql);
			 query.setParameter("agency_id", agency_id);
		}else{
			 hql = "select count(*) from Customer as c,Employee as e where c.employee_id = e.id and e.angency_id = :agency_id and c.employee_id = :employee_id";
			 query = session.createQuery(hql);
	 		 query.setParameter("agency_id", agency_id);
	 		 query.setParameter("employee_id", employee_id);
				
		}
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}
	@Override
	public List<Employee> listEmployee(String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " from Employee where angency_id=:agency_id";
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		return query.list();
	}
	@Override
	public List<Customer> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select DISTINCT c from Customer as c,Employee as e where c.employee_id = e.id and e.angency_id = :agency_id and ";
		hql+=" c.name like '%"+searchText+"%'";
		hql+=" or c.gender like '%"+searchText+"%'";
		hql+=" or c.identity_id like '%"+searchText+"%'";
		hql+=" or c.email like '%"+searchText+"%'";
		hql+=" or c.phone like '%"+searchText+"%'";
		hql+=" or c.address like '%"+searchText+"%'";
		hql+=" or c.customer_type like '%"+searchText+"%'";
		hql+=" or c.employee.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or c.status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or c.status like '%Y%' order by status desc";
		}
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public List<Customer> queryByphone(String phone) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Customer c where c.phone=:phone";
		Query query = session.createQuery(hql);
		query.setParameter("phone", phone);
		List<Customer> customer = query.list();
		if(customer.size()>0){
			return customer;
		}else {
			return null;
		}
		
	}
	@Override
	public List<Customer> searchA(int pageNumber, int pageSize, String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Customer c where c.employee_id = :id and";
		hql+=" (c.name like '%"+searchText+"%'";
		hql+=" or c.gender like '%"+searchText+"%'";
		hql+=" or c.identity_id like '%"+searchText+"%'";
		hql+=" or c.email like '%"+searchText+"%'";
		hql+=" or c.phone like '%"+searchText+"%'";
		hql+=" or c.customer_type like '%"+searchText+"%'";
		hql+=" or c.address like '%"+searchText+"%'";
		hql+=" or c.status like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		System.out.println(hql);
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int searchcountA(String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(c.id) from Customer c where c.employee_id = :id and ";
		hql+=" (c.name like '%"+searchText+"%'";
		hql+=" or c.gender like '%"+searchText+"%'";
		hql+=" or c.identity_id like '%"+searchText+"%'";
		hql+=" or c.email like '%"+searchText+"%'";
		hql+=" or c.phone like '%"+searchText+"%'";
		hql+=" or c.customer_type like '%"+searchText+"%'";
		hql+=" or c.address like '%"+searchText+"%')";
		hql+=" or c.status like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		System.out.println(hql);
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(DISTINCT c.id) from Customer as c,Employee as e where c.employee_id = e.id and e.angency_id = :agency_id and ";
		hql+=" c.name like '%"+searchText+"%'";
		hql+=" or c.gender like '%"+searchText+"%'";
		hql+=" or c.identity_id like '%"+searchText+"%'";
		hql+=" or c.email like '%"+searchText+"%'";
		hql+=" or c.phone like '%"+searchText+"%'";
		hql+=" or c.address like '%"+searchText+"%'";
		hql+=" or c.customer_type like '%"+searchText+"%'";
		hql+=" or c.employee.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or c.status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or c.status like '%Y%' order by status desc";
		}
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		return Integer.parseInt(query.uniqueResult().toString());
	}
}
