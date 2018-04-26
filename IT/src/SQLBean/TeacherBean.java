package SQLBean;

import java.io.Serializable;

public class TeacherBean implements Serializable{

	private int teacherid;
	private String teachermobile;
	private String teacherpassword;   
	private String teachername;   
	private int teachersex;   
	private String teacheraddress;	   
	private String teacheremail;	   
	private String teacherjianjie;
	private String teacherspecial;
	private String teacherjiaolin;   
	private String teachereducation;   
	private String teacherpictureurl;  
	private int bankid;
	private String teacherbanknumber;  
	private String teacherbankname;  
	private int gradeid;
	private String bankname;
	private String greadname;
	private int status;
	private String reason;
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getGreadname() {
		return greadname;
	}
	public void setGreadname(String greadname) {
		this.greadname = greadname;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
	public String getTeachermobile() {
		return teachermobile;
	}
	public void setTeachermobile(String teachermobile) {
		this.teachermobile = teachermobile;
	}
	public String getTeacherpassword() {
		return teacherpassword;
	}
	public void setTeacherpassword(String teacherpassword) {
		this.teacherpassword = teacherpassword;
	}
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public int getTeachersex() {
		return teachersex;
	}
	public void setTeachersex(int teachersex) {
		this.teachersex = teachersex;
	}
	public String getTeacheraddress() {
		return teacheraddress;
	}
	public void setTeacheraddress(String teacheraddress) {
		this.teacheraddress = teacheraddress;
	}
	public String getTeacheremail() {
		return teacheremail;
	}
	public void setTeacheremail(String teacheremail) {
		this.teacheremail = teacheremail;
	}
	public String getTeacherjianjie() {
		return teacherjianjie;
	}
	public void setTeacherjianjie(String teacherjianjie) {
		this.teacherjianjie = teacherjianjie;
	}
	public String getTeacherspecial() {
		return teacherspecial;
	}
	public void setTeacherspecial(String teacherspecial) {
		this.teacherspecial = teacherspecial;
	}
	public String getTeacherjiaolin() {
		return teacherjiaolin;
	}
	public void setTeacherjiaolin(String teacherjiaolin) {
		this.teacherjiaolin = teacherjiaolin;
	}
	public String getTeachereducation() {
		return teachereducation;
	}
	public void setTeachereducation(String teachereducation) {
		this.teachereducation = teachereducation;
	}
	public String getTeacherpictureurl() {
		return teacherpictureurl;
	}
	public void setTeacherpictureurl(String teacherpictureurl) {
		this.teacherpictureurl = teacherpictureurl;
	}
	public int getBankid() {
		return bankid;
	}
	public void setBankid(int bankid) {
		this.bankid = bankid;
	}
	public String getTeacherbanknumber() {
		return teacherbanknumber;
	}
	public void setTeacherbanknumber(String teacherbanknumber) {
		this.teacherbanknumber = teacherbanknumber;
	}
	public String getTeacherbankname() {
		return teacherbankname;
	}
	public void setTeacherbankname(String teacherbankname) {
		this.teacherbankname = teacherbankname;
	}
	public int getGradeid() {
		return gradeid;
	}
	public void setGradeid(int gradeid) {
		this.gradeid = gradeid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
}
