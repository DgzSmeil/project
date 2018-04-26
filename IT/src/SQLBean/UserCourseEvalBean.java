package SQLBean;

import java.util.Date;

//用户课程评价表
public class UserCourseEvalBean {

	private int usercourseevalid;	   
	private int userid;	   
	private int courseid;  
	private int evallevel;   
	private String evalcontent;	   
	private String evaldate;
	private String studentname;
	private String studentface;
	public int getUsercourseevalid() {
		return usercourseevalid;
	}
	public void setUsercourseevalid(int usercourseevalid) {
		this.usercourseevalid = usercourseevalid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public int getEvallevel() {
		return evallevel;
	}
	public void setEvallevel(int evallevel) {
		this.evallevel = evallevel;
	}
	public String getEvalcontent() {
		return evalcontent;
	}
	public void setEvalcontent(String evalcontent) {
		this.evalcontent = evalcontent;
	}
	public String getEvaldate() {
		return evaldate;
	}
	public void setEvaldate(String evaldate) {
		this.evaldate = evaldate;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getStudentface() {
		return studentface;
	}
	public void setStudentface(String studentface) {
		this.studentface = studentface;
	}
}
