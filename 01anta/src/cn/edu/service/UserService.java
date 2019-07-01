package cn.edu.service;


import java.util.List;

import com.tsc.util.Page;

import cn.edu.dao.UserDao;
import cn.edu.pojo.User;

public class UserService {
	private UserDao dao=new UserDao();

	public boolean add(User user) {
		// TODO Auto-generated method stub
		return dao.add(user);
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
	
	
	
	
	
	

		public boolean updateByid(User u) {
			
			return this.dao.updateByid(u);
		}

		public boolean delByid(int id) {
			// TODO Auto-generated method stub
			return this.dao.delByid(id);
		}
		
		public List<User> list(Page page, String name) {
			// TODO Auto-generated method stub
			return this.dao.list(page,name);
		}
		public User selectByid(int id){
			// TODO Auto-generated method stub
			return this.dao.selectByid(id);
		}

		
		
		public int getCountByTel(String tel) {
			return this.dao.getCountByTel(tel);
		}

		//根据电话查找用户
		public User selectTel(String utel){
			
			return this.dao.selectTel(utel);
		}

}
