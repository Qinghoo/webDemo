package cn.edu.service;

import java.util.List;

import com.tsc.util.Page;

import cn.edu.dao.ProductDao;
import cn.edu.pojo.Product;
import cn.edu.pojo.SecondCategory;

public class ProductService {
	private ProductDao dao=new ProductDao();
	public int getCount(String name) {
		// TODO Auto-generated method stub
		return dao.getCount(name);
	}
	public List<Product> list(String name, Page page) {
		// TODO Auto-generated method stub
		return dao.list(name,page);
	}
	public void addProduct(Product product) {
		dao.addProduct(product);
	}
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		dao.updateProduct(product);
	}
	public Product getProductById(int id) {
		// TODO Auto-generated method stub
		return dao.getProductById(id);
	}
	public void delProduct(int id) {
		// TODO Auto-generated method stub
		dao.delProduct(id);
	}

}
