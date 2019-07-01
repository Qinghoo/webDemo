package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tsc.util.Page;

import cn.edu.pojo.Category;
import cn.edu.pojo.Product;
import cn.edu.pojo.SecondCategory;
import cn.edu.service.CategoryService;
import cn.edu.service.ProductService;
import cn.edu.service.SecondCategoryService;

@WebServlet("/ClassifyServlet")
public class ClassifyServlet extends BaseServlet{
	private SecondCategoryService secondCategoryService=new SecondCategoryService();
	private ProductService proservice =new ProductService();
	private CategoryService cservice =new CategoryService();
	
	protected void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String curPage = request.getParameter("currPage");
		int count = proservice.getCount("");
		int pageSize = 8;
		Page page = new Page(curPage, count, pageSize);
		List<Product> list=proservice.list("",page);
		for (Product product : list) {
			String[] s = product.getMinphoto().split(";");
			product.setMinphoto(s[0]);
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		
		
		List<Category> typeList = cservice.listAll();
		request.setAttribute("typeList", typeList);
		
		List<SecondCategory> stList = secondCategoryService.listBytid(1);
		request.setAttribute("stList", stList);
		
		String m="list";
		request.setAttribute("m", m);
		request.getRequestDispatcher("/classify.jsp").forward(request, response);
		
	}

	protected void type(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tid = request.getParameter("tid");
		//获取一級分類
		List<Category> typeList = cservice.listAll();
		request.setAttribute("typeList", typeList);
		
		//获取二级分类
		List<SecondCategory> stList = secondCategoryService.listBytid(Integer.parseInt(tid));
		request.setAttribute("stList", stList);
		
		//获取商品list
		String curPage = request.getParameter("currPage");
		int count = proservice.getCount(Integer.parseInt(tid));
		int pageSize = 8;
		Page page = new Page(curPage, count, pageSize);
		List<Product> list=proservice.list(Integer.parseInt(tid),page);
		for (Product product : list) {
			String[] s = product.getMinphoto().split(";");
			product.setMinphoto(s[0]);
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		String m="type";
		request.setAttribute("m", m);
		request.setAttribute("tid", tid);
		
		request.getRequestDispatcher("/classify.jsp").forward(request, response);		
		
	}
	protected void secondType(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String stid = request.getParameter("stid");
		//获取一級分類
		List<Category> typeList = cservice.listAll();
		request.setAttribute("typeList", typeList);
		
		//获取二级分类
		List<SecondCategory> stList  =secondCategoryService.getSecondCategoryAllById(Integer.parseInt(stid));
		request.setAttribute("stList", stList);
		
		
		String curPage = request.getParameter("currPage");
		int count = proservice.getCount2(Integer.parseInt(stid));
		int pageSize = 8;
		Page page = new Page(curPage, count, pageSize);
		List<Product> list=proservice.list2(Integer.parseInt(stid),page);
		for (Product product : list) {
			String[] s = product.getMinphoto().split(";");
			product.setMinphoto(s[0]);
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		String m="secondType";
		request.setAttribute("m", m);
		request.setAttribute("stid", stid);
		
		request.getRequestDispatcher("/classify.jsp").forward(request, response);		
	}
	

}
