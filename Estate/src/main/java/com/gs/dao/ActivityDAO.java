package com.gs.dao;

import java.util.List;

import com.gs.pojo.Activity;
import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;

public interface ActivityDAO extends BaseDAO<String, Activity>{
	public void updateStatus(String id,String status);
	public List<Activity> count(int pageSize,int pageNumber);
	public int count();
	public List<Activity> search(int pageNumber,int pageSize,String searchText,String id);
	public int searchcount(String searchText,String id);
	public List<Activity> search(int pageNumber,int pageSize,String searchText,String id,String id2);
	public int searchcount(String searchText,String id,String id2);
	//manager start
	public List<Activity> activityPager(int pageSize,int pageNumber);
	public int activityCount();
	public List<Activity> mgnactivityPager(int pageSize,int pageNumber);
	public int mgnactivityCount();
	public List<Activity> search(int pageNumber,int pageSize,Activity activity);
	public int searchcount(Activity activity);
	public void mgnActvtActive(String id);
	public void mgnActvtInactive(String id);
	public void mgnActvtEdit(Activity activity);
	public List<Activity> allsearch(int pageNumber,int pageSize,String searchText);
	public int allsearchcount(String searchText);
	public List<Buildings> findBdsList();
	public List<Agency> findAgencyList();
	public List<Activity> list2(int pageSize,int pageNumber,String agency_id,String buildings_id);
	public int count2(String agency_id,String buildings_id);
	//manager end
	//分页
	public List<Activity> list(int pageSize,int pageNumber,String agency_id,String buildings_id);
	//获取数量
	public int count(String agency_id,String buildings_id);
}
