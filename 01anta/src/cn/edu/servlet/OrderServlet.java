package cn.edu.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tsc.util.Page;

import cn.edu.pojo.Cart;
import cn.edu.pojo.CartItem;
import cn.edu.pojo.Order;
import cn.edu.pojo.Orderitem;
import cn.edu.pojo.Product;
import cn.edu.pojo.User;
import cn.edu.service.OrderService;
import cn.edu.service.ProductService;



/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order/OrderServlet")
public class OrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private String oid;
	
	OrderService os = new OrderService();

	ProductService ps = new ProductService();


	//添加订单
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//订单号
		this.oid = UUID.randomUUID().toString();
		//下单时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(new Date());// new Date()为获取当前系统时间
		//获取用户信息
		User u = (User) request.getSession().getAttribute("user");

		String utel = u.getUtel();

		//支付方式，订单状态
		String pay = "";
		String state = "待支付";

		//收货信息
		String oname = u.getUname();
		String otel = u.getUtel();
		String oaddress = " ";
		if(u.getUaddress()!=null){
			oaddress = u.getUaddress();
		}

		//从session中获取cart
		Cart cart = (Cart) request.getSession().getAttribute("cart");

		//总计
		double sum = cart.getTotal();
		Order order = new Order(oid, u.getUid(), time, pay, sum, state, oname, otel, oaddress);

		//从cart中获取CartItem
		Collection<CartItem> cartItems = cart.getCartItems();
		Orderitem orderitem = null;
		for (CartItem cartItem : cartItems) {
			orderitem = new Orderitem(oid, cartItem.getProduct().getPid(), cartItem.getCount());

			orderitem.setProduct(cartItem.getProduct());//为页面显示而用

			//修改商品库存
			int stock = orderitem.getProduct().getStock()-orderitem.getNum();
			ps.updateStock(stock,orderitem.getProduct().getPid());
			
			order.getOrderitems().add(orderitem);
		}

		//上传数据库
		os.add(order);
		//清空购物车
		//cart.clearCart();
		/*request.getSession().removeAttribute("map");
		request.getSession().removeAttribute("cart");*/

		
		
		request.getSession().setAttribute("order", order);
		request.setAttribute("mname", u.getUname());
		request.getRequestDispatcher("/order/order.jsp").forward(request, response);
	}

	//去支付
	private void payorder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String oid = request.getParameter("oid");
		String oname = request.getParameter("oname");
		String otel = request.getParameter("otel");
		String oaddress = request.getParameter("oaddress");
        String pay = request.getParameter("pay");
		
		String state = "待支付";

		if(os.payorder(oid,oname,otel,oaddress,state,pay)){
			response.sendRedirect(request.getContextPath()+"/order/OrderServlet?m=list");
		}

	}


	//支付订单
	private void payMoney(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String oid = request.getParameter("oid");
	
		String state = "待发货";

		if(os.payMoney(oid,state)){
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			cart.clearCart();
			request.getSession().removeAttribute("map");
			request.getSession().removeAttribute("cart");
			response.sendRedirect(request.getContextPath()+"/order/OrderServlet?m=list");
		}

	}

	

	
	//用户查看订单
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = (User) request.getSession().getAttribute("user");
		int uid = u.getUid();

		String curPage = request.getParameter("curPage");
		//c)设置每页显示的条数:
		int pageSize=2;

		int count = os.getCountByUid(uid);
		Page page=new Page(curPage, count, pageSize);

		List<Order> list = os.list(page,uid);
		for (Order order : list) {
			List<Orderitem> orderitems = order.getOrderitems();
			for (Orderitem orderitem : orderitems) {
				Product product = orderitem.getProduct();
				String minphoto = product.getMinphoto();
				String[] sq = minphoto.split(";");
				product.setMinphoto(sq[0]);
			}
		}
		request.setAttribute("list",list);
		request.setAttribute("page",page);
		request.getRequestDispatcher("/order/myorder.jsp").forward(request, response);
	}

	

	
	
	//修改订单状态
		private void updateState(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String header = request.getHeader("referer");

			String oid = request.getParameter("oid");

			if(os.updateState(oid,"完成订单")){
				response.sendRedirect(header);
			}

		}

	
	//删除订单
	private void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String header = request.getHeader("referer");

		int oid = Integer.parseInt(request.getParameter("oid"));

		os.del(oid);
			response.sendRedirect(header);
		


	}


	//修改收货地址
	private void address(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//		Order order = os.getByOid(this.oid);
//        List<Orderitem> orderitems = order.getOrderitems();
//        for (Orderitem orderitem : orderitems) {
//			System.out.println(orderitem);
//		}
//		request.setAttribute("order", order);
				
		request.getRequestDispatcher("/order/order.jsp").forward(request, response);
	}



}
