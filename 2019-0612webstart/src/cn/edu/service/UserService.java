package cn.edu.service;


import java.util.List;

import com.tsc.util.Page;

import cn.edu.dao.UserDao;
import cn.edu.pojo.User;

public class UserService {
	private UserDao dao=new UserDao();

	public void add(User user) {
		// TODO Auto-generated method stub
		dao.add(user);
	}

	public  int getCount(String name) {
		// TODO Auto-generated method stub
		return dao.getCount(name);
	}

	public List<User> list(String name, Page page) {
		// TODO Auto-generated method stub
		return dao.list(name,page);
	}

	public User getById(int id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		dao.update(user);
	}

	public void del(int id) {
		// TODO Auto-generated method stub
		dao.del(id);
	}
}
