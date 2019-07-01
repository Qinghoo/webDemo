package cn.edu.pojo;

import java.io.Serializable;

public class SecondCategory implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int stid;
	private String stname;
	
	private int tid;
	private String tname;
	public SecondCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SecondCategory(int stid, String stname, int tid, String tname) {
		super();
		this.stid = stid;
		this.stname = stname;
		this.tid = tid;
		this.tname = tname;
	}
	public SecondCategory(String stname, int tid, String tname) {
		super();
		this.stname = stname;
		this.tid = tid;
		this.tname = tname;
	}
	public SecondCategory(int stid, String stname, int tid) {
		super();
		this.stid = stid;
		this.stname = stname;
		this.tid = tid;
	}
	public SecondCategory(String stname, int tid) {
		super();
		this.stname = stname;
		this.tid = tid;
	}
	public int getStid() {
		return stid;
	}
	public void setStid(int stid) {
		this.stid = stid;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	@Override
	public String toString() {
		return "SecondCategory [stid=" + stid + ", stname=" + stname + ", tid=" + tid + ", tname=" + tname + "]";
	}
	
	
}
