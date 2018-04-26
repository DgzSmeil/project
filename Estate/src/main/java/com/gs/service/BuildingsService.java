package com.gs.service;

import java.util.List;

import com.gs.pojo.Buildings;
import com.gs.pojo.Comment;

public interface BuildingsService extends BaseService<String, Buildings>{
	public List<Buildings> list(String id);
	public void updateStatus(String id,String status);
	public List<Buildings> search(int pageNumber,int pageSize,String searchText,String id);
	public int searchcount(String searchText,String id);
	public List<Buildings> dituList(String agency_id);
	//manager start
	public List<Buildings> buildpager(int pageSize,int pageNumber);
	public int buildcount();
	public List<Buildings> search(int pageNumber,int pageSize,Buildings buildings);
	public int searchcount(Buildings buildings);
	public List<Buildings> allsearch(int pageNumber,int pageSize,String searchText);
	public int allsearchcount(String searchText);
	//manger end
	//查找最近注册的楼盘
	public List<Buildings> builds(int first,int last);
	//排序查看楼盘
	public List<Buildings> builds(int first, int last, String param);
	public List<Comment> findComment(String Buildings_id);
	public List<Buildings> findbuildings(int first,int last,String name);
	public int findbuildingscount(String name);
	//查看单个楼盘销售记录
		public List findSale(String buildings_id,String date );
}
