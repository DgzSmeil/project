package SQLBean;

import java.io.Serializable;

public class StudentBean implements Serializable{

	private int studentid;
	private String studentmobile;
	private String studentpassword;
	private String studentname;
	private int studentsex;
	private String studenthomeaddress;
	private String studentemail;
	private String studentregisterdate;
	private int provinceid;
	private int cityid;
	private String provincename;
	private String cityname;
	private int leibie;
	private String studentface;
	private int VIP;
	private int num;
	public int getLeibie() {
		return leibie;
	}
	public void setLeibie(int leibie) {
		this.leibie = leibie;
	}
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public String getStudentmobile() {
		return studentmobile;
	}
	public void setStudentmobile(String studentmobile) {
		this.studentmobile = studentmobile;
	}
	public String getStudentpassword() {
		return studentpassword;
	}
	public void setStudentpassword(String studentpassword) {
		this.studentpassword = studentpassword;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public int getStudentsex() {
		return studentsex;
	}
	public void setStudentsex(int studentsex) {
		this.studentsex = studentsex;
	}
	public String getStudenthomeaddress() {
		return studenthomeaddress;
	}
	public void setStudenthomeaddress(String studenthomeaddress) {
		this.studenthomeaddress = studenthomeaddress;
	}
	public String getStudentemail() {
		return studentemail;
	}
	public void setStudentemail(String studentemail) {
		this.studentemail = studentemail;
	}
	public String getStudentregisterdate() {
		return studentregisterdate;
	}
	public void setStudentregisterdate(String studentregisterdate) {
		this.studentregisterdate = studentregisterdate;
	}
	public int getProvinceid() {
		return provinceid;
	}
	public void setProvinceid(int provinceid) {
		this.provinceid = provinceid;
	}
	public int getCityid() {
		return cityid;
	}
	public void setCityid(int cityid) {
		this.cityid = cityid;
	}
	public String getProvincename() {
		return provincename;
	}
	public void setProvincename(String provincename) {
		this.provincename = provincename;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	public String getStudentface() {
		return studentface;
	}
	public void setStudentface(String studentface) {
		this.studentface = studentface;
	}
	public int getVIP() {
		return VIP;
	}
	public void setVIP(int vip) {
		VIP = vip;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	} 
}
