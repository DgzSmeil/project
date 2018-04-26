package SQLBean;

import java.io.Serializable;

public class NewmsgBean implements Serializable{

	public int newmsgid;   
	public String msgname;	   
	public String oneword;   
	public String msgcontent;  
	public String msgcontenturl;   
	public String publishdate;   
	public String publishusername;   
	public int effective;	    
	public int seq;  
	public int newsType;     
	public String imageurl;
	public int getNewmsgid() {
		return newmsgid;
	}
	public void setNewmsgid(int newmsgid) {
		this.newmsgid = newmsgid;
	}
	public String getMsgname() {
		return msgname;
	}
	public void setMsgname(String msgname) {
		this.msgname = msgname;
	}
	public String getOneword() {
		return oneword;
	}
	public void setOneword(String oneword) {
		this.oneword = oneword;
	}
	public String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	public String getMsgcontenturl() {
		return msgcontenturl;
	}
	public void setMsgcontenturl(String msgcontenturl) {
		this.msgcontenturl = msgcontenturl;
	}
	public String getPublishdate() {
		return publishdate;
	}
	public void setPublishdate(String publishdate) {
		this.publishdate = publishdate;
	}
	public String getPublishusername() {
		return publishusername;
	}
	public void setPublishusername(String publishusername) {
		this.publishusername = publishusername;
	}
	public int getEffective() {
		return effective;
	}
	public void setEffective(int effective) {
		this.effective = effective;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getNewsType() {
		return newsType;
	}
	public void setNewsType(int newsType) {
		this.newsType = newsType;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
}
