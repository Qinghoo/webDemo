package cn.edu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tsc.util.BaseDbutil;

import cn.edu.pojo.Message;



public class MessageDao extends BaseDbutil {

	public List<Message> list(int uid) {
		String sql="select * from shopaddress where uid=?";
		try {
			return qRunner.query(sql,new BeanListHandler<Message>(Message.class),uid);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean add(Message message) {
		String sql="insert into shopaddress(mname,mtel,maddress,uid) values(?,?,?,?)";
		try {
			return qRunner.update(sql,message.getMname(),message.getMtel(),message.getMaddress(),message.getUid())>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public Message getMessage(int mid) {
		String sql="select * from shopaddress where mid="+mid;
		try {
			return qRunner.query(sql,new BeanHandler<Message>(Message.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean updateBymid(Message message) {
		String sql="update shopaddress set mname=?,mtel=?,maddress=? where mid=?";
		try {
			return qRunner.update(sql,message.getMname(),message.getMtel(),message.getMaddress(),message.getMid())>0;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public boolean delByid(int mid) {
		String sql="delete from shopaddress where mid="+mid;
		try {

			return qRunner.update(sql)>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

}
