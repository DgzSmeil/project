package SQLBean;

import java.io.Serializable;

public class ExchangeCodeBean implements Serializable {

	private int exchangecodeid;
	private int activityid;
	private String userid;
	private int studentname;
	private String exchangecode;
	private int exchangemeony;
	private int exchangestatus;
	private String exchangedate;
	private int activity_id;
	private String activity_name;
	private String activity_desc;
	private String activity_username;
	private String activity_date;
	private String replayname;
	private String date;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public String getActivity_name() {
		return activity_name;
	}
	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}
	public String getActivity_desc() {
		return activity_desc;
	}
	public void setActivity_desc(String activity_desc) {
		this.activity_desc = activity_desc;
	}
	public String getActivity_username() {
		return activity_username;
	}
	public void setActivity_username(String activity_username) {
		this.activity_username = activity_username;
	}
	public String getActivity_date() {
		return activity_date;
	}
	public void setActivity_date(String activity_date) {
		this.activity_date = activity_date;
	}
	public int getExchangecodeid() {
		return exchangecodeid;
	}
	public void setExchangecodeid(int exchangecodeid) {
		this.exchangecodeid = exchangecodeid;
	}
	public int getActivityid() {
		return activityid;
	}
	public void setActivityid(int activityid) {
		this.activityid = activityid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getExchangecode() {
		return exchangecode;
	}
	public void setExchangecode(String exchangecode) {
		this.exchangecode = exchangecode;
	}
	public int getExchangemeony() {
		return exchangemeony;
	}
	public void setExchangemeony(int exchangemeony) {
		this.exchangemeony = exchangemeony;
	}
	public int getExchangestatus() {
		return exchangestatus;
	}
	public void setExchangestatus(int exchangestatus) {
		this.exchangestatus = exchangestatus;
	}
	public String getExchangedate() {
		return exchangedate;
	}
	public void setExchangedate(String exchangedate) {
		this.exchangedate = exchangedate;
	}
	public String getReplayname() {
		return replayname;
	}
	public void setReplayname(String replayname) {
		this.replayname = replayname;
	}
	public int getStudentname() {
		return studentname;
	}
	public void setStudentname(int studentname) {
		this.studentname = studentname;
	}
}

