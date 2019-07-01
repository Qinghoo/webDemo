package cn.edu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import com.tsc.util.BaseDbutil;

import cn.edu.pojo.Orderitem;

public class OrderItemDao extends BaseDbutil {

	
	public void add(Orderitem item) {
		String sql="insert into orderitem(oid,pid,num,total) values(?,?,?,?)";
		try {
			qRunner.update(sql,item.getOid(),item.getPid(),item.getNum(),item.getTotal());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}


	public List<Orderitem> list(String oid) {
		String sql="select * from orderitem where oid = ?";
		try {
			return qRunner.query(sql,new BeanListHandler<Orderitem>(Orderitem.class),oid);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}


	public void del(int oid) {
		String sql="delete from orderitem where oid="+oid;
		try {

			qRunner.update(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}


	public List<Orderitem> Alllist() {
		String sql="select * from orderitem";
		try {
			return qRunner.query(sql,new BeanListHandler<Orderitem>(Orderitem.class));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
