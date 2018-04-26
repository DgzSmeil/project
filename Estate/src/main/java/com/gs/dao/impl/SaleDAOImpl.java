package com.gs.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.gs.dao.SaleDAO;
import com.gs.pojo.Buildings;
import com.gs.pojo.Customer;
import com.gs.pojo.Employee;
import com.gs.pojo.Hchart;
import com.gs.pojo.Sale;

public class SaleDAOImpl implements SaleDAO{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Sale queryById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Sale sale = session.get(Sale.class, id);
		return sale;
	}

	@Override
	public List<Sale> querylist(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Sale s where s.customer_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return query.list();
	}

	@Override
	public List<Sale> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1 ) * pageSize;
		String hql = "from Sale where emp_id=:id";
	    Query query = session.createQuery(hql);
	    query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		List<Sale> salelist = query.list();
		if(salelist.size()>0){
			return salelist;
		}else {
			return null;
		}
	}

	@Override
	public void update(Sale t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public void add(Sale t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
	}

	@Override
	public void delete(Sale t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(id) from Sale s where s.emp_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = (int)(long)query.uniqueResult();
		return count;
	}

	@Override
	public void valid(String id, String status) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Sale";
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
	public double total_cost(String id){
		Session session = sessionFactory.getCurrentSession();
		String hql = "select sum(total_cost) from Sale s where s.emp_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Double total_cost=(Double)query.uniqueResult() ;
		return total_cost;
		
	}
	
	@Override
	public List<Sale> querylist1(String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Sale s where s.emp_id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		return query.list();
	}
	
	
	
	@Override
	public List<Employee> findEmployee(String agency_id) {
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<Employee> employees =null;
		query =  session.createQuery("from Employee where angency_id = :id");
		query.setParameter("id", agency_id);
		employees = query.list();
		return employees;
	}

	@Override
	public int salecount(String agency_id, String name, String employee_id) {
		Session session = sessionFactory.getCurrentSession();
		Query query=null;
		Buildings builds = null;
		int count = 0;
		if((name==null || name.equals("")) && (employee_id==null || employee_id.equals(""))){
			query =  session.createQuery("select count(*) from Sale as s ,Employee as e where s.emp_id =e.id and e.angency_id = :id");
			query.setParameter("id", agency_id);
		}else if((employee_id!=null || !employee_id.equals("")) && (name==null || name.equals(""))){
			System.out.println("aaa");
			query =  session.createQuery("select count(*) from Sale where emp_id = :employee_id");
			query.setParameter("employee_id", employee_id);
			
		}else if((name!=null || !name.equals("")) && (employee_id!=null || !employee_id.equals(""))){
			Customer customer = null;
			query =  session.createQuery("from Customer where name=:name");
			query.setParameter("name", name);
			customer = (Customer)query.uniqueResult();
			
			query =  session.createQuery("select count(*) from Sale  where customer_id = :id and emp_id = :employee_id");
			query.setParameter("id",customer.getId());
			query.setParameter("emplyoee_id",employee_id);
		}
			count =Integer.parseInt(query.uniqueResult().toString());
			return count;
	}

	@Override
	public List<Sale> findSale(String agency_id, int pageSize, int pageNumber, String name, String employee_id) {
		pageNumber=(pageNumber - 1) * pageSize;
		Session session  =sessionFactory.getCurrentSession();
		Query query=null;
		List<Sale> sales = null;
		if((name==null || name.equals("")) && (employee_id==null ||employee_id.equals("")) ){
			query =  session.createQuery("select s from Sale as s ,Employee as e where s.emp_id =e.id and e.angency_id = :agency_id");
			query.setParameter("agency_id", agency_id);
		}else if((name==null || name.equals("")) && (employee_id!=null || !employee_id.equals(""))){

			query =  session.createQuery("from Sale where emp_id = :employee_id");
			query.setParameter("employee_id", employee_id);
		}else if((name!=null || !name.equals("")) && (employee_id==null || employee_id.equals(""))){
			Customer customer = null;
			query =  session.createQuery("from Customer where name=:name");
			query.setParameter("name", name);
			customer = (Customer)query.uniqueResult();
			
			query =  session.createQuery(" from Sale  where customer_id = :id");
			query.setParameter("id",customer.getId());
		}else if((name!=null || !name.equals("")) && (employee_id!=null || !employee_id.equals(""))){
			Customer customer = null;
			query =  session.createQuery("from Customer where name=:name");
			query.setParameter("name", name);
			customer = (Customer)query.uniqueResult();
			
			query =  session.createQuery("from Sale  where customer_id = :id and emp_id = :employee_id");
			query.setParameter("id",customer.getId());
			query.setParameter("emplyee_id",employee_id);
		}
			query.setFirstResult(pageNumber);
			query.setMaxResults(pageSize);
			sales = query.list();
			return  sales;
	}

	@Override
	public List<Sale> searchA(int pageNumber, int pageSize, String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Sale s where s.emp_id = :id and ";
		hql+=" (s.customer.name like '%"+searchText+"%'";
		hql+=" or s.unit_price like '%"+searchText+"%'";
		hql+=" or s.room.name like '%"+searchText+"%'";
		hql+=" or s.discount like '%"+searchText+"%'";
		hql+=" or s.total_cost like '%"+searchText+"%'";
		hql+=" or s.status like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public List<Sale> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="select DISTINCT s from Sale as s,Employee as e where s.emp_id =e.id and e.angency_id = :agency_id and ";
		hql+=" or s.unit_price like '%"+searchText+"%'";
		hql+=" or s.room.name like '%"+searchText+"%'";
		hql+=" or s.discount like '%"+searchText+"%'";
		hql+=" or s.total_cost like '%"+searchText+"%'";
		hql+=" or s.status like '%"+searchText+"%')";
		hql+=" s.unit_price like '%"+searchText+"%'";
		hql+=" or s.discount like '%"+searchText+"%'";
		hql+=" or s.total_cost like '%"+searchText+"%'";
		hql+=" or s.employee.name like '%"+searchText+"%'";
		hql+=" or s.room.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or s.status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or s.status like '%Y%' order by status desc";
		}
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int searchcountA(String searchText, String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(s.id) from Sale s where s.emp_id = :id and ";
		hql+=" (s.customer.name like '%"+searchText+"%'";
		hql+=" or s.unit_price like '%"+searchText+"%'";
		hql+=" or s.room.name like '%"+searchText+"%'";
		hql+=" or s.discount like '%"+searchText+"%'";
		hql+=" or s.total_cost like '%"+searchText+"%'";
		hql+=" or s.status like '%"+searchText+"%')";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql="select count(DISTINCT s.id) from Sale as s ,Employee as e where s.emp_id =e.id and e.angency_id = :agency_id and ";
		hql+="  s.unit_price like '%"+searchText+"%'";
		hql+=" or s.discount like '%"+searchText+"%'";
		hql+=" or s.total_cost like '%"+searchText+"%'";
		hql+=" or s.employee.name like '%"+searchText+"%'";
		hql+=" or s.room.name like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁")){
			hql+=" or s.status like '%N%' order by status desc";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or s.status like '%Y%' order by status desc";
		}
		Query query = session.createQuery(hql);
		query.setParameter("agency_id", agency_id);
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List findsale(String agency_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select e.name,";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=1 ),"; 
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=2 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=3 ),"; 
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=4 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=5 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=6 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=7 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=8 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=9 ),";
		       hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=10 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=11 ),"; 
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=12 ) ";
			   hql+="from  Sale as t,Employee as e where t.emp_id= e.id and e.angency_id = :agency_id  group by t.emp_id" ;
			   Query query = session.createQuery(hql);
			   query.setParameter("agency_id", agency_id);
			   return query.list();
	}
	@Override
	public List querybysale(String emp_id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select e.name,";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=1 ),"; 
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=2 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=3 ),"; 
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=4 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=5 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=6 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=7 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=8 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=9 ),";
		       hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=10 ),";
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=11 ),"; 
			   hql+="(select count(s.emp_id) from Sale as s where  s.emp_id=e.id  and month(s.sale_time)=12 ) ";
			   hql+="from  Sale as t,Employee as e where t.emp_id= e.id and t.emp_id=:emp_id" ;
			   Query query = session.createQuery(hql);
			   query.setParameter("emp_id", emp_id);
			   return query.list();
	}

	@Override
	public int findcount(String emp_id, String yearmonth) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select count(id) from Sale s where s.emp_id=:emp_id and DATE_FORMAT(s.sale_time,'%Y-%m')=:yearmonth";
		Query query = session.createQuery(hql);
		query.setParameter("emp_id", emp_id);
		query.setParameter("yearmonth", yearmonth);
		int count = (int)(long)query.uniqueResult();
		return count;
	}
}
