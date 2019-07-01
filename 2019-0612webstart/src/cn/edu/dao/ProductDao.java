package cn.edu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.tsc.util.BaseDbutil;
import com.tsc.util.Page;

import cn.edu.pojo.Product;
import cn.edu.pojo.SecondCategory;

public class ProductDao extends BaseDbutil {

	public int getCount(String name) {
		// TODO Auto-generated method stub
		try {
			return ((Long) qRunner.query("select count(*) from product", new ScalarHandler<>(1))).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Product> list(String name, Page page) {
		try {
			return qRunner.query("select p.*,sc.name from product p,secondcategory sc where sc.id=p.stid and p.pname like ? limit ?,?",
					new BeanListHandler<>(Product.class), "%" + name + "%", page.getStartRecord(), page.getPageSize());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void addProduct(Product product) {
		try {
			qRunner.update("insert into product(pname,price,minphoto,maxphoto,stock,stid) values(?,?,?,?,?,?)",
					product.getPname(), product.getPrice(), product.getMinphoto(), product.getMaxphoto(),
					product.getStock(), product.getStid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void updateProduct(Product product) {
		try {
			qRunner.update("update product set pname=?,price=?,minphoto=?,maxphoto=?,stock=?,stid=? where pid=?",
					product.getPname(), product.getPrice(), product.getMinphoto(), product.getMaxphoto(),
					product.getStock(), product.getStid(),product.getPid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Product getProductById(int id) {
		try {
			return qRunner.query("select * from product where pid=?", new BeanHandler<>(Product.class), id);
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void delProduct(int id) {
		try {
			qRunner.update("delete from product where pid=?",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
