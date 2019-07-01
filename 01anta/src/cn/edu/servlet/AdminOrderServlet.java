package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tsc.util.Page;

import cn.edu.pojo.Order;
import cn.edu.pojo.Orderitem;
import cn.edu.service.OrderItemService;
import cn.edu.service.OrderService;



/**
 * Servlet implementation class OrderItemServlet
 */
@WebServlet("/AdminOrderServlet")
public class AdminOrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	OrderService os = new OrderService();
	OrderItemService is = new OrderItemService();

	//发货
	private void send(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String header = request.getHeader("referer");
		
		String oid = request.getParameter("oid");

		String state = "待收货";

		if(os.payMoney(oid,state)){
			//response.sendRedirect(request.getContextPath()+"/AdminOrderServlet?m=alllist");
			response.sendRedirect(header);
		}

	}

	//管理员查看订单
	private void alllist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//a)接收请求的参数:
		String curPage=request.getParameter("curPage");
		String oid = request.getParameter("oid");
		oid=oid==null?"":oid;

		//c)设置每页显示的条数:
		int pageSize=2;
		//d)取得总记录数:
		int count=os.getCount(oid);

		Page page=new Page(curPage, count, pageSize);

		//g)取得分页的列表数据:
		List<Order> list = os.Alllist(page,oid);


		// h)将得到的分页的列表数据放到request作用域中:
		request.setAttribute("list",list);
		request.setAttribute("page",page);
		request.setAttribute("oid",oid);
		//				request.setAttribute("count",count);
		// l)请求转发到list.jsp.
		request.getRequestDispatcher("/admin/order/orderlist.jsp").forward(request, response);

	}

	//发货
		private void find(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
			String oid = request.getParameter("oid");

			List<Orderitem> list = is.list(oid);
            for (Orderitem orderitem : list) {
				String minphoto = orderitem.getProduct().getMinphoto();
				String[] sq = minphoto.split(";");
				orderitem.getProduct().setMinphoto(sq[0]);
			}
			request.setAttribute("list",list);
			request.getRequestDispatcher("/admin/order/orderitem.jsp").forward(request, response);

		}
	//修改订单
	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String header = request.getHeader("referer");

		int oid = Integer.parseInt(request.getParameter("oid"));
		String oname = request.getParameter("oname");
		String otel = request.getParameter("otel");
		String oaddress = request.getParameter("oaddress");

		if(os.update(oid,oname,otel,oaddress)){
			response.sendRedirect(header);
		}

	}


}
