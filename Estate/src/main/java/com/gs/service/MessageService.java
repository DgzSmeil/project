package com.gs.service;

import java.util.List;

import com.gs.dao.BaseDAO;
import com.gs.pojo.Message;

public interface MessageService extends BaseDAO<String, Message>{
	public void updateStatus(String id,String status);
	//分页
	public List<Message> list(int pageSize,int pageNumber,String agency_id,String buildings_id);
	//获取数量
	public int count(String agency_id,String buildings_id);
	public List<Message> search(int pageNumber,int pageSize,String searchText,String agency_id);
	public int searchcount(String searchText,String agency_id);
	public List<Message> search(int pageNumber,int pageSize,String searchText,String agency_id,String buildings_id);
	public int searchcount(String searchText,String agency_id,String buildings_id);
	//前台分页
	public List<Message> listByUser_id(int pageSize,int pageNumber,String user_id);
	public int countByUser_id(String user_id);
	public Message queryId(String buildings_id,String user_id);
}
