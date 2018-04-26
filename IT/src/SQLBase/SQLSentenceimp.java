package SQLBase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.regexp.internal.recompile;
import com.sun.xml.internal.bind.v2.model.core.ID;

import SQLBean.BankBean;
import SQLBean.BirthdayBean;
import SQLBean.CashRecordBean;
import SQLBean.Citybean;
import SQLBean.CourseBean;
import SQLBean.ExchangeCodeBean;
import SQLBean.ExchangeRecordBean;
import SQLBean.ForumBean;
import SQLBean.GreadBean;
import SQLBean.JifenBean;
import SQLBean.ManagerBean;
import SQLBean.MoneyBean;
import SQLBean.MoneyRecordBean;
import SQLBean.NewmsgBean;
import SQLBean.PayRecordBean;
import SQLBean.Provincebean;
import SQLBean.Refund;
import SQLBean.SectionBean;
import SQLBean.ShoppingcarBean;
import SQLBean.StudentBean;
import SQLBean.SysLogBean;
import SQLBean.TeacherBean;
import SQLBean.TeacherMoneyBean;
import SQLBean.UserCourseEvalBean;
import SQLBean.VIPBean;
import SQLCon.OracleConnection;

public class SQLSentenceimp implements SQLSentence{

	Connection con = OracleConnection.open();
	public void cityadd(Citybean citybean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into city values('cityid.nextval," + citybean.getCityname()
					+ "'," + citybean.getProvinceid() + ")";
			st.executeUpdate(sql);
			st.close();
		} catch (SQLException e) {
			System.out.println("城市的添加语句出错了！");
		}
	}

	public void citydel(int cityid) {
		Statement st;
		try {
			System.out.println("cityid=" + cityid);
			st = con.createStatement();
			st.executeUpdate("delete city where cityid=" + cityid);
			st.close();
		} catch (SQLException e) {
			System.out.println("SQL语句中的删除语句出错了！");
		}
	}

