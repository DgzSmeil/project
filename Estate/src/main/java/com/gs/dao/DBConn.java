package com.gs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public abstract class DBConn {
protected Connection conn;
	
	public void getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.0.144:3306/estate?useUnicode=true&amp;characterEncoding=utf-8&useSSL=false","root","123456");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(){
		try {
			if(conn!=null && !conn.isClosed()){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}	

