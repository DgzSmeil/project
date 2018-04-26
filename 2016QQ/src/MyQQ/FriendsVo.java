package MyQQ;

import java.io.Serializable;

public class FriendsVo implements Serializable {

	private int friendId;
	private int myQQcode;
	private int friendQQcode;
	private String grupName;
	public int getFriendId() {
		return friendId;
	}
	public void setFriendId(int friendId) {
		this.friendId = friendId;
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
	public String getGrupName() {
		return grupName;
	}
	public void setGrupName(String grupName) {
		this.grupName = grupName;
	}
}
