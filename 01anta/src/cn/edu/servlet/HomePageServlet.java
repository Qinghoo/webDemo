package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.pojo.Product;
import cn.edu.pojo.SecondCategory;
import cn.edu.service.ProductService;
import cn.edu.service.SecondCategoryService;


@WebServlet("/HomePageServlet")
public class HomePageServlet extends BaseServlet {
	private SecondCategoryService scservice=new SecondCategoryService();
	private ProductService pservice=new ProductService();
	
	
	protected void homePageList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<SecondCategory> paobu = scservice.listBytid(1);
		List<SecondCategory> lanqiu = scservice.listBytid(2);
		List<SecondCategory> zuqiu = scservice.listBytid(3);
		List<SecondCategory> jianshen = scservice.listBytid(4);
		List<SecondCategory> xiuxian = scservice.listBytid(5);
		List<SecondCategory> peijian = scservice.listBytid(6);
		List<SecondCategory> ertong = scservice.listBytid(7);
		HttpSession session = request.getSession();
		
		session.setAttribute("paobu", paobu);
		session.setAttribute("lanqiu", lanqiu);
		session.setAttribute("zuqiu", zuqiu);
		session.setAttribute("jianshen", jianshen);
		session.setAttribute("xiuxian", xiuxian);
		session.setAttribute("peijian", peijian);
		session.setAttribute("ertong", ertong);
		
		List<Product> list= pservice.getProduct();
		for (Product product : list) {
			String[] s = product.getMinphoto().split(";");
			product.setMinphoto(s[0]);
		}
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/homePage.jsp").forward(request, response);
	}

}
