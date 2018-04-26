package com.gs.service.impl;

import java.util.List;

import com.gs.dao.RoomDAO;
import com.gs.pojo.Building;
import com.gs.pojo.House;
import com.gs.pojo.Room;
import com.gs.service.RoomService;

public class RoomServiceImpl implements RoomService{
	private RoomDAO roomDAO;
	public void setRoomDAO(RoomDAO roomDAO) {
		this.roomDAO = roomDAO;
	}
	@Override
	public Room queryById(String id) {
		return roomDAO.queryById(id);
	}

	@Override
	public List<Room> querylist(String id) {
		return roomDAO.querylist(id);
	}

	@Override
	public List<Room> list(int pageSize, int pageNumber, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Room t) {
		roomDAO.update(t);
	}

	@Override
	public void add(Room t) {
		roomDAO.add(t);
	}

	@Override
	public void delete(Room t) {
		
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<House> findHouse(String agency_id) {
		return roomDAO.findHouse(agency_id);
	}

	@Override
	public List<Building> findBuilding(String agency_id) {
		return roomDAO.findBuilding(agency_id);
	}

	@Override
	public void updatestatus(String id, String status) {
		roomDAO.updatestatus(id, status);
	}

	@Override
	public List<Room> findRoom(String id, int pageSize, int pageNumber, String building_id, String house_id) {
		return roomDAO.findRoom(id, pageSize, pageNumber, building_id, house_id);
	}

	@Override
	public int findcount(String agency_id, String building_id, String house_id) {
		return roomDAO.findcount(agency_id, building_id, house_id);
	}

	@Override
	public List<Room> search(int pageNumber, int pageSize, String searchText, String agency_id) {
		return roomDAO.search(pageNumber, pageSize, searchText, agency_id);
	}



	@Override
	public int searchcount(String searchText, String agency_id) {
		return roomDAO.searchcount(searchText, agency_id);
	}
	@Override
	public Building findBuild(String building_id) {
		return roomDAO.findBuild(building_id);
	}
	@Override
	public List<Room> queryByRoom(int pageSize, int pageNumber, String buildings_id) {
		return roomDAO.queryByRoom(pageSize, pageNumber, buildings_id);
	}
	@Override
	public int querycount(String buildings_id) {
		return roomDAO.querycount(buildings_id);
	}
	@Override
	public List<Room> searchA(int pageNumber, int pageSize, String searchText, String buildings_id) {
		return roomDAO.searchA(pageNumber, pageSize, searchText, buildings_id);
	}
	@Override
	public int searchcountA(String searchText, String buildings_id) {
		return roomDAO.searchcountA(searchText, buildings_id);
	}
	@Override
	public void updatesale_status(String id, String sale_status) {
		roomDAO.updatesale_status(id, sale_status);
	}
	@Override
	public List<Room> query(String buildings_id) {
		return roomDAO.query(buildings_id);
	}


}
