package com.gs.service.impl;

import java.util.List;

import com.gs.dao.MessageDAO;
import com.gs.pojo.Activity;
import com.gs.pojo.Message;
import com.gs.service.MessageService;

public class MessageServiceImpl implements MessageService{
	
	private MessageDAO messageDAO;
	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}

	@Override
	public Message queryById(String id) {
		return messageDAO.queryById(id);
	}

	@Override
	public List<Message> querylist(String id) {
		return messageDAO.querylist(id);
	}

	@Override
	public List<Message> list(int pageSize, int pageNumber, String id) {
		return messageDAO.list(pageSize, pageNumber, id);
	}

	@Override
	public void update(Message t) {
		messageDAO.update(t);
	}

	@Override
	public void add(Message t) {
		messageDAO.add(t);
	}

	@Override
	public void delete(Message t) {
		messageDAO.delete(t);
	}

	@Override
	public int count(String id) {
		return messageDAO.count(id);
	}

	@Override
	public void updateStatus(String id, String status) {
		messageDAO.updateStatus(id, status);
	}

	@Override
	public List<Message> list(int pageSize, int pageNumber, String agency_id, String buildings_id) {
		return messageDAO.list(pageSize, pageNumber, agency_id, buildings_id);
	}

	@Override
	public int count(String agency_id, String buildings_id) {
		return messageDAO.count(agency_id, buildings_id);
	}

	@Override
	public List<Message> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return messageDAO.search(pageNumber, pageSize, searchText, agency_id);
	}

	@Override
	public int searchcount(String searchText, String agency_id) {
		return messageDAO.searchcount(searchText, agency_id);
	}

	@Override
	public List<Message> search(int pageNumber, int pageSize, String searchText, String agency_id,
			String buildings_id) {
		return messageDAO.search(pageNumber, pageSize, searchText, agency_id, buildings_id);
	}

	@Override
	public int searchcount(String searchText, String agency_id, String buildings_id) {
		return messageDAO.searchcount(searchText, agency_id, buildings_id);
	}

	@Override
	public List<Message> listByUser_id(int pageSize, int pageNumber, String user_id) {
		return messageDAO.listByUser_id(pageSize, pageNumber, user_id);
	}

	@Override
	public int countByUser_id(String user_id) {
		return messageDAO.countByUser_id(user_id);
	}

	@Override
	public Message queryId(String buildings_id, String user_id) {
		return messageDAO.queryId(buildings_id, user_id);
	}

}
