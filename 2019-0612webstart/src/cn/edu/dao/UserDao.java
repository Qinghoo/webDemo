package cn.edu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.tsc.util.BaseDbutil;
import com.tsc.util.Page;

import cn.edu.pojo.Admin;
import cn.edu.pojo.User;

public class UserDao extends BaseDbutil {

	public void add(User user) {
		try {
			qRunner.update(
					"insert into user(username,password,name,email,phone,addr,state,code) values(?,?,?,?,?,?,?,?)",
					user.getUsername(), user.getPassword(), user.getName(), user.getEmail(), user.getPhone(),
					user.getAddr(), user.getState(), user.getCode());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}

	public int getCount(String name) {
		try {
			return ((Long)qRunner.query("select count(*) from user where username like ?",new ScalarHandler<>(1), "%"+name+"%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<User> list(String name, Page page) {
			try {
				return qRunner.query("select * from user where username like ? limit ?,?", new BeanListHandler<>(User.class), "%"+name+"%",page.getStartRecord(),page.getPageSize());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	}

	public User getById(int id) {
		try {
			return qRunner.query("select * from user where id=?", new BeanHandler<>(User.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		try {
			qRunner.update(
					"update user set username=?,password=?,name=?,email=?,phone=?,addr=?,state=?,code=? where id=?",
					user.getUsername(), user.getPassword(), user.getName(), user.getEmail(), user.getPhone(),
					user.getAddr(), user.getState(), user.getCode(),user.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}

	public void del(int id) {
		try {
			qRunner.update(
					"delete from user where id=?",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}
}
