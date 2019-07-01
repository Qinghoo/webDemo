package cn.edu.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Order implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String oid;
	private int uid;
	private String time;
	private String pay;
	private Double sum;
	private String state;
	private String oname;//收货人
	private String otel;
	private String oaddress;
	
	private List<Orderitem> orderitems = new ArrayList<Orderitem>();
	
	public Order(String oid, int uid, String time, String pay, Double sum, String state, String oname, String otel,
			String oaddress) {
		super();
		this.oid = oid;
		this.uid = uid;
		this.time = time;
		this.pay = pay;
		this.sum = sum;
		this.state = state;
		this.oname = oname;
		this.otel = otel;
		this.oaddress = oaddress;
	}
	public Order() {
		super();
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public Double getSum() {
		return sum;
	}
	public void setSum(Double sum) {
		this.sum = sum;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOtel() {
		return otel;
	}
	public void setOtel(String otel) {
		this.otel = otel;
	}
	public String getOaddress() {
		return oaddress;
	}
	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}
	
	
	
	public List<Orderitem> getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(List<Orderitem> orderitems) {
		this.orderitems = orderitems;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", uid=" + uid + ", time=" + time + ", pay=" + pay + ", sum=" + sum + ", state="
				+ state + ", oname=" + oname + ", otel=" + otel + ", oaddress=" + oaddress + "]";
	}
	
	
	
}
