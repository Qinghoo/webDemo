package com.company.servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.alibaba.fastjson.JSON;
import com.company.popj.Company;
import com.company.service.CompanyService;
import com.company.utils.Page;



/**
 * Servlet implementation class CompanyServlet
 */
@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String m=request.getParameter("m");
		
		//String m = request.getParameter("m");
		if (m.equals("list")) {
			listServlet(request,response);
			
		}else if (m.equals("findById")) {
			findByIdServlet(request,response);
		}else if (m.equals("del")) {
		delServlet(request,response);
		}else if (m.equals("add")) {
			addServlet(request,response);
		}else if (m.equals("update")) {
		updateServlet(request,response);
}
		
		
		
		
		
		
	}

	private void updateServlet(HttpServletRequest request, HttpServletResponse response) {
		boolean b=ServletFileUpload.isMultipartContent(request);
		if (b) {
			Company company=new Company();
			StringBuffer imgs=new StringBuffer();
			
			FileItemFactory factory=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(factory);
			List <FileItem> list;
			try {
				list=upload.parseRequest(request);
				
				for (FileItem fileItem : list) {
					if (fileItem.isFormField()) {
						String fileName=fileItem.getFieldName();
						if (fileName.equals("name")) {
							System.out.println("name"+fileItem.getString("UTF-8"));
							company.setName(fileItem.getString("UTF-8"));
						}if (fileName.equals("id")) {
							System.out.println("id"+fileItem.getString("UTF-8"));
							company.setId(Integer.parseInt(fileItem.getString("UTF-8")));
						}
						if (fileName.equals("sname")) {
							System.out.println("sname"+fileItem.getString("UTF-8"));
							company.setSname(fileItem.getString("UTF-8"));
						}
						if (fileName.equals("id")) {
							System.out.println("id"+fileItem.getString("UTF-8"));
							company.setId(Integer.parseInt(fileItem.getString("UTF-8")));
						}
						
						
					}else {
						String fileName=fileItem.getName();
						if (fileName!=null&&!fileName.equals("")&&fileItem.getSize()>0) {
							System.out.println(fileName);
							String realPath = request.getServletContext().getRealPath("/upload/");
							System.out.println(realPath);
							File dir=new File(realPath);
							if (!dir.exists()) {
								dir.mkdirs();
							}
							File destFile = new File(dir,fileName);
							fileItem.write(destFile);
							imgs.append(",").append("upload/"+fileName);
						}
						
					}
				}
				company.setFilepath(imgs.substring(1));
				CompanyService service=new CompanyService();
				
						boolean c = service.updateCompany(company);
						
						response.getWriter().print(c);
						//response.sendRedirect(request.getContextPath()+"/list.jsp");
					
				
				
				//request.getRequestDispatcher("/Servlet0?m=add").forward(request, response);
				
				//response.sendRedirect(request.getContextPath()+"/Servlet0?m=add");
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	}

	private void addServlet(HttpServletRequest request, HttpServletResponse response) {
		boolean b=ServletFileUpload.isMultipartContent(request);
		if (b) {
			Company company=new Company();
			StringBuffer imgs=new StringBuffer();
			
			FileItemFactory factory=new DiskFileItemFactory();
			ServletFileUpload upload=new ServletFileUpload(factory);
			List <FileItem> list;
			try {
				list=upload.parseRequest(request);
				
				for (FileItem fileItem : list) {
					if (fileItem.isFormField()) {
						String fileName=fileItem.getFieldName();
						if (fileName.equals("name")) {
							System.out.println("name"+fileItem.getString("UTF-8"));
							company.setName(fileItem.getString("UTF-8"));
						}if (fileName.equals("id")) {
							System.out.println("id"+fileItem.getString("UTF-8"));
							company.setId(Integer.parseInt(fileItem.getString("UTF-8")));
						}
						if (fileName.equals("sname")) {
							System.out.println("age"+fileItem.getString("UTF-8"));
							company.setSname(fileItem.getString("UTF-8"));
						}
						
						
					}else {
						String fileName=fileItem.getName();
						if (fileName!=null&&!fileName.equals("")&&fileItem.getSize()>0) {
							System.out.println(fileName);
							String realPath = request.getServletContext().getRealPath("/upload/");
							System.out.println(realPath);
							File dir=new File(realPath);
							if (!dir.exists()) {
								dir.mkdirs();
							}
							File destFile = new File(dir,fileName);
							fileItem.write(destFile);
							imgs.append(",").append("upload/"+fileName);
						}
						
					}
				}
				company.setFilepath(imgs.substring(1));
				CompanyService service=new CompanyService();
				
						boolean c = service.insertCompany(company);
						
						response.getWriter().print(c);
						//response.sendRedirect(request.getContextPath()+"/list.jsp");
					
				
				
				//request.getRequestDispatcher("/Servlet0?m=add").forward(request, response);
				
				//response.sendRedirect(request.getContextPath()+"/Servlet0?m=add");
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	}
		
	

	private void delServlet(HttpServletRequest request, HttpServletResponse response) {
		CompanyService service=new CompanyService();
		String id=request.getParameter("id");
		service.delCompany(Integer.parseInt(id));
		try {
			response.sendRedirect(request.getContextPath()+"/list.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void findByIdServlet(HttpServletRequest request, HttpServletResponse response) {
		CompanyService service=new CompanyService();
		String id = request.getParameter("id");
		System.out.println(id);
		Company company = service.FindCompanyById(Integer.parseInt(id));
		System.out.println(company);
		try {
			String json = JSON.toJSONString(company);
			response.getWriter().print(json);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		/*request.setAttribute("company", company);*/
		
		
	}

	private void listServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CompanyService service=new CompanyService();
		List<Company> companyAll = service.FindCompanyAll();
		String json = JSON.toJSONString(companyAll);
		response.getWriter().print(json);
		
		/*String curPage = request.getParameter("curPage");
		String name = request.getParameter("name");*/
		/*name=name==null?"":name;*/
		/*int pageSize=2;
		int count=service.getCount(name);
		Page page = new Page(curPage, count, pageSize);
		List<Company> list = service.FindCompanyAll(page, name);
		request.setAttribute("page", page);
		request.setAttribute("name", name);
		request.getSession().setAttribute("list",  list);
		try {
			request.getRequestDispatcher("/list.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
