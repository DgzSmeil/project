package SQLBean;

import java.util.Date;

//充值记录表
public class MoneyRecordBean {

	private int recordid;	   
	private int userid;
	private Date pay_date;
	private float pay_money;
	private String studentname;
	private int status;
	private String remark;
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getRecordid() {
		return recordid;
	}
	public void setRecordid(int recordid) {
		this.recordid = recordid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public float getPay_money() {
		return pay_money;
	}
	public void setPay_money(float pay_money) {
		this.pay_money = pay_money;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
}
