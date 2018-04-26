package com.gs.service;

import java.util.List;

import com.gs.pojo.User;

public interface UserService extends BaseService<String, User>{
	public  User login( User t);
	public void updataPwd(User t) ;
	public User queryforcheck(String phone,String email);
	
	//manager start
	public List<User> userpager(int pageSize,int pageNumber);
	public int usercount();
	public void active(String id);
	public void inactive(String id);
	public List<User> search(int pageNumber,int pageSize,User user);
	public int searchcount(User user);
	public List<User> allsearch(int pageNumber,int pageSize,String searchText);
	public int allsearchcount(String searchText);
	//manager end
}
