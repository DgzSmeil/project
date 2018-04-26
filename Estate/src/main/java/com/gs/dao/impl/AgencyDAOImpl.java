package com.gs.dao.impl;




import java.sql.Date;
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

import com.gs.dao.AgencyDAO;
import com.gs.pojo.Agency;

public class AgencyDAOImpl implements AgencyDAO {
	
	private SessionFactory sessionFactory;
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Agency queryById(String id) {
		Session session = sessionFactory.openSession();
		Agency agency=session.get(Agency.class, id);
		return agency;
	}
	
	
	public Agency query(String name, String email, String phone) {
		String hql = "from Agency where ";
		String param = null;
		if (name != null) {
			hql += "name = :param";
			param = name;
		} else if (email != null) {
			hql += "email = :param";
			param = email;
		} else if (phone != null) {
			hql += "phone = :param";
			param = phone;
		}
		Session session = sessionFactory.openSession();
		Query<Agency> query = session.createQuery(hql);
		query.setParameter("param", param);
		return query.uniqueResult();
	}

	@Override
	public List<Agency> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Agency> list(int pageSize, int pageNumber, String id) {
		
		return null;
	}

	@Override
	public void update(Agency t) {
		Session session = sessionFactory.getCurrentSession();
		session.update(t);
		
	}

	@Override
	public void add(Agency t) {
		Session session = sessionFactory.getCurrentSession();
		session.save(t);
		
	}

