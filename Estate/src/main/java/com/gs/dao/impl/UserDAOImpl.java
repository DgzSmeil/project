package com.gs.dao.impl;

import java.util.List;

import javax.jws.soap.SOAPBinding.Use;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.selector.spi.StrategySelectionException;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.UserDAO;
import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;
import com.gs.pojo.Like;
import com.gs.pojo.Manager;
import com.gs.pojo.User;
import com.sun.org.apache.xml.internal.security.transforms.Transforms;

public class UserDAOImpl implements UserDAO{

	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public User queryById(String id) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.getTransaction();
		transaction.begin();
		User user = session.get(User.class, id);
		transaction.commit();
		session.close();
		return user;
		
	}

	@Override
	public void update(User t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
	}

	@Override
	public void add(User t) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(t);
	}


	@Override
	public User login(User t) {
		Session session = sessionFactory.openSession();
		DetachedCriteria dc=DetachedCriteria.forClass(User.class);
		if((t.getPhone()!=null && t.getPwd()==null)|| (!t.getPhone().equals("") && t.getPwd().equals(""))){
			dc.add(Restrictions.eq("phone",t.getPhone()));
			dc.add(Restrictions.eq("status",t.getStatus()));
		}else{
			
		dc.add(Restrictions.eq("phone",t.getPhone()));
		dc.add(Restrictions.eq("pwd",t.getPwd()));
		dc.add(Restrictions.eq("status",t.getStatus()));
		}
		Criteria cri=dc.getExecutableCriteria(session);
		@SuppressWarnings("unchecked")
		List<User> userlist=cri.list();
		session.close();
		if(userlist.size()>0)
		{	
			return userlist.get(0);
		}else
		{
			return null;
		}
	}
	//修改密码
	public void updataPwd(User t) {
		Session session=sessionFactory.getCurrentSession();
		String sql ="update t_user set pwd='"+t.getPwd()+"' where id='"+t.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
	}
	
	//查询
	@Override
	public List<User> querylist(String id) {
		String hql="from User u where u.id= :id";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter("id", id);
		return q.list();
	}


	@Override
	public void delete(User t) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(t);
	}

	//分页查询
	@Override
	public List<User> list(int pageSize, int pageNumber, String id) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from User u where u.id = :id  order by status desc");
		query.setParameter("id", id);
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int count(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from User u where u.id = :id");
		query.setParameter("id", id);
		int count = Integer.parseInt(query.uniqueResult().toString());
		return count;
	}

	//注册
	@Override
	public User queryforcheck(String phone,String email) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where ";
		String str = null;
		if(phone!=null ) {
			hql += "phone =:str";
			str = phone;
		} else if(email !=null) {
			hql += "email =:str";
			str = email;
		}
		Query<User> query = session.createQuery(hql);
		query.setParameter("str", str);
		System.out.println("str:"+str);
		return query.uniqueResult();
	}

	@Override
	public List<User> userpager(int pageSize, int pageNumber) {
		Session session = sessionFactory.getCurrentSession();
		pageNumber=(pageNumber - 1) * pageSize;
		Query query = session.createQuery("from User a order by a.headicon desc");
		query.setFirstResult(pageNumber);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int usercount() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(u.id) from User u");
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public void active(String id) {
		String hql="update User u set u.status='Y' where u.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
		
	}

	@Override
	public void inactive(String id) {
		String hql="update User u set u.status='N' where u.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}

	@Override
	public List<User> search(int pageNumber, int pageSize, User user) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from User a where 1=1";
		if(user.getNickname()!=null && !user.getNickname().equals(""))
		{
			hql+=" and a.nickname like '%"+user.getNickname()+"%'";
		}
		if(user.getName()!=null && !user.getName().equals(""))
		{
			hql+=" and a.name like '%"+user.getName()+"%'";
		}
		
		if(user.getEmail()!=null && !user.getEmail().equals(""))
		{
			hql+=" and a.email like '%"+user.getEmail()+"%'";
		}
	
		if(user.getPhone()!=null && !user.getPhone().equals(""))
		{
			hql+=" and a.phone like '%"+user.getPhone()+"%'";
		}
		if(user.getQq()!=null && !user.getQq().equals(""))
		{
			hql+=" and a.QQ like '%"+user.getQq()+"%'";
		}
		if(user.getWechat()!=null && !user.getWechat().equals(""))
		{
			hql+=" and a.wechat like '%"+user.getWechat()+"%'";
		}
	
		hql+=" order by a.headicon desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<User> userlist=q.list();
		return userlist;
	}

	@Override
	public int searchcount(User user) {
		String hql="select count(a.id) from User a where 1=1";
		if(user.getNickname()!=null && !user.getNickname().equals(""))
		{
			hql+=" and a.nickname like '%"+user.getNickname()+"%'";
		}
		if(user.getName()!=null && !user.getName().equals(""))
		{
			hql+=" and a.name like '%"+user.getName()+"%'";
		}
		
		if(user.getEmail()!=null && !user.getEmail().equals(""))
		{
			hql+=" and a.email like '%"+user.getEmail()+"%'";
		}
		
		if(user.getPhone()!=null && !user.getPhone().equals(""))
		{
			hql+=" and a.phone like '%"+user.getPhone()+"%'";
		}
		if(user.getQq()!=null && !user.getQq().equals(""))
		{
			hql+=" and a.qq like '%"+user.getQq()+"%'";
		}
		if(user.getWechat()!=null && !user.getWechat().equals(""))
		{
			hql+=" and a.wechat like '%"+user.getWechat()+"%'";
		}
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public List<User> allsearch(int pageNumber, int pageSize, String searchText) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from User a where ";
		hql+=" a.nickname like '%"+searchText+"%'";
		hql+=" or a.name like '%"+searchText+"%'";
		hql+=" or a.email like '%"+searchText+"%'";
		hql+=" or a.phone like '%"+searchText+"%'";
		hql+=" or a.qq like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" or a.wechat like '%"+searchText+"%'";
		hql+=" order by a.headicon desc";
		System.out.println(hql);
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<User> userlist=q.list();
		return userlist;
	}

	@Override
	public int allsearchcount(String searchText) {
		String hql="select count(a.id) from User a where ";
		hql+=" a.nickname like '%"+searchText+"%'";
		hql+=" or a.name like '%"+searchText+"%'";
		hql+=" or a.email like '%"+searchText+"%'";
		hql+=" or a.phone like '%"+searchText+"%'";
		hql+=" or a.qq like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" or a.wechat like '%"+searchText+"%'";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}
	
	
	
}
