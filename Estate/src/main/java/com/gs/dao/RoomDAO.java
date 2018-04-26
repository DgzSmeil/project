package com.gs.dao;

import java.util.List;

import com.gs.pojo.Building;
import com.gs.pojo.House;
import com.gs.pojo.Room;

public interface RoomDAO extends BaseDAO<String, Room>{

	
	public List<Room> search(int pageNumber,int pageSize,String searchText,String agency_id);
	public int searchcount(String searchText,String agency_id);
	
	public List<Room> searchA(int pageNumber,int pageSize,String searchText,String buildings_id);
	public int searchcountA(String searchText,String buildings_id);
	
	public List<House> findHouse(String agency_id);
	public Building findBuild(String building_id);
	
	public int findcount(String agency_id, String building_id, String house_id);
	public List<Room>findRoom(String id, int pageSize, int pageNumber, String building_id, String house_id);
	public List<Building> findBuilding(String agency_id);
	public void updatestatus(String id, String status);
	
	public List<Room> queryByRoom(int pageSize,int pageNumber,String buildings_id);
	public int querycount(String buildings_id);
	public void updatesale_status(String id,String sale_status);
	
	public List<Room> query(String buildings_id);
}
