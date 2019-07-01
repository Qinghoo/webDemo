package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tsc.util.Page;

import cn.edu.pojo.Admin;
import cn.edu.pojo.Product;
import cn.edu.service.AdminService;
import cn.edu.service.ProductService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	AdminService adminService = new AdminService();

	public AdminServlet() {
		super();
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		Admin admin = adminService.getByUserName(username);
		HttpSession session = request.getSession();
		session.setAttribute("admin", admin);
		response.sendRedirect(request.getContextPath() + "/admin/home.jsp");
	}

	private void validUsername(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		Admin admin = adminService.getByUserName(username);
		response.getWriter().println(admin != null);

	}

	private void validPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admin admin = adminService.getByUserName(username);
		response.getWriter().println(admin != null && password.equals(admin.getPassword()));
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Admin admin = new Admin(name, password);
		adminService.add(admin);
		response.sendRedirect(request.getContextPath() + "/AdminServlet?m=list");
	}

	private void list(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String name = request.getParameter("name");
		String curPage = request.getParameter("curPage");
		name = name == null ? "" : name;
		int pageSize = 2;
		int count = adminService.getCount(name);
		Page page = new Page(curPage, count, pageSize);
		List<Admin> list = adminService.list(name, page);
		request.setAttribute("name", name);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/admin/list.jsp").forward(request, response);
	}

	private void getById(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String id = request.getParameter("id");
		Admin admin = adminService.getById(Integer.parseInt(id));
		request.setAttribute("admin", admin);
		request.getRequestDispatcher("/admin/admin/update.jsp").forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Admin admin = new Admin(Integer.parseInt(id), name, password);
		adminService.update(admin);
		response.sendRedirect(request.getContextPath() + "/AdminServlet?m=list");
	}

	private void del(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
	 	adminService.del(Integer.parseInt(id));
		response.sendRedirect(request.getContextPath() + "/AdminServlet?m=list");
	}
	
	  private void lll(HttpServletRequest request,HttpServletResponse response)
	  throws IOException, ServletException{ ProductService s = new
	  ProductService(); Page page = new Page("1", 6, 4); List<Product> list =
	  s.list("", page); request.setAttribute("list", list);
	  request.getRequestDispatcher("/admin/admin/080101.jsp").forward(request,
	  response); }
	 
}
