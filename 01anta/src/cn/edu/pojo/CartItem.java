package cn.edu.pojo;

import java.io.Serializable;

public class CartItem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Product product;
	private int count;
	private double total;
	public CartItem(Product product, int count) {
		super();
		this.product = product;
		this.count = count;
		
	}
	public CartItem() {
		super();
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getTotal() {
		return this.count*this.product.getPrice();
	}
	public void setTotal(double total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "CartItem [product=" + product + ", count=" + count + ", total=" + total + "]";
	}
	
	
}
