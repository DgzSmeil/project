package com.gs.service.impl;

import java.util.List;

import com.gs.dao.AdsDAO;
import com.gs.pojo.Ads;
import com.gs.pojo.Article;
import com.gs.service.AdsService;

public class AdsServiceImpl implements AdsService
{
	private AdsDAO adsDAO;
	
	public void setAdsDAO(AdsDAO adsDAO) {
		this.adsDAO = adsDAO;
	}

	@Override
	public List<Ads> adsPager(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return adsDAO.adsPager(pageNumber, pageSize);
	}

	@Override
	public int adsCount() {
		// TODO Auto-generated method stub
		return adsDAO.adsCount();
	}
	@Override
	public List<Ads> search(int pageNumber, int pageSize, Ads ads) {
		// TODO Auto-generated method stub
		return adsDAO.search(pageNumber, pageSize, ads);
	}

	@Override
	public int searchcount(Ads ads) {
		// TODO Auto-generated method stub
		return adsDAO.searchcount(ads);
	}

	@Override
	public List<Ads> allsearch(int pageNumber, int pageSize, String searchText) {
		// TODO Auto-generated method stub
		return adsDAO.allsearch(pageNumber, pageSize, searchText);
	}

	@Override
	public int allsearchcount(String searchText) {
		// TODO Auto-generated method stub
		return adsDAO.allsearchcount(searchText);
	}

	@Override
	public void active(String id) {
		adsDAO.active(id);
	}

	@Override
	public void inactive(String id) {
		adsDAO.inactive(id);
	}

	@Override
	public Ads queryById(String id) {
		// TODO Auto-generated method stub
		return adsDAO.queryById(id);
	}

	@Override
	public List<Ads> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Ads> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Ads t) {
		adsDAO.update(t);
	}

	@Override
	public void add(Ads t) {
		adsDAO.add(t);
	}

	@Override
	public void delete(Ads t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int maxTid() {
		// TODO Auto-generated method stub
		return adsDAO.maxTid();
	}

	@Override
	public Ads showAds(String id) {
		// TODO Auto-generated method stub
		return adsDAO.showAds(id);
	}

	@Override
	public List<Ads> builds(int first, int last) {
		return adsDAO.builds(first, last);
	}

}
