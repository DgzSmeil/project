package SQLBean;

import java.io.Serializable;

public class GreadBean implements Serializable{

	private int greadid;
	private String greadname;
	private Float greadpercent;
	public int getGreadid() {
		return greadid;
	}
	public void setGreadid(int greadid) {
		this.greadid = greadid;
	}
	public String getGreadname() {
		return greadname;
	}
	public void setGreadname(String greadname) {
		this.greadname = greadname;
	}
	public Float getGreadpercent() {
		return greadpercent;
	}
	public void setGreadpercent(Float greadpercent) {
		this.greadpercent = greadpercent;
	}
	
}
