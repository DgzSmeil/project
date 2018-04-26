package com.gs.service.impl;

import java.util.List;

import com.gs.dao.ArticleTypeDAO;
import com.gs.pojo.ArticleType;
import com.gs.service.ArticleTypeService;

public class ArticleTypeServiceImpl implements ArticleTypeService
{
	private ArticleTypeDAO articleTypeDAO;
	public void setArticleTypeDAO(ArticleTypeDAO articleTypeDAO) {
		this.articleTypeDAO = articleTypeDAO;
	}

	@Override
	public ArticleType queryById(String id) {
		// TODO Auto-generated method stub
		return articleTypeDAO.queryById(id);
	}

	@Override
	public List<ArticleType> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ArticleType> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(ArticleType t) {
	
		articleTypeDAO.update(t);
	}

	@Override
	public void add(ArticleType t) {
		// TODO Auto-generated method stub
		articleTypeDAO.add(t);
	}

	@Override
	public void delete(ArticleType t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ArticleType> articleTypePager(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return articleTypeDAO.articleTypePager(pageNumber, pageSize);
	}

	@Override
	public int articleTypeCount() {
		// TODO Auto-generated method stub
		return articleTypeDAO.articleTypeCount();
	}

	@Override
	public void active(String id) {
		articleTypeDAO.active(id);
	}

	@Override
	public void inactive(String id) {
		articleTypeDAO.inactive(id);
	}

	@Override
	public List<ArticleType> allsearch(int pageNumber, int pageSize, String searchText) {
		// TODO Auto-generated method stub
		return articleTypeDAO.allsearch(pageNumber, pageSize, searchText);
	}

	@Override
	public int allsearchcount(String searchText) {
		// TODO Auto-generated method stub
		return articleTypeDAO.allsearchcount(searchText);
	}

	@Override
	public List<ArticleType> search(int pageNumber, int pageSize, ArticleType articletype) {
		// TODO Auto-generated method stub
		return articleTypeDAO.search(pageNumber, pageSize, articletype);
	}

	@Override
	public int searchcount(ArticleType articletype) {
		// TODO Auto-generated method stub
		return articleTypeDAO.searchcount(articletype);
	}

}
