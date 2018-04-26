package MyQQ;

import java.io.Serializable;

public class Account implements Serializable{

	private int qqCode;
	private String qqPassword;
	private String nickName;
	private String Headimg;
	private int age;
	private String sex;
	private String star;
	private String blood;
	private String nation;
	private String hobit;
	private String ipAddr;
	private int port;
	private String onlinestatus;
	private String remark;
	private String GropName;
	public String getGropName() {
		return GropName;
	}
	public void setGropName(String gropName) {
		GropName = gropName;
	}
	public int getQqCode() {
		return qqCode;
	}
	public void setQqCode(int qqCode) {
		this.qqCode = qqCode;
	}
	public String getQqPassword() {
		return qqPassword;
	}
	public void setQqPassword(String qqPassword) {
		this.qqPassword = qqPassword;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHeadimg() {
		return Headimg;
	}
	public void setHeadimg(String headimg) {
		Headimg = headimg;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getBlood() {
		return blood;
	}
	public void setBlood(String blood) {
		this.blood = blood;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getHobit() {
		return hobit;
	}
	public void setHobit(String hobit) {
		this.hobit = hobit;
	}
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getOnlinestatus() {
		return onlinestatus;
	}
	public void setOnlinestatus(String onlinestatus) {
		this.onlinestatus = onlinestatus;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
