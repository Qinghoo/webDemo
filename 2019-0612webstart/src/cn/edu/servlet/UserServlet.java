package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tsc.util.Page;

import cn.edu.pojo.Admin;
import cn.edu.pojo.User;
import cn.edu.service.UserService;

@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	private UserService service = new UserService();

	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		User user = new User(username, password, username, email, phone, addr, 0, "xyz");
		service.add(user);
		response.sendRedirect(request.getContextPath() + "/UserServlet?m=list");
	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String curPage = request.getParameter("curPage");
		name = name == null ? "" : name;
		int pageSize = 2;
		int count = service.getCount(name);
		Page page = new Page(curPage, count, pageSize);
		List<User> list = service.list(name, page);
		request.setAttribute("name", name);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/user/list.jsp").forward(request, response);
	}

	private void getById(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String id = request.getParameter("id");
		User user = service.getById(Integer.parseInt(id));
		request.setAttribute("user", user);
		request.getRequestDispatcher("/admin/user/update.jsp").forward(request, response);
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String cid = request.getParameter("cid");
		User user = new User(Integer.parseInt(id),username, password, username, email, phone, addr, Integer.parseInt(cid), "xyz");
		service.update(user);
		response.sendRedirect(request.getContextPath() + "/UserServlet?m=list");
	}
	private void del(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		service.del(Integer.parseInt(id));
		response.sendRedirect(request.getContextPath() + "/UserServlet?m=list");
	}

}
