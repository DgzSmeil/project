package com.gs.dao;

import java.util.List;

import com.gs.pojo.Agency;
import com.gs.pojo.Article;
import com.gs.pojo.ArticleType;

public interface ArticleDAO extends BaseDAO<String, Article>
{
	public List<Article> articlePager(int pageNumber,int pageSize);
	public int articleCount();
	
	public List<Article> search(int pageNumber,int pageSize,Article article);
	public int searchcount(Article article);
	
	public List<Article> allsearch(int pageNumber,int pageSize,String searchText);
	public int allsearchcount(String searchText);
	
	public void active(String id);
	public void inactive(String id);
	
	public List<ArticleType> findAtcTypeList();
	public List<Article> builds(int first,int last);
	public int buildsCount();
}