	public List<Citybean> citylist() {
		List<Citybean> list = new ArrayList<Citybean>();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select c.*,p.provinceName from city c inner join province p on c.provinceid=p.provinceid order by p.provinceid,c.cityid");
			while (rs.next()) {
				// 最关键的一步
				Citybean citybean = new Citybean();
				citybean.setCityid(rs.getInt("cityid"));
				citybean.setCityname(rs.getString("cityname"));
				citybean.setProvinceid(rs.getInt("provinceid"));
				citybean.setProvincename(rs.getString("provincename"));
				list.add(citybean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("sql语句的实现类中的sql查询语句出错！");
		}
		return list;
	}

	public void cityupdate(Citybean citybean) {
		try {
			Statement st = con.createStatement();
			String sql = "update city set cityName='" + citybean.getCityname()
					+ "',provinceid=" + citybean.getProvinceid()
					+ " where cityid=" + citybean.getCityid();
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (SQLException e) {
			System.out.println("城市的更新语句出错了！");
		}

	}


	public Citybean findcity(String cityid) {
		Citybean city = null;
		try {
			Statement st = con.createStatement();
			String sql = "select * from city where cityid="+ cityid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				city = new Citybean();
				city.setCityid(rs.getInt("cityid"));
				city.setCityname(rs.getString("cityname"));
				city.setProvinceid(rs.getInt("provinceid"));
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return city;

	}

	public List<Citybean> citylist(int pagebarsize, int startlocal) {
		List<Citybean> list = new ArrayList<Citybean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select  c.*,p.provinceName from city c inner join province p on c.provinceid=p.provinceid where cityid not in (select top "+startlocal+" cityid from city order by provinceid) order by p.provinceid ";
			String sql = "select * from (select rownum rn, c.*,p.provinceName from city c inner join province p on c.provinceid=p.provinceid  order by p.provinceid) where rn>="+(startlocal+1)+" and rn<="+(pagebarsize+startlocal);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				// 最关键的一步
				Citybean citybean = new Citybean();
				citybean.setCityid(rs.getInt("cityid"));
				citybean.setCityname(rs.getString("cityname"));
				citybean.setProvinceid(rs.getInt("provinceid"));
				citybean.setProvincename(rs.getString("provincename"));
				list.add(citybean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("分页查询城市语句出错！");
		}
		return list;
	}

	public int pagebarsum(String tablename) {
		int barsum=0;
		try {
			Statement st = con.createStatement();
			String sql ="select count(*) cnt from "+tablename;
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				barsum = rs.getInt(1);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.out.println("查询城市的记录总数出错！");
		}
		return barsum;
	}
	public  int listbarsum(String studentid) {
		int barsum=0;
		try {
			Statement st = con.createStatement();
			String sql ="select count(*) cnt from payrecord where studentid="+studentid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				barsum = rs.getInt(1);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.out.println("查询城市的记录总数出错！");
			e.printStackTrace();
		}
		return barsum;
	}
//省份的语句
	
	public void provinceadd(Provincebean provincebean) {
   		try {
   			Statement st = con.createStatement();
			st.executeUpdate("insert into province values(provinceid.nextval,'"+provincebean.getProvinceName()+"')");
			st.close();
   		} catch (SQLException e) {
			System.out.println("省份的添加语句出错了！");
		}
		
		
	}
	public void provincedel(int provinceid) {
   		Statement st;
		try {
			st = con.createStatement();
			st.executeUpdate("delete city where cityid="+provinceid+";"+"delete province where provinceid="+provinceid);
			st.close();
		} catch (SQLException e) {
			System.out.println("SQL语句中的删除语句出错了！");
		}
	}

	public List<Provincebean> provincelist() {
		List<Provincebean> list = new ArrayList<Provincebean>();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from province order by provinceid asc");
			while (rs.next()) {
				Provincebean provincebean = new Provincebean();
				provincebean.setProvinceid(rs.getInt("provinceid"));
				provincebean.setProvinceName(rs.getString("provinceName"));
				list.add(provincebean);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.out.println("查询城市语句出错！");
		}
		
		return list;
	}

	public void provinceupdate(Provincebean provincebean) {
  		
		try {
			Statement st = con.createStatement();
			String sql ="update province set provincename='"+provincebean.getProvinceName()+"' where provinceid="+provincebean.getProvinceid();
	  		st.executeUpdate(sql);
	  		st.close();
		} catch (SQLException e) {
			System.out.println("省份更新数据出错了！");
		}
  		
		
	}

	public List<Provincebean> provincelist(int pagesize, int startpage) {
		List<Provincebean> list = new ArrayList<Provincebean>();
		try {
			Statement st = con.createStatement();
//			String sql ="select top "+pagesize+"* from province where provinceid not in(select top "+startpage+" provinceid from province order by provinceid asc)order by provinceid asc"; 
			String sql = "select * from (select rownum rn,p.* from province p) where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Provincebean provincebean = new Provincebean();
				provincebean.setProvinceid(rs.getInt("provinceid"));
				provincebean.setProvinceName(rs.getString("provinceName"));
				list.add(provincebean);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.out.println("查询页面省份语句出错！");
			e.printStackTrace();
		}
		
		return list;
	}

	public List<Citybean> cityalllist(String provinceid) {
		List<Citybean> list = new ArrayList<Citybean>();
		try {
			Statement st = con.createStatement();
			String sql ="select *  from city where provinceid='"+provinceid+"'"; 
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Citybean citybean = new Citybean();
				citybean.setProvinceid(rs.getInt("provinceid"));
				citybean.setCityid(rs.getInt("cityid"));
				citybean.setCityname(rs.getString("cityname"));
				list.add(citybean);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	//教师语句
	
	public List<GreadBean> greadlist() {
		List<GreadBean> list = new ArrayList<GreadBean>();
		Statement st;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from gread");
			while (rs.next()) {
				GreadBean bean = new GreadBean();
				bean.setGreadid(rs.getInt("greadid"));
				bean.setGreadname(rs.getString("greadname"));
				bean.setGreadpercent(rs.getFloat("greadpercent"));
				list.add(bean);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.out.println("查询教师分类等级出错！");
		}
		return list;
	}

	public void greadadd(GreadBean bean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into gread values(greadid.nextval,'"+bean.getGreadname()+"',"+bean.getGreadpercent()+")";
			st.executeUpdate(sql);
			st.close();
		} catch (SQLException e) {
			System.out.println("添加教师分类语句出错！");
		}
	}
	public void greaddel(String greadid) {
		try {
			Statement st = con.createStatement();
			st.executeUpdate("delete gread where greadid="+greadid);
			st.close();
		} catch (SQLException e) {
			System.out.println("删除教师分类语句出错！");
		}
		
		
	}

	public void greadupdate(GreadBean bean) {
		try {
			Statement st = con.createStatement();
			String sql = "update gread set greadname='"+bean.getGreadname()+"',greadpercent="+bean.getGreadpercent()+" where greadid="+bean.getGreadid();
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (SQLException e) {
			System.out.println("更新教师分类语句出错！");
		}
		
		
	}

	public GreadBean bean(String greadname) {
		GreadBean bean = null;
		try {
			Statement st = con.createStatement();
			String sql ="select * from gread where greadid="+greadname;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				bean = new GreadBean();
				bean.setGreadid(rs.getInt("greadid"));
				bean.setGreadpercent(rs.getFloat("greadpercent"));
				bean.setGreadname(rs.getString("greadname"));
			}
			st.close();
		} catch (SQLException e) {
			System.out.println("教师分类单个查询语句出错！");
		}
		return bean;
	}

	public List<GreadBean> greadlist(int pagesize, int startpage) {
		List<GreadBean> list = new ArrayList<GreadBean>();
		try {
			Statement st = con.createStatement();
//			String sql ="select top "+pagesize+"* from gread where greadid not in(select top "+startpage+" greadid from gread order by greadid asc)order by greadid asc"; 
			String sql = "select * from (select rownum rn,g.* from gread g) where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize)+" order by greadid asc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				GreadBean greadbean = new GreadBean();
				greadbean.setGreadid(rs.getInt("greadid"));
				greadbean.setGreadname(rs.getString("greadname"));
				greadbean.setGreadpercent(rs.getFloat("greadpercent"));
				list.add(greadbean);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.out.println("查询页面教师分类语句出错！");
		}
		
		return list;
	}
	public void saveleibie (String leibie,String reason,String username,String managerid){
		try {
			Statement st = con.createStatement();
			String sql = "update manager set manager_leibie="+leibie+",reason='"+reason+"',changeusername='"+username+"' where manager_id="+managerid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("审核出现错误");
		}
		
	}
	public ManagerBean findmanger(String managerid) {
		ManagerBean bean = null;
		try {
			Statement st = con.createStatement();
			String sql = "select * from Manager where Manager_id="+managerid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				bean = new ManagerBean();
				bean.setManager_id(Integer.parseInt(rs.getString("manager_id")));
				bean.setManager_account(rs.getString("manager_account"));
				bean.setManager_name(rs.getString("manager_name"));
				bean.setManager_password(rs.getString("manager_password"));
				bean.setManager_sex(rs.getInt("manager_sex"));
				bean.setManager_contact(rs.getString("manager_contact"));
				bean.setManager_status(rs.getInt("manager_status"));
				bean.setManager_leibie(rs.getInt("manager_leibie"));
				bean.setReason(rs.getString("reason"));
				bean.setChangeusername(rs.getString("changeusername"));
			}
			st.close();
			rs.close();
		} catch (SQLException e) {
			System.out.println("管理员单个查询语句出错！");
		}
		return bean;
	}

	public void manageradd(ManagerBean bean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into Manager values(managerid.nextval,'"+bean.getManager_account()+"',";
			sql+="'"+bean.getManager_password()+"',";
			sql+="'"+bean.getManager_name()+"',";
			sql+="'"+bean.getManager_sex()+"',";
			sql+="'"+bean.getManager_contact()+"',";
			sql+="'"+bean.getManager_status()+"',";
			sql+="'"+bean.getManager_leibie()+"',";
			sql+="'"+bean.getReason()+"',";
			sql+="'"+bean.getChangeusername()+"',";
			sql+="'"+bean.getManagerurl()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (SQLException e) {
			System.out.println("添加管理员语句出错！");
		}
		
	}

	public void managerdel(String managerid) {
		try {
			Statement st = con.createStatement();
			st.executeUpdate("delete manager where manager_id="+managerid);
			st.close();
		} catch (SQLException e) {
			System.out.println("删除管理员语句出错！");
		}
		
	}

	public List<ManagerBean> managerlist() {
		List<ManagerBean> list = new ArrayList<ManagerBean>();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Manager order by Manager_id asc");
			while (rs.next()) {
				ManagerBean managerbean = new ManagerBean();
				managerbean.setManager_id(Integer.parseInt(rs.getString("Manager_id")));
				managerbean.setManager_account(rs.getString("manager_account"));
				managerbean.setManager_name(rs.getString("manager_name"));
				managerbean.setManager_password(rs.getString("manager_password"));
				managerbean.setManager_sex(rs.getInt("manager_sex"));
				managerbean.setManager_contact(rs.getString("manager_contact"));
				managerbean.setManager_status(rs.getInt("manager_status"));
				managerbean.setManager_leibie(rs.getInt("manager_leibie"));
				list.add(managerbean);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.out.println("查询管理员语句出错！");
		}
		return list;
	}
	public List<ManagerBean> managerlist(int pagesize, int startpage) {
		List<ManagerBean> list = new ArrayList<ManagerBean>();
		try {
			Statement st = con.createStatement();
//			String sql ="select top "+pagesize+"* from Manager where Manager_id not in(select top "+startpage+" Manager_id from Manager order by Manager_id asc)order by Manager_id asc"; 
			String sql = "select * from (select rownum rn ,m.* from Manager m) where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+" order by Manager_id asc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ManagerBean managerbean = new ManagerBean();
				managerbean.setManager_id(Integer.parseInt(rs.getString("Manager_id")));
				managerbean.setManager_account(rs.getString("manager_account"));
				managerbean.setManager_name(rs.getString("manager_name"));
				managerbean.setManager_password(rs.getString("manager_password"));
				managerbean.setManager_sex(rs.getInt("manager_sex"));
				managerbean.setManager_contact(rs.getString("manager_contact"));
				managerbean.setManager_status(rs.getInt("manager_status"));
				managerbean.setManager_leibie(rs.getInt("manager_leibie"));
				list.add(managerbean);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.out.println("管理员页面语句出错！");
		}
		
		return list;
	}

	public void managerupdate(ManagerBean bean) {
		try {
			Statement st = con.createStatement();
			String sql = "update manager set manager_account='"+bean.getManager_account()+"',manager_name='"+bean.getManager_name()+"',manager_sex="+bean.getManager_sex()+",manager_contact='"+bean.getManager_contact()+"' where manager_id="+bean.getManager_id();
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("更新管理员语句出错！");
		}
		
	}
	public void changeleibie (String managerid){
		try {
			Statement st = con.createStatement();
			String sql = "update manager set manager_leibie='2' where manager_id="+managerid;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println("更新管理员状态语句出错！");
		}
		
		
	}
	public void checkpwd(String managerid, String managerpassword ,String tablename,String id,String pwd) {
		try {
			Statement st = con.createStatement();
			String sql = "update "+tablename+" set ";
			sql+=id+"='"+managerpassword+"'";
			sql+=" where "+pwd+"='"+managerid+"'";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新密码出错！");
		}
	}

	public void checkstatus(String managerid, String managerstatus) {
		try {
			Statement st = con.createStatement();
			String sql = "update manager set ";
			sql+="Manager_status='"+managerstatus+"'";
			sql+=" where Manager_id="+managerid;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新状态出错！");
		}
	}

	public boolean oldpwd(String managerid) {
		boolean isok = false;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select manager_password from Manager where Manager_id="+managerid);
			if(rs.next()){
				isok=true;
			}
		} catch (SQLException e) {
			System.out.println("管理员密码查询出错！");
		}
		return isok;
	}
	
	
	public Provincebean findprovincename(String provinceid) {
		Provincebean province = null;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Province where Provinceid="
					+ provinceid);
			if (rs.next()) {
				province = new Provincebean();
				province.setProvinceid(rs.getInt("provinceid"));
				province.setProvinceName(rs.getString("provincename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return province;
	}

	public void studentadd(StudentBean studentbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into student values(";
			sql+="studentid.nextval,";
			sql+="'"+studentbean.getStudentmobile()+"',";
			sql+="'"+studentbean.getStudentpassword()+"',";
			sql+="'"+studentbean.getStudentname()+"',";
			sql+="'"+studentbean.getStudentsex()+"',";
			sql+="'"+studentbean.getStudenthomeaddress()+"',";
			sql+="'"+studentbean.getStudentemail()+"',";
			sql+="sysdate,";
			sql+="'"+studentbean.getProvinceid()+"',";
			sql+="'"+studentbean.getCityid()+"',";
			sql+="'"+studentbean.getLeibie()+"',";
			sql+="'"+studentbean.getStudentface()+"',";
			sql+="'"+studentbean.getVIP()+"'";
			sql+=")";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("学生新增出错！");
		}
		
	}
	public void checkteacher(String studentname,String status){
		try {
			Statement st = con.createStatement();
			String sql = "update student set leibie="+status+" where studentmobile='"+studentname+"'";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("审核教师做个出错！");
		}
		
	}
	public void studentdel(int studentid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete student where studentid="+studentid;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("删除学生出现错误！");
		}
		
	}

	public List<StudentBean> studentlist() {
		List<StudentBean> studentlist = new ArrayList<StudentBean>();
		try {
			Statement st =  con.createStatement();
			String sql ="select s.*,c.cityName,p.provincename from student s ,city c ,province p where s.cityid=c.cityid and s.provinceid = p.provinceid";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				StudentBean studentbean = new StudentBean();
				studentbean.setStudentid(rs.getInt("studentid"));
				studentbean.setStudentmobile(rs.getString("studentmobile"));
				studentbean.setStudentpassword(rs.getString("studentpassword"));
				studentbean.setStudentname(rs.getString("studentname"));
				studentbean.setStudentsex(rs.getInt("studentsex"));
				studentbean.setStudenthomeaddress(rs.getString("studenthomeaddress"));
				studentbean.setStudentemail(rs.getString("studentemail"));
				studentbean.setStudentregisterdate(rs.getString("studentregisterdate"));
				studentbean.setProvincename(rs.getString("provincename"));
				studentbean.setCityname(rs.getString("cityname"));
				studentbean.setLeibie(rs.getInt("leibie"));
				studentbean.setVIP(rs.getInt("VIP"));
				studentbean.setStudentface(rs.getString("studentface"));
				studentlist.add(studentbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询学生列表出错！");
		}
		return studentlist;
	}
	public List<StudentBean> studentbirthdaylist(int pagesize,int startpage,int leibie){
		List<StudentBean> studentlist = new ArrayList<StudentBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" s.*,c.cityName,p.provincename from student s ,city c ,province p where s.cityid=c.cityid and s.provinceid = p.provinceid and studentid not in (select top "+startpage+" studentid from student) and leibie=2";
			String sql = "select * from (select rownum rn,s.*,floor(MONTHS_BETWEEN(sysdate,to_date(s.STUDENTREGISTERDATE,'yyyy-mm-dd hh24:mi:ss'))) num,c.cityName,p.provincename from student s ,city c ,province p where s.cityid=c.cityid and s.provinceid = p.provinceid and leibie=1) where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				StudentBean studentbean = new StudentBean();
				studentbean.setStudentid(rs.getInt("studentid"));
				studentbean.setStudentmobile(rs.getString("studentmobile"));
				studentbean.setStudentpassword(rs.getString("studentpassword"));
				studentbean.setStudentname(rs.getString("studentname"));
				studentbean.setStudentsex(rs.getInt("studentsex"));
				studentbean.setStudenthomeaddress(rs.getString("studenthomeaddress"));
				studentbean.setStudentemail(rs.getString("studentemail"));
				studentbean.setStudentregisterdate(rs.getString("studentregisterdate"));
				studentbean.setProvincename(rs.getString("provincename"));
				studentbean.setCityname(rs.getString("cityname"));
				studentbean.setLeibie(rs.getInt("leibie"));
				studentbean.setVIP(rs.getInt("VIP"));
				studentbean.setNum(rs.getInt("num"));
				studentlist.add(studentbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询分页学生列表出错！");
		}
		return studentlist;
	}

	public List<TeacherBean> checkList(int pagesize,int startpage,String status){
		List<TeacherBean> teacherlist = new ArrayList<TeacherBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top ("+pagesize+") t.*,b.bankname,g.greadname from teacher t,bank b,gread g where t.bankid=b.bankid and t.gradeid=g.greadid and teacherid not in (select top ("+startpage+") teacherid  from teacher) and status="+status;
			String sql = "select * from (select rownum rn,t.*,b.bankname,g.greadname from teacher t,bank b,gread g where t.bankid=b.bankid and t.gradeid=g.greadid and status="+status+") where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				TeacherBean teacherbean = new TeacherBean();
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
				teacherbean.setStatus(rs.getInt("status"));
				teacherbean.setReason(rs.getString("reason"));
				teacherlist.add(teacherbean);
			}
		} catch (Exception e) {
			System.out.println("查找教师分类名称出错！");
		}
		return teacherlist;
	}
		
	public List<StudentBean> studentlist(int pagesize, int startpage,String leibie) {
		List<StudentBean> studentlist = new ArrayList<StudentBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" s.*,c.cityName,p.provincename from student s ,city c ,province p where s.cityid=c.cityid and s.provinceid = p.provinceid and studentid not in (select top "+startpage+" studentid from student) and leibie=2";
			String sql = "select * from (select rownum rn,s.*,c.cityName,p.provincename from student s ,city c ,province p where s.cityid=c.cityid and s.provinceid = p.provinceid and leibie=2 ) where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				StudentBean studentbean = new StudentBean();
				studentbean.setStudentid(rs.getInt("studentid"));
				studentbean.setStudentmobile(rs.getString("studentmobile"));
				studentbean.setStudentpassword(rs.getString("studentpassword"));
				studentbean.setStudentname(rs.getString("studentname"));
				studentbean.setStudentsex(rs.getInt("studentsex"));
				studentbean.setStudenthomeaddress(rs.getString("studenthomeaddress"));
				studentbean.setStudentemail(rs.getString("studentemail"));
				studentbean.setStudentregisterdate(rs.getString("studentregisterdate"));
				studentbean.setProvincename(rs.getString("provincename"));
				studentbean.setCityname(rs.getString("cityname"));
				studentbean.setLeibie(rs.getInt("leibie"));
				studentbean.setVIP(rs.getInt("VIP"));
				studentlist.add(studentbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询分页学生列表出错！");
		}
		return studentlist;
	}
	public List<StudentBean> studentlist(int pagesize, int startpage) {
		List<StudentBean> studentlist = new ArrayList<StudentBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" s.*,c.cityName,p.provincename from student s ,city c ,province p where s.cityid=c.cityid and s.provinceid = p.provinceid and studentid not in (select top "+startpage+" studentid from student) order by studentid desc";
			String sql = "select * from (select rownum rn,s.*,c.cityName,p.provincename from student s ,city c ,province p where s.cityid=c.cityid and s.provinceid = p.provinceid ) where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize)+" order by studentid desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				StudentBean studentbean = new StudentBean();
				studentbean.setStudentid(rs.getInt("studentid"));
				studentbean.setStudentmobile(rs.getString("studentmobile"));
				studentbean.setStudentpassword(rs.getString("studentpassword"));
				studentbean.setStudentname(rs.getString("studentname"));
				studentbean.setStudentsex(rs.getInt("studentsex"));
				studentbean.setStudenthomeaddress(rs.getString("studenthomeaddress"));
				studentbean.setStudentemail(rs.getString("studentemail"));
				studentbean.setStudentregisterdate(rs.getString("studentregisterdate"));
				studentbean.setProvincename(rs.getString("provincename"));
				studentbean.setCityname(rs.getString("cityname"));
				studentbean.setLeibie(rs.getInt("leibie"));
				studentbean.setVIP(rs.getInt("VIP"));
				studentlist.add(studentbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询分页学生列表出错！");
		}
		return studentlist;
	}
	public void studentupdate(StudentBean studentbean) {
		try {
			Statement st = con.createStatement();
			String sql = "update student set ";
			sql+="Studentmobile='"+studentbean.getStudentmobile()+"',";
			sql+="Studentname='"+studentbean.getStudentname()+"',";
			sql+="Studentsex='"+studentbean.getStudentsex()+"',";
			sql+="Studenthomeaddress='"+studentbean.getStudenthomeaddress()+"',";
			sql+="Studentemail='"+studentbean.getStudentemail()+"',";
			sql+="Provinceid='"+studentbean.getProvinceid()+"',";
			sql+="Cityid='"+studentbean.getCityid()+"'";
			sql+=" where studentid="+studentbean.getStudentid();
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("学生新增出错！");
		}
	}
	public int provinceid (String provincename){
		int provinceid=0;
		try {
			Statement st = con.createStatement();
			String sql ="select provinceid from province where provincename='"+provincename+"'";
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				provinceid = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("查找省份id出错！");
		}
		return provinceid;
		
	}
	public int cityid (String cityname){
		int cityid=0;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select cityid from city where cityname='"+cityname+"'");
			if(rs.next()){
				cityid = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("查找省份id出错！");
		}
		return cityid;
		
	}
	public String findstudentname(String studentid){
		String nameString=null;
		try {
			Statement st =  con.createStatement();
			String sql = "select studentname from student where studentid="+studentid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				nameString = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("查找学生姓名出错！");
		}
		return nameString;
	}
	public StudentBean findstudent(String studentname) {
		StudentBean studentbean = new StudentBean();
		try {
			Statement st =  con.createStatement();
			String sql ="select s.*,c.cityName,p.provincename from student s ,city c ,province p where studentname='"+studentname+"' and s.cityid=c.cityid and s.provinceid = p.provinceid ";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				studentbean.setStudentid(rs.getInt("studentid"));
				studentbean.setStudentmobile(rs.getString("studentmobile"));
				studentbean.setStudentpassword(rs.getString("studentpassword"));
				studentbean.setStudentname(rs.getString("studentname"));
				studentbean.setStudentsex(rs.getInt("studentsex"));
				studentbean.setStudenthomeaddress(rs.getString("studenthomeaddress"));
				studentbean.setStudentemail(rs.getString("studentemail"));
				studentbean.setStudentregisterdate(rs.getString("studentregisterdate"));
				studentbean.setProvincename(rs.getString("provincename"));
				studentbean.setCityname(rs.getString("cityname"));
				studentbean.setProvinceid(rs.getInt("provinceid"));
				studentbean.setCityid(rs.getInt("cityid"));
				studentbean.setStudentface(rs.getString("studentface"));
				studentbean.setLeibie(rs.getInt("leibie"));
				studentbean.setVIP(rs.getInt("VIP"));
			}
		} catch (Exception e) {
			System.out.println("查询学生列表出错！");
		}
		return studentbean;
	}
	public StudentBean findstudentinfo(String studentmobile) {
		StudentBean studentbean = new StudentBean();
		try {
			Statement st =  con.createStatement();
			String sql ="select s.*,c.cityName,p.provincename from student s ,city c ,province p where studentmobile='"+studentmobile+"' and s.cityid=c.cityid and s.provinceid = p.provinceid ";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				studentbean.setStudentid(rs.getInt("studentid"));
				studentbean.setStudentmobile(rs.getString("studentmobile"));
				studentbean.setStudentpassword(rs.getString("studentpassword"));
				studentbean.setStudentname(rs.getString("studentname"));
				studentbean.setStudentsex(rs.getInt("studentsex"));
				studentbean.setStudenthomeaddress(rs.getString("studenthomeaddress"));
				studentbean.setStudentemail(rs.getString("studentemail"));
				studentbean.setStudentregisterdate(rs.getString("studentregisterdate"));
				studentbean.setProvincename(rs.getString("provincename"));
				studentbean.setCityname(rs.getString("cityname"));
				studentbean.setProvinceid(rs.getInt("provinceid"));
				studentbean.setCityid(rs.getInt("cityid"));
				studentbean.setStudentface(rs.getString("studentface"));
				studentbean.setLeibie(rs.getInt("leibie"));
				studentbean.setVIP(rs.getInt("VIP"));
			}
		} catch (Exception e) {
			System.out.println("查询学生列表出错！");
		}
		return studentbean;
	}
	public List<BankBean> banklist() {
		List<BankBean> banklist = new ArrayList<BankBean>();
		try {
			Statement st =  con.createStatement();
			String sql ="select * from bank";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				BankBean bankbean = new BankBean();
				bankbean.setBank_id(rs.getInt(1));
				bankbean.setBank_name(rs.getString(2));
				banklist.add(bankbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询银行名称出错！");
		}
		return banklist;
	}

	public void activeadd(ExchangeRecordBean bean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into ExchangeRecord values(ExchangeRecordid.nextval,";
			sql+="'"+bean.getActivity_name()+"',";
			sql+="'"+bean.getActivity_desc()+"',";
			sql+="'"+bean.getActivity_username()+"',";
			sql+="sysdate";
			sql+=")";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("优惠券活动新增出错！");
		}
		
	}

	public void activeupdate(ExchangeRecordBean bean) {
		try {
			Statement st = con.createStatement();
			String sql = "update ExchangeRecord set ";
			sql+="Activity_name='"+bean.getActivity_name()+"',";
			sql+="Activity_desc='"+bean.getActivity_desc()+"',";
			sql+="Activity_username='"+bean.getActivity_username()+"',";
			sql+="Activity_date='"+bean.getActivity_date()+"'";
			sql+=" where activity_id="+bean.getActivity_id();
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("优惠券活动新增出错！");
		}
		
	}

	public void activedel(String activeid) {
		try {
			Statement st = con.createStatement();
			st.executeUpdate("delete ExchangeRecord where activity_id ="+activeid);
		} catch (Exception e) {
			System.out.println("优惠券活动删除出错！");
		}
		
	}

	public List<ExchangeRecordBean> activelist() {
		List<ExchangeRecordBean> activelist = new ArrayList<ExchangeRecordBean>();
		try {
			Statement st =  con.createStatement();
			String sql ="select * from ExchangeRecord  order by activity_id asc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeRecordBean exchangerecordbean = new ExchangeRecordBean();
				exchangerecordbean.setActivity_id(rs.getInt("activity_id"));
				exchangerecordbean.setActivity_name(rs.getString("activity_name"));
				exchangerecordbean.setActivity_desc(rs.getString("activity_desc"));
				exchangerecordbean.setActivity_username(rs.getString("activity_username"));
				exchangerecordbean.setActivity_date(rs.getString("activity_date"));
				activelist.add(exchangerecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询活动列表出错！");
		}
		return activelist;
	}
	public  List<ExchangeRecordBean> activelist(int pagesize,int startpage,String username){
		List<ExchangeRecordBean> activelist = new ArrayList<ExchangeRecordBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" * from ExchangeRecord  where activity_id not in (select top "+startpage+" activity_id from ExchangeRecord)  and activity_username='"+username+"' order by activity_id desc";
			String sql = "select * from (select rownum rn,e.* from ExchangeRecord e where activity_username='"+username+"')  where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+"  order by activity_id desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeRecordBean exchangerecordbean = new ExchangeRecordBean();
				exchangerecordbean.setActivity_id(rs.getInt("activity_id"));
				exchangerecordbean.setActivity_name(rs.getString("activity_name"));
				exchangerecordbean.setActivity_desc(rs.getString("activity_desc"));
				exchangerecordbean.setActivity_username(rs.getString("activity_username"));
				exchangerecordbean.setActivity_date(rs.getString("activity_date"));
				activelist.add(exchangerecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("活动分页列表出错！");
		}
		return activelist;
		
	}
	public List<ExchangeRecordBean> activelist(int pagesize, int startpage) {
		List<ExchangeRecordBean> activelist = new ArrayList<ExchangeRecordBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" * from ExchangeRecord  where activity_id not in (select top "+startpage+" activity_id from ExchangeRecord)";
			String sql = "select * from (select rownum rn,e.* from ExchangeRecord e) where rn>="+(startpage+1)+" and rn>="+(pagesize+startpage);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeRecordBean exchangerecordbean = new ExchangeRecordBean();
				exchangerecordbean.setActivity_id(rs.getInt("activity_id"));
				exchangerecordbean.setActivity_name(rs.getString("activity_name"));
				exchangerecordbean.setActivity_desc(rs.getString("activity_desc"));
				exchangerecordbean.setActivity_username(rs.getString("activity_username"));
				exchangerecordbean.setActivity_date(rs.getString("activity_date"));
				activelist.add(exchangerecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("活动分页列表出错！");
		}
		return activelist;
	}

	public ExchangeRecordBean findactivemanger(String activeid) {
		ExchangeRecordBean exchangerecordbean = new ExchangeRecordBean();
		try {
			Statement st =  con.createStatement();
			String sql ="select * from ExchangeRecord  where activity_id="+activeid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				exchangerecordbean.setActivity_id(rs.getInt("activity_id"));
				exchangerecordbean.setActivity_name(rs.getString("activity_name"));
				exchangerecordbean.setActivity_desc(rs.getString("activity_desc"));
				exchangerecordbean.setActivity_username(rs.getString("activity_username"));
				exchangerecordbean.setActivity_date(rs.getString("activity_date"));
			}
		} catch (Exception e) {
			System.out.println("查询活动单个列表出错！");
		}
		return exchangerecordbean;
	}

	public void courseadd(CourseBean bean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into course values(courseid.nextval,";
			sql+="'"+bean.getCourse_name()+"',";
			sql+="'"+bean.getPicture_url()+"',";
			sql+="'"+bean.getOne_word()+"',";
			sql+="'"+bean.getIntroduce()+"',";
			sql+="'"+bean.getTeacher_id()+"',";
			sql+="'"+bean.getCourse_count()+"',";
			sql+="'"+bean.getPrice()+"',";
			sql+="'"+bean.getDiscount()+"',";
			sql+="'"+bean.getEffective()+"',";
			sql+="sysdate,";
			sql+="'"+bean.getReplay_username()+"',";
			sql+="'"+bean.getSeq()+"',";
			sql+="'"+bean.getStatus()+"',";
			sql+="'"+bean.getReason()+"',";
			sql+="'"+bean.getIsmoney()+"'";
			sql+=")";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("课程表新增出错！");
		}
		
	}

	public void coursedel(String courseid) {
		try {
			Statement st = con.createStatement();
			st.executeUpdate("delete course where course_id ="+courseid);
		} catch (Exception e) {
			System.out.println("课程表删除出错！");
		}
		
		
	}

	public List<CourseBean> courselist() {
		List<CourseBean> courselist = new ArrayList<CourseBean>();
		try {
			Statement st =  con.createStatement();
			String sql ="select * from course where status=1 order by course_id desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CourseBean coursebean = new CourseBean();
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
				coursebean.setIsmoney(rs.getInt("ismoney"));
				courselist.add(coursebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询活动列表出错！");
		}
		return courselist;
	}
	public List<CourseBean> courselist(int pagesize, int startpage) {
		List<CourseBean> courselist = new ArrayList<CourseBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" * from course  where course_id not in (select top "+startpage+" course_id from course)  order by course_id desc";
			String sql = "select * from (select rownum rn,c.* from course c order by replay_date desc)  where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+"  order by replay_date desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CourseBean coursebean = new CourseBean();
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
				coursebean.setStatus(rs.getInt("status"));
				coursebean.setReason(rs.getString("reason"));
				coursebean.setIsmoney(rs.getInt("ismoney"));
				courselist.add(coursebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询课程分页语句出错！");
		}
		
		return courselist;
	}
	public List<CourseBean> findcourselist(int pagesize,int startpage,String ifvalue){
		List<CourseBean> courselist = new ArrayList<CourseBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" * from course  where course_id not in (select top "+startpage+" course_id from course)  order by course_id desc";
			String sql = "select * from (select rownum rn,c.* from course c "+ifvalue+")  where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+"  order by price desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CourseBean coursebean = new CourseBean();
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
				coursebean.setStatus(rs.getInt("status"));
				coursebean.setReason(rs.getString("reason"));
				coursebean.setIsmoney(rs.getInt("ismoney"));
				courselist.add(coursebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询课程分页语句出错！");
		}
		return courselist;
	}
	public List<CourseBean> courselist(String username,int pagesize,int startpage){
		List<CourseBean> courselist = new ArrayList<CourseBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" * from course  where course_id not in (select top "+startpage+" course_id from course) and replay_username='"+username+"' order by course_id desc";
			String sql = "select * from (select rownum rn,c.* from course c where  replay_username='"+username+"')  where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+" order by course_id desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CourseBean coursebean = new CourseBean();
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
				coursebean.setStatus(rs.getInt("status"));
				coursebean.setReason(rs.getString("reason"));
				coursebean.setIsmoney(rs.getInt("ismoney"));
				courselist.add(coursebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询课程分页语句出错！");
		}
		return courselist;
	}
	public List<CourseBean> courselist(String username,int pagesize,int startpage,String word){
		List<CourseBean> courselist = new ArrayList<CourseBean>();
		try {
			Statement st =  con.createStatement();
//			String sql ="select top "+pagesize+" * from course  where course_id not in (select top "+startpage+" course_id from course) and replay_username='"+username+"' order by course_id desc";
			String sql = "select * from (select rownum rn,c.* from course c where  replay_username='"+username+"' and course_name like '%"+word+"%')  where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+" order by course_id desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CourseBean coursebean = new CourseBean();
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
				coursebean.setStatus(rs.getInt("status"));
				coursebean.setReason(rs.getString("reason"));
				coursebean.setIsmoney(rs.getInt("ismoney"));
				courselist.add(coursebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询课程分页语句出错！");
		}
		return courselist;
	}
	public void courseupdate(CourseBean bean) {
		try {
			Statement st = con.createStatement();
			String sql = "update course set ";
			sql+="Course_name='"+bean.getCourse_name()+"',";
			sql+="picture_url='"+bean.getPicture_url()+"',";
			sql+="one_word='"+bean.getOne_word()+"',";
			sql+="introduce='"+bean.getIntroduce()+"',";
			sql+="teacher_id='"+bean.getTeacher_id()+"',";
			sql+="course_count='"+bean.getCourse_count()+"',";
			sql+="price='"+bean.getPrice()+"',";
			sql+="discount='"+bean.getDiscount()+"',";
			sql+="effective='"+bean.getEffective()+"',";
			sql+="replay_date=sysdate,";
			sql+="replay_username='"+bean.getReplay_username()+"',";
			sql+="seq='"+bean.getSeq()+"',";
			sql+="status='"+bean.getStatus()+"',";
			sql+="reason='"+bean.getReason()+"' ";
			sql+=" where course_id="+bean.getCourse_id();
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新课程表出错！");
			e.printStackTrace();
		}
	}
	public CourseBean findcoursemanger(String courseid) {
		CourseBean coursebean = new CourseBean();
			try {
				Statement st =  con.createStatement();
				String sql ="select * from course where course_id="+courseid;
				System.out.println(sql);
				ResultSet rs = st.executeQuery(sql);
				if (rs.next()) {
					coursebean.setCourse_id(rs.getInt("course_id"));
					coursebean.setCourse_name(rs.getString("course_name"));
					coursebean.setPicture_url(rs.getString("picture_url"));
					coursebean.setOne_word(rs.getString("one_word"));
					coursebean.setIntroduce(rs.getString("introduce"));
					coursebean.setTeacher_id(rs.getInt("teacher_id"));
					coursebean.setCourse_count(rs.getInt("course_count"));
					coursebean.setPrice(rs.getFloat("price"));
					coursebean.setDiscount(rs.getFloat("discount"));
					coursebean.setEffective(rs.getInt("effective"));
					coursebean.setReplay_date(rs.getString("replay_date"));
					coursebean.setReplay_username(rs.getString("replay_username"));
					coursebean.setSeq(rs.getInt("seq"));
					coursebean.setIsmoney(rs.getInt("ismoney"));
				}
			} catch (Exception e) {
				System.out.println("查询课程分页列表出错！");
			}
			return coursebean;
		}
	public CourseBean findcourse(String teacherid) {
		CourseBean coursebean = new CourseBean();
			try {
				Statement st =  con.createStatement();
				String sql ="select * from course where teacher_id="+teacherid;
				System.out.println(sql);
				ResultSet rs = st.executeQuery(sql);
				if (rs.next()) {
					coursebean.setCourse_id(rs.getInt("course_id"));
					coursebean.setCourse_name(rs.getString("course_name"));
					coursebean.setPicture_url(rs.getString("picture_url"));
					coursebean.setOne_word(rs.getString("one_word"));
					coursebean.setIntroduce(rs.getString("introduce"));
					coursebean.setTeacher_id(rs.getInt("teacher_id"));
					coursebean.setCourse_count(rs.getInt("course_count"));
					coursebean.setPrice(rs.getFloat("price"));
					coursebean.setDiscount(rs.getFloat("discount"));
					coursebean.setEffective(rs.getInt("effective"));
					coursebean.setReplay_date(rs.getString("replay_date"));
					coursebean.setReplay_username(rs.getString("replay_username"));
					coursebean.setSeq(rs.getInt("seq"));
				}
			} catch (Exception e) {
				System.out.println("查询课程列表出错！");
			}
			return coursebean;
		}
	//教师语句
	public BankBean findbankname(String bankid) {
		BankBean bankbean = new BankBean();
		try {
			Statement st = con.createStatement();
			String sql = "select bankname from bank where bankid="+bankid;
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				bankbean.setBank_name(rs.getString(1));
			}
		} catch (Exception e) {
			System.out.println("查找银行名称出错！");
		}
		return bankbean;
	}

	public GreadBean findgreadname(String greadid) {
		GreadBean greadbean  = new GreadBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from gread where greadid="+greadid;
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				greadbean.setGreadid(rs.getInt("greadid"));
				greadbean.setGreadname(rs.getString("greadname"));
				greadbean.setGreadpercent(rs.getFloat("greadpercent"));
			}
		} catch (Exception e) {
			System.out.println("查找教师分类名称出错！");
		}
		return greadbean;
	}
	public TeacherBean checkteacherinfo(String teachername) {
		TeacherBean teacherbean = new TeacherBean();
		try {
			Statement st = con.createStatement();
			String sql = "select t.*,g.greadname,b.bankname from teacher t,gread g,bank b where t.gradeid=g.greadid and t.bankid=b.bankid and teachername='"+teachername+"'";
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setBankname(rs.getString("bankname"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setGreadname(rs.getString("greadname"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
			}
		} catch (Exception e) {
			System.out.println("更改教师资料出错");
		}
		return teacherbean;
	}
	public TeacherBean findteacher(String teacherid) {
		TeacherBean teacherbean  = new TeacherBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from teacher where teacherid="+teacherid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
			}
		} catch (Exception e) {
			System.out.println("查找教师分类名称出错！");
		}
		return teacherbean;
	}
	public TeacherBean findstudenttoteacher(String teachermobile) {
		TeacherBean teacherbean  = new TeacherBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from teacher where teachermobile='"+teachermobile+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
				teacherbean.setStatus(rs.getInt("status"));
				teacherbean.setReason(rs.getString("reason"));
			}
		} catch (Exception e) {
			System.out.println("查找教师分类名称出错！");
		}
		return teacherbean;
	}
	public TeacherBean findmyinfo(String teachername) {
		TeacherBean teacherbean  = new TeacherBean();
		try {
			Statement st = con.createStatement();
			String sql = "select t.*,g.greadname from teacher t,gread g where t.gradeid=g.greadid and teachername='"+teachername+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
				teacherbean.setStatus(rs.getInt("status"));
				teacherbean.setReason(rs.getString("reason"));
				teacherbean.setGreadname(rs.getString("greadname"));
			}
		} catch (Exception e) {
			System.out.println("查找教师分类名称出错！");
		}
		return teacherbean;
	}
	public TeacherBean findmydatainfo(String teachermobile) {
		TeacherBean teacherbean  = new TeacherBean();
		try {
			Statement st = con.createStatement();
			String sql = "select t.*,g.greadname from teacher t,gread g where t.gradeid=g.greadid and teachermobile='"+teachermobile+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
				teacherbean.setStatus(rs.getInt("status"));
				teacherbean.setReason(rs.getString("reason"));
				teacherbean.setGreadname(rs.getString("greadname"));
			}
		} catch (Exception e) {
			System.out.println("查找教师分类名称出错！");
		}
		return teacherbean;
	}

	public List<TeacherBean> taecherlist(int pagesize, int startpage) {
		List<TeacherBean> teacherlist = new ArrayList<TeacherBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top ("+pagesize+") t.*,b.bankname,g.greadname from teacher t,bank b,gread g where t.bankid=b.bankid and t.gradeid=g.greadid and teacherid not in (select top ("+startpage+") teacherid  from teacher)";
			String sql = "select  * from (select rownum rn,t.*,b.bankname,g.greadname from teacher t,bank b,gread g where t.bankid=b.bankid and t.gradeid=g.greadid ) where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				TeacherBean teacherbean  = new TeacherBean();
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
				teacherbean.setBankname(rs.getString("bankname"));
				teacherbean.setGreadname(rs.getString("greadname"));
				teacherlist.add(teacherbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找教师分页出错！");
		}
		return teacherlist;
	}

	public void teacheradd(TeacherBean teacherbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into teacher values(teacherid.nextval,";
			sql+="'"+teacherbean.getTeachermobile()+"',";
			sql+="'"+teacherbean.getTeacherpassword()+"',";
			sql+="'"+teacherbean.getTeachername()+"',";
			sql+="'"+teacherbean.getTeachersex()+"',";
			sql+="'"+teacherbean.getTeacheraddress()+"',";
			sql+="'"+teacherbean.getTeacheremail()+"',";
			sql+="'"+teacherbean.getTeacherjianjie()+"',";
			sql+="'"+teacherbean.getTeacherspecial()+"',";
			sql+="'"+teacherbean.getTeacherjiaolin()+"',";
			sql+="'"+teacherbean.getTeachereducation()+"',";
			sql+="'"+teacherbean.getTeacherpictureurl()+"',";
			sql+="'"+teacherbean.getBankid()+"',";
			sql+="'"+teacherbean.getTeacherbanknumber()+"',";
			sql+="'"+teacherbean.getTeacherbankname()+"',";
			sql+="'"+teacherbean.getGradeid()+"',";
			sql+="'"+teacherbean.getStatus()+"',";
			sql+="'"+teacherbean.getReason()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("添加教师语句出错！");
		}
	}
	public void teacherdel(String teacherid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete teacher where teacherid="+teacherid;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("删除教师语句出错！");
		}
	}
	public void teacherdelete(String teachername) {
		try {
			Statement st = con.createStatement();
			String sql = "delete teacher where teachername='"+teachername+"'";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("删除教师语句出错！");
		}
	}
	public List<TeacherBean> teacherlist() {
		List<TeacherBean> teacherlist = new ArrayList<TeacherBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select t.*,b.bankname,g.greadname from teacher t,bank b,gread g where t.bankid=b.bankid and t.gradeid=g.greadid";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				TeacherBean teacherbean  = new TeacherBean();
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
				teacherbean.setBankname(rs.getString("bankname"));
				teacherbean.setGreadname(rs.getString("greadname"));
				teacherlist.add(teacherbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找教师出错！");
		}
		return teacherlist;
	}
	public void teacherpwdupdate(String teacherid,String teacherpwd) {
		try {
			Statement st = con.createStatement();
			String sql = "update teacher set teacherpassword='"+teacherpwd +"' where teacherid="+teacherid;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("教师更改密码出错！");
		}
		
	}
	public void checkteacher(String teacherid,String status,String reason){
		try {
			Statement st = con.createStatement();
			String sql = "update teacher set ";
			sql+="status='"+status+"',";
			sql+="reason='"+reason+"' ";
			sql+=" where teacherid="+teacherid;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("审核更新教师语句出错！");
		}
		
		
	}
	public void teacherupdate(TeacherBean teacherbean) {
		try {
			Statement st = con.createStatement();
			String sql = "update teacher set ";
			sql+="teachermobile='"+teacherbean.getTeachermobile()+"',";
			sql+="teachername='"+teacherbean.getTeachername()+"',";
			sql+="teachersex='"+teacherbean.getTeachersex()+"',";
			sql+="teacheraddress='"+teacherbean.getTeacheraddress()+"',";
			sql+="teacheremail='"+teacherbean.getTeacheremail()+"',";
			sql+="teacherjianjie='"+teacherbean.getTeacherjianjie()+"',";
			sql+="teacherspecial='"+teacherbean.getTeacherspecial()+"',";
			sql+="teacherjiaolin='"+teacherbean.getTeacherjiaolin()+"',";
			sql+="teachereducation='"+teacherbean.getTeachereducation()+"'";
			sql+=" where teacherid="+teacherbean.getTeacherid();
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新教师语句出错！");
		}
	}
	public void teacherbankupdate(TeacherBean teacherbean){
		try {
			Statement st = con.createStatement();
			String sql = "update teacher set ";
			sql+="bankid='"+teacherbean.getBankid()+"',";
			sql+="teacherbanknumber='"+teacherbean.getTeacherbanknumber()+"',";
			sql+="teacherbankname='"+teacherbean.getTeacherbankname()+"'";
			sql+=" where teacherid="+teacherbean.getTeacherid();
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新教师银行语句出错！");
		}
		
	}
	public BankBean bankbe(String bankname) {
		BankBean bankBean = new BankBean();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from bank where bankname="+bankname);
			if(rs.next()){
				bankBean.setBank_name(rs.getString("bankname"));
				bankBean.setBank_id(rs.getInt("bankid"));
			}
		} catch (Exception e) {
			System.out.println("");
		}
		return bankBean;
	}

	public StudentBean checkstudentlogin(String studentname) {
		StudentBean studentbean = new StudentBean();
		try {
			Statement st =  con.createStatement();
			String sql ="select studentid,studentpassword,studentname,studentmobile,leibie from student where studentmobile='"+studentname+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				studentbean.setStudentpassword(rs.getString("studentpassword"));
				studentbean.setStudentname(rs.getString("studentname"));
				studentbean.setStudentmobile(rs.getString("studentmobile"));
				studentbean.setLeibie(rs.getInt("leibie"));
				studentbean.setStudentid(rs.getInt("studentid"));
			}
		} catch (Exception e) {
			System.out.println("控制学生登录出错！");
			e.printStackTrace();
		}
		return studentbean;
	}
	public TeacherBean checkteacherlogin(String teachername) {
		TeacherBean teacherbean = new TeacherBean();
		try {
			Statement st =  con.createStatement();
			String sql ="select teachername,teacherpassword,teacherpictureurl,teachermobile from teacher where teachermobile='"+teachername+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
			}
		} catch (Exception e) {
			System.out.println("控制学生登录出错！");
			e.printStackTrace();
		}
		return teacherbean;
	}
	public SectionBean findsection(String sectionid) {
		SectionBean sectionbean  = new SectionBean();
		try {
			Statement st = con.createStatement();
			String sql = "select s.*,c.course_name from section s,course c where s.courseid=c.course_id and sectionid="+sectionid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				sectionbean.setCourseid(rs.getInt("courseid"));
				sectionbean.setSectionid(rs.getInt("sectionid"));
				sectionbean.setSectionname(rs.getString("sectionname"));
				sectionbean.setIsfree(rs.getInt("isfree"));
				sectionbean.setPaixu(rs.getInt("paixu"));
				sectionbean.setReason(rs.getString("reason"));
				sectionbean.setSectioncontent(rs.getString("sectioncontent"));
				sectionbean.setSectionremark(rs.getString("sectionremark"));
				sectionbean.setSectionurl(rs.getString("sectionurl"));
				sectionbean.setStatus(rs.getInt("status"));
				sectionbean.setTimelength(rs.getInt("timelength"));
				sectionbean.setCoursename(rs.getString("course_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sectionbean;
	}
	public void sectiondel(String sectionid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete section where sectionid="+sectionid;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("删除发布课程语句出错！");
		}
		
	}

	public void sectionadd(SectionBean sectionbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into section values(sectionid.nextval,";
			sql+="'"+sectionbean.getCourseid()+"',";
			sql+="'"+sectionbean.getSectionname()+"',";
			sql+="'"+sectionbean.getTimelength()+"',";
			sql+="'"+sectionbean.getSectionurl()+"',";
			sql+="'"+sectionbean.getSectioncontent()+"',";
			sql+="'"+sectionbean.getSectionremark()+"',";
			sql+="'"+sectionbean.getIsfree()+"',";
			sql+="'"+sectionbean.getPaixu()+"',";
			sql+="'"+sectionbean.getStatus()+"',";
			sql+="'"+sectionbean.getReason()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("新增发布课程失败");
		}
		
	}
	public List<SectionBean> sectionlist(int pagesize,int startpage,String courseid){
		List<SectionBean> sectionlist = new ArrayList<SectionBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") s.*,c.course_name from section s,course c where s.courseid=c.course_id and sectionid not in (select top("+startpage+") sectionid from section order by sectionid asc) and courseid="+courseid;
			String sql = "select * from (select rownum rn,s.*,c.course_name from section s,course c where s.courseid=c.course_id and courseid="+courseid+") where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage) ;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				SectionBean sectionbean  = new SectionBean();
				sectionbean.setSectionid(rs.getInt("sectionid"));
				sectionbean.setCourseid(rs.getInt("courseid"));
				sectionbean.setSectionname(rs.getString("sectionname"));
				sectionbean.setIsfree(rs.getInt("isfree"));
				sectionbean.setPaixu(rs.getInt("paixu"));
				sectionbean.setReason(rs.getString("reason"));
				sectionbean.setSectioncontent(rs.getString("sectioncontent"));
				sectionbean.setSectionremark(rs.getString("sectionremark"));
				sectionbean.setSectionurl(rs.getString("sectionurl"));
				sectionbean.setStatus(rs.getInt("status"));
				sectionbean.setTimelength(rs.getInt("timelength"));
				sectionbean.setCoursename(rs.getString("course_name"));
				sectionlist.add(sectionbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找分页的发布课程出错喔！");
			e.printStackTrace();
		}
		return sectionlist;
		
	}
	public List<SectionBean> sectionbeanlist(int pagesize, int startpage) {
		List<SectionBean> sectionlist = new ArrayList<SectionBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") s.*,c.course_name from section s,course c where s.courseid=c.course_id and sectionid not in (select top("+startpage+") sectionid from section ) order by sectionid desc";
			String sql = "select * from (select rownum rn,s.*,c.course_name from section s,course c where s.courseid=c.course_id order by sectionid desc) where  rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+" order by sectionid desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				SectionBean sectionbean  = new SectionBean();
				sectionbean.setSectionid(rs.getInt("sectionid"));
				sectionbean.setCourseid(rs.getInt("courseid"));
				sectionbean.setSectionname(rs.getString("sectionname"));
				sectionbean.setIsfree(rs.getInt("isfree"));
				sectionbean.setPaixu(rs.getInt("paixu"));
				sectionbean.setReason(rs.getString("reason"));
				sectionbean.setSectioncontent(rs.getString("sectioncontent"));
				sectionbean.setSectionremark(rs.getString("sectionremark"));
				sectionbean.setSectionurl(rs.getString("sectionurl"));
				sectionbean.setStatus(rs.getInt("status"));
				sectionbean.setTimelength(rs.getInt("timelength"));
				sectionbean.setCoursename(rs.getString("course_name"));
				sectionlist.add(sectionbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找分页的发布课程出错！");
		}
		return sectionlist;
	}
	public List<SectionBean> sectionlist(String courseid) {
		List<SectionBean> sectionlist = new ArrayList<SectionBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select * from section s where  courseid="+courseid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				SectionBean sectionbean  = new SectionBean();
				sectionbean.setSectionname(rs.getString("sectionname"));
				sectionbean.setIsfree(rs.getInt("isfree"));
				sectionbean.setPaixu(rs.getInt("paixu"));
				sectionbean.setReason(rs.getString("reason"));
				sectionbean.setSectioncontent(rs.getString("sectioncontent"));
				sectionbean.setSectionremark(rs.getString("sectionremark"));
				sectionbean.setSectionurl(rs.getString("sectionurl"));
				sectionbean.setStatus(rs.getInt("status"));
				sectionbean.setTimelength(rs.getInt("timelength"));
				sectionlist.add(sectionbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找课程失败!");
		}
		return sectionlist;
	}

	public List<SectionBean> sectionlist() {
		List<SectionBean> sectionlist = new ArrayList<SectionBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select s.*,c.course_name from section s,course c where s.courseid=c.course_id ";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				SectionBean sectionbean  = new SectionBean();
				sectionbean.setCourseid(rs.getInt("courseid"));
				sectionbean.setCourseid(rs.getInt("courseid"));
				sectionbean.setSectionname(rs.getString("sectionname"));
				sectionbean.setIsfree(rs.getInt("isfree"));
				sectionbean.setPaixu(rs.getInt("paixu"));
				sectionbean.setReason(rs.getString("reason"));
				sectionbean.setSectioncontent(rs.getString("sectioncontent"));
				sectionbean.setSectionremark(rs.getString("sectionremark"));
				sectionbean.setSectionurl(rs.getString("sectionurl"));
				sectionbean.setStatus(rs.getInt("status"));
				sectionbean.setTimelength(rs.getInt("timelength"));
				sectionbean.setCoursename(rs.getString("coursename"));
				sectionlist.add(sectionbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找教师分类名称出错！");
		}
		return sectionlist;
	}

	public void sectionupdate(SectionBean sectionbean) {
		try {
			Statement st = con.createStatement();
			String sql = "update section set ";
			sql+="Courseid='"+sectionbean.getCourseid()+"',";
			sql+="Sectionname='"+sectionbean.getSectionname()+"',";
			sql+="Timelength='"+sectionbean.getTimelength()+"',";
			sql+="Sectionurl='"+sectionbean.getSectionurl()+"',";
			sql+="Sectioncontent='"+sectionbean.getSectioncontent()+"',";
			sql+="Sectionremark='"+sectionbean.getSectionremark()+"',";
			sql+="Isfree='"+sectionbean.getIsfree()+"',";
			sql+="Paixu='"+sectionbean.getPaixu()+"',";
			sql+="Status='"+sectionbean.getStatus()+"',";
			sql+="Reason='"+sectionbean.getReason()+"'";
			sql+=" where sectionid="+sectionbean.getSectionid();
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("新增发布课程失败");
		}
		
	}

	public void updatereason(String sectionid) {
		try {
			Statement st = con.createStatement();
			String sql = "update section set reason='请求审核' where sectionid="+sectionid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("提交审核的语句出错！");
		}
	}
	public void updatestatus(String sectionid,String status,String reason) {
		try {
			Statement st = con.createStatement();
			String sql = "update section set status='"+status+"',reason='"+reason+"' where sectionid="+sectionid ;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("审核语句出错！");
		}
	}
	public List<SectionBean> sectionbeanlist(int pagesize, int startpage,
			String reason) {
		List<SectionBean> sectionlist = new ArrayList<SectionBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") s.*,c.course_name from section s,course c where s.courseid=c.course_id and sectionid not in (select top("+startpage+") sectionid from section order by sectionid asc) and reason='"+reason+"'";
			String sql = "select * from (select rownum rn,s.*,c.course_name from section s,course c where s.courseid=c.course_id and reason='"+reason+"') where rn>="+(startpage+1)+" and  rn<="+(pagesize+startpage) ;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				SectionBean sectionbean  = new SectionBean();
				sectionbean.setSectionid(rs.getInt("sectionid"));
				sectionbean.setCourseid(rs.getInt("courseid"));
				sectionbean.setSectionname(rs.getString("sectionname"));
				sectionbean.setIsfree(rs.getInt("isfree"));
				sectionbean.setPaixu(rs.getInt("paixu"));
				sectionbean.setReason(rs.getString("reason"));
				sectionbean.setSectioncontent(rs.getString("sectioncontent"));
				sectionbean.setSectionremark(rs.getString("sectionremark"));
				sectionbean.setSectionurl(rs.getString("sectionurl"));
				sectionbean.setStatus(rs.getInt("status"));
				sectionbean.setTimelength(rs.getInt("timelength"));
				sectionbean.setCoursename(rs.getString("course_name"));
				sectionlist.add(sectionbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找分页的发布课程出错！");
		}
		return sectionlist;
	}
//=================学生充值表=====================
	public void moneyadd(MoneyRecordBean moneyrecordbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into moneyrecord values(moneyrecordid.nextval,"+moneyrecordbean.getUserid()+",sysdate,"+moneyrecordbean.getPay_money()+",0,'"+moneyrecordbean.getRemark()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("充值语句的新增出错！");
		}
	}
//删除充值语句
	public void moneydel(String recordid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete moneyrecord where recordid="+recordid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("删除充值语句出错！");
		}
		
	}
//查找充值语句
	public List<MoneyRecordBean> moneylist(int pagesize, int startpage,String studentid) {
		List<MoneyRecordBean> moneyrecordlist = new ArrayList<MoneyRecordBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") m.*,s.studentname from moneyrecord m,student s where m.userid = s.studentid and studentname='"+username+"' and recordid not in (select top("+startpage+") m.recordid from moneyrecord m,student s where m.userid = s.studentid and studentname='"+username+"') ";
			String sql = "select * from (select rownum rn, m.*,s.studentname from moneyrecord m,student s where m.userid = s.studentid and studentid='"+studentid+"' order by pay_date desc) where rownum>="+(startpage+1)+" and rownum<="+(pagesize+startpage)+"  order by pay_date desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				MoneyRecordBean moneyrecordbean  = new MoneyRecordBean();
				moneyrecordbean.setRecordid(rs.getInt("recordid"));
				moneyrecordbean.setUserid(rs.getInt("userid"));
				moneyrecordbean.setPay_date(rs.getDate("pay_date"));
				moneyrecordbean.setPay_money(rs.getFloat("pay_money"));
				moneyrecordbean.setStudentname(rs.getString("studentname"));
				moneyrecordbean.setStatus(rs.getInt("status"));
				moneyrecordbean.setRemark(rs.getString("remark"));
				moneyrecordlist.add(moneyrecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找分页的发布课程出错！");
			e.printStackTrace();
		}
		return moneyrecordlist;
	}
	public List<MoneyRecordBean> findmoneylist(int pagesize, int startpage,String studentid,String ifvalue) {
		List<MoneyRecordBean> moneyrecordlist = new ArrayList<MoneyRecordBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") m.*,s.studentname from moneyrecord m,student s where m.userid = s.studentid and studentname='"+username+"' and recordid not in (select top("+startpage+") m.recordid from moneyrecord m,student s where m.userid = s.studentid and studentname='"+username+"') ";
			String sql = "select * from (select rownum rn, m.*,s.studentname from moneyrecord m,student s where m.userid = s.studentid and studentid='"+studentid+"'"+ifvalue+" order by pay_date desc) where rownum>="+(startpage+1)+" and rownum<="+(pagesize+startpage) +" order by pay_date desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				MoneyRecordBean moneyrecordbean  = new MoneyRecordBean();
				moneyrecordbean.setRecordid(rs.getInt("recordid"));
				moneyrecordbean.setUserid(rs.getInt("userid"));
				moneyrecordbean.setPay_date(rs.getDate("pay_date"));
				moneyrecordbean.setPay_money(rs.getFloat("pay_money"));
				moneyrecordbean.setStudentname(rs.getString("studentname"));
				moneyrecordbean.setStatus(rs.getInt("status"));
				moneyrecordbean.setRemark(rs.getString("remark"));
				moneyrecordlist.add(moneyrecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找分页的发布课程出错！");
			e.printStackTrace();
		}
		return moneyrecordlist;
	}
	public void updatecoursestatus(String courseid,String status,String reason) {
		try {
			Statement st = con.createStatement();
			String sql = "update course set status='"+status+"',reason='"+reason+"'  where course_id="+courseid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("更新状态出错啦");
		}
		
	}
	public CourseBean courlistandsection(int n){
		CourseBean coursebean = new CourseBean();
		try {
			Statement st = con.createStatement();
//			String sql ="select top("+n+") c.course_name,c.price,c.course_id,s.sectionid,c.picture_url,c.one_word,s.isfree,s.sectionurl from course c,section s where c.status=1 and s.status=1 and c.course_name not in(select top(0) c.course_name from course c,section s where c.status=1 and s.status=1) and s.courseid=c.course_id order by sectionid desc";
			String sql ="select * from (select rownum rn,c.course_name,c.price,c.course_id,s.sectionid,c.picture_url,c.one_word,s.isfree,s.sectionurl from course c,section s where c.status=1 and s.status=1  and s.courseid=c.course_id) where rn<="+n+" order by sectionid desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIsmoney(rs.getInt("isfree"));
				coursebean.setSectionurl(rs.getString("sectionurl"));
				coursebean.setSectionid(rs.getInt("sectionid"));
				coursebean.setPrice(rs.getFloat("price"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("学生查询课程列表出错！");
			e.printStackTrace();
		}
		return coursebean;
		
	} 
	public List<CourseBean> courlistwithsection(int pagesize,int startpage) {
		List<CourseBean> list = new ArrayList<CourseBean>();
		try {
			Statement st = con.createStatement();
//			String sql ="select top("+pagesize+") c.course_name,c.price,c.course_id,s.sectionid,c.picture_url,c.one_word,s.isfree,s.sectionurl from course c,section s where c.status=1 and s.status=1 and c.course_name not in(select top("+startpage+") c.course_name from course c,section s where c.status=1 and s.status=1) and s.courseid=c.course_id order by sectionid desc";
			String sql = "select * from (select rownum rn, c.course_name,c.price,c.course_id,c.replay_date,s.sectionid,c.picture_url,c.one_word,s.isfree,s.sectionurl from course c,section s where c.status=1 and s.courseid=c.course_id order by c.replay_date desc) where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+" order by replay_date desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CourseBean coursebean = new CourseBean();
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIsmoney(rs.getInt("isfree"));
				coursebean.setSectionurl(rs.getString("sectionurl"));
				coursebean.setSectionid(rs.getInt("sectionid"));
				coursebean.setPrice(rs.getFloat("price"));
				list.add(coursebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("学生查询课程列表出错！");
		}
		return list;
	}

	public int listsum() {
		int sumlist=0;
		try {
			Statement st = con.createStatement();
			String sql = "select count(*) cnt from course c,section s where c.status=1 and s.status=1 and s.courseid=c.course_id";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				sumlist = rs.getInt(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("学生列表的总和数出错！");
		}
		return sumlist;
	}

	public void checkfree(String sectionid, String isfree) {
		try {
			Statement st = con.createStatement();
			String sql = "update section set isfree="+isfree +" where sectionid="+sectionid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("更改是否付费出错！");
		}
		
	}

	public CourseBean courselistandsection(String courseid) {
		CourseBean coursebean = new CourseBean();
		try {
			Statement st = con.createStatement();
			String sql = "select c.*,s.* from course c,section s where c.course_id=s.courseid and sectionid="+courseid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
				coursebean.setIsmoney(rs.getInt("ismoney"));
				coursebean.setSectionname(rs.getString("sectionname"));
				coursebean.setTimelength(rs.getInt("timelength"));
				coursebean.setSectionurl(rs.getString("sectionurl"));
				coursebean.setSectioncontent(rs.getString("sectioncontent"));
				coursebean.setSectionremark(rs.getString("sectionremark"));
				coursebean.setPaixu(rs.getInt("paixu"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("更改是否付费出错！");
		}
		return coursebean;
	}

	public TeacherBean teacherbean(String teachername) {
		TeacherBean teacherbean  = new TeacherBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from teacher where teachername='"+teachername+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找教师名称出错！");
		}
		return teacherbean;
	}

	public TeacherBean findteacherpwd(String teachername) {
		TeacherBean teacherbean  = new TeacherBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from teacher where teachername='"+teachername+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				teacherbean.setTeacherid(rs.getInt("teacherid"));
				teacherbean.setBankid(rs.getInt("bankid"));
				teacherbean.setGradeid(rs.getInt("gradeid"));
				teacherbean.setTeacheraddress(rs.getString("teacheraddress"));
				teacherbean.setTeacherbankname(rs.getString("teacherbankname"));
				teacherbean.setTeacherbanknumber(rs.getString("teacherbanknumber"));
				teacherbean.setTeachereducation(rs.getString("teachereducation"));
				teacherbean.setTeacheremail(rs.getString("teacheremail"));
				teacherbean.setTeacherjianjie(rs.getString("teacherjianjie"));
				teacherbean.setTeacherjiaolin(rs.getString("teacherjiaolin"));
				teacherbean.setTeachermobile(rs.getString("teachermobile"));
				teacherbean.setTeachername(rs.getString("teachername"));
				teacherbean.setTeacherpassword(rs.getString("teacherpassword"));
				teacherbean.setTeacherpictureurl(rs.getString("teacherpictureurl"));
				teacherbean.setTeachersex(rs.getInt("teachersex"));
				teacherbean.setTeacherspecial(rs.getString("teacherspecial"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找教师分类名称出错！");
		}
		return teacherbean;
	}

	public void updateface(String tablename, String picturename,
			String pictureurl, String username, String name) {
		try {
			Statement st = con.createStatement();
			String sql ="update "+tablename +" set "+picturename+"='"+pictureurl+"' where "+username+"='"+name+"'";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("修改头像出错！");
		}
		
	}

	public double summoney(String moneyname, String tablename,String userid) {
		double money=0.0;
		try {
			Statement st = con.createStatement();
			String sql = "select sum("+moneyname+") summoney  from "+tablename+" where userid="+userid;
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				money = rs.getDouble(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找余额出错！");
		}
		return money;
	}

	public void insertmoney(String summoney,int userid,String pwd) {
		try {
			Statement st = con.createStatement();
			String sql ="insert into summoney values('"+userid+"','"+summoney+"','"+pwd+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("余额账目出错！");
		}
	}
	public void updatemoney(String summoney,int userid) {
		try {
			Statement st = con.createStatement();
			String sql ="update summoney set summoney=(nvl(summoney,0)+"+summoney+") where userid="+userid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("余额账目更新出错！");
		}
	}
	public void updatemoney(String summoney,String userid) {
		try {
			Statement st = con.createStatement();
			String sql ="update summoney set summoney=(summoney+"+summoney+") where userid="+userid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("余额账目更新出错！");
		}
	}
	public MoneyBean money(String userid) {
		MoneyBean moneybean = new MoneyBean();
		try {
			Statement st = con.createStatement();
			String sql = "select userid,round(summoney,2) summoney,password from summoney where userid="+userid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				moneybean.setUserid(rs.getInt("userid"));
				moneybean.setSummoney(rs.getDouble("summoney"));
				moneybean.setPassword(rs.getString("password"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找余额出错！");
		}
		return moneybean;
	}

	public void updatezhifupwd(String pwd, int userid) {
		try {
			Statement st = con.createStatement();
			String sql ="update summoney set password='"+pwd+"' where userid="+userid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("支付密码修改错误出错！");
		}
		
	}
//===========新闻资讯表==========
	public List<NewmsgBean> msglist(int pagesize, int startpage) {
		List<NewmsgBean> list = new ArrayList<NewmsgBean>();
		try {
			Statement st = con.createStatement();
//			String sql ="select top("+pagesize+")*  from newmsg where new_msg_id  not in(select top("+startpage+") new_msg_id from newmsg)";
			String sql = "select * from (select rownum rn,n.*  from newmsg n) where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				NewmsgBean newmsgbean = new NewmsgBean();
				newmsgbean.setNewmsgid(rs.getInt("new_msg_id"));
				newmsgbean.setMsgname(rs.getString("msg_name"));
				newmsgbean.setOneword(rs.getString("one_word"));
				newmsgbean.setMsgcontent(rs.getString("msg_content"));
				newmsgbean.setMsgcontenturl(rs.getString("msg_content_url"));
				newmsgbean.setPublishdate(rs.getString("publish_date"));
				newmsgbean.setPublishusername(rs.getString("publish_username"));
				newmsgbean.setEffective(rs.getInt("effective"));
				newmsgbean.setSeq(rs.getInt("seq"));
				newmsgbean.setNewsType(rs.getInt("newsType"));
				newmsgbean.setImageurl(rs.getString("Image_Url"));
				list.add(newmsgbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("新闻资讯列表出错！");
		}
		return list;
	}

	public void newsmsgadd(NewmsgBean newmsgbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into NewMsg values(NewMsgid.nextval,";
			sql += "'"+newmsgbean.getMsgname() +"',";
			sql += "'"+newmsgbean.getOneword()+"',";
			sql += "'"+newmsgbean.getMsgcontent()+"',";
			sql += "'"+newmsgbean.getMsgcontenturl()+"',";
			sql += "'"+newmsgbean.getPublishdate()+"',";
			sql += "'"+newmsgbean.getPublishusername()+"',";
			sql += "'"+newmsgbean.getEffective()+"',";
			sql += "'"+newmsgbean.getSeq()+"',";
			sql += "'"+newmsgbean.getNewsType()+"',";
			sql += "'"+newmsgbean.getImageurl()+"'";
			sql += ")";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void newsmsgdelete(String newmsgid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete newmsg where new_msg_id="+newmsgid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("删除新闻资讯出错！");
		}
		
	}

	public void newsmsgupdte(NewmsgBean newmsgbean) {
		try {
			Statement st = con.createStatement();
			String sql = "update newmsg set ";
			sql+="msg_name='"+newmsgbean.getMsgname()+"',";
			sql+="one_word='"+newmsgbean.getOneword()+"',";
			sql+="msg_content='"+newmsgbean.getMsgcontent()+"',";
			sql+="msg_content_url='"+newmsgbean.getMsgcontenturl()+"',";
			sql+="publish_date='"+newmsgbean.getPublishdate()+"',";
			sql+="publish_username='"+newmsgbean.getPublishusername()+"',";
			sql+="effective='"+newmsgbean.getEffective()+"',";
			sql+="seq='"+newmsgbean.getSeq()+"',";
			sql+="newsType='"+newmsgbean.getNewsType()+"',";
			sql+="Image_Url='"+newmsgbean.getImageurl()+"' ";
			sql+=" where new_msg_id="+newmsgbean.getNewmsgid();
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("修改公告出错！");
		}
		
	}

	public NewmsgBean findnewsmsg(String newmsgid) {
		NewmsgBean newmsgbean = new NewmsgBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from newmsg  where new_msg_id="+newmsgid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				newmsgbean.setNewmsgid(rs.getInt("new_msg_id"));
				newmsgbean.setMsgname(rs.getString("msg_name"));
				newmsgbean.setOneword(rs.getString("one_word"));
				newmsgbean.setMsgcontent(rs.getString("msg_content"));
				newmsgbean.setMsgcontenturl(rs.getString("msg_content_url"));
				newmsgbean.setPublishdate(rs.getString("publish_date"));
				newmsgbean.setPublishusername(rs.getString("publish_username"));
				newmsgbean.setEffective(rs.getInt("effective"));
				newmsgbean.setSeq(rs.getInt("seq"));
				newmsgbean.setNewsType(rs.getInt("newsType"));
				newmsgbean.setImageurl(rs.getString("Image_Url"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("删除新闻资讯出错！");
		}
		return newmsgbean;
	}
	
	public void exchangecodeadd(ExchangeCodeBean exchangecodebean,int num) {
		try {
			Statement st = con.createStatement();
			for (int i = 0; i<num; i++) {
				String sql = "insert into exchangecode values(exchangecodeid.nextval,";
				sql+="'"+exchangecodebean.getActivityid()+"',";
				sql+="'0',";
				sql+="'"+procudeCode()+"',";
				sql+="'"+exchangecodebean.getExchangemeony()+"',";
				sql+="'0',";
				sql+="'"+exchangecodebean.getReplayname()+"',";
				sql+="'"+exchangecodebean.getDate()+"',";
				sql+="0)";
				System.out.println(sql);
				st.executeUpdate(sql);
			}
			st.close();
		} catch (Exception e) {
			System.out.println("添加优惠记录出错！");
		}
		
	}

	public void exchangecodedelete(String userid,String money,String code) {
		try {
			Statement st = con.createStatement();
			String sql = "delete exchangecode where userid="+userid+" and exchangemeony='"+money+"' and exchangecode='"+code+"'";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("删除优惠券出错！");
		}
		
	}
	public void exchangecodedelete(String codeid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete exchangecode where exchangecodeid="+codeid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("删除优惠券出错！");
		}
		
	}
	public List<ExchangeCodeBean> exchangecodelist(String userid) {
		List<ExchangeCodeBean> mylist = new ArrayList<ExchangeCodeBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select e.*,a.* from exchangecode e,exchangerecord a where  e.activityid=a.activity_id and userid='"+userid+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeCodeBean exbean = new ExchangeCodeBean();
				exbean.setActivity_date(rs.getString("activity_date"));
				exbean.setActivity_desc(rs.getString("activity_desc"));
				exbean.setActivity_id(rs.getInt("activity_id"));
				exbean.setActivity_name(rs.getString("activity_name"));
				exbean.setActivity_username(rs.getString("activity_username"));
				exbean.setActivityid(rs.getInt("activityid"));
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setUserid(rs.getString("userid"));
				mylist.add(exbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易记录出错！");
			e.printStackTrace();
		}
		return mylist;
	}
	public List<ExchangeCodeBean> exchangecodelist(int pagesize, int startpage,
			String userid) {
		List<ExchangeCodeBean> mylist = new ArrayList<ExchangeCodeBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select  top("+pagesize+") * from exchangecode where exchangecodeid not in(select top("+startpage+")exchangecodeid from exchangecode  ) and userid="+userid;
			String sql = "select * from (select rownum rn,e.* from exchangecode e where userid="+userid+") where  rn>="+(startpage+1)+" and rn<="+(pagesize+startpage);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeCodeBean exbean = new ExchangeCodeBean();
				exbean.setActivity_date(rs.getString("activity_date"));
				exbean.setActivity_desc(rs.getString("activity_desc"));
				exbean.setActivity_id(rs.getInt("activity_id"));
				exbean.setActivity_name(rs.getString("activity_name"));
				exbean.setActivity_username(rs.getString("activity_username"));
				exbean.setActivityid(rs.getInt("activityid"));
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setUserid(rs.getString("userid"));
				mylist.add(exbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易分页记录出错！");
		}
		return mylist;
	}
	public List<ExchangeCodeBean> myreplaylist(int pagesize, int startpage,
			String username) {
		List<ExchangeCodeBean> mylist = new ArrayList<ExchangeCodeBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select  top("+pagesize+") * from exchangecode where exchangecodeid not in(select top("+startpage+")exchangecodeid from exchangecode  ) and username="+username;
			String sql = "select * from (select rownum rn,e.* from exchangecode e where username="+username+") where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeCodeBean exbean = new ExchangeCodeBean();
				exbean.setActivity_date(rs.getString("activity_date"));
				exbean.setActivity_desc(rs.getString("activity_desc"));
				exbean.setActivity_id(rs.getInt("activity_id"));
				exbean.setActivity_name(rs.getString("activity_name"));
				exbean.setActivity_username(rs.getString("activity_username"));
				exbean.setActivityid(rs.getInt("activityid"));
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setUserid(rs.getString("userid"));
				mylist.add(exbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易分页记录出错！");
		}
		return mylist;
	}
	public void exchangecodeupdatestatus(String status,String id){
		try {
			Statement st = con.createStatement();
			String sql = "update exchangecode set ";
			sql+="exchangestatus="+status;
			sql+=" where exchangecodeid="+id;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("交易记录的更新出错！");
		}
		
	}
	public void exchangecodeupdate(ExchangeCodeBean exchangecodebean) {
		try {
			Statement st = con.createStatement();
			String sql = "update exchangecode set ";
			sql+="userid='"+exchangecodebean.getUserid()+"',";
			sql+="Exchangestatus='"+exchangecodebean.getExchangestatus()+"',";
			sql+="exchangedate=sysdate ";
			sql+=" where exchangecode='"+exchangecodebean.getExchangecode()+"'";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("交易记录的更新出错！");
			e.printStackTrace();
		}
	}

	public ExchangeCodeBean findexchangecode(String conname,String value) {
		ExchangeCodeBean exbean = new ExchangeCodeBean();
		try {
			Statement st = con.createStatement();
			String sql = "select e.*,a.* from exchangecode e,exchangerecord a where  e.activityid=a.activity_id and "+conname+"="+value;
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				exbean.setActivity_date(rs.getString("activity_date"));
				exbean.setActivity_desc(rs.getString("activity_desc"));
				exbean.setActivity_id(rs.getInt("activity_id"));
				exbean.setActivity_name(rs.getString("activity_name"));
				exbean.setActivity_username(rs.getString("activity_username"));
				exbean.setActivityid(rs.getInt("activityid"));
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setUserid(rs.getString("userid"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易记录出错！");
			e.printStackTrace();
		}
		return exbean;
	}
	public ExchangeCodeBean findexcodebean(String code) {
		ExchangeCodeBean exbean = new ExchangeCodeBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from exchangecode where exchangecode='"+code+"'";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setUserid(rs.getString("userid"));
				exbean.setDate(rs.getString("replaydate"));
				exbean.setReplayname(rs.getString("replayusername"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易记录出错！");
			e.printStackTrace();
		}
		return exbean;
	}

	public  TeacherMoneyBean teacherbeanlist(String teacherid){
		TeacherMoneyBean moneybean = new TeacherMoneyBean();
		try {
			Statement st = con.createStatement();
			String sql = "select t.teacherid,floor(t.summoney) summoney,t.password from teachermoney t where teacherid="+teacherid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				moneybean.setTeacherid(rs.getInt("teacherid"));
				moneybean.setSummoney(rs.getDouble("summoney"));
				moneybean.setPassword(rs.getString("password"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找余额出错！");
		}
		return moneybean;
	}

	public void teachermoneyadd(TeacherMoneyBean teachermoneybean) {
		try {
			Statement st = con.createStatement();
			String sql ="insert into teachermoney values("+teachermoneybean.getTeacherid()+","+teachermoneybean.getSummoney()+",'"+teachermoneybean.getPassword()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("教师余额的新增出错！");
		}
		
	}
	public void teachermoneyupdate(String teacherid,String money){
		try {
			Statement st = con.createStatement();
			String sql ="update teachermoney set summoney=(summoney+"+money+")"+" where teacherid="+teacherid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("教师余额更新出错！");
		}
	}

	public void payrecodeadd(PayRecordBean payrecordbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into payrecord values(payrecordid.nextval,";
			sql+="'"+payrecordbean.getStudentid()+"',";
			sql+="'"+payrecordbean.getCourseid()+"',";
			sql+="'"+payrecordbean.getPayorreturn()+"',";
			sql+="sysdate,";
			sql+="'"+payrecordbean.getPaymoney()+"',";
			sql+="'"+payrecordbean.getPaytype()+"',";
			sql+="'"+payrecordbean.getCardnum()+"',";
			sql+="'"+payrecordbean.getPayer()+"',";
			sql+="'"+payrecordbean.getOrdernumber()+"',";
			sql+="'"+payrecordbean.getPaystatus()+"',";
			sql+="'"+payrecordbean.getIsCash()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("买课记录新增出错！");
		}
		
	}

	public void payrecodedelete(String payrecodeid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete  payrecord where payrecordid="+payrecodeid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("删除宝贝出错！");
		}
		
	}

	public List<PayRecordBean> payrecodelist(int pagesize,int startpage,String status,int studentid) {
		List<PayRecordBean> paylist = new ArrayList<PayRecordBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") p.*,c.*,s.* from payrecord p,course c,section s where p.courseid=s.courseid and p.courseid=c.course_id and  paystatus="+status+" and payrecordid not in (select top("+startpage+") payrecordid from payrecord where paystatus="+status+") and studentid="+studentid;
			String sql = "select * from (select rownum rn, p.payrecordid,p.payorreturn,p.paydate,p.studentid,p.paymoney,p.paytype,p.cardnum,p.payer,p.ordernumber,p.paystatus,p.isCash,p.courseid,c.picture_url,c.course_name,c.one_word,c.introduce,c.teacher_id,c.course_count,c.price,c.discount,c.effective,c.replay_date,c.replay_username,c.seq,c.status,c.reason,c.ismoney,s.sectionurl,s.sectionid,s.sectionname from payrecord p,course c,section s where p.courseid=s.courseid and p.courseid=c.course_id and  paystatus <>"+status+" and studentid="+studentid+" order by paydate desc) where rownum>="+(startpage+1)+" and rownum<="+(pagesize+startpage) +" order by paydate desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				PayRecordBean payrecordbean = new PayRecordBean();
				payrecordbean.setPayrecordid(rs.getInt("payrecordid"));
				payrecordbean.setStudentid(rs.getInt("studentid"));
				payrecordbean.setCourseid(rs.getInt("courseid"));
				payrecordbean.setPayorreturn(rs.getInt("payorreturn"));
				payrecordbean.setPaydate(rs.getString("paydate"));
				payrecordbean.setPaymoney(rs.getFloat("paymoney"));
				payrecordbean.setPaytype(rs.getInt("paytype"));
				payrecordbean.setCardnum(rs.getString("cardnum"));
				payrecordbean.setPayer(rs.getString("payer"));
				payrecordbean.setOrdernumber(rs.getString("ordernumber"));
				payrecordbean.setPaystatus(rs.getInt("paystatus"));
				payrecordbean.setIsCash(rs.getInt("isCash"));
				payrecordbean.setCourse_name(rs.getString("course_name"));
				payrecordbean.setPicture_url(rs.getString("picture_url"));
				payrecordbean.setOne_word(rs.getString("one_word"));
				payrecordbean.setIntroduce(rs.getString("introduce"));
				payrecordbean.setTeacher_id(rs.getInt("teacher_id"));
				payrecordbean.setCourse_count(rs.getInt("course_count"));
				payrecordbean.setPrice(rs.getFloat("price"));
				payrecordbean.setDiscount(rs.getFloat("discount"));
				payrecordbean.setSectionid(rs.getInt("sectionid"));
				payrecordbean.setEffective(rs.getInt("effective"));
				payrecordbean.setReplay_date(rs.getString("replay_date"));
				payrecordbean.setReplay_username(rs.getString("replay_username"));
				payrecordbean.setSeq(rs.getInt("seq"));
				payrecordbean.setStatus(rs.getInt("status"));
				payrecordbean.setReason(rs.getString("reason"));
				payrecordbean.setIsmoney(rs.getInt("ismoney"));
				payrecordbean.setSectionurl(rs.getString("sectionurl"));
				payrecordbean.setSectionname(rs.getString("sectionname"));
				paylist.add(payrecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询购买的课程出错！");
			e.printStackTrace();
		}
		return paylist;
	}
	public List<PayRecordBean> findpayrecodelist(int pagesize,int startpage,String status,int studentid,String ifvalue) {
		List<PayRecordBean> paylist = new ArrayList<PayRecordBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") p.*,c.*,s.* from payrecord p,course c,section s where p.courseid=s.courseid and p.courseid=c.course_id and  paystatus="+status+" and payrecordid not in (select top("+startpage+") payrecordid from payrecord where paystatus="+status+") and studentid="+studentid;
			String sql = "select * from (select rownum rn, p.payrecordid,p.payorreturn,p.paydate,p.studentid,p.paymoney,p.paytype,p.cardnum,p.payer,p.ordernumber,p.paystatus,p.isCash,p.courseid,c.picture_url,c.course_name,c.one_word,c.introduce,c.teacher_id,c.course_count,c.price,c.discount,c.effective,c.replay_date,c.replay_username,c.seq,c.status,c.reason,c.ismoney,s.sectionurl,s.sectionname from payrecord p,course c,section s where p.courseid=s.courseid and p.courseid=c.course_id and  paystatus="+status+" and studentid="+studentid+" and "+ifvalue+" order by paydate desc) where rownum>="+(startpage+1)+" and rownum<="+(pagesize+startpage) +" order by paydate desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				PayRecordBean payrecordbean = new PayRecordBean();
				payrecordbean.setPayrecordid(rs.getInt("payrecordid"));
				payrecordbean.setStudentid(rs.getInt("studentid"));
				payrecordbean.setCourseid(rs.getInt("courseid"));
				payrecordbean.setPayorreturn(rs.getInt("payorreturn"));
				payrecordbean.setPaydate(rs.getString("paydate"));
				payrecordbean.setPaymoney(rs.getFloat("paymoney"));
				payrecordbean.setPaytype(rs.getInt("paytype"));
				payrecordbean.setCardnum(rs.getString("cardnum"));
				payrecordbean.setPayer(rs.getString("payer"));
				payrecordbean.setOrdernumber(rs.getString("ordernumber"));
				payrecordbean.setPaystatus(rs.getInt("paystatus"));
				payrecordbean.setIsCash(rs.getInt("isCash"));
				payrecordbean.setCourse_name(rs.getString("course_name"));
				payrecordbean.setPicture_url(rs.getString("picture_url"));
				payrecordbean.setOne_word(rs.getString("one_word"));
				payrecordbean.setIntroduce(rs.getString("introduce"));
				payrecordbean.setTeacher_id(rs.getInt("teacher_id"));
				payrecordbean.setCourse_count(rs.getInt("course_count"));
				payrecordbean.setPrice(rs.getFloat("price"));
				payrecordbean.setDiscount(rs.getFloat("discount"));
				payrecordbean.setEffective(rs.getInt("effective"));
				payrecordbean.setReplay_date(rs.getString("replay_date"));
				payrecordbean.setReplay_username(rs.getString("replay_username"));
				payrecordbean.setSeq(rs.getInt("seq"));
				payrecordbean.setStatus(rs.getInt("status"));
				payrecordbean.setReason(rs.getString("reason"));
				payrecordbean.setIsmoney(rs.getInt("ismoney"));
				payrecordbean.setSectionurl(rs.getString("sectionurl"));
				payrecordbean.setSectionname(rs.getString("sectionname"));
				paylist.add(payrecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询购买的课程出错！");
			e.printStackTrace();
		}
		return paylist;
	}
	public List<PayRecordBean> payrecodelist(int pagesize,int startpage,String status,String studentid) {
		List<PayRecordBean> paylist = new ArrayList<PayRecordBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") p.*,c.*,s.sectionurl,s.sectionname from payrecord p,course c,section s  where p.courseid=c.course_id and c.course_id=s.courseid  and paystatus="+status+" and payrecordid not in (select top("+startpage+") payrecordid from payrecord where paystatus="+status+") and p.courseid="+studentid;
			String sql = "select * from (select rownum rn, p.payrecordid,p.payorreturn,p.studentid,p.paydate,p.paymoney,p.paytype,p.cardnum,p.payer,p.ordernumber,p.paystatus,p.isCash,p.courseid,c.picture_url,c.one_word,c.introduce,c.course_name,c.teacher_id,c.course_count,c.price,c.discount,c.effective,c.replay_date,c.replay_username,c.seq,c.status,c.reason,c.ismoney,s.sectionurl,s.sectionname from payrecord p,course c,section s where p.courseid=s.courseid and p.courseid=c.course_id and  paystatus="+status+" and  p.courseid="+studentid+") where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				PayRecordBean payrecordbean = new PayRecordBean();
				payrecordbean.setPayrecordid(rs.getInt("payrecordid"));
				payrecordbean.setStudentid(rs.getInt("studentid"));
				payrecordbean.setCourseid(rs.getInt("courseid"));
				payrecordbean.setPayorreturn(rs.getInt("payorreturn"));
				payrecordbean.setPaydate(rs.getString("paydate"));
				payrecordbean.setPaymoney(rs.getFloat("paymoney"));
				payrecordbean.setPaytype(rs.getInt("paytype"));
				payrecordbean.setCardnum(rs.getString("cardnum"));
				payrecordbean.setPayer(rs.getString("payer"));
				payrecordbean.setOrdernumber(rs.getString("ordernumber"));
				payrecordbean.setPaystatus(rs.getInt("paystatus"));
				payrecordbean.setIsCash(rs.getInt("isCash"));
				payrecordbean.setCourse_name(rs.getString("course_name"));
				payrecordbean.setPicture_url(rs.getString("picture_url"));
				payrecordbean.setOne_word(rs.getString("one_word"));
				payrecordbean.setIntroduce(rs.getString("introduce"));
				payrecordbean.setTeacher_id(rs.getInt("teacher_id"));
				payrecordbean.setCourse_count(rs.getInt("course_count"));
				payrecordbean.setPrice(rs.getFloat("price"));
				payrecordbean.setDiscount(rs.getFloat("discount"));
				payrecordbean.setEffective(rs.getInt("effective"));
				payrecordbean.setReplay_date(rs.getString("replay_date"));
				payrecordbean.setReplay_username(rs.getString("replay_username"));
				payrecordbean.setSeq(rs.getInt("seq"));
				payrecordbean.setStatus(rs.getInt("status"));
				payrecordbean.setReason(rs.getString("reason"));
				payrecordbean.setIsmoney(rs.getInt("ismoney"));
				payrecordbean.setSectionurl(rs.getString("sectionurl"));
				payrecordbean.setSectionname(rs.getString("sectionname"));
				paylist.add(payrecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询购买的课程出错啦！");
			e.printStackTrace();
		}
		return paylist;
	}

	public int payrecodebarsum(String status,String conclum,String value) {
		int barsum=0;
		try {
			Statement st = con.createStatement();
			String sql = "select count(*) cnt from payrecord where paystatus="+status+" and courseid="+value;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				barsum = rs.getInt(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找记录数出错！");
		}
		return barsum;
		
	}
	public void payrecodeupdate(String iscash,String recodeid){
		try {
			Statement st = con.createStatement();
			String sql = "update payrecord set iscash='"+iscash+"' where payrecordid="+recodeid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("更改提现状态出错！");
		}
		
	}
	public List<PayRecordBean> payrecodetixian(int pagesize,int startpage,String iscash,String status){
		List<PayRecordBean> paylist = new ArrayList<PayRecordBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") p.*,c.* from payrecord p,course c where p.courseid=c.course_id  and payrecordid not in (select top("+startpage+") payrecordid from payrecord )";
			String sql = "select * from (select rownum rn, p.*,c.* from payrecord p,course c where p.courseid=c.course_id ) where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage) +" order by paydate desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				PayRecordBean payrecordbean = new PayRecordBean();
				payrecordbean.setPayrecordid(rs.getInt("payrecordid"));
				payrecordbean.setStudentid(rs.getInt("studentid"));
				payrecordbean.setCourseid(rs.getInt("courseid"));
				payrecordbean.setPayorreturn(rs.getInt("payorreturn"));
				payrecordbean.setPaydate(rs.getString("paydate"));
				payrecordbean.setPaymoney(rs.getFloat("paymoney"));
				payrecordbean.setPaytype(rs.getInt("paytype"));
				payrecordbean.setCardnum(rs.getString("cardnum"));
				payrecordbean.setPayer(rs.getString("payer"));
				payrecordbean.setOrdernumber(rs.getString("ordernumber"));
				payrecordbean.setPaystatus(rs.getInt("paystatus"));
				payrecordbean.setIsCash(rs.getInt("isCash"));
				payrecordbean.setCourse_name(rs.getString("course_name"));
				payrecordbean.setPicture_url(rs.getString("picture_url"));
				payrecordbean.setOne_word(rs.getString("one_word"));
				payrecordbean.setIntroduce(rs.getString("introduce"));
				payrecordbean.setTeacher_id(rs.getInt("teacher_id"));
				payrecordbean.setCourse_count(rs.getInt("course_count"));
				payrecordbean.setPrice(rs.getFloat("price"));
				payrecordbean.setDiscount(rs.getFloat("discount"));
				payrecordbean.setEffective(rs.getInt("effective"));
				payrecordbean.setReplay_date(rs.getString("replay_date"));
				payrecordbean.setReplay_username(rs.getString("replay_username"));
				payrecordbean.setSeq(rs.getInt("seq"));
				payrecordbean.setStatus(rs.getInt("status"));
				payrecordbean.setReason(rs.getString("reason"));
				payrecordbean.setIsmoney(rs.getInt("ismoney"));
				paylist.add(payrecordbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("审核购买的课程出错！");
		}
		return paylist;
		
	}
	public void cashrecordadd(CashRecordBean cashbean){
		try {
			Statement st = con.createStatement();
			String sql = "insert into cashrecord values(cashrecordid.nextval,";
			sql+="'"+cashbean.getUserid()+"',";
			sql+="'"+cashbean.getCourseid()+"',";
			sql+="'"+cashbean.getTeacherid()+"',";
			sql+="sysdate,";
			sql+="'"+cashbean.getPaymoney()+"',";
			sql+="'"+cashbean.getIncommoney()+"',";
			sql+="'"+cashbean.getStatus()+"',";
			sql+="'"+cashbean.getReason()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("提现记录表出错！");
		}		
	}

	public PayRecordBean findpayrecode(String recodeid) {
		PayRecordBean payrecordbean = new PayRecordBean();
		try {
			Statement st = con.createStatement();
			String sql = "select p.*,c.*,t.gradeid from payrecord p,course c,teacher t where p.courseid=c.course_id and payrecordid="+recodeid+"  and c.teacher_id=t.teacherid";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				payrecordbean.setPayrecordid(rs.getInt("payrecordid"));
				payrecordbean.setStudentid(rs.getInt("studentid"));
				payrecordbean.setCourseid(rs.getInt("courseid"));
				payrecordbean.setPayorreturn(rs.getInt("payorreturn"));
				payrecordbean.setPaydate(rs.getString("paydate"));
				payrecordbean.setPaymoney(rs.getFloat("paymoney"));
				payrecordbean.setPaytype(rs.getInt("paytype"));
				payrecordbean.setCardnum(rs.getString("cardnum"));
				payrecordbean.setPayer(rs.getString("payer"));
				payrecordbean.setOrdernumber(rs.getString("ordernumber"));
				payrecordbean.setPaystatus(rs.getInt("paystatus"));
				payrecordbean.setIsCash(rs.getInt("isCash"));
				payrecordbean.setCourse_name(rs.getString("course_name"));
				payrecordbean.setPicture_url(rs.getString("picture_url"));
				payrecordbean.setOne_word(rs.getString("one_word"));
				payrecordbean.setIntroduce(rs.getString("introduce"));
				payrecordbean.setTeacher_id(rs.getInt("teacher_id"));
				payrecordbean.setCourse_count(rs.getInt("course_count"));
				payrecordbean.setPrice(rs.getFloat("price"));
				payrecordbean.setDiscount(rs.getFloat("discount"));
				payrecordbean.setEffective(rs.getInt("effective"));
				payrecordbean.setReplay_date(rs.getString("replay_date"));
				payrecordbean.setReplay_username(rs.getString("replay_username"));
				payrecordbean.setSeq(rs.getInt("seq"));
				payrecordbean.setStatus(rs.getInt("status"));
				payrecordbean.setReason(rs.getString("reason"));
				payrecordbean.setIsmoney(rs.getInt("ismoney"));
				payrecordbean.setGreadid(rs.getInt("gradeid"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {

		}
		return payrecordbean;
	}
	public PayRecordBean findcode(String recodename) {
		PayRecordBean payrecordbean = new PayRecordBean();
		try {
			Statement st = con.createStatement();
			String sql = "select p.*,c.*,t.gradeid from payrecord p,course c,teacher t where p.courseid=c.course_id and courseid='"+recodename+"'  and c.teacher_id=t.teacherid";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				payrecordbean.setPayrecordid(rs.getInt("payrecordid"));
				payrecordbean.setStudentid(rs.getInt("studentid"));
				payrecordbean.setCourseid(rs.getInt("courseid"));
				payrecordbean.setPayorreturn(rs.getInt("payorreturn"));
				payrecordbean.setPaydate(rs.getString("paydate"));
				payrecordbean.setPaymoney(rs.getFloat("paymoney"));
				payrecordbean.setPaytype(rs.getInt("paytype"));
				payrecordbean.setCardnum(rs.getString("cardnum"));
				payrecordbean.setPayer(rs.getString("payer"));
				payrecordbean.setOrdernumber(rs.getString("ordernumber"));
				payrecordbean.setPaystatus(rs.getInt("paystatus"));
				payrecordbean.setIsCash(rs.getInt("isCash"));
				payrecordbean.setCourse_name(rs.getString("course_name"));
				payrecordbean.setPicture_url(rs.getString("picture_url"));
				payrecordbean.setOne_word(rs.getString("one_word"));
				payrecordbean.setIntroduce(rs.getString("introduce"));
				payrecordbean.setTeacher_id(rs.getInt("teacher_id"));
				payrecordbean.setCourse_count(rs.getInt("course_count"));
				payrecordbean.setPrice(rs.getFloat("price"));
				payrecordbean.setDiscount(rs.getFloat("discount"));
				payrecordbean.setEffective(rs.getInt("effective"));
				payrecordbean.setReplay_date(rs.getString("replay_date"));
				payrecordbean.setReplay_username(rs.getString("replay_username"));
				payrecordbean.setSeq(rs.getInt("seq"));
				payrecordbean.setStatus(rs.getInt("status"));
				payrecordbean.setReason(rs.getString("reason"));
				payrecordbean.setIsmoney(rs.getInt("ismoney"));
				payrecordbean.setGreadid(rs.getInt("gradeid"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {

		}
		return payrecordbean;
	}
	public void updateteachermoney(String summoney, String teacherid) {
		try {
			Statement st = con.createStatement();
			String sql ="update teachermoney set summoney=(summoney+"+summoney+") where teacherid="+teacherid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("余额账目更新出错！");
		}
		
	}

	public void shopcaradd(ShoppingcarBean shopcarbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into shoppingcar values(shoppingcarid.nextval,";
			sql+="'"+shopcarbean.getCourse_id()+"',";
			sql+="'"+shopcarbean.getStudentmobile()+"',";
			sql+="'"+shopcarbean.getPicture_url()+"',";
			sql+="'"+shopcarbean.getOne_word()+"',";
			sql+="'"+shopcarbean.getTeacher_name()+"',";
			sql+="'"+shopcarbean.getCourse_count()+"',";
			sql+="'"+shopcarbean.getPrice()+"',";
			sql+="'"+shopcarbean.getDiscount()+"',";
			sql+="'"+shopcarbean.getEffective()+"',";
			sql+="'"+shopcarbean.getReplay_date()+"',";
			sql+="'"+shopcarbean.getReplay_username()+"',";
			sql+="'"+shopcarbean.getSectionid()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("购物车添加出错啦！");
			e.printStackTrace();
		}
		
	}

	public void shopcardelete(String carid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete shoppingcar where carid="+carid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("删除购物车出错！");
		}
		
	}
	public ShoppingcarBean findshopcar(String courseid,String studentmobile){
		ShoppingcarBean shopbean = new ShoppingcarBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from shoppingcar where course_id="+courseid+" and studentmobile='"+studentmobile+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				shopbean.setStudentmobile(rs.getString("studentmobile"));
			}
			rs.close();
			st.close();
		}catch (Exception e) {
			System.out.println("查找购物车失败！");
			e.printStackTrace();
		}
		return shopbean;
		
	}
	public List<ShoppingcarBean> shopcarlist(int pagesize, int startpage,
			String studentname) {
		List<ShoppingcarBean> shoplist = new ArrayList<ShoppingcarBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select top("+pagesize+") s.*,c.course_name from shoppingcar s,course c where s.course_id=c.course_id and carid not in (select top("+startpage+") carid from shoppingcar) and studentname='"+studentname+"' order by replay_date desc";
			String sql = "select * from (select rownum rn, s.*,c.course_name from shoppingcar s,course c where s.course_id=c.course_id and studentmobile='"+studentname+"' ) where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage)+" order by replay_date desc";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ShoppingcarBean shopbean = new ShoppingcarBean();
				shopbean.setCarid(rs.getInt("carid"));
				shopbean.setCourse_id(rs.getInt("course_id"));
				shopbean.setStudentmobile(rs.getString("studentmobile"));
				shopbean.setPicture_url(rs.getString("picture_url"));
				shopbean.setOne_word(rs.getString("one_word"));
				shopbean.setCourse_count(rs.getInt("course_count"));
				shopbean.setPrice(rs.getFloat("price"));
				shopbean.setDiscount(rs.getFloat("discount"));
				shopbean.setEffective(rs.getInt("effective"));
				shopbean.setReplay_date(rs.getString("replay_date"));
				shopbean.setReplay_username(rs.getString("replay_username"));
				shopbean.setCoursename(rs.getString("course_name"));
				shopbean.setSectionid(rs.getString("sectionid"));
				shoplist.add(shopbean);
			}
			rs.close();
			st.close();
		}catch (Exception e) {
			System.out.println("");
		}
		return shoplist;
	}
	public int shopcarbarsum(String studentname){
		int barnum=0;
		try {
			Statement st = con.createStatement();
			String sql = "select count(*) cnt from shoppingcar where studentmobile='"+studentname+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				barnum = rs.getInt(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("购物车列表出错！");
		}
		return barnum;
		
	}

	public void updateteachername(String oldname, String newname) {
		try {
			Statement st = con.createStatement();
			String sql = "update teacher set teachername='"+newname+"' where teachername='"+oldname+"'";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("更改教师的名字出错！");
		}
		
	}

	public ManagerBean  checkmanagerlogin(String studentname) {
		ManagerBean managerbean = new ManagerBean();
		try {
			Statement st =  con.createStatement();
			String sql ="select * from manager where manager_account='"+studentname+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				managerbean.setManager_id(rs.getInt("manager_id"));
				managerbean.setManager_account(rs.getString("manager_account"));
				managerbean.setManager_contact(rs.getString("manager_contact"));
				managerbean.setManager_name(rs.getString("manager_name"));
				managerbean.setManager_password(rs.getString("manager_password"));
				managerbean.setManager_sex(rs.getInt("manager_sex"));
				managerbean.setManager_status(rs.getInt("manager_status"));
				managerbean.setManager_leibie(rs.getInt("manager_leibie"));
				managerbean.setReason(rs.getString("reason"));
				managerbean.setChangeusername(rs.getString("changeusername"));
				managerbean.setManagerurl(rs.getString("managerurl"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("控制管理员登录出错！");
		}
		return managerbean;
	}

	public ManagerBean findmanager(String managername) {
		ManagerBean managerbean = new ManagerBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from manager where manager_name='"+managername+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				managerbean.setManager_id(rs.getInt("manager_id"));
				managerbean.setManager_account(rs.getString("manager_account"));
				managerbean.setManager_contact(rs.getString("manager_contact"));
				managerbean.setManager_name(rs.getString("manager_name"));
				managerbean.setManager_password(rs.getString("manager_password"));
				managerbean.setManager_sex(rs.getInt("manager_sex"));
				managerbean.setManager_status(rs.getInt("manager_status"));
				managerbean.setReason(rs.getString("reason"));
				managerbean.setChangeusername(rs.getString("changeusername"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找管理员");
		}
		return managerbean;
	}
	public List<ExchangeCodeBean> myecodelist(int pagesize,int startpage,String replayname,int acticityid){
		List<ExchangeCodeBean> mylist = new ArrayList<ExchangeCodeBean>();
		String username="";
		try {
			Statement st = con.createStatement();
//			String sql = "select  top("+pagesize+") e.*,c.*,s.studentname from exchangecode e,exchangerecord c ,student s where exchangecodeid not in(select top("+startpage+")exchangecodeid from exchangecode  ) and s.studentid=e.userid and e.activityid = c.activity_id and activityid="+acticityid+" and replayusername='"+replayname+"'";
			String sql = "select * from (select rownum rn,e.*,c.*,s.studentname from exchangecode e,exchangerecord c ,student s where  s.studentid=e.userid and e.activityid = c.activity_id and activityid="+acticityid+" and replayusername='"+replayname+"') where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeCodeBean exbean = new ExchangeCodeBean();
				exbean.setActivity_date(rs.getString("activity_date"));
				exbean.setActivity_desc(rs.getString("activity_desc"));
				exbean.setActivity_id(rs.getInt("activity_id"));
				exbean.setActivity_name(rs.getString("activity_name"));
				exbean.setActivity_username(rs.getString("activity_username"));
				exbean.setActivityid(rs.getInt("activityid"));
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setUserid(rs.getString("studentname"));
				exbean.setDate(rs.getString("date"));
				mylist.add(exbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易优惠券记录出错asdfksd！");
			e.printStackTrace();
		}
		return mylist;
		
	}
	public List<ExchangeCodeBean> myecodelist1(int pagesize,int startpage,String replayname,int acticityid){
		List<ExchangeCodeBean> mylist = new ArrayList<ExchangeCodeBean>();
		String username="";
		try {
			Statement st = con.createStatement();
//			String sql = "select  top("+pagesize+") e.*,c.* from exchangecode e,exchangerecord c  where exchangecodeid not in(select top("+startpage+")exchangecodeid from exchangecode  ) and  e.activityid = c.activity_id and activityid="+acticityid+" and replayusername='"+replayname+"'";
			String sql = "select * from (select rownum rn,e.*,c.* from exchangecode e,exchangerecord c  where  e.activityid = c.activity_id and activityid="+acticityid+" and replayusername='"+replayname+"') where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeCodeBean exbean = new ExchangeCodeBean();
				exbean.setActivity_date(rs.getString("activity_date"));
				exbean.setActivity_desc(rs.getString("activity_desc"));
				exbean.setActivity_id(rs.getInt("activity_id"));
				exbean.setActivity_name(rs.getString("activity_name"));
				exbean.setActivity_username(rs.getString("activity_username"));
				exbean.setActivityid(rs.getInt("activityid"));
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setDate(rs.getString("activity_date"));
				mylist.add(exbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易优惠券记录出错asdfksd！");
			e.printStackTrace();
		}
		return mylist;
		
	}
	public List<ExchangeCodeBean> exchangecodelist(int pagesize, int startpage) {
		List<ExchangeCodeBean> mylist = new ArrayList<ExchangeCodeBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select  top("+pagesize+") e.*,c.* from exchangecode e,exchangerecord c where exchangecodeid not in(select top("+startpage+")exchangecodeid from exchangecode  ) and e.activityid = c.activity_id";
			String sql = "select * from (select rownum rn,e.*,c.* from exchangecode e,exchangerecord c where e.activityid = c.activity_id) where rn>="+(startpage+1)+" and rn<="+(pagesize+startpage);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ExchangeCodeBean exbean = new ExchangeCodeBean();
				exbean.setActivity_date(rs.getString("activity_date"));
				exbean.setActivity_desc(rs.getString("activity_desc"));
				exbean.setActivity_id(rs.getInt("activity_id"));
				exbean.setActivity_name(rs.getString("activity_name"));
				exbean.setActivity_username(rs.getString("activity_username"));
				exbean.setActivityid(rs.getInt("activityid"));
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setUserid(rs.getString("userid"));
				mylist.add(exbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易优惠券记录出错！");
		}
		return mylist;
	}

	public int exchangecodesum(String userid) {
		int barsum=0;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select count(*) cnt from exchangecode where userid="+userid);
			if(rs.next()){
				barsum = rs.getInt(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找优惠券出错！");
		}
		return barsum;
	}

	public int exchangecodesum() {
		int barsum=0;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select count(*) cnt from exchangecode");
			if(rs.next()){
				barsum = rs.getInt(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找优惠券出错！");
		}
		return barsum;
	}
	public int barsum(String sql){
		System.out.println(sql);
		int bar=0;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				bar = rs.getInt(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找记录数出错！");
		}
		return bar;
	}
	public void pingjiaadd(UserCourseEvalBean pingjia){
		try {
			Statement st = con.createStatement();
			String sql = "insert into usercourseeval values(usercourseevalid.nextval,";
			sql+="'"+pingjia.getUserid()+"',";
			sql+="'"+pingjia.getCourseid()+"',";
			sql+="'"+pingjia.getEvallevel()+"',";
			sql+="'"+pingjia.getEvalcontent()+"',";
			sql+="sysdate)";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("用户评价新增失败！");
		}
	}
	public CourseBean findcoursename (String coursename){
		CourseBean coursebean = new CourseBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from course where course_name='"+coursename+"'";
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询课程列表出错！");
		}
		return coursebean;
		
	}

	public List<UserCourseEvalBean> codelist() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<UserCourseEvalBean> codelist(int pagesize, int startpage) {
		// TODO Auto-generated method stub
		return null;
	}

	public UserCourseEvalBean findcode(String userid, String courseid) {
		UserCourseEvalBean codebean = new UserCourseEvalBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from usercourseeval where userid="+userid+" and courseid="+courseid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);  
			if (rs.next()) {
				codebean.setCourseid(rs.getInt("courseid"));
				codebean.setEvalcontent(rs.getString("evalcontent"));
				codebean.setEvaldate(rs.getString("evaldate"));
				codebean.setUsercourseevalid(rs.getInt("usercourseevalid"));
				codebean.setUserid(rs.getInt("userid"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找用户课程评价出错！");
		}
		return codebean;
	}
	public List<UserCourseEvalBean> pingjialist(String courseid) {
		List<UserCourseEvalBean> userlist = new ArrayList<UserCourseEvalBean>();
 		try {
			Statement st = con.createStatement();
			String sql = "select * from (select rownum rn,u.*,s.studentname,s.studentface from usercourseeval u,student s where courseid="+courseid+" and u.userid=s.studentid) where  rn>=1 and rn<=2";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);  
			while (rs.next()) {
				UserCourseEvalBean codebean = new UserCourseEvalBean();
				codebean.setCourseid(rs.getInt("courseid"));
				codebean.setEvalcontent(rs.getString("evalcontent"));
				codebean.setEvaldate(rs.getString("evaldate"));
				codebean.setUsercourseevalid(rs.getInt("usercourseevalid"));
				codebean.setUserid(rs.getInt("userid"));
				codebean.setStudentname(rs.getString("studentname"));
				codebean.setStudentface(rs.getString("studentface"));
				userlist.add(codebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找用户课程评价出错！");
		}
		return userlist;
	}

	public List<UserCourseEvalBean> findpingjia(String courseid) {
		List<UserCourseEvalBean> list = new ArrayList<UserCourseEvalBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select * from usercourseeval where courseid="+courseid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);  
			while (rs.next()) {
				UserCourseEvalBean codebean = new UserCourseEvalBean();
				codebean.setCourseid(rs.getInt("courseid"));
				codebean.setEvalcontent(rs.getString("evalcontent"));
				codebean.setEvaldate(rs.getString("evaldate"));
				codebean.setUsercourseevalid(rs.getInt("usercourseevalid"));
				codebean.setUserid(rs.getInt("userid"));
				list.add(codebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找用户课程评价出错！");
		}
		return list;
	}

	public void exchangecodeadd(ExchangeCodeBean exchangecodebean) {
		// TODO Auto-generated method stub
		
	}

	public String procudeCode(){
			java.util.Random rand = new java.util.Random();
			String sql = "";
			long cnt = 0;
			int suffix=0;
			String prefix="";
			try {
				Statement stmt = con.createStatement();
				do{
					suffix=rand.nextInt(899999)+100000;
					prefix = Random.produceExchangeCode()+suffix;
					sql = "select count(exchangecode) cnt from exchangecode where exchangecode='"+prefix+"'";
					ResultSet rs = stmt.executeQuery(sql);
					if(rs.next()){
						cnt = rs.getInt("cnt");
					}
				}while(cnt>0);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return prefix;
	}
	public ExchangeCodeBean findecode(String status,String username){
		ExchangeCodeBean exbean = new ExchangeCodeBean();
		try {
			Statement st = con.createStatement();
			String sql = "select rownum rn,e.* from  ExchangeCode e where exchangestatus='"+status+"' and  replayusername='"+username+"' and rownum=1";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				exbean.setExchangecode(rs.getString("exchangecode"));
				exbean.setExchangecodeid(rs.getInt("exchangecodeid"));
				exbean.setExchangedate(rs.getString("exchangedate"));
				exbean.setExchangemeony(rs.getInt("exchangemeony"));
				exbean.setExchangestatus(rs.getInt("exchangestatus"));
				exbean.setUserid(rs.getString("userid"));
				exbean.setReplayname(rs.getString("replayusername"));
				exbean.setDate(rs.getString("REPLAYDATE"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("交易记录出错saodkgpod");
			e.printStackTrace();
		}
		return exbean;
	}

	public ForumBean findliuyan(String forid) {
		ForumBean forbean = new ForumBean();
		try {
			Statement st = con.createStatement();
			String sql = "select f.*,s.studentname from Forum f,student s where f.userid=s.studentid and Forumid="+forid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				forbean.setCountent(rs.getString("countent"));
				forbean.setForumdate(rs.getDate("forumdate"));
				forbean.setForumid(rs.getInt("forumid"));
				forbean.setFourmtype(rs.getInt("fourmtype"));
				forbean.setReplayUserid(rs.getInt("replayUserid"));
				forbean.setUserid(rs.getInt("userid"));
				forbean.setUsername(rs.getString("studentname"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找留言列表出错！");
			e.printStackTrace();
		}
		return forbean;
	}

	public ForumBean liuyanadd(ForumBean forumBean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into Forum values(Forumlid.nextval,";
			sql+="'"+forumBean.getUserid()+"',";
			sql+="'"+forumBean.getReplayUserid()+"',";
			sql+="'"+forumBean.getFourmtype()+"',";
			sql+="'"+forumBean.getCountent()+"',";
			sql+="sysdate)";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("留言失败！");
			e.printStackTrace();
		}
		return null;
	}

	public void liuyandel(String forid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete Forum where Forumid="+forid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("删除留言出错！");
			e.printStackTrace();
		}
		
	}

	public List<ForumBean> liuyanlist(int pagesize, int startpage,String myid,String sc) {
		List<ForumBean> liuyanlist = new ArrayList<ForumBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select f.*,s.studentname,t.teachername from Forum f,student s,teacher t where f.replayUserid=t.teacherid and f.userid=s.studentid and ReplayUserid="+myid;
			String sql = "select * from (select rownum rn,f.*,s.studentname,t.teachername from Forum f,student s,teacher t where f.replayUserid=t.teacherid and f.userid=s.studentid and ReplayUserid="+myid+") where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize)+" order by "+sc;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				ForumBean forbean = new ForumBean();
				forbean.setCountent(rs.getString("countent"));
				forbean.setForumdate(rs.getDate("forumdate"));
				forbean.setForumid(rs.getInt("forumid"));
				forbean.setFourmtype(rs.getInt("fourmtype"));
				forbean.setReplayUserid(rs.getInt("replayUserid"));
				forbean.setUserid(rs.getInt("userid"));
				forbean.setUsername(rs.getString("studentname"));
				forbean.setTeachername(rs.getString("teachername"));
				liuyanlist.add(forbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找留言列表出错！");
			e.printStackTrace();
		}
		return liuyanlist;
	}
	public List<ForumBean> liuyanlist(int pagesize, int startpage,int myid) {
		List<ForumBean> liuyanlist = new ArrayList<ForumBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select f.*,s.studentname,t.teachername from Forum f,student s,teacher t where f.replayUserid=t.teacherid and f.userid=s.studentid and Userid="+myid;
			String sql = "select * from (select rownum rn,f.*,s.studentname,t.teachername from Forum f,student s,teacher t where f.replayUserid=t.teacherid and f.userid=s.studentid and Userid="+myid+") where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				ForumBean forbean = new ForumBean();
				forbean.setCountent(rs.getString("countent"));
				forbean.setForumdate(rs.getDate("forumdate"));
				forbean.setForumid(rs.getInt("forumid"));
				forbean.setFourmtype(rs.getInt("fourmtype"));
				forbean.setReplayUserid(rs.getInt("replayUserid"));
				forbean.setUserid(rs.getInt("userid"));
				forbean.setUsername(rs.getString("studentname"));
				forbean.setTeachername(rs.getString("teachername"));
				liuyanlist.add(forbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找留言列表出错！");
			e.printStackTrace();
		}
		return liuyanlist;
	}
	public List<ForumBean> liuyanlist(int pagesize, int startpage) {
		List<ForumBean> liuyanlist = new ArrayList<ForumBean>();
		try {
			Statement st = con.createStatement();
//			String sql = "select f.*,s.studentname,s.studentface,t.teacherpictureurl,t.teachername from Forum f,student s,teacher t where f.replayUserid=t.teacherid and f.userid=s.studentid";
			String sql = "select * from (select rownum rn,f.*,s.studentface,t.teacherpictureurl,s.studentname,t.teachername from Forum f,student s,teacher t where f.replayUserid=t.teacherid and f.userid=s.studentid) where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				ForumBean forbean = new ForumBean();
				forbean.setCountent(rs.getString("countent"));
				forbean.setForumdate(rs.getDate("forumdate"));
				forbean.setForumid(rs.getInt("forumid"));
				forbean.setFourmtype(rs.getInt("fourmtype"));
				forbean.setReplayUserid(rs.getInt("replayUserid"));
				forbean.setUserid(rs.getInt("userid"));
				forbean.setUsername(rs.getString("studentname"));
				forbean.setTeachername(rs.getString("teachername"));
				forbean.setUserface(rs.getString("studentface"));
				forbean.setTeacherface(rs.getString("teacherpictureurl"));
				liuyanlist.add(forbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找留言列表出错！");
			e.printStackTrace();
		}
		return liuyanlist;
	}
	public void liuyanupdate(ForumBean forumBean) {
		try {
			Statement st = con.createStatement();
			String sql = "update Forum set countent='"+forumBean.getCountent()+"' where forumid="+forumBean.getForumid() ;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("更新留言出错！");
			e.printStackTrace();
		}
		
	}
	public String pingtai(){
		String money="";
		try {
			Statement st = con.createStatement();
			String sql = "select summoney from pingtai";
			System.err.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				money=rs.getString(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("平台收入");
		}
		return money;
	}
	public void pingtaiadd(String money){
		try {
			Statement st = con.createStatement();
			String sql = "insert into pingtai values("+money+"',sysdate)";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("增加收入！");
			e.printStackTrace();
		}
		
	}
	public void pingtaiupdate(String money){
		try {
			Statement st = con.createStatement();
			String sql = "update pingtai set summoney=(summoney)+"+money;
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("增加收入！");
		}
		
	}

	public void jifenadd(JifenBean jifenbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into jifen values(jifenid.nextval,'"+jifenbean.getTeacherid()+"','"+jifenbean.getFen()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("积分的查询！");
		}
		
	}

	public JifenBean jifenlist(String teacherid) {
		JifenBean jifen = new JifenBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from jifen where teacherid="+teacherid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				jifen.setFen(rs.getInt("fen"));
				jifen.setFenid(rs.getInt("fenid"));
				jifen.setTeacherid(rs.getInt("teacherid"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("积分的查询！");
		}
		return jifen;
	}

	public void jifenupdate(JifenBean jifenbean) {
		try {
			Statement st = con.createStatement();
			String sql = "update jifen set fen=fen+"+jifenbean.getFen()+" where teacherid="+jifenbean.getTeacherid();
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("积分的更新出错了！");
		}
		
	}
	public void updateteachergread(String gradeid,String teacherid){
		try {
			Statement st = con.createStatement();
			String sql = "update teacher set ";
			sql+="gradeid='"+gradeid+"' ";
			sql+=" where teacherid="+teacherid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("更新教师语句出错！");
		}
	}

	public List<CourseBean> courselist(String coursename) {
		List<CourseBean> courselist = new ArrayList<CourseBean>();
		try {
			Statement st =  con.createStatement();
			String sql ="select * from course where course_name like '%"+coursename+"%' or one_word like '%"+coursename+"%' or introduce like '%"+coursename+"%'  or replay_username like '%"+coursename+"%' ";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CourseBean coursebean = new CourseBean();
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
				coursebean.setStatus(rs.getInt("status"));
				coursebean.setReason(rs.getString("reason"));
				coursebean.setIsmoney(rs.getInt("ismoney"));
				courselist.add(coursebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询课程分页语句出错！");
		}
		return courselist;
	}
	public List<CourseBean> courselist(int courseid){
		List<CourseBean> courselist = new ArrayList<CourseBean>();
		try {
			Statement st =  con.createStatement();
			String sql ="select rownum rn , c.* from course c where teacher_id='"+courseid+"' and rn<=10 and rn>=1";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				CourseBean coursebean = new CourseBean();
				coursebean.setCourse_id(rs.getInt("course_id"));
				coursebean.setCourse_name(rs.getString("course_name"));
				coursebean.setPicture_url(rs.getString("picture_url"));
				coursebean.setOne_word(rs.getString("one_word"));
				coursebean.setIntroduce(rs.getString("introduce"));
				coursebean.setTeacher_id(rs.getInt("teacher_id"));
				coursebean.setCourse_count(rs.getInt("course_count"));
				coursebean.setPrice(rs.getFloat("price"));
				coursebean.setDiscount(rs.getFloat("discount"));
				coursebean.setEffective(rs.getInt("effective"));
				coursebean.setReplay_date(rs.getString("replay_date"));
				coursebean.setReplay_username(rs.getString("replay_username"));
				coursebean.setSeq(rs.getInt("seq"));
				coursebean.setStatus(rs.getInt("status"));
				coursebean.setReason(rs.getString("reason"));
				coursebean.setIsmoney(rs.getInt("ismoney"));
				courselist.add(coursebean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询课程分页语句出错！");
		}
		return courselist;
		
	}
	public  void courseupdate(int money,int courseid){
		try {
			Statement st = con.createStatement();
			st.executeUpdate("update course set price='"+money+"' where course_id="+courseid);
			st.close();
		} catch (Exception e) {
			System.out.println("更改金额出错！");
		}
		
	}

	public String img(String column,String tablename,String tablecolumn,String mobile) {
		String str = "upfile/1493734331223.jpg";
		try {
			Statement st = con.createStatement();
			String sql = "select "+column+" from "+tablename+" where "+tablecolumn+"='"+mobile+"'";
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				str = rs.getString(1);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("刷新头像！");
		}
		return str;
	}

	public void delvip(String vipid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete VIP where VIPid="+vipid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("删除会员失败！");
			e.printStackTrace();
		}
		
	}

	public VIPBean findvip(String vipid) {
		VIPBean vipbean = new VIPBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from VIP where VIPid="+vipid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				vipbean.setVIPid(rs.getInt("VIPid"));
				vipbean.setVIPleibie(rs.getString("VIPleibie"));
				vipbean.setVIPmoney(rs.getInt("VIPmoney"));
				vipbean.setVIPsell(rs.getInt("VIPsell"));
				vipbean.setVIPsrcmoney(rs.getInt("VIPsrcmoney"));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查找vip失败！");
			e.printStackTrace();
		}
		return vipbean;
	}

	public void updatevip(VIPBean vipbean) {
		try {
			Statement st = con.createStatement();
			String sql = "update VIP set VIPleibie='"+vipbean.getVIPleibie()+"',VIPmoney="+vipbean.getVIPmoney()+",VIPsell="+vipbean.getVIPsell()+",VIPsrcmoney="+vipbean.getVIPsrcmoney()+" where VIPid="+vipbean.getVIPid();
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("更新vip资料失败！");
			e.printStackTrace();
		}
		
	}

	public List<VIPBean> viplist() {
		List<VIPBean> list = new ArrayList<VIPBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select * from VIP";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				VIPBean vipbean = new VIPBean();
				vipbean.setVIPid(rs.getInt("VIPid"));
				vipbean.setVIPleibie(rs.getString("VIPleibie"));
				vipbean.setVIPmoney(rs.getInt("VIPmoney"));
				vipbean.setVIPsell(rs.getInt("VIPsell"));
				vipbean.setVIPsrcmoney(rs.getInt("VIPsrcmoney"));
				list.add(vipbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询vip列表失败！");
		}
		return list;
	}

	public List<VIPBean> viplist(int pagesize, int startpage) {
		List<VIPBean> list = new ArrayList<VIPBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select * from (select rownum rn,v.* from VIP v) where rn>="+(startpage+1)+" and rn<="+(startpage+pagesize);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				VIPBean vipbean = new VIPBean();
				vipbean.setVIPid(rs.getInt("VIPid"));
				vipbean.setVIPleibie(rs.getString("VIPleibie"));
				vipbean.setVIPmoney(rs.getInt("VIPmoney"));
				vipbean.setVIPsell(rs.getInt("VIPsell"));
				vipbean.setVIPsrcmoney(rs.getInt("VIPsrcmoney"));
				list.add(vipbean);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			System.out.println("查询vip分页列表失败！");
		}
		return list;
	}
	public void addvip(VIPBean vipbean){
		try {
			Statement st = con.createStatement();
			String sql = "insert into VIP values(VIPid.nextval,";
			sql+="'"+vipbean.getVIPleibie()+"',";
			sql+=vipbean.getVIPmoney()+",";
			sql+=vipbean.getVIPsell()+",";
			sql+=vipbean.getVIPsrcmoney()+")";
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("新增vip失败");
			e.printStackTrace();
		}
	}
	public void updatestudentVIP(String studentid){
		try {
			Statement st = con.createStatement();
			String sql = "update student set VIP=1 where studentid="+studentid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("更改学生会员出错！");
			e.printStackTrace();
		}
	}
//申请退款的操作
	public void deletefund(String fundid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete refund where refundid="+fundid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("申请退款操作失败！");
		}
		
	}

	public Refund findfund(String courseid, String sectionid) {
		Refund refund = new Refund();
		try {
			Statement st = con.createStatement();
//			String sql = "select * from (select r.*,c.course_name,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refund r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid) where rownum>=1 and rownum<=10";
			String sql = "select r.*,c.course_name,c.price,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refund r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid and r.courseid="+courseid+" and r.sectionid="+sectionid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				refund.setRefundid(rs.getInt("refundid"));
				refund.setCourseid(rs.getInt("courseid"));
				refund.setSectionid(rs.getInt("sectionid"));
				refund.setStudentid(rs.getInt("studentid"));
				refund.setTeacherid(rs.getInt("teacherid"));
				refund.setStatus(rs.getString("status"));
				refund.setReason(rs.getString("reason"));
				refund.setCourse_name(rs.getString("course_name"));
				refund.setPicture_url(rs.getString("picture_url"));
				refund.setPrice(rs.getFloat("price"));
				refund.setStudentmobile(rs.getString("studentmobile"));
				refund.setStudentname(rs.getString("studentname"));
				refund.setSectionurl(rs.getString("sectionurl"));
				refund.setTeachername(rs.getString("teachername"));
			}
		} catch (Exception e) {
			System.out.println("查询退款单条记录失败！");
		}
		return refund;
	}
	public Refund findteacherrefund(String refundid) {
		Refund refund = new Refund();
		try {
			Statement st = con.createStatement();
//			String sql = "select * from (select r.*,c.course_name,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refund r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid) where rownum>=1 and rownum<=10";
			String sql = "select r.*,c.course_name,c.price,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refundteacher r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid and r.refundid="+refundid;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				refund.setRefundid(rs.getInt("refundid"));
				refund.setCourseid(rs.getInt("courseid"));
				refund.setSectionid(rs.getInt("sectionid"));
				refund.setStudentid(rs.getInt("studentid"));
				refund.setTeacherid(rs.getInt("teacherid"));
				refund.setStatus(rs.getString("status"));
				refund.setReason(rs.getString("reason"));
				refund.setCourse_name(rs.getString("course_name"));
				refund.setPicture_url(rs.getString("picture_url"));
				refund.setPrice(rs.getFloat("price"));
				refund.setStudentmobile(rs.getString("studentmobile"));
				refund.setStudentname(rs.getString("studentname"));
				refund.setSectionurl(rs.getString("sectionurl"));
				refund.setTeachername(rs.getString("teachername"));
			}
		} catch (Exception e) {
			System.out.println("查询退款单条记录失败！");
		}
		return refund;
	}
	public void updatepaystatus(String payid,String status){
		try {
			Statement st = con.createStatement();
			String sql = "update payrecord set paystatus="+status+" where payrecordid="+payid ;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更改状态失败！");
		}
		
	} 
	public List<Refund> refundlist(String ifvalue) {
		List<Refund> list = new ArrayList<Refund>();
		try {
			Statement st = con.createStatement();
//			String sql = "select * from (select r.*,c.course_name,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refund r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid "+ifvalue+") where rownum>="+(star)+" and rownum<=10";
			String sql = "select r.*,c.course_name,c.price,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refund r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid "+ifvalue;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				Refund refund = new Refund();
				refund.setRefundid(rs.getInt("refundid"));
				refund.setCourseid(rs.getInt("courseid"));
				refund.setSectionid(rs.getInt("sectionid"));
				refund.setStudentid(rs.getInt("studentid"));
				refund.setTeacherid(rs.getInt("teacherid"));
				refund.setStatus(rs.getString("status"));
				refund.setReason(rs.getString("reason"));
				refund.setCourse_name(rs.getString("course_name"));
				refund.setPicture_url(rs.getString("picture_url"));
				refund.setPrice(rs.getFloat("price"));
				refund.setStudentmobile(rs.getString("studentmobile"));
				refund.setStudentname(rs.getString("studentname"));
				refund.setSectionurl(rs.getString("sectionurl"));
				refund.setTeachername(rs.getString("teachername"));
				list.add(refund);
			}
		} catch (Exception e) {
			System.out.println("查询分页退款单条记录失败！");
		}
		return list;
	}

	public List<Refund> refundlist(int pagesize, int startpage, String ifvalue) {
		List<Refund> list = new ArrayList<Refund>();
		try {
			Statement st = con.createStatement();
			String sql = "select * from (select r.*,c.course_name,c.price,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refund r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid "+ifvalue+") where rownum>="+(startpage+1)+" and rownum<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				Refund refund = new Refund();
				refund.setRefundid(rs.getInt("refundid"));
				refund.setCourseid(rs.getInt("courseid"));
				refund.setSectionid(rs.getInt("sectionid"));
				refund.setStudentid(rs.getInt("studentid"));
				refund.setTeacherid(rs.getInt("teacherid"));
				refund.setStatus(rs.getString("status"));
				refund.setReason(rs.getString("reason"));
				refund.setCourse_name(rs.getString("course_name"));
				refund.setPicture_url(rs.getString("picture_url"));
				refund.setPrice(rs.getFloat("price"));
				refund.setStudentmobile(rs.getString("studentmobile"));
				refund.setStudentname(rs.getString("studentname"));
				refund.setSectionurl(rs.getString("sectionurl"));
				refund.setTeachername(rs.getString("teachername"));
				list.add(refund);
			}
		} catch (Exception e) {
			System.out.println("查询分页退款单条记录失败！");
			e.printStackTrace();
		}
		return list;
	}
	public List<Refund> refundteacherlist(int pagesize, int startpage, String ifvalue) {
		List<Refund> list = new ArrayList<Refund>();
		try {
			Statement st = con.createStatement();
			String sql = "select * from (select r.*,c.course_name,c.price,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refundteacher r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid "+ifvalue+") where rownum>="+(startpage+1)+" and rownum<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				Refund refund = new Refund();
				refund.setRefundid(rs.getInt("refundid"));
				refund.setCourseid(rs.getInt("courseid"));
				refund.setSectionid(rs.getInt("sectionid"));
				refund.setStudentid(rs.getInt("studentid"));
				refund.setTeacherid(rs.getInt("teacherid"));
				refund.setStatus(rs.getInt("STATUS")+"");
				refund.setReason(rs.getString("reason"));
				refund.setCourse_name(rs.getString("course_name"));
				refund.setPicture_url(rs.getString("picture_url"));
				refund.setPrice(rs.getFloat("price"));
				refund.setStudentmobile(rs.getString("studentmobile"));
				refund.setStudentname(rs.getString("studentname"));
				refund.setSectionurl(rs.getString("sectionurl"));
				refund.setTeachername(rs.getString("teachername"));
				list.add(refund);
			}
		} catch (Exception e) {
			System.out.println("查询分页退款单条记录失败！");
			e.printStackTrace();
		}
		return list;
	}
	public void updatesaveteacherfund(Refund refund) {
		try {
			Statement st = con.createStatement();
			String sql = "update refundteacher set ";
			sql+="studentid="+refund.getStudentid()+",";
			sql+="teacherid="+refund.getTeacherid()+",";
			sql+="courseid="+refund.getCourseid()+",";
			sql+="sectionid="+refund.getSectionid()+",";
			sql+="status="+refund.getStatus()+",";
			sql+="reason='"+refund.getReason()+"' ";
			sql+=" where refundid="+refund.getRefundid();
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新退款失败！");
			e.printStackTrace();
		}
	}
	public Refund updaterefund(String refundid, String ifvalue) {
		Refund refund = new Refund();
		try {
			Statement st = con.createStatement();
			String sql = "select r.*,c.course_name,c.price,c.picture_url,s.sectionname,s.sectionurl,t.teachername,ss.studentname,ss.studentmobile from refund r,student ss,course c,section s,teacher t where r.studentid=ss.studentid and r.teacherid=t.teacherid and r.courseid=c.course_id and r.sectionid=s.sectionid and r.refundid="+refundid+" "+ifvalue;
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				refund.setRefundid(rs.getInt("refundid"));
				refund.setCourseid(rs.getInt("courseid"));
				refund.setSectionid(rs.getInt("sectionid"));
				refund.setStudentid(rs.getInt("studentid"));
				refund.setTeacherid(rs.getInt("teacherid"));
				refund.setStatus(rs.getString("status"));
				refund.setReason(rs.getString("reason"));
				refund.setCourse_name(rs.getString("course_name"));
				refund.setPicture_url(rs.getString("picture_url"));
				refund.setPrice(rs.getFloat("price"));
				refund.setStudentmobile(rs.getString("studentmobile"));
				refund.setStudentname(rs.getString("studentname"));
				refund.setTeachername(rs.getString("teachername"));
				refund.setSectionurl(rs.getString("sectionurl"));
			}
		} catch (Exception e) {
			System.out.println("查询退款update单条记录失败！");
		}
		return refund;
	}

	public void updatesavefund(Refund refund) {
		try {
			Statement st = con.createStatement();
			String sql = "update refund set ";
			sql+="studentid="+refund.getStudentid()+",";
			sql+="teacherid="+refund.getTeacherid()+",";
			sql+="courseid="+refund.getCourseid()+",";
			sql+="sectionid="+refund.getSectionid()+",";
			sql+="status="+refund.getStatus()+",";
			sql+="reason='"+refund.getReason()+"' ";
			sql+=" where refundid="+refund.getRefundid();
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新退款失败！");
			e.printStackTrace();
		}
	}
	public void addfund(Refund refund){
		try {
			Statement st = con.createStatement();
			String sql = "insert into refund values(refundid.nextval,";
			sql+=refund.getStudentid()+",";
			sql+=refund.getTeacherid()+",";
			sql+=refund.getCourseid()+",";
			sql+=refund.getSectionid()+",";
			sql+=refund.getStatus()+",'";
			sql+=refund.getReason()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("新增退款出错！");
		}
		
		
	}
	public void addteacherfund(Refund refund){
		try {
			Statement st = con.createStatement();
			String sql = "insert into refundteacher values(refundteacherid.nextval,";
			sql+=refund.getStudentid()+",";
			sql+=refund.getTeacherid()+",";
			sql+=refund.getCourseid()+",";
			sql+=refund.getSectionid()+",";
			sql+=refund.getStatus()+",'";
			sql+=refund.getReason()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("新增讲师退款出错！");
		}
	}
	public void refundstudentmoney(String studentid,float money){
		try {
			Statement st = con.createStatement();
			String sql ="update summoney set summoney=(nvl(summoney,0)+"+money+") where userid="+studentid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("退款余额账目更新出错！");
		}
	}
	public void refundupdateteachermoney(String summoney, String teacherid) {
		try {
			Statement st = con.createStatement();
			String sql ="update teachermoney set summoney=(summoney-"+summoney+") where teacherid="+teacherid;
			System.out.println(sql);
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("退款余额账目更新出错！");
		}
		
	}
	public void refundpingtaiupdate(String money){
		try {
			Statement st = con.createStatement();
			String sql = "update pingtai set summoney=summoney-"+money;
			st.executeUpdate(sql);
			st.close();
		} catch (Exception e) {
			System.out.println("退款收入！");
		}
		
	}

	public void addlog(SysLogBean syslogbean) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into syslog values(syslogid.nextval,";
			sql+=syslogbean.getManagerid()+",";
			sql+=syslogbean.getTypetext()+",";
			sql+="'"+syslogbean.getCountent()+"',sysdate,";
			sql+="'"+syslogbean.getIpaddress()+"')";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("系统日志新增出错！");
		}
		
	}

	public void deletelog(String syslogid) {
		try {
			Statement st = con.createStatement();
			String sql = "delete syslog where syslogid="+syslogid;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("删除日志文件出错！");
		}
		
	}

	public List<SysLogBean> loglist() {
		List<SysLogBean> logList = new ArrayList<SysLogBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select s.*,m.manager_name from syslog s,manager m where s.managerid=m.manager_id order by createdate desc";
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				SysLogBean sysLogBean = new SysLogBean();
				sysLogBean.setCountent(rs.getString("countent"));
				sysLogBean.setCreatedate(rs.getDate("createdate"));
				sysLogBean.setIpaddress(rs.getString("ipaddress"));
				sysLogBean.setSyslogid(rs.getInt("syslogid"));
				sysLogBean.setTypetext(rs.getInt("typetext"));
				sysLogBean.setManagername(rs.getString("manager_name"));
				logList.add(sysLogBean);
			}
		} catch (Exception e) {
			System.out.println("查询日志列表出错！");
		}
		return logList;
	}

	public List<SysLogBean> loglist(int pagesize, int startpage) {
		List<SysLogBean> logList = new ArrayList<SysLogBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select * from (select s.*,m.manager_name from syslog s,manager m where s.managerid=m.manager_id order by createdate desc) where rownum>="+(startpage+1)+" and rownum<="+(startpage+pagesize);
			System.out.println(sql);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				SysLogBean sysLogBean = new SysLogBean();
				sysLogBean.setCountent(rs.getString("countent"));
				sysLogBean.setCreatedate(rs.getDate("createdate"));
				sysLogBean.setIpaddress(rs.getString("ipaddress"));
				sysLogBean.setSyslogid(rs.getInt("syslogid"));
				sysLogBean.setTypetext(rs.getInt("typetext"));
				sysLogBean.setManagername(rs.getString("manager_name"));
				logList.add(sysLogBean);
			}
		} catch (Exception e) {
			System.out.println("查询日志分页列表出错！");
		}
		return logList;
	}

	public void addbirthday(BirthdayBean birthday) {
		try {
			Statement st = con.createStatement();
			String sql = "insert into birthday values(birthdayid.nextval,";
			sql+=birthday.getStudentid()+",";
			sql+=birthday.getMoney()+",";
			sql+=birthday.getCode()+",";
			sql+=birthday.getStatus()+")";
			System.err.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("用户生日新增失败！");
		}
	}
	public List<BirthdayBean> birthdaylist(int pagesize, int startpage){
		List<BirthdayBean> list = new ArrayList<BirthdayBean>();
		try {
			Statement st = con.createStatement();
			String sql = "select * from (select rownum rn,b.*,s.studentname from birthday b,student s where b.studentid=s.studentid) where rn>="+(startpage+1) +"and rn<="+(startpage+pagesize);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				BirthdayBean br = new BirthdayBean();
				br.setBirthdayid(rs.getInt("birthdayid"));
				br.setCode(rs.getLong("code"));
				br.setStatus(rs.getInt("status"));
				br.setMoney(rs.getInt("money"));
				br.setStudentid(rs.getInt("studentid"));
				br.setStudentname(rs.getString("studentname"));
				list.add(br);
			}
		} catch (Exception e) {
			System.out.println("查询生日列表出错！");
		}
		return list;
	}
	public int sumnewmsg(String studentid){
		int num=0;
		try {
			Statement st = con.createStatement();
			String sql = "select count(*) from birthday where studentid="+studentid+" and status=0";
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("查询消息指令出错！");
		}
		return num;
	}
	public BirthdayBean findbirthday(String ifvalue){
		BirthdayBean br = new BirthdayBean();
		try {
			Statement st = con.createStatement();
			String sql = "select * from birthday "+ifvalue;
			System.out.println(sql+"========");
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				br.setBirthdayid(rs.getInt("birthdayid"));
				br.setCode(rs.getLong("code"));
				br.setStatus(rs.getInt("status"));
				br.setMoney(rs.getInt("money"));
				br.setStudentid(rs.getInt("studentid"));
			}
		} catch (Exception e) {
			System.out.println("查询福利失败！");
			e.printStackTrace();
		}
		return br;
	}
	public void updatebirthday(int money,String ifvalue){
		try {
			Statement st = con.createStatement();
			String sql = "update birthday set money="+money+" "+ifvalue;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新福利失败！");
		}
	}
	public void updatebirthdaystatus(int status,String ifvalue){
		try {
			Statement st = con.createStatement();
			String sql = "update birthday set status="+status+" "+ifvalue;
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println("更新福利状态失败！");
		}
	}
}
	
	
