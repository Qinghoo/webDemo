package cn.edu.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

import cn.edu.pojo.Cart;
import cn.edu.pojo.CartItem;
import cn.edu.pojo.Product;
import cn.edu.service.ProductService;

/**
 * Servlet implementation class ProSelect
 */
@WebServlet("/CartServlet")
public class CartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	
	
	ProductService ps = new ProductService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	private void jia(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		Cart cart = getCart(request);
		
	   Map<Integer, CartItem> map = cart.getMap();
	   
	   cart.jia(map, pid);
	   request.getSession().setAttribute("cart", cart);
	    response.sendRedirect(request.getContextPath()+"/CartServlet?m=cartlist");
	}
	
	
    private void jian(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	int pid = Integer.parseInt(request.getParameter("pid"));
    	
		Cart cart = getCart(request);
		
		Map<Integer, CartItem> map = cart.getMap();
	   
		 cart.jian(map, pid);
		 request.getSession().setAttribute("cart", cart);
	    response.sendRedirect(request.getContextPath()+"/CartServlet?m=cartlist");
	}
	
	
	private void clear(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Cart cart = getCart(request);
		request.getSession().removeAttribute("map");
		request.getSession().removeAttribute("cart");
	    cart.clearCart();
		
	    response.sendRedirect(request.getContextPath()+"/CartServlet?m=cartlist");
	}


	private void delcart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
 
		Cart cart = getCart(request);
		
		//删除
		cart.removecart(pid);
		response.sendRedirect(request.getContextPath()+"/CartServlet?m=cartlist");
	}

	private void cartlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart==null) {
			String map=null;
			request.getRequestDispatcher("/cart.jsp").forward(request, response);
		}else {
		Map<Integer, CartItem> map = cart.getMap();
		for (Integer key : map.keySet()) {
			String minphoto = map.get(key).getProduct().getMinphoto();
			String[] sq = minphoto.split(";");
		    map.get(key).getProduct().setMinphoto(sq[0]);
		   }
		request.setAttribute("map", map);
		request.getRequestDispatcher("/cart.jsp").forward(request, response);
		}

	}
	private void addcart(HttpServletRequest request, HttpServletResponse response) throws IOException {	
		//接收数据
		String header = request.getHeader("referer");

		int pid = Integer.parseInt(request.getParameter("pid"));
		int count = Integer.parseInt(request.getParameter("count"));

		Product pro = ps.selectByPid(pid);
		//new CartItem
		CartItem cartItem = new CartItem(pro, count);
		
		Cart cart = getCart(request);
		
		//把cartItem 加到购物车中
		cart.addCart(cartItem);
		request.getSession().setAttribute("cart", cart);
		//response.sendRedirect(header);
		response.sendRedirect(request.getContextPath()+"/CartServlet?m=cartlist");

	}

	private Cart getCart(HttpServletRequest request) {
		//session->cart
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		
		if(cart==null){
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		return cart;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
