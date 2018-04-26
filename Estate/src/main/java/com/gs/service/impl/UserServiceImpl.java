package com.gs.service.impl;

import java.util.List;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.dao.UserDAO;
import com.gs.pojo.User;
import com.gs.service.UserService;

public class UserServiceImpl implements UserService{

	private UserDAO userDAO;
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public User queryById(String id) {
		return userDAO.queryById(id);
	}


	@Override
	public void update(User t) {
		userDAO.update(t);
	}

	@Override
	public void add(User t) {
		userDAO.add(t);
	}

	@Override
	public User login(User t) {
		return userDAO.login(t);
	}

	@Override
	public void updataPwd(User t) {
		userDAO.updataPwd(t);
		
	}

	@Override
	public void delete(User t) {
		userDAO.delete(t);
	}


	@Override
	public List<User> list(int pageSize, int pageNumber, String id) {
		return userDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public List<User> querylist(String id) {
		return userDAO.querylist(id);
	}

	@Override
	public int count(String id) {
		return userDAO.count(id);
	}

	@Override
	public User queryforcheck(String phone,String email) {
		return userDAO.queryforcheck(phone, email);
	}

	@Override
	public List<User> userpager(int pageSize, int pageNumber) {
		// TODO Auto-generated method stub
		return userDAO.userpager(pageSize, pageNumber);
	}

	@Override
	public int usercount() {
		// TODO Auto-generated method stub
		return userDAO.usercount();
	}

	@Override
	public void active(String id) {
		userDAO.active(id);
	}

	@Override
	public void inactive(String id) {
		userDAO.inactive(id);
	}

	@Override
	public List<User> search(int pageNumber, int pageSize, User user) {
		// TODO Auto-generated method stub
		return userDAO.search(pageNumber, pageSize, user);
	}

	@Override
	public int searchcount(User user) {
		// TODO Auto-generated method stub
		return userDAO.searchcount(user);
	}

	@Override
	public List<User> allsearch(int pageNumber, int pageSize, String searchText) {
		// TODO Auto-generated method stub
		return userDAO.allsearch(pageNumber, pageSize, searchText);
	}

	@Override
	public int allsearchcount(String searchText) {
		// TODO Auto-generated method stub
		return userDAO.allsearchcount(searchText);
	}



}
