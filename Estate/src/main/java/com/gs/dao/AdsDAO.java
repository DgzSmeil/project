package com.gs.dao;

import java.util.List;

import com.gs.pojo.Ads;
import com.gs.pojo.Article;

public interface AdsDAO extends BaseDAO<String, Ads>
{
	public List<Ads> adsPager(int pageNumber,int pageSize);
	public int adsCount();
	
	public List<Ads> search(int pageNumber,int pageSize,Ads ads);
	public int searchcount(Ads ads);
	
	public List<Ads> allsearch(int pageNumber,int pageSize,String searchText);
	public int allsearchcount(String searchText);
	
	public void active(String id);
	public void inactive(String id);
	
	public int maxTid();
	public Ads showAds(String id);
	public List<Ads> builds(int first,int last);
}
