package cn.edu.service;

import java.util.List;

import com.tsc.util.Page;

import cn.edu.dao.AdminDao;
import cn.edu.pojo.Admin;

public class AdminService {
	AdminDao dao=new AdminDao();
	public Admin getByUserName(String username) {
		return dao.getByUserName(username);
		
	}
	public void add(Admin admin) {
		dao.add(admin);
	}
	public int getCount(String name) {
		// TODO Auto-generated method stub
		return dao.getCount(name);
	}
	public List<Admin> list(String name, Page page) {
		// TODO Auto-generated method stub
		return dao.list(name,page);
	}
	public Admin getById(int id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}
	public void update(Admin admin) {
		// TODO Auto-generated method stub
		dao.update(admin);
	}
	public void del(int id) {
		// TODO Auto-generated method stub
		dao.del(id);
	}
	
}
