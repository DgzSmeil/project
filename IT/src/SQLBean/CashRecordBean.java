package SQLBean;

import java.io.Serializable;

public class CashRecordBean implements Serializable{

	private int payrecordid;
	private int userid;
	private int courseid;
	private int teacherid;
	private String cashdate;
	private float paymoney;
	private float Incommoney;
	private int status;
	private String reason;
	public int getPayrecordid() {
		return payrecordid;
	}
	public void setPayrecordid(int payrecordid) {
		this.payrecordid = payrecordid;
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
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
	public String getCashdate() {
		return cashdate;
	}
	public void setCashdate(String cashdate) {
		this.cashdate = cashdate;
	}
	public float getPaymoney() {
		return paymoney;
	}
	public void setPaymoney(float paymoney) {
		this.paymoney = paymoney;
	}
	public float getIncommoney() {
		return Incommoney;
	}
	public void setIncommoney(float incommoney) {
		Incommoney = incommoney;
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
