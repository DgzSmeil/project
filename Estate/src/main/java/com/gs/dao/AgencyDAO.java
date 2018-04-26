package com.gs.dao;


import java.sql.Date;
import java.util.List;


import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;

public interface AgencyDAO extends BaseDAO<String, Agency>{
	
		public void updataPwd(Agency t);
		public Agency query(String name, String email, String phone);
		public Agency login(Agency agency);
		
		//manager start
		public List<Agency> agencylist(int pageNumber,int pageSize);
		public List<Agency> agcCklist(int pageNumber,int pageSize,String checked);
		public int agencycount();
		public int agcCKcount(String checked);
		public void agencyupdate(Agency agency);
		public void active(String id);
		public void inactive(String id);
		public void checked(String id);
		public void unchecked(String id,String reason);
		public List<Agency> search(int pageNumber,int pageSize,Agency agency);
		public int searchcount(Agency agency);
		public List<Agency> allsearch(int pageNumber,int pageSize,String searchText);
		public int allsearchcount(String searchText);
		public void delbytime(Date starttime,Date endtime);
		public void delbyid(String id);
		public List<Agency> builds(int first,int last);
		
}
