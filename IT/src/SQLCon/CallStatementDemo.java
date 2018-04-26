package SQLCon;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;

public class CallStatementDemo {
	public static void main(String[] args) {
		CallStatementDemo mp = new CallStatementDemo();
		mp.execute2();
	}
	/**
	 * 执行不带参数的存储过程
	 */
	public void execute1() {
		Connection conn = null;
		try {
			conn = OracleConnection.open();
			//执行存储过程
			String sql = "{call PRO_HELLO}";
			CallableStatement cs = conn.prepareCall(sql);
			cs.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	/**
	 * 执行带IN, OUT参数的存储过程
	 */
	public void execute2() {
		Connection conn = null;
		try {
			conn = OracleConnection.open();;
			//执行存储过程
			String sql = "{call p_score(?,?)}";
			CallableStatement cs = conn.prepareCall(sql);
			cs.setString(1, "s001");
			cs.registerOutParameter(2, Types.INTEGER);
			cs.executeUpdate();
			int score = cs.getInt(2);
			System.out.println("总分："+score);
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	/**
	 * 执行带IN OUT的存储过程
	 */
	public void execute3() {
		Connection conn = null;
		try {
			conn = OracleConnection.open();;
			String sql = "{call PRO_EMP2(?, ?, ?)}";
			CallableStatement cs = conn.prepareCall(sql);
			cs.setLong(1, 7499);
			cs.registerOutParameter(2, Types.VARCHAR);
			//第三个参数为IN OUT类型 
			cs.registerOutParameter(3, Types.VARCHAR);
			cs.setString(3, "经理");
			cs.executeUpdate();
			String name = cs.getString(2);
			String job = cs.getString(3);
			System.out.println(name + " : "+ job);
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
}
