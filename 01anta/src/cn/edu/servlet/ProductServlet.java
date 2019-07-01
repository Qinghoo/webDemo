package cn.edu.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tsc.util.Page;

import cn.edu.pojo.Category;
import cn.edu.pojo.Product;
import cn.edu.pojo.SecondCategory;
import cn.edu.service.ProductService;
import cn.edu.service.SecondCategoryService;

@WebServlet("/ProductServlet")
@MultipartConfig
public class ProductServlet extends BaseServlet {
	private ProductService service=new ProductService();
	private SecondCategoryService service1=new SecondCategoryService();
	
	protected void toAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<SecondCategory> list = service1.listAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/product/add.jsp").forward(request, response);;
	}
	
	protected void getById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		Product product=service.getProductById(Integer.parseInt(id));
		List<SecondCategory> list = service1.listAll();
		request.setAttribute("list", list);
		request.setAttribute("product", product);
		
		request.getRequestDispatcher("/admin/product/update.jsp").forward(request, response);;
	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		name = name == null ? "" : name;
		String curPage = request.getParameter("curPage");
		int count = service.getCount(name);
		int pageSize = 4;
		Page page = new Page(curPage, count, pageSize);
		List<Product> list = service.list(name, page);
		for (Product product : list) {
			String[] s = product.getMinphoto().split(";");
			product.setMinphoto(s[0]);
		}
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("name", name);
		request.getRequestDispatcher("/admin/product/list.jsp").forward(request, response);
	}
	
	protected void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		service.delProduct(Integer.parseInt(id));
		response.sendRedirect(request.getContextPath()+"/ProductServlet?m=list");
	}
	
	private String getFilename(Part part) {
        String contentDispositionHeader = 
                part.getHeader("content-disposition");
        String[] elements = contentDispositionHeader.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1)
                        .trim().replace("\"", "");
            }
        }
        return null;
    }

	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pname = request.getParameter("pname");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String maxphoto = request.getParameter("maxphoto");
		String stid= request.getParameter("stid");
		StringBuffer minphoto=new StringBuffer();
		// 2.得到普通的表单域的值
		Collection<Part> parts = request.getParts();
		 for (Part part : parts) {
	            if (part.getContentType() != null) {
	                // save file Part to disk
	                String fileName = getFilename(part);
	                if (fileName != null && !fileName.isEmpty()) {
	                    part.write(getServletContext().getRealPath(
	                            "/upload/minphoto") + "/" + fileName);
	                    minphoto.append(";").append("upload/minphoto/"+fileName);
	                }
	            }/* else {
	                // print field name/value
	                String partName = part.getName();
	                String fieldValue = request.getParameter(partName);
	                System.out.println("<br/>" + partName + ": " + 
	                        fieldValue);
	            }*/
	        }        
		 String min = minphoto.substring(1);
		 Product product = new Product(pname, Double.parseDouble(price), min, maxphoto, Integer.parseInt(stock), Integer.parseInt(stid));
		 service.addProduct(product);
		 response.sendRedirect(request.getContextPath()+"/ProductServlet?m=list");
		
	}
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pname = request.getParameter("pname");
		String pid = request.getParameter("pid");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		
		//String min1 = request.getParameter("min");//多于
		
		String maxphoto = request.getParameter("maxphoto");
		String stid= request.getParameter("stid");
		StringBuffer minphoto=new StringBuffer();
		// 2.得到普通的表单域的值
		Collection<Part> parts = request.getParts();
		 for (Part part : parts) {
	            if (part.getContentType() != null) {
	                // save file Part to disk
	                String fileName = getFilename(part);
	                if (fileName != null && !fileName.isEmpty()) {
	                    part.write(getServletContext().getRealPath(
	                            "/upload/minphoto") + "/" + fileName);
	                  /*  System.out.println("<br/>Uploaded file name: " +
	                            fileName);*/
	                    minphoto.append(";").append("upload/minphoto/"+fileName);
/*	                    System.out.println("<br/>Size: " + part.getSize());
*/	                }
	            }/* else {
	                // print field name/value
	                String partName = part.getName();
	                String fieldValue = request.getParameter(partName);
	                System.out.println("<br/>" + partName + ": " + 
	                        fieldValue);
	            }*/
	        }   
		 
		 String min = minphoto.substring(1);
		 
	 Product product = new Product(Integer.parseInt(pid),pname, Double.parseDouble(price), min, maxphoto, Integer.parseInt(stock), Integer.parseInt(stid));
		 //Product product = new Product(Integer.parseInt(pid),pname, Double.parseDouble(price), min1, maxphoto, Integer.parseInt(stock), Integer.parseInt(stid));//多余
		 service.updateProduct(product);
		
		response.sendRedirect(request.getContextPath()+"/ProductServlet?m=list");
	}
}
