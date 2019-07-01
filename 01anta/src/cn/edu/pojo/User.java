package cn.edu.pojo;

import java.io.Serializable;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int uid;
	private String uname;
	private String upwd;
	private String utel;
	private String uemail;
	private String uaddress;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int uid, String uname, String upwd, String utel, String uemail, String uaddress) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.utel = utel;
		this.uemail = uemail;
		this.uaddress = uaddress;
	}
	public User(String uname, String upwd, String utel, String uemail, String uaddress) {
		super();
		this.uname = uname;
		this.upwd = upwd;
		this.utel = utel;
		this.uemail = uemail;
		this.uaddress = uaddress;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upwd=" + upwd + ", utel=" + utel + ", uemail=" + uemail
				+ ", uaddress=" + uaddress + "]";
	}
	
	
}
