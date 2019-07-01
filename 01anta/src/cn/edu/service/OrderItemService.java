package cn.edu.service;

import java.util.List;

import cn.edu.dao.OrderItemDao;
import cn.edu.dao.ProductDao;
import cn.edu.pojo.Orderitem;



public class OrderItemService {
	
	OrderItemDao dao = new OrderItemDao();
	ProductDao prodao = new ProductDao();

	public List<Orderitem> list(String oid) {
		List<Orderitem> list = dao.list(oid);
		for (Orderitem orderitem : list) {
			orderitem.setProduct(prodao.getProductById(orderitem.getPid()));
		}
		return list;
	}

}
