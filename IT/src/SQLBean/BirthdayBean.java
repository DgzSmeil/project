package SQLBean;

import java.io.Serializable;

public class BirthdayBean  implements Serializable{

	private int birthdayid;
	private int studentid;
	private int money;
	private long code;
	private int status;
	private String studentname;
	public int getBirthdayid() {
		return birthdayid;
	}
	public void setBirthdayid(int birthdayid) {
		this.birthdayid = birthdayid;
	}
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public long getCode() {
		return code;
	}
	public void setCode(long code) {
		this.code = code;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
}
