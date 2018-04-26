package com.gs.dao;

import java.util.List;

import com.gs.pojo.Agency;
import com.gs.pojo.Manager;
import com.gs.pojo.User;

public interface UserDAO extends BaseDAO<String, User>{
	
	public User login(User t);
	
	public void updataPwd(User t) ;
	
	public User queryforcheck(String phone,String email);
	
	//manager started
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
