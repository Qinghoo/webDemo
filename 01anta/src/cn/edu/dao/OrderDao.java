package cn.edu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import com.tsc.util.BaseDbutil;
import com.tsc.util.Page;

import cn.edu.pojo.Order;

public class OrderDao extends BaseDbutil {
	
	public void add(Order o){
		String sql="insert into orders(oid,uid,time,pay,sum,state,oname,otel,oaddress) values(?,?,?,?,?,?,?,?,?)";
		try {
			qRunner.update(sql,o.getOid(),o.getUid(),o.getTime(),o.getPay(),o.getSum(),o.getState(),o.getOname(),o.getOtel(),o.getOaddress());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}


	}

	public boolean payorder(String oid, String oname, String otel, String oaddress, String state,String pay) {
		String sql="update orders set oname=?,otel=?,oaddress=?,state=?,pay=? where oid=?";
		try {
			return qRunner.update(sql,oname, otel, oaddress,state,pay,oid)>0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean payMoney(String oid, String state) {
		String sql="update orders set state=? where oid=?";
		try {
			return qRunner.update(sql,state,oid)>0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}


	public int getCount(String oid) {
		String sql="select count(*) from orders where oid like ?";
		try {
			return ((Long)qRunner.query(sql,new ScalarHandler<>(1),"%"+oid+"%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Order> Alllist(Page page, String oid) {
		String sql="select * from orders where oid like ? limit ?,?";
		try {
			return qRunner.query(sql,new BeanListHandler<Order>(Order.class),"%"+oid+"%",page.getStartRecord(),page.getPageSize());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public List<Order> list(Page page, int uid) {
		String sql="select * from orders where uid=? limit ?,?";
		try {
			return qRunner.query(sql,new BeanListHandler<Order>(Order.class),uid,page.getStartRecord(),page.getPageSize());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean update(int oid, String oname, String otel, String oaddress) {
		String sql="update orders set oname=?,otel=?,oaddress=? where oid=?";
		try {
			return qRunner.update(sql,oname, otel, oaddress,oid)>0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateState(String oid, String state) {
		String sql="update orders set state=? where oid=?";
		try {
			return qRunner.update(sql,state,oid)>0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	
	public Order select(int oid) {
		String sql="select * from orders where utel= ?";
		try {
			return qRunner.query(sql,new BeanHandler<Order>(Order.class),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void del(int oid) {
		String sql="delete from orders where oid="+oid;
		try {

			qRunner.update(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}

	public int getCountByUid(int uid) {
		String sql="select count(*) from orders where uid=? ";
		try {
			return ((Long)qRunner.query(sql,new ScalarHandler<>(1),uid)).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public Order getByOid(String oid) {
		String sql="select * from orders where oid= ?";
		try {
			return qRunner.query(sql,new BeanHandler<Order>(Order.class),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	

}
