package cn.edu.pojo;

import java.io.Serializable;

public class Admin implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int aid;
	private String aname;
	private String apwd;
	private int power;
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Admin(int aid, String aname, String apwd, int power) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.apwd = apwd;
		this.power = power;
	}

	public Admin(String aname, String apwd, int power) {
		super();
		this.aname = aname;
		this.apwd = apwd;
		this.power = power;
	}

	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", aname=" + aname + ", apwd=" + apwd + ", power=" + power + "]";
	}

	
	
	
}
