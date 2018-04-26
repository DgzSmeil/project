package com.gs.service;

import java.util.List;

import com.gs.pojo.ArticleType;

public interface ArticleTypeService extends BaseService<String, ArticleType>
{
	public List<ArticleType> articleTypePager(int pageNumber,int pageSize);
	public int articleTypeCount();
	public void active(String id);
	public void inactive(String id);
	
	public List<ArticleType> allsearch(int pageNumber,int pageSize,String searchText);
	public int allsearchcount(String searchText);
	
	public List<ArticleType> search(int pageNumber,int pageSize,ArticleType articletype);
	public int searchcount(ArticleType articletype);
	
	
}
