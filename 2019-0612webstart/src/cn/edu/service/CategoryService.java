package cn.edu.service;

import java.util.List;

import com.tsc.util.Page;

import cn.edu.dao.CategoryDao;
import cn.edu.pojo.Category;

public class CategoryService {
private CategoryDao dao=new CategoryDao();

public int getCount(String name ) {
	// TODO Auto-generated method stub
	return dao.getCount(name);
}

public List<Category> list(String name, Page page) {
	// TODO Auto-generated method stub
	return dao.list(name,page);
}

public void add(Category category) {
	dao.add(category);
	
}

public Category getCategoryById(int id) {
	// TODO Auto-generated method stub
	return dao.getCategoryById(id);
}

public void update(Category category) {
	dao.update(category);
}

public List<Category> listAll() {
	return dao.listAll();
}
public void del(int id){
	dao.del(id);
}

}
