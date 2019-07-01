package cn.edu.pojo;

import java.io.Serializable;

public class Category implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private int tid;
private String tname;
public Category() {
	super();
	// TODO Auto-generated constructor stub
}
public Category(int tid, String tname) {
	super();
	this.tid = tid;
	this.tname = tname;
}
public Category(String tname) {
	super();
	this.tname = tname;
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
	return "Category [tid=" + tid + ", tname=" + tname + "]";
}

}
