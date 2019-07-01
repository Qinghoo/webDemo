package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.pojo.Message;
import cn.edu.pojo.User;
import cn.edu.service.MessageService;


/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet")
public class MessageServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	MessageService ms=new MessageService();
	private String upheader;

	//读取用户信息
	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		List<Message> list = ms.list(user.getUid());
		request.setAttribute("list", list);
		request.getRequestDispatcher("message/list.jsp").forward(request, response);
	}

	//选择收货信息
	protected void xuan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mname = request.getParameter("mname");
		String mtel = request.getParameter("mtel");
		String maddress = request.getParameter("maddress");

		User user = (User) request.getSession().getAttribute("user");

		user.setUaddress(maddress);
		user.setUtel(mtel);

		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("mname", mname);
		response.sendRedirect(request.getContextPath()+"/order/OrderServlet?m=address");
	}

	//添加收货信息
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getHeader("");

		String mname = request.getParameter("mname");
		String mtel = request.getParameter("mtel");
		String maddress = request.getParameter("maddress");

		User user = (User) request.getSession().getAttribute("user");

		Message message = new Message(user.getUid(), mname, mtel, maddress);
		if(ms.add(message)){
			response.sendRedirect(request.getContextPath()+"/MessageServlet?m=list");
		}


	}

	protected void getBid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收数据
		upheader = request.getHeader("referer");

		int mid = Integer.parseInt(request.getParameter("mid"));

		Message message = ms.getMessage(mid);
		request.setAttribute("message", message);
		request.getRequestDispatcher("/message/update.jsp").forward(request, response);


	}

	//修改信息
		private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
			//得到普通表单的值
			int mid = Integer.parseInt(request.getParameter("mid"));
			String mname = request.getParameter("mname");
			String mtel = request.getParameter("mtel");
			String maddress = request.getParameter("maddress");

			User user = (User) request.getSession().getAttribute("user");
			
			Message message= new Message(mid, user.getUid(), mname, mtel, maddress);

			if(ms.updateBymid(message)){
				//System.out.println(upheader);
				response.sendRedirect(upheader);
			}


		}

		//删除信息
		private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
			//接收数据

			String header = request.getHeader("referer");

			int mid = Integer.parseInt(request.getParameter("mid"));

			if(ms.delByid(mid)){
				//			response.sendRedirect(request.getContextPath()+"/UseServlet?m=list");
				response.sendRedirect(header);
			}

		}


}
