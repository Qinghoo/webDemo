package com.company.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.company.dao.CompanyDao;
import com.company.popj.Company;
import com.company.utils.Page;
import com.sun.jndi.toolkit.ctx.StringHeadTail;

public class CompanyService {
	private CompanyDao dao;

	public CompanyService() {
		this.dao=new CompanyDao();
	}
	public List<Company> FindCompanyAll(Page page,String name) {
		return dao.FindCompanyAll(page,name);
		
	}
	public List<Company> FindCompanyAll() {
		return dao.FindCompanyAll();
		
	}
	public Company FindCompanyById(int id) {
		return dao.FindCompanyById(id);
		
	}
	public boolean delCompany(int id) {
		return dao.delCompany(id);
	}
	public boolean insertCompany(Company company) {
		return dao.insertCompany(company);
	}
	public boolean updateCompany(Company company) {
		return dao.updateCompany(company);
	}
	public int getCount(String name) {
		return dao.getCount(name);
		
	}
	
}
