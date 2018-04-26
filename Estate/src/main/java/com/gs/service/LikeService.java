package com.gs.service;


import com.gs.pojo.Like;

public interface LikeService extends BaseService<String, Like>{
	
	public Like likeCount(String user_id,String buildings_id);
	public void updatestatus(String status,String id);//判断状态
	public String queryStatus(String id);//查看状态
}
