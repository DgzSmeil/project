package com.gs.service;

import java.util.List;

import com.gs.common.bean.Pager4EasyUI;

public interface BaseService<PK, T> {

	//根据id查询bean
			public T queryById(PK id);
			//根据id查询List
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
