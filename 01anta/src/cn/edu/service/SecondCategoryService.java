package cn.edu.service;

import java.io.IOException;
import java.util.List;



import org.apache.commons.dbutils.QueryRunner;

import com.tsc.util.Page;

import cn.edu.dao.SecondCategoryDao;
import cn.edu.pojo.Category;
import cn.edu.pojo.SecondCategory;

public class SecondCategoryService {
	private SecondCategoryDao dao=new SecondCategoryDao();

	public int getCount(String name) {
		return dao.getCount(name);
	}

	public List<SecondCategory> list(String name, Page page) {
		// TODO Auto-generated method stub
		return dao.list(name,page);
	}

	public void add(SecondCategory secondCategory) {
		// TODO Auto-generated method stub
		dao.add(secondCategory);
	}

	public void update(SecondCategory secondCategory) {
		dao.update(secondCategory);
	}

	public SecondCategory getSecondCategoryById(int id) {
		// TODO Auto-generated method stub
		return dao.getSecondCategoryById(id);
	}

	public void del(int id) {
		// TODO Auto-generated method stub
		dao.del(id);
	}

	public List<SecondCategory> listAll() {
		return dao.listAll();
	}

	public List<SecondCategory> listBytid(int tid) {
		return dao.listBytid(tid);
	}

	public List<SecondCategory> getSecondCategoryAllById(int id) {
		return dao.getSecondCategoryAllById(id);
		// TODO Auto-generated method stub
		
	}

	
	
}
