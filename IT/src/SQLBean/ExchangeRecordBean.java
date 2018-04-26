package SQLBean;

import java.io.Serializable;

public class ExchangeRecordBean implements Serializable{

	private int activity_id;
	private String activity_name;
	private String activity_desc;
	private String activity_username;
	private String activity_date;
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
}
