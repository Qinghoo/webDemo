package cn.edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.pojo.Product;
import cn.edu.service.ProductService;

@WebServlet("/DetailedServlet")
public class DetailedServlet extends BaseServlet{
	private ProductService proservice =new ProductService();
	
	
	protected void product(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid = request.getParameter("pid");
		Product product = proservice.getProductById(Integer.parseInt(pid));
		request.setAttribute("product", product);
		String[] s = product.getMinphoto().split(";");
		request.setAttribute("s", s);
		List<Product> list= proservice.getProduct();
		for (Product p : list) {
			String[] ss = p.getMinphoto().split(";");
			p.setMinphoto(ss[0]);
		}
		List<Product> mayLikeList= proservice.getMayLikeProduct(Integer.parseInt(pid));
		for (Product product2 : mayLikeList) {
			String[] ss = product2.getMinphoto().split(";");
			product2.setMinphoto(ss[0]);
		}
		request.setAttribute("mayLikeList",mayLikeList);
		request.getRequestDispatcher("/detailed.jsp").forward(request, response);
	}
}
