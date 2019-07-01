package cn.edu.pojo;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<Integer,CartItem> map = new HashMap<Integer,CartItem>();
	private double total;
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	

	public Map<Integer, CartItem> getMap() {
		return map;
	}
	public void setMap(Map<Integer, CartItem> map) {
		this.map = map;
	}
	public Collection<CartItem> getCartItems(){
		return map.values();
	}
	public void addCart(CartItem cartItem) {
		Product product = cartItem.getProduct();
		CartItem item = map.get(product.getPid());
		//原来有，数量相加
		if(item!=null){
			item.setCount((item.getCount()+cartItem.getCount()));
		}
		//原来没有，cartItem加到map
		else{
			map.put(product.getPid(),cartItem);
		}
		
		this.setTotal(this.getTotal()+cartItem.getTotal());
		
	}
	public void removecart(int pid) {
		CartItem cartItem = map.remove(pid);
		this.setTotal(this.getTotal()-cartItem.getTotal());
		
	}
	public void clearCart() {
		map.clear();
		setTotal(0);
		
	}
	public void jia(Map<Integer, CartItem> map2, int pid) {
		
		CartItem cartItem = map2.get(pid);
		
		int count = cartItem.getCount() +1;
		cartItem.setCount(count);
		this.setTotal(this.getTotal()+cartItem.getProduct().getPrice());
		
		
	}
	public void jian(Map<Integer, CartItem> map2, int pid) {
		CartItem cartItem = map2.get(pid);
		int count = cartItem.getCount();
		if(count==1){
			return;
		}else{
			count--;
		}
		
		
		cartItem.setCount(count);
		this.setTotal(this.getTotal()-cartItem.getProduct().getPrice());
		
	}
	
	
}
