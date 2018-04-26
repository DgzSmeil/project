package SQLBean;

import java.io.Serializable;

public class ShoppingcarBean implements Serializable {

	private int carid;
	private int course_id;
	private String coursename;
	private String studentmobile;
	private String picture_url;
	private String one_word;
	private String teacher_name;
	private int course_count;
	private float price;
	private float discount;
	private int effective;
	private String replay_date;
	private String sectionid;
	private String  replay_username;
	public int getCarid() {
		return carid;
	}
	public void setCarid(int carid) {
		this.carid = carid;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public String getStudentmobile() {
		return studentmobile;
	}
	public void setStudentmobile(String studentmobile) {
		this.studentmobile = studentmobile;
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
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
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
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getSectionid() {
		return sectionid;
	}
	public void setSectionid(String sectionid) {
		this.sectionid = sectionid;
	}
}
