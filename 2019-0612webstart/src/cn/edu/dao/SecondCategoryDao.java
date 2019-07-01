package cn.edu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.tsc.util.BaseDbutil;
import com.tsc.util.Page;

import cn.edu.pojo.Category;
import cn.edu.pojo.SecondCategory;

public class SecondCategoryDao extends BaseDbutil {

	public int getCount(String name) {
		// TODO Auto-generated method stub
		try {
			return ((Long) qRunner.query("select count(*) from secondcategory where name like ?",
					new ScalarHandler<>(1), "%" + name + "%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<SecondCategory> list(String name, Page page) {
		// TODO Auto-generated method stub
		try {
			return qRunner.query(
					"select sc.*,c.name cname from secondcategory sc,category c where sc.cid=c.id and sc.name like ? limit ?,?",
					new BeanListHandler<>(SecondCategory.class), "%" + name + "%", page.getStartRecord(),
					page.getPageSize());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void add(SecondCategory secondCategory) {
		try {
			int i = qRunner.update("insert into secondcategory(name,cid) values(?,?)", secondCategory.getName(),
					secondCategory.getCid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void update(SecondCategory secondCategory) {
		try {
			int i = qRunner.update("update secondcategory set name=?,cid=?  where id=?", secondCategory.getName(),
					secondCategory.getCid(), secondCategory.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public SecondCategory getSecondCategoryById(int id) {
		try {
			return qRunner.query("select * from secondcategory where id=?", new BeanHandler<>(SecondCategory.class),
					id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void del(int id) {
		try {
			int i = qRunner.update("delete from secondcategory where id=?", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<SecondCategory> listAll() {
		// TODO Auto-generated method stub
		try {
			return qRunner.query(
					"select * from secondcategory",
					new BeanListHandler<>(SecondCategory.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
