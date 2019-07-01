package cn.edu.pojo;

import java.io.Serializable;

public class Orderitem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String oid;//订单编号
	private int pid;//商品id
	private int num;//数量
	private double total;
	private Product product;
	
	

	public Orderitem(String oid, int pid, int num) {
		super();
		this.oid = oid;
		this.pid = pid;
		this.num = num;

	}
	
	
	
	public Orderitem() {
	
		
	}



	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	public Product getProduct() {
		return product;
	}



	public double getTotal() {
		return getProduct().getPrice()*getNum();
	}



	public void setTotal(double total) {
		this.total = total;
	}



	public void setProduct(Product product) {
		this.product = product;
	}



	@Override
	public String toString() {
		return "Orderitem [oid=" + oid + ", pid=" + pid + ", num=" + num + "]";
	}
	
	
}
