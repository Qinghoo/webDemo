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

	public boolean add(User u) {
		try {
			return qRunner.update(
					"insert into user(uname,upwd,utel,uemail,uaddress) values(?,?,?,?,?)",u.getUname(),u.getUpwd(),u.getUtel(),u.getUemail(),u.getUaddress())>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;

	}

	public int getCount(String name) {
		try {
			return ((Long)qRunner.query("select count(*) from user where utel like ?",new ScalarHandler<>(1), "%"+name+"%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<User> list(String name, Page page) {
			try {
				return qRunner.query("select * from user where utel like ? limit ?,?", new BeanListHandler<>(User.class), "%"+name+"%",page.getStartRecord(),page.getPageSize());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	}

	public User getById(int id) {
		try {
			return qRunner.query("select * from user where uid=?", new BeanHandler<>(User.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void update(User u) {
		// TODO Auto-generated method stub
		try {
			qRunner.update(
					"update user set uname=?,upwd=?,utel=?,uemail=?,uaddress=? where uid=?",
					u.getUname(),u.getUpwd(),u.getUtel(),u.getUemail(),u.getUaddress(),u.getUid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}

	public void del(int id) {
		try {
			qRunner.update(
					"delete from user where uid=?",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}
	
	
	
	
	
	
	public List<User> list(Page page ,String name){
		String sql="select * from user where length(utel)=11 and uname like ? limit ?,?";
		try {
			return qRunner.query(sql,new BeanListHandler<User>(User.class),"%"+name+"%",page.getStartRecord(),page.getPageSize());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public User selectByid(int id){
		String sql="select * from user where uid="+id;
		try {
			return qRunner.query(sql,new BeanHandler<User>(User.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}


	}

	public boolean delByid(int id){

		String sql="delete from user where uid="+id;
		try {

			return qRunner.update(sql)>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public boolean updateByid(User u){

		String sql="update users set uname=?,upwd=?,utel=? where uid=?";
		try {
			return qRunner.update(sql,u.getUname(),u.getUpwd(),u.getUtel(),u.getUid())>0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}


	public int getCountByTel(String utel) {
		String sql="select count(*) from user where utel= ?";
		try {
			return ((Long)qRunner.query(sql,new ScalarHandler<>(1),utel)).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	//根据电话查找密码
	public User selectTel(String utel){
		String sql="select * from user where utel= ?";
		try {
			return qRunner.query(sql,new BeanHandler<User>(User.class),utel);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}
