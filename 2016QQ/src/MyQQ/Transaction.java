package MyQQ;

import java.sql.Connection;
import java.sql.SQLException;

public class Transaction {

	public static void main(String[] args) {
		Connection connection = DAODBdome.DBdome();
		try {
			connection.setAutoCommit(false);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		try {
			connection.commit();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			connection.rollback();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
 }
}