	@Override
	public void delete(Agency t) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(t);
		
	}

	@Override
	public int count(String id) {
		
		return 0;
	}

	@Override
	public void updataPwd(Agency t) {
		Session session=sessionFactory.getCurrentSession();
		String sql ="update t_agency set pwd="+t.getPwd()+" where id='"+t.getId()+"'";
		session.createSQLQuery(sql).executeUpdate();
		
	}

	@Override
	public Agency login(Agency agency) {
		
		Session session = sessionFactory.openSession();
		DetachedCriteria dc=DetachedCriteria.forClass(Agency.class);
		if(agency.getPhone()==null ||agency.getPhone().equals("")){
			dc.add(Restrictions.eq("email",agency.getEmail()));
			dc.add(Restrictions.eq("pwd",agency.getPwd()));
		}else{
			dc.add(Restrictions.eq("phone",agency.getPhone()));
			
		}
		Criteria cri=dc.getExecutableCriteria(session);
		@SuppressWarnings("unchecked")
		List<Agency> agencylist=cri.list();
		session.close();
		if(agencylist.size()>0)
		{	
			return agencylist.get(0);
		}else
		{
			return null;
		}
	}
	
	@Override
	public List<Agency> agencylist(int pageNumber, int pageSize) {
		pageNumber=(pageNumber - 1) * pageSize;
		Query q=sessionFactory.getCurrentSession().createQuery("from Agency");
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Agency> agencylist=q.list();
		return agencylist;
	}
	@Override
	public int agencycount() {
		Query q=sessionFactory.getCurrentSession().createQuery("select count(a.id) from Agency a");
		return Integer.parseInt(q.uniqueResult().toString());
	}
	@Override
	public void agencyupdate(Agency agency) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(agency);
	}
	@Override
	public List<Agency> agcCklist(int pageNumber, int pageSize,String checked) {
		pageNumber=(pageNumber - 1) * pageSize;
		Query q=sessionFactory.getCurrentSession().createQuery("from Agency a where a.checked_status='"+checked+"'  order by  a.created_time desc");
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Agency> agencylist=q.list();
		return agencylist;
	}
	@Override
	public int agcCKcount(String checked) {
		Query q=sessionFactory.getCurrentSession().createQuery("select count(a.id) from Agency a where a.checked_status='"+checked+"' order by  a.created_time desc");
		return Integer.parseInt(q.uniqueResult().toString());
	}
	@Override
	public void active(String id) {
		String hql="update Agency a set a.status='Y' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}
	@Override
	public void inactive(String id) {
		String hql="update Agency a set a.status='N' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}
	@Override
	public void checked(String id) {
		String hql="update Agency a set a.checked_status='Y',a.status='Y' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}
	@Override
	public void unchecked(String id,String reason) {
		String hql="update Agency a set a.checked_status='F',a.checked_reason='"+reason+"' where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}
	@Override
	public List<Agency> search(int pageNumber,int pageSize,Agency agency) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Agency a where 1=1";
		if(agency.getName()!=null && !agency.getName().equals(""))
		{
			hql+=" and a.name like '%"+agency.getName()+"%'";
		}
		if(agency.getEmail()!=null && !agency.getEmail().equals(""))
		{
			hql+=" and a.email like '%"+agency.getEmail()+"%'";
		}
		if(agency.getLeader()!=null && !agency.getLeader().equals(""))
		{
			hql+=" and a.leader like '%"+agency.getLeader()+"%'";
		}
		if(agency.getPhone()!=null && !agency.getPhone().equals(""))
		{
			hql+=" and a.phone like '%"+agency.getPhone()+"%'";
		}
		if(agency.getTel()!=null && !agency.getTel().equals(""))
		{
			hql+=" and a.tel like '%"+agency.getTel()+"%'";
		}
		if(agency.getAddress()!=null && !agency.getAddress().equals(""))
		{
			hql+=" and a.address like '%"+agency.getAddress()+"%'";
		}
		if(session.getAttribute("checked")!=null)
		{
			hql+=" and a.checked_status like '%"+session.getAttribute("checked").toString()+"%'";
		}
		hql+="  order by  a.created_time desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Agency> agencylist=q.list();
		return agencylist;
	}
	@Override
	public int searchcount(Agency agency) {
		String hql="select count(a.id) from Agency a where 1=1";
		if(agency.getName()!=null && !agency.getName().equals(""))
		{
			hql+=" and a.name like '%"+agency.getName()+"%'";
		}
		if(agency.getEmail()!=null && !agency.getEmail().equals(""))
		{
			hql+=" and a.email like '%"+agency.getEmail()+"%'";
		}
		if(agency.getLeader()!=null && !agency.getLeader().equals(""))
		{
			hql+=" and a.leader like '%"+agency.getLeader()+"%'";
		}
		if(agency.getPhone()!=null && !agency.getPhone().equals(""))
		{
			hql+=" and a.phone like '%"+agency.getPhone()+"%'";
		}
		if(agency.getTel()!=null && !agency.getTel().equals(""))
		{
			hql+=" and a.tel like '%"+agency.getTel()+"%'";
		}
		if(agency.getAddress()!=null && !agency.getAddress().equals(""))
		{
			hql+=" and a.address like '%"+agency.getAddress()+"%'";
		}
		if(session.getAttribute("checked")!=null)
		{
			hql+=" and a.checked_status like '%"+session.getAttribute("checked").toString()+"%'";
		}
		hql+="  order by  a.created_time desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}
	@Override
	public void delbytime(Date starttime, Date endtime) {
		String hql="delete from Agency a where a.created_time between "+starttime+" and "+endtime;
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}
	@Override
	public void delbyid(String id) {
		String hql="delete from Agency a where a.id='"+id+"'";
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery(hql);
		q.executeUpdate();
	}
	@Override
	public List<Agency> allsearch(int pageNumber, int pageSize, String searchText) {
		pageNumber=(pageNumber - 1) * pageSize;
		String hql="from Agency a where";
		hql+=" (a.name like '%"+searchText+"%'";
		hql+=" or a.email like '%"+searchText+"%'";
		hql+=" or a.leader like '%"+searchText+"%'";
		hql+=" or a.phone like '%"+searchText+"%'";
		hql+=" or a.tel like '%"+searchText+"%'";
		if(searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" or a.address like '%"+searchText+"%')";
		
		
		if(session.getAttribute("checked")!=null)
		{
			hql+=" and a.checked_status like '%"+session.getAttribute("checked").toString()+"%'";
		}
		hql+="  order by  a.created_time desc";
		System.out.println(hql);
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		q.setFirstResult(pageNumber);
		q.setMaxResults(pageSize);
		List<Agency> agencylist=q.list();
		return agencylist;
	}

	@Override
	public int allsearchcount(String searchText) {
		String hql="select count(a.id) from Agency a where";
		hql+=" (a.name like '%"+searchText+"%'";
		hql+=" or a.email like '%"+searchText+"%'";
		hql+=" or a.leader like '%"+searchText+"%'";
		hql+=" or a.phone like '%"+searchText+"%'";
		hql+=" or a.tel like '%"+searchText+"%'";
		if(searchText.equals("已禁用")||searchText.equals("禁用")||searchText.equals("禁")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已禁"))
		{
			hql+=" or a.status like '%N%'";
		}else if(searchText.equals("已启用")||searchText.equals("启用")||searchText.equals("启")||searchText.equals("用")||searchText.equals("已")||searchText.equals("已启")){
			hql+=" or a.status like '%Y%'";
		}
		hql+=" or a.address like '%"+searchText+"%')";
		
		if(session.getAttribute("checked")!=null)
		{
			hql+=" and a.checked_status like '%"+session.getAttribute("checked").toString()+"%'";
		}
		hql+="  order by  a.created_time desc";
		Query q=sessionFactory.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.uniqueResult().toString());
	}

	@Override
	public List<Agency> builds(int first, int last) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Agency where status='Y' and checked_status='Y' order by created_time");
		query.setFirstResult(first);
		query.setMaxResults(last);
		return query.list();
	}

}
