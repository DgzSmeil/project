package MyQQ;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.Vector;

import javax.swing.JOptionPane;


public class BaseQQ {

	public int getQQcode(){
		boolean bExist=false;
		Connection conn = DAODBdome.DBdome();
		String sql = "select qqcode from Account where qqcode=?";
		int qqcode=0;
		try {
			PreparedStatement psm = conn.prepareStatement(sql);
			while(!bExist){
				Random ran = new Random();
				qqcode = ran.nextInt(8999)+1000;
				psm.setInt(1, qqcode);
				ResultSet rs = psm.executeQuery();
				if(!rs.next()){
					bExist=true;
					break;
				}
			}
			psm.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return qqcode;
	}
	public static int getport(){
		boolean bExist=false;
		Connection conn = DAODBdome.DBdome();
		String sql = "select port from Account where onlinestatus<>? and  port=?";
		int port=0;
		try {
			PreparedStatement psm = conn.prepareStatement(sql);
			while(!bExist){
				Random ran = new Random();
				port = ran.nextInt(64000)+1024;
				psm.setString(1, Cmd.STATUS[1]);
			    psm.setInt(2, port);
				ResultSet rs = psm.executeQuery();
				if(!rs.next()){
					bExist=true;
					break;
				};
			}
			psm.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return port;
		
	}
	public Account saveAccount(Account acc){
		int qqcode=getQQcode();
		acc.setQqCode(qqcode);
		acc.setPort(0);
		acc.setOnlinestatus(Cmd.STATUS[1]);
		String sql ="insert into account values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = DAODBdome.DBdome();
        try {
        	int i=1;
    		PreparedStatement psm = conn.prepareStatement(sql);
            psm.setInt(i++, acc.getQqCode());
            psm.setString(i++, acc.getNickName());
            psm.setString(i++, acc.getHeadimg());
            psm.setString(i++, acc.getQqPassword());
            psm.setInt(i++, acc.getAge());
            psm.setString(i++, acc.getSex());
            psm.setString(i++, acc.getStar());
            psm.setString(i++, acc.getBlood());
            psm.setString(i++, acc.getNation());
            psm.setString(i++, acc.getHobit());
            psm.setString(i++, acc.getIpAddr());
            psm.setInt(i++, acc.getPort());
            psm.setString(i++, acc.getOnlinestatus());
            psm.setString(i++, acc.getRemark());
            i=psm.executeUpdate();
            psm.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		return acc;
		
	}
	//保存用户修改信息
	public Account UpdatAccount(Account acc){
		String sql ="update account set nickName=?,headImg=?,age=?,sex=?,star=?,blood=?,nation=?,hobit=?,remark=? where qqCode=?";
        Connection conn = DAODBdome.DBdome();
        try {
        	int i=1;
    		PreparedStatement psm = conn.prepareStatement(sql);
            psm.setString(i++, acc.getNickName());
            psm.setString(i++, acc.getHeadimg());
            psm.setInt(i++, acc.getAge());
            psm.setString(i++, acc.getSex());
            psm.setString(i++, acc.getStar());
            psm.setString(i++, acc.getBlood());
            psm.setString(i++, acc.getNation());
            psm.setString(i++, acc.getHobit());
            psm.setString(i++, acc.getRemark());
            psm.setInt(i++, acc.getQqCode());
            i=psm.executeUpdate();
            psm.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		return acc;
		
	}
	public Account lonin(Account account){
		Connection conn = DAODBdome.DBdome();
		String sql = "select * from Account where qqCode=? and qqPassword=?";
		int qqCode = 0;
		try{
			int port =getport();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, account.getQqCode());
			pstmt.setString(2, account.getQqPassword());
		    ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				account.setNickName(rs.getString("nickName").trim());
				account.setHeadimg(rs.getString("Headimg").trim());
				account.setAge(rs.getInt("age"));
				account.setSex(rs.getString("sex").trim());
				account.setStar(rs.getString("star").trim());
				account.setBlood(rs.getString("blood").trim());
				account.setNation(rs.getString("nation").trim());
				account.setHobit(rs.getString("hobit").trim());
				InetAddress addr = null;
				try {
					addr=InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				String ip = addr.getHostAddress();
				account.setIpAddr(ip);
				account.setPort(port);
				account.setOnlinestatus(Cmd.STATUS[0]);//在线
				account.setRemark(rs.getString("remark"));
				sql = "update Account set ipaddr='"+ip+"' ,port="+port +",onlinestatus='" + Cmd.STATUS[0] + "' where qqCode="+account.getQqCode();
				Statement stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				pstmt.close();
				stmt.close();
			}else{
				account=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return account;
		
	}
	public static Vector<Account> getmyfriend(int myQQcode){
		String sql = "select a.*,f.groupName from account a inner join Friends f on a.qqcode=f.friendQQcode where myqqcode=?";
		int qqcode = 0;
		Vector<Account> vmyFriend = new Vector<Account>(); 
		Connection conn = DAODBdome.DBdome();
		try{
			int port =getport();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, myQQcode);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Account account = new Account();
				account.setQqCode(rs.getInt("qqCode"));
				account.setNickName(rs.getString("nickName").trim());
				account.setHeadimg(rs.getString("headimg").trim());
				account.setAge(rs.getInt("age"));
				account.setSex(rs.getString("sex").trim());
				account.setStar(rs.getString("star").trim());
				account.setBlood(rs.getString("blood").trim());
				account.setNation(rs.getString("nation").trim());
				account.setHobit(rs.getString("hobit").trim());
				account.setIpAddr(rs.getString("ipAddr"));
				account.setPort(rs.getInt("port"));
				account.setOnlinestatus(rs.getString("onlinestatus"));//在线
				account.setRemark(rs.getString("remark"));
				account.setGropName(rs.getString("groupName"));
				vmyFriend.add(account);
			}
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return vmyFriend;
	}
	public static void moveGroup(int myQQcode,int friendQQcode,String groupName){
		String sql ="update friends set groupname=? where myQQcode=? and friendQQcode=?";
		try{
			Connection conn =DAODBdome.DBdome();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int i=1;
			pstmt.setString(i++, groupName);
			pstmt.setInt(i++, myQQcode);
			pstmt.setInt(i++, friendQQcode);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public Vector<Vector> findFriend(final String sql){
		Vector<Vector> vData = new Vector<Vector>();
		Connection conn =DAODBdome.DBdome();
		try{
			int port =getport();
			Statement pstmt = conn.createStatement();
			ResultSet rs = pstmt.executeQuery(sql);
			while(rs.next()){
				Vector rowData = new Vector();
				rowData.addElement(rs.getString("headimg").trim());
				rowData.addElement(rs.getInt("qqCode"));
				rowData.addElement(rs.getString("nickName").trim());
				rowData.addElement(rs.getInt("age"));
				rowData.addElement(rs.getString("sex").trim());
				rowData.addElement(rs.getString("blood").trim());
				rowData.addElement(rs.getString("star").trim());
				rowData.addElement(rs.getString("nation").trim());
				rowData.addElement(rs.getString("hobit").trim());
				rowData.addElement(rs.getString("onlinestatus").trim());
				rowData.addElement(rs.getString("remark"));
				vData.addElement(rowData);
			}
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return vData;
	}
	public Account getSelectedFriend(int myQQcode){
		String sql = "select * from account where qqcode=?";
		int qqcode = 0;
		Account account = new Account(); 
		Connection conn =DAODBdome.DBdome();
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, myQQcode);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				account.setQqCode(rs.getInt("qqCode"));
				account.setNickName(rs.getString("nickName").trim());
				account.setHeadimg(rs.getString("headImg").trim());
				account.setAge(rs.getInt("age"));
				account.setSex(rs.getString("sex").trim());
				account.setStar(rs.getString("star").trim());
				account.setBlood(rs.getString("blood").trim());
				account.setNation(rs.getString("nation").trim());
				account.setHobit(rs.getString("hobit").trim());
				account.setIpAddr(rs.getString("ipAddr"));
				account.setPort(rs.getInt("port"));
				account.setOnlinestatus(rs.getString("onlinestatus"));//在线
				account.setRemark(rs.getString("remark"));
			}
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return account;
	}
	public boolean isFriend(int myQQcode,int friendqqcode){
		String sql = "select * from friends where myqqcode=? and friendqqcode=?";
		boolean isok=false;
		Account account = new Account(); 
		Connection conn =DAODBdome.DBdome();
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, myQQcode);
			pstmt.setInt(2, friendqqcode);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				isok=true;
			}
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return isok;
	}
	public void addFriend(int myqqcode,int friendqqcode){
		try{
			Connection conn =DAODBdome.DBdome();
			String sql ="insert into friends values(?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, myqqcode);
			pstmt.setInt(2, friendqqcode);
			pstmt.setString(3, Cmd.GROUPNAME[1]);
			pstmt.executeUpdate();
			pstmt.setInt(1, friendqqcode);
			pstmt.setInt(2, myqqcode);
			pstmt.setString(3, Cmd.GROUPNAME[1]);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void changeStatus(int qqcode,String status){
		String sql ="update account set onlinestatus=? where qqCode=?";
		Connection conn =DAODBdome.DBdome();
		try{
			int i=1;
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(i++, status);
			pstmt.setInt(i++, qqcode);
			i=pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//删除好友
	public void delFriend(int myqqcode,int friendqqcode){
		try{
			Connection conn =DAODBdome.DBdome();
			String sql ="delete friends where myqqcode=? and friendqqcode=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, myqqcode);
			pstmt.setInt(2, friendqqcode);
			pstmt.executeUpdate();
			pstmt.setInt(1, friendqqcode);
			pstmt.setInt(2, myqqcode);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//发送离线消息
	public static Account Onefriend(int QQcode){
		String sql = "select a.*,f.groupName from account a inner join Friends f on a.qqcode=f.friendQQcode where qqcode=?";
		Account acc = new Account(); 
		Connection conn = DAODBdome.DBdome();
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, QQcode);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				
				acc.setQqCode(rs.getInt("qqCode"));
				acc.setNickName(rs.getString("nickName").trim());
				acc.setHeadimg(rs.getString("headimg").trim());
				acc.setAge(rs.getInt("age"));
				acc.setSex(rs.getString("sex").trim());
				acc.setStar(rs.getString("star").trim());
				acc.setBlood(rs.getString("blood").trim());
				acc.setNation(rs.getString("nation").trim());
				acc.setHobit(rs.getString("hobit").trim());
				acc.setIpAddr(rs.getString("ipAddr"));
				acc.setPort(rs.getInt("port"));
				acc.setOnlinestatus(rs.getString("onlinestatus"));//在线
				acc.setRemark(rs.getString("remark"));
				acc.setGropName(rs.getString("groupName"));
				
			}
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return acc;
	}
	
	public void StatuFriend(int myqqcode,int friendqqcode,int cmd,String ffige){
		try{
			Connection conn =DAODBdome.DBdome();
			String sql ="insert into offlinemsg values(?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, myqqcode);
			pstmt.setInt(2, friendqqcode);
			pstmt.setInt(3, cmd);
			pstmt.setString(4, ffige);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static Vector readfriend(int friendqqcode){
		String sql ="select*from offlinemsg where friendqqcode=?";
		Vector acc2 = new Vector(); 
		Connection conn = DAODBdome.DBdome();
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, friendqqcode);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
			    acc2.add(rs.getInt("myQQcode"));
				acc2.add(rs.getInt("friendqqcode"));
				acc2.add(rs.getInt("cmd"));
				acc2.add(rs.getString("msg"));
			}
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return acc2;
	}
	public void deloffmsg(int qqcode){
		String sql="delete from offlinemsg where friendqqcode="+qqcode;
		Connection conn = DAODBdome.DBdome();
		try {
			Statement sta=conn.createStatement();
			sta.executeUpdate(sql);
			sta.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
