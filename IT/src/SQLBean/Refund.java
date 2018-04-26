package SQLBean;

import java.io.Serializable;


public class Refund implements Serializable{

	private int refundid;
	private int studentid;
	private int teacherid;
	private int courseid;
	private int sectionid;
	private String status;
	private String reason;
	//课程表，和章节表的javabean
	private String course_name;
	private String picture_url;
	private float price;
	private String coursename;	
	private String studentname;
	private String studentmobile;
	private String sectionurl;
	private String teachername;
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public String getSectionurl() {
		return sectionurl;
	}
	public void setSectionurl(String sectionurl) {
		this.sectionurl = sectionurl;
	}
	public int getRefundid() {
		return refundid;
	}
	public void setRefundid(int refundid) {
		this.refundid = refundid;
	}
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public int getSectionid() {
		return sectionid;
	}
	public void setSectionid(int sectionid) {
		this.sectionid = sectionid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getStudentmobile() {
		return studentmobile;
	}
	public void setStudentmobile(String studentmobile) {
		this.studentmobile = studentmobile;
	}
	
}
