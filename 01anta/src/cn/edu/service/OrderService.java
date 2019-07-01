package cn.edu.service;

import java.util.List;

import com.tsc.util.Page;

import cn.edu.dao.OrderDao;
import cn.edu.dao.OrderItemDao;
import cn.edu.dao.ProductDao;
import cn.edu.pojo.Order;
import cn.edu.pojo.Orderitem;



public class OrderService {
	
	OrderDao dao = new OrderDao();
	OrderItemDao itemdao = new OrderItemDao();
	ProductDao prodao=new ProductDao();
	
	public void add(Order order) {
		// 1.order
	 dao.add(order);
	 //2.orderitem
	   List<Orderitem> orderitems = order.getOrderitems();
	   for (Orderitem orderitem : orderitems) {
		itemdao.add(orderitem);
	}
	}

	public boolean payorder(String oid, String oname, String otel, String oaddress, String state,String pay) {
		// TODO Auto-generated method stub
		return dao.payorder(oid,oname, otel, oaddress,state,pay);
	}
	
	public boolean payMoney(String oid, String state) {
		// TODO Auto-generated method stub
		return dao.payMoney(oid,state);
	}

	public List<Order> Alllist(Page page, String oid) {
		// TODO Auto-generated method stub
		return dao.Alllist(page,oid);
	}

	public int getCount(String oid) {
		// TODO Auto-generated method stub
		return dao.getCount(oid);
	}

	public List<Order> list(Page page, int uid) {
		
		List<Order> list = dao.list(page,uid);
		for (Order order : list) {
			List<Orderitem> list2 = itemdao.list(order.getOid());
			
			for (Orderitem orderitem : list2) {
				orderitem.setProduct(prodao.getProductById(orderitem.getPid()));
			}
			
			order.setOrderitems(list2);
		}
		return list;
	}

	public boolean update(int oid, String oname, String otel, String oaddress) {
		// TODO Auto-generated method stub
		return dao.update(oid,oname,otel,oaddress);
	}
	
	public boolean updateState(String oid, String state) {
		// TODO Auto-generated method stub
		return dao.updateState(oid,state);
	}


	public Order select(int oid) {
		// TODO Auto-generated method stub
		return dao.select(oid);
	}

	public void del(int oid) {
		// TODO Auto-generated method stub
		 dao.del(oid);
		 
		 itemdao.del(oid);
	}

	public int getCountByUid(int uid) {
		// TODO Auto-generated method stub
		return dao.getCountByUid(uid);
	}

	public Order getByOid(String oid) {
		// TODO Auto-generated method stub
		return dao.getByOid(oid);
	}
	

	

}
