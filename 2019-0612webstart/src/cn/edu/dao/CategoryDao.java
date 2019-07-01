package cn.edu.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.tsc.util.BaseDbutil;
import com.tsc.util.Page;

import cn.edu.pojo.Category;

public class CategoryDao extends BaseDbutil {

	public int getCount(String name) {
		// TODO Auto-generated method stub
		try {
			return ((Long) qRunner.query("select count(*) from category where name like ?", new ScalarHandler<>(1),
					"%" + name + "%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Category> list(String name, Page page) {
		// TODO Auto-generated method stub
		try {
			return qRunner.query("select * from category where  name like ? limit ?,?",
					new BeanListHandler<>(Category.class), "%" + name + "%", page.getStartRecord(), page.getPageSize());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void add(Category category) {
		try {
			int i = qRunner.update("insert into category(name) values(?)", category.getName());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Category getCategoryById(int id) {
		// TODO Auto-generated method stub
		try {
			return qRunner.query("select * from category where id=?", new BeanHandler<>(Category.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void update(Category category) {
		try {
			int i = qRunner.update("update category set name=? where id=?", category.getName(), category.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Category> listAll() {
		// TODO Auto-generated method stub
		try {
			return qRunner.query("select * from category",
					new BeanListHandler<>(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void del(int id) {
		try {
			int i = qRunner.update("delete from category where id=?", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
