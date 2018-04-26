package MyQQ;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAODBdome {

	private static String driver ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url="jdbc:sqlserver://192.168.3.17\\:1433;databasename=MyQQ";
	private static String username="sa";
	private static String password="123456";
	private static Connection conn = null;
	static{
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,username,password);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static Connection DBdome() {
		
		//1.注册一个驱动
		try {
			if(conn.isClosed()){
			conn = DriverManager.getConnection(url,username,password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//2.连接数据库
		return conn;
	}
	
}
