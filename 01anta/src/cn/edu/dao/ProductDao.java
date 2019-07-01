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
			return qRunner.query("select p.*,sc.stname name from product p,secondtype sc where sc.stid=p.stid and p.pname like ? limit ?,?",
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

	public List<Product> getProduct() {
		try {
			return qRunner.query("select * from product limit 0,8",
					new BeanListHandler<>(Product.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Product> getAllProduct() {
		try {
			return qRunner.query("select * from product",
					new BeanListHandler<>(Product.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Product> list(int id, Page page) {
		try {
			return qRunner.query("select p.*,st.stname name from type t,secondtype st,product p where st.tid=t.tid and st.stid=p.stid and t.tid=? limit ?,?",
					new BeanListHandler<>(Product.class), id, page.getStartRecord(), page.getPageSize());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List<Product> list2(int id, Page page) {
		try {
			return qRunner.query("select p.*,st.stname name from type t,secondtype st,product p where st.tid=t.tid and st.stid=p.stid and st.stid=? limit ?,?",
					new BeanListHandler<>(Product.class), id, page.getStartRecord(), page.getPageSize());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int getCount(int id) {
		// TODO Auto-generated method stub
				try {
					return ((Long) qRunner.query("select count(p.pname) from type t,secondtype st,product p where st.tid=t.tid and st.stid=p.stid and t.tid=? ", new ScalarHandler<>(1),id)).intValue();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return 0;
	}
	public int getCount2(int id) {
		// TODO Auto-generated method stub
		try {
			return ((Long) qRunner.query("select count(p.pname) from type t,secondtype st,product p where st.tid=t.tid and st.stid=p.stid and st.stid=? ", new ScalarHandler<>(1),id)).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Product> getMayLikeProduct(int id) {
		// TODO Auto-generated method stub
		try {
			return qRunner.query("select p.*,t.tid from product p,secondtype st,type t where p.stid=st.stid and st.tid=t.tid and t.tid=(select t.tid from type t,secondtype st,product p where t.tid=st.tid and  p.stid=st.stid and p.pid=? ) limit ?,?",
					new BeanListHandler<>(Product.class), id, 0,5);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public Product selectByPid(int pid) {
		String sql="select * from product where pid="+pid;
		try {
			return qRunner.query(sql,new BeanHandler<Product>(Product.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	
	public void updateStock(int stock, int pid) {
		String sql="update product set stock=? where pid=?";
		try {
			 qRunner.update(sql,stock,pid);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}

}
