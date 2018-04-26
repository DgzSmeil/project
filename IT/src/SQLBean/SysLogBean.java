package SQLBean;

import java.io.Serializable;
import java.util.Date;

//系统日志表
public class SysLogBean implements Serializable{

	private int syslogid;   
	private int managerid;
	private int typetext; 
	private String countent;
	private Date createdate;  
	private String ipaddress;
	private String managername;
	public String getManagername() {
		return managername;
	}
	public void setManagername(String managername) {
		this.managername = managername;
	}
	public int getSyslogid() {
		return syslogid;
	}
	public void setSyslogid(int syslogid) {
		this.syslogid = syslogid;
	}
	public int getManagerid() {
		return managerid;
	}
	public void setManagerid(int managerid) {
		this.managerid = managerid;
	}
	public int getTypetext() {
		return typetext;
	}
	public void setTypetext(int typetext) {
		this.typetext = typetext;
	}
	public String getCountent() {
		return countent;
	}
	public void setCountent(String countent) {
		this.countent = countent;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

}
