package MyQQ;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Dooo {

	public static void main(String[] args) {
		Connection connection = DAODBdome.DBdome();
		try {
			Statement st = connection.createStatement();
			for (int i = 0; i <100; i++) {
				String sql = "insert into course select courseid,coursename from course";
				System.out.println(sql);
					st.executeUpdate(sql);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
