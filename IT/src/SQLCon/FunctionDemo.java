package SQLCon;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;

import com.sun.java.swing.plaf.windows.WindowsInternalFrameTitlePane.ScalableIconUIResource;

public class FunctionDemo {
	public static void main(String[] args) {
		FunctionDemo mp = new FunctionDemo();
		mp.execute1();
	}
	/**
	 * 执行不带参数的存储过程
	 */
	public void execute1() {
		Connection conn = null;
		try {
			conn = OracleConnection.open();
			//执行存储过程
			String sql = "{?=call hello(?)}";
			CallableStatement cs = conn.prepareCall(sql);
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, "s001");
			cs.execute();
			System.out.println(cs.getInt(1));
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	
}
