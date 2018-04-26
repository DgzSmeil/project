package SQLBean;

import java.io.Serializable;

import org.omg.CORBA.PRIVATE_MEMBER;

import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;

public class CourseBean implements Serializable{

	private int course_id;
	private String course_name;
	private String picture_url;
	private String one_word;
	private String introduce;
	private int teacher_id;
	private int  course_count;
	private float price;
	private float discount;
	private int effective;
	private String replay_date;
	private String replay_username;
	private int seq;
	private int status;
	private String reason;
	private int ismoney;
	private String sectionurl;
	private int sectionid;	   
	private int courseid;
	private String sectionname;	 
	private String coursename;	 
	private int timelength;	   
	private String sectioncontent;  
	private String sectionremark;
	private int isfree;	   
	private int paixu;	 
	public int getSectionid() {
		return sectionid;
	}
	public void setSectionid(int sectionid) {
		this.sectionid = sectionid;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public String getSectionname() {
		return sectionname;
	}
	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public int getTimelength() {
		return timelength;
	}
	public void setTimelength(int timelength) {
		this.timelength = timelength;
	}
	public String getSectioncontent() {
		return sectioncontent;
	}
	public void setSectioncontent(String sectioncontent) {
		this.sectioncontent = sectioncontent;
	}
	public String getSectionremark() {
		return sectionremark;
	}
	public void setSectionremark(String sectionremark) {
		this.sectionremark = sectionremark;
	}
	public int getIsfree() {
		return isfree;
	}
	public void setIsfree(int isfree) {
		this.isfree = isfree;
	}
	public int getPaixu() {
		return paixu;
	}
	public void setPaixu(int paixu) {
		this.paixu = paixu;
	}
	public String getSectionurl() {
		return sectionurl;
	}
	public void setSectionurl(String sectionurl) {
		this.sectionurl = sectionurl;
	}
	public int getIsmoney() {
		return ismoney;
	}
	public void setIsmoney(int ismoney) {
		this.ismoney = ismoney;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
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
	public String getOne_word() {
		return one_word;
	}
	public void setOne_word(String one_word) {
		this.one_word = one_word;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	public int getCourse_count() {
		return course_count;
	}
	public void setCourse_count(int course_count) {
		this.course_count = course_count;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getEffective() {
		return effective;
	}
	public void setEffective(int effective) {
		this.effective = effective;
	}
	public String getReplay_date() {
		return replay_date;
	}
	public void setReplay_date(String replay_date) {
		this.replay_date = replay_date;
	}
	public String getReplay_username() {
		return replay_username;
	}
	public void setReplay_username(String replay_username) {
		this.replay_username = replay_username;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
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
