package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tsc.util.Page;

import cn.edu.pojo.Category;
import cn.edu.pojo.SecondCategory;
import cn.edu.service.CategoryService;
import cn.edu.service.SecondCategoryService;

@WebServlet("/SecondCategoryServlet")
public class SecondCategoryServlet extends BaseServlet{
	private SecondCategoryService service=new SecondCategoryService();
	private CategoryService service1=new CategoryService();
	protected void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		name = name == null ? "" : name;
		String curPage = request.getParameter("curPage");
		int count = service.getCount(name);
		int pageSize = 2;
		Page page = new Page(curPage, count, pageSize);
		List<SecondCategory> list = service.list(name, page);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("name", name);
		request.getRequestDispatcher("/admin/secondcategory/list.jsp").forward(request, response);
	}
	protected void toAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Category> list = service1.listAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/secondcategory/add.jsp").forward(request, response);
	}
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String cid= request.getParameter("cid");
		SecondCategory secondCategory=new SecondCategory(name,Integer.parseInt(cid));
		service.add(secondCategory);
		response.sendRedirect(request.getContextPath()+"/SecondCategoryServlet?m=list");
	}
	protected void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		SecondCategory secondCategory=service.getSecondCategoryById(Integer.parseInt(id));
		request.setAttribute("secondcategory", secondCategory);
		List<Category> list = service1.listAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/secondcategory/update.jsp").forward(request, response);
	}
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String cid = request.getParameter("cid");
		String name = request.getParameter("name");
		SecondCategory secondCategory=new SecondCategory(Integer.parseInt(id),name,Integer.parseInt(cid));
		service.update(secondCategory);
		response.sendRedirect(request.getContextPath()+"/SecondCategoryServlet?m=list");
	}
	protected void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		service.del(Integer.parseInt(id));
		response.sendRedirect(request.getContextPath()+"/SecondCategoryServlet?m=list");
	}
}
