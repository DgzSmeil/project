package MyQQ;

public class OfflineMsg implements java.io.Serializable {

	private int magId;
	private int myQQcode;
	private int friendQQcode;
	private int cmd;
	private String msg;
	public int getMagId() {
		return magId;
	}
	public void setMagId(int magId) {
		this.magId = magId;
	}
	public int getMyQQcode() {
		return myQQcode;
	}
	public void setMyQQcode(int myQQcode) {
		this.myQQcode = myQQcode;
	}
	public int getFriendQQcode() {
		return friendQQcode;
	}
	public void setFriendQQcode(int friendQQcode) {
		this.friendQQcode = friendQQcode;
	}
	public int getCmd() {
		return cmd;
	}
	public void setCmd(int cmd) {
		this.cmd = cmd;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
