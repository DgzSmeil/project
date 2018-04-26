package com.gs.dao;


import com.gs.pojo.Like;

public interface LikeDAO extends BaseDAO<String , Like>{

	public Like likeCount(String phone,String email);//查看是否有记录
	public String queryStatus(String id);//查看状态
	public void updatestatus(String status,String id);//判断状态
}
