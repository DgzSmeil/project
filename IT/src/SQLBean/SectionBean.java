package SQLBean;

import java.io.Serializable;
//课件节表
public class SectionBean implements Serializable {

	private int sectionid;	   
	private int courseid;
	private String sectionname;	 
	private String coursename;	 
	private int timelength;	   
	private String sectionurl;	   
	private String sectioncontent;  
	private String sectionremark;
	private int isfree;	   
	private int paixu;	 
	private int status;
	private String reason;
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
	public int getTimelength() {
		return timelength;
	}
	public void setTimelength(int timelength) {
		this.timelength = timelength;
	}
	public String getSectionurl() {
		return sectionurl;
	}
	public void setSectionurl(String sectionurl) {
		this.sectionurl = sectionurl;
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
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	

}
