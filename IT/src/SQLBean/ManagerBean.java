package SQLBean;

import java.io.Serializable;

public class ManagerBean implements Serializable{

	private int manager_id ;
	private String manager_account;
	private String manager_password;
	private String manager_name;
	private int manager_sex;
	private String manager_contact;
	private int manager_status;
	private int manager_leibie;
	private String reason ;
	private String changeusername;
	private String managerurl;
	public String getManagerurl() {
		return managerurl;
	}
	public void setManagerurl(String managerurl) {
		this.managerurl = managerurl;
	}
	public int getManager_leibie() {
		return manager_leibie;
	}
	public void setManager_leibie(int manager_leibie) {
		this.manager_leibie = manager_leibie;
	}
	public int getManager_status() {
		return manager_status;
	}
	public void setManager_status(int manager_status) {
		this.manager_status = manager_status;
	}
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_account() {
		return manager_account;
	}
	public void setManager_account(String manager_account) {
		this.manager_account = manager_account;
	}
	public String getManager_password() {
		return manager_password;
	}
	public void setManager_password(String manager_password) {
		this.manager_password = manager_password;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public int getManager_sex() {
		return manager_sex;
	}
	public void setManager_sex(int manager_sex) {
		this.manager_sex = manager_sex;
	}
	public String getManager_contact() {
		return manager_contact;
	}
	public void setManager_contact(String manager_contact) {
		this.manager_contact = manager_contact;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getChangeusername() {
		return changeusername;
	}
	public void setChangeusername(String changeusername) {
		this.changeusername = changeusername;
	}
}
