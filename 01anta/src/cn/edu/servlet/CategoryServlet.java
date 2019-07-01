package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tsc.util.Page;

import cn.edu.pojo.Category;
import cn.edu.service.CategoryService;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends BaseServlet {
	private CategoryService service = new CategoryService();

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		name = name == null ? "" : name;
		String curPage = request.getParameter("curPage");
		int count = service.getCount(name);
		int pageSize = 2;
		Page page = new Page(curPage, count, pageSize);
		List<Category> list = service.list(name, page);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("name", name);
		request.getRequestDispatcher("/admin/category/list.jsp").forward(request, response);
	}
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		Category category=new Category(name);
		service.add(category);
		response.sendRedirect(request.getContextPath()+"/CategoryServlet?m=list");
	}
	protected void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Category category=service.getCategoryById(Integer.parseInt(id));
		request.setAttribute("category", category);
		request.getRequestDispatcher("/admin/category/update.jsp").forward(request, response);
	}
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		Category category=new Category(Integer.parseInt(id),name);
		service.update(category);
		response.sendRedirect(request.getContextPath()+"/CategoryServlet?m=list");
	}
	protected void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		service.del(Integer.parseInt(id));
		response.sendRedirect(request.getContextPath()+"/CategoryServlet?m=list");
	}
}
