package cn.edu.pojo;

public class Message {

	private int mid;
	private int uid;
	private String mname;
	private String mtel;
	private String maddress;
	public Message(int mid, int uid, String mname, String mtel, String maddress) {
		super();
		this.mid = mid;
		this.uid = uid;
		this.mname = mname;
		this.mtel = mtel;
		this.maddress = maddress;
	}
	public Message(int uid, String mname, String mtel, String maddress) {
		super();
		this.uid = uid;
		this.mname = mname;
		this.mtel = mtel;
		this.maddress = maddress;
	}
	public Message() {
		super();
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	@Override
	public String toString() {
		return "Message [mid=" + mid + ", uid=" + uid + ", mname=" + mname + ", mtel=" + mtel + ", maddress=" + maddress
				+ "]";
	}
	
	
}
