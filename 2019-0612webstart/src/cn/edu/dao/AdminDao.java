package cn.edu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.tsc.util.BaseDbutil;
import com.tsc.util.Page;

import cn.edu.pojo.Admin;

public class AdminDao extends BaseDbutil{
	
	public Admin getByUserName(String username) {
		Admin admin;
		try {
			admin = qRunner.query("select * from admin where username=?", new BeanHandler<>(Admin.class), username);
			return admin;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void add(Admin admin) {
		try {
			qRunner.update("insert into admin(username,password) values(?,?)", admin.getUsername(),admin.getPassword());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getCount(String name) {
		
		try {
			return ((Long)qRunner.query("select count(*) from admin where username like ?",new ScalarHandler<>(1), "%"+name+"%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Admin> list(String name, Page page) {
		try {
			return qRunner.query("select * from admin where username like ? limit ?,?", new BeanListHandler<>(Admin.class), "%"+name+"%",page.getStartRecord(),page.getPageSize());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public Admin getById(int id) {
		try {
			return qRunner.query("select * from admin where id=?", new BeanHandler<>(Admin.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void update(Admin admin) {
		try {
			qRunner.update("update admin set username=?,password=? where id=?", admin.getUsername(),admin.getPassword(),admin.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void del(int id) {
		try {
			qRunner.update("delete from admin where id=?", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
