package com.gs.dao;

import java.util.List;

import com.gs.pojo.BuildingsImg;

public interface Buildings_imgDAO extends BaseDAO<String, BuildingsImg>{
	public List<BuildingsImg> search(int pageNumber, int pageSize, String searchText,String id);
	public int searchcount(String searchText,String id);
	public List<BuildingsImg> builds(int first,int last,String buildings_id);
}
