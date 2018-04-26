package com.gs.dao;

import java.util.List;

import com.gs.common.bean.Pager4EasyUI;
import com.gs.pojo.Buildings;

public interface BaseDAO<PK, T> {
	//根据id查询bean
	public T queryById(PK id);
	//根据id查询List(没有分页的查询)
	public List<T> querylist(PK id);
	//分页
	public List<T> list(int pageSize,int pageNumber,PK id);
	//修改
	public void update(T t);
	//新增
	public void add(T t);
	//删除
	public void delete(T t);
	//获取数量
	public int count(PK id);

}
