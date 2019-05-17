package com.company.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.company.popj.Company;
import com.company.utils.BaseDbutil;
import com.company.utils.Page;

public class CompanyDao extends BaseDbutil{
	static QueryRunner qRunner=new QueryRunner(pool);
	public List<Company> FindCompanyAll(Page page,String name) {
		String sql="select * from t_company where name like ? limit ?,?";
		
		try {
			 //new BaseDbutil();
			 List<Company> list = qRunner.query(sql, new BeanListHandler<>(Company.class),"%"+name+"%",page.getStartRecord(),page.getPageSize());
			// System.out.println(company);
			 return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public List<Company> FindCompanyAll() {
		String sql="select * from t_company";
		
		try {
			//new BaseDbutil();
			List<Company> list = qRunner.query(sql, new BeanListHandler<>(Company.class));
			// System.out.println(company);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public Company FindCompanyById(int id) {
		String sql="select * from t_company where id=?";
		
		try {
			 //new BaseDbutil();
			Company company = qRunner.query(sql, new BeanHandler<>(Company.class),id);
			// System.out.println(company);
			 return company;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public boolean delCompany(int id) {
		String sql="delete from t_company where id=?";
		
		try {
			 //new BaseDbutil();
			int i = qRunner.update(sql,id);
			return i>0;
			// System.out.println(company);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public boolean insertCompany(Company company) {
		String sql="insert into t_company(name,sname,filepath) values(?,?,?)";
		
		try {
			 //new BaseDbutil();
			int i = qRunner.update(sql,company.getName(),company.getSname(),company.getFilepath());
			return i>0;
			// System.out.println(company);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public boolean updateCompany(Company company) {
		String sql="update t_company set name=?,sname=?,filepath=? where id=?";
		
		try {
			 //new BaseDbutil();
			int i = qRunner.update(sql,company.getName(),company.getSname(),company.getFilepath(),company.getId());
			return i>0;
			// System.out.println(company);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public int getCount(String name) {
		String sql="select count(*) from t_company where name like ?";
		try {
			return ((Long)qRunner.query(sql,new ScalarHandler<>(1),"%"+name+"%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
	
}
