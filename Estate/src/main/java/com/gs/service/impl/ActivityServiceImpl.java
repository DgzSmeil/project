package com.gs.service.impl;

import java.util.List;

import com.gs.dao.ActivityDAO;
import com.gs.pojo.Activity;
import com.gs.pojo.Agency;
import com.gs.pojo.Buildings;
import com.gs.service.ActivityService;

public class ActivityServiceImpl implements ActivityService{
	
	private ActivityDAO activityDAO;

	public void setActivityDAO(ActivityDAO activityDAO) {
		this.activityDAO = activityDAO;
	}

	@Override
	public Activity queryById(String id) {
		return activityDAO.queryById(id);
	}

	@Override
	public List<Activity> querylist(String id) {
		return activityDAO.querylist(id);
	}

	@Override
	public void update(Activity t) {
		activityDAO.update(t);
		
	}
	
	@Override
	public void add(Activity t) {
		activityDAO.add(t);
		
	}

	@Override
	public void delete(Activity t) {
		activityDAO.delete(t);
		
	}

	@Override
	public int count(String id) {
		return activityDAO.count(id);
	}

	@Override
	public List<Activity> list(int pageSize, int pageNumber, String id) {
		return activityDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void updateStatus(String id, String status) {
		activityDAO.updateStatus(id, status);
	}

	@Override
	public List<Activity> activityPager(int pageSize, int pageNumber) {
		return activityDAO.activityPager(pageSize, pageNumber);
	}

	@Override
	public int activityCount() {
		return activityDAO.activityCount();
	}

	@Override
	public List<Activity> search(int pageNumber, int pageSize, Activity activity) {
		return activityDAO.search(pageNumber, pageSize, activity);
	}

	@Override
	public int searchcount(Activity activity) {
		return activityDAO.searchcount(activity);
	}

	@Override
	public List<Activity> mgnactivityPager(int pageSize, int pageNumber) {
		return activityDAO.mgnactivityPager(pageSize, pageNumber);
	}

	@Override
	public int mgnactivityCount() {
		return activityDAO.mgnactivityCount();
	}

	@Override
	public void mgnActvtActive(String id) {
		activityDAO.mgnActvtActive(id);
		
	}

	@Override
	public void mgnActvtInactive(String id) {
		activityDAO.mgnActvtInactive(id);
	}

	@Override
	public void mgnActvtEdit(Activity activity) {
		activityDAO.mgnActvtEdit(activity);
	}

	@Override
	public List<Activity> list(int pageSize, int pageNumber, String agency_id, String buildings_id) {
		return activityDAO.list(pageSize, pageNumber, agency_id, buildings_id);
	}

	@Override
	public int count(String agency_id, String buildings_id) {
		return activityDAO.count(agency_id, buildings_id);
	}

	@Override
	public List<Activity> allsearch(int pageNumber, int pageSize, String searchText) {
		return activityDAO.allsearch(pageNumber, pageSize, searchText);
	}

	@Override
	public int allsearchcount(String searchText) {
		return activityDAO.allsearchcount(searchText);
	}

	@Override
	public List<Activity> search(int pageNumber, int pageSize, String searchText, String id) {
		return activityDAO.search(pageNumber, pageSize, searchText, id);
	}

	@Override
	public int searchcount(String searchText, String id) {
		return activityDAO.searchcount(searchText, id);
	}

	@Override
	public List<Activity> search(int pageNumber, int pageSize, String searchText, String id, String id2) {
		return activityDAO.search(pageNumber, pageSize, searchText, id, id2);
	}

	@Override
	public int searchcount(String searchText, String id, String id2) {
		return activityDAO.searchcount(searchText, id, id2);
	}

	@Override
	public List<Buildings> findBdsList() {
		return activityDAO.findBdsList();
	}

	@Override
	public List<Agency> findAgencyList() {
		return activityDAO.findAgencyList();
	}

	@Override
	public List<Activity> list2(int pageSize, int pageNumber, String agency_id, String buildings_id) {
		return activityDAO.list2(pageSize, pageNumber, agency_id, buildings_id);
	}

	@Override
	public int count2(String agency_id, String buildings_id) {
		return activityDAO.count2(agency_id, buildings_id);
	}

	@Override
	public List<Activity> count(int pageSize, int pageNumber) {
		return activityDAO.count(pageSize, pageNumber);
	}

	@Override
	public int count() {
		return activityDAO.count();
	}

}
