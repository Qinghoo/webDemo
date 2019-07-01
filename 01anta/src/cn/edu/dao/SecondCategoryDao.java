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

public class SecondCategoryDao extends BaseDbutil{

	public int getCount(String name) {
		// TODO Auto-generated method stub
		try {
			return ((Long)qRunner.query("select count(*) from secondtype where stname like ?", new ScalarHandler<>(1),"%"+name+"%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<SecondCategory> list(String name, Page page) {
		// TODO Auto-generated method stub
		try {
			return qRunner.query("select sc.*,c.tname tname from secondtype sc,type c where sc.tid=c.tid and sc.stname like ? limit ?,?", new BeanListHandler<>(SecondCategory.class), "%"+name+"%",page.getStartRecord(),page.getPageSize());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void add(SecondCategory secondCategory) {
		try {
			int i = qRunner.update("insert into secondtype(stname,tid) values(?,?)", secondCategory.getStname(),secondCategory.getTid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void update(SecondCategory secondCategory) {
		try {
			int i = qRunner.update("update secondtype set tid=?,stname=? where stid=?", secondCategory.getTid(),secondCategory.getStname(), secondCategory.getStid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public SecondCategory getSecondCategoryById(int id) {
		try {
			return qRunner.query("select * from secondtype where stid=?", new BeanHandler<>(SecondCategory.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void del(int id) {
		try {
			int i = qRunner.update("delete from secondtype where stid=?", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<SecondCategory> listAll() {
		try {
			return qRunner.query("select * from secondtype", new BeanListHandler<SecondCategory>(SecondCategory.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<SecondCategory> listBytid(int tid) {
		try {
			return qRunner.query("select * from secondtype where tid=?", new BeanListHandler<SecondCategory>(SecondCategory.class),tid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<SecondCategory> getSecondCategoryAllById(int id) {
		try {
			return qRunner.query("select  st.* from  type t,secondtype st where t.tid=st.tid and t.tid=(select t.tid from type t,secondtype st where t.tid=st.tid and st.stid=?)", new BeanListHandler<SecondCategory>(SecondCategory.class),id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


}
