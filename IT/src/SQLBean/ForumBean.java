package SQLBean;

import java.io.Serializable;
import java.util.Date;

public class ForumBean implements Serializable{

	private int forumid;	   
	private int userid;  
	private int replayUserid;   
	private int fourmtype;	   
	private String countent;	   
	private Date forumdate;
	private String username;
	private String userface;
	private String teachername;
	private String teacherface;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getForumid() {
		return forumid;
	}
	public void setForumid(int forumid) {
		this.forumid = forumid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getFourmtype() {
		return fourmtype;
	}
	public void setFourmtype(int fourmtype) {
		this.fourmtype = fourmtype;
	}
	public int getReplayUserid() {
		return replayUserid;
	}
	public void setReplayUserid(int replayUserid) {
		this.replayUserid = replayUserid;
	}
	public String getCountent() {
		return countent;
	}
	public void setCountent(String countent) {
		this.countent = countent;
	}
	public Date getForumdate() {
		return forumdate;
	}
	public void setForumdate(Date forumdate) {
		this.forumdate = forumdate;
	}
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public String getUserface() {
		return userface;
	}
	public void setUserface(String userface) {
		this.userface = userface;
	}
	public String getTeacherface() {
		return teacherface;
	}
	public void setTeacherface(String teacherface) {
		this.teacherface = teacherface;
	}	 
}
