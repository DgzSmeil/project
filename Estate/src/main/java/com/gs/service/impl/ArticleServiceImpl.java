package com.gs.service.impl;

import java.util.List;

import com.gs.dao.ArticleDAO;
import com.gs.pojo.Article;
import com.gs.pojo.ArticleType;
import com.gs.service.ArticleService;

public class ArticleServiceImpl implements ArticleService
{
	private ArticleDAO articleDAO;
	public void setArticleDAO(ArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}

	@Override
	public Article queryById(String id) {
		return articleDAO.queryById(id);
	}

	@Override
	public List<Article> querylist(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Article> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Article t) {
		articleDAO.update(t);
	}

	@Override
	public void add(Article t) {
		articleDAO.add(t);
	}

	@Override
	public void delete(Article t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Article> articlePager(int pageNumber, int pageSize) {
		return articleDAO.articlePager(pageNumber, pageSize);
	}

	@Override
	public int articleCount() {
		return articleDAO.articleCount();
	}

	@Override
	public List<Article> allsearch(int pageNumber, int pageSize, String searchText) {
		return articleDAO.allsearch(pageNumber, pageSize, searchText);
	}

	@Override
	public int allsearchcount(String searchText) {
		return articleDAO.articleCount();
	}

	@Override
	public List<Article> search(int pageNumber, int pageSize, Article article) {
		return articleDAO.search(pageNumber, pageSize, article);
	}

	@Override
	public int searchcount(Article article) {
		return articleDAO.searchcount(article);
	}

	@Override
	public void active(String id) {
		articleDAO.active(id);
	}

	@Override
	public void inactive(String id) {
		articleDAO.inactive(id);
	}

	@Override
	public List<ArticleType> findAtcTypeList() {
		return articleDAO.findAtcTypeList();
	}

	@Override
	public List<Article> builds(int first, int last) {
		return articleDAO.builds(first, last);
	}

	@Override
	public int buildsCount() {
		return articleDAO.buildsCount();
	}

}
