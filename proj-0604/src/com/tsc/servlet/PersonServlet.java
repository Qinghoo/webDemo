package com.tsc.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.company.utils.Page;
import com.tsc.popj.Person;
import com.tsc.service.PersonService;

/**
 * Servlet implementation class PersonServlet
 */
@WebServlet("/PersonServlet")
@MultipartConfig
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonService service=new PersonService();

	public PersonServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String m = request.getParameter("m");
		if (m.equals("add")) {
			addPerson(request, response);
		}else if (m.equals("findPersonById")) {
			findPersonById(request,response);
		}else if (m.equals("update")) {
			updatePerson(request,response);
		}else if (m.equals("list")) {
			listServlet(request,response);
		}
		if (m.equals("del")) {
			deletePerson(request,response);
		}
	}

	private void deletePerson(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		service.deletePerson(Integer.parseInt(id));
		response.sendRedirect(request.getContextPath()+"/PersonServlet?m=list");
	}

	private void updatePerson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Part part = request.getPart("photo");
		// 2.得到普通的表单域的值
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String birthday = request.getParameter("birthday");
		String[] hs = request.getParameterValues("hobbies");
		StringBuffer sb = new StringBuffer();
		for (String string : hs) {
			sb.append(",").append(string);
		}
		String hobbies = sb.substring(1);
		String sex = request.getParameter("sex");
		
		// 3.得到文件名
		// 3.1得到头:form-data; name="photo"; filename="cs10005.jpg"
		String header = part.getHeader("Content-Disposition");
		// 3.2根据头得到filename的值
		String filename = header.substring(header.indexOf("filename=") + 10, header.length() - 1);
		// 4.创建上传文件的目录
		String realPath = request.getServletContext().getRealPath("/upload/");
		// 5.创建File对象
		File dir = new File(realPath);
		// 6.判断文件夹是否存在
		if (!dir.exists()) {
			// 7.不存在就创建
			dir.mkdirs();
		}
		
		// 8.向目标文件写内容
		part.write(realPath + filename);
		String photoPath="upload/"+filename;
		String id = request.getParameter("id");
		Person person = new Person(Integer.parseInt(id),name, Integer.parseInt(age), birthday, hobbies, sex, photoPath);

		service.updatePerson(person);
		response.sendRedirect(request.getContextPath()+"/PersonServlet?m=list");
		
	}

	private void findPersonById(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Person person= service.findCompanyById(Integer.parseInt(id));
		request.setAttribute("person", person);
		try {
			request.getRequestDispatcher("update.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void listServlet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		/*List<Person> companyAll = service.findPersonAll();
		String json = JSON.toJSONString(companyAll);
		response.getWriter().print(json);*/
		//分页
		String curPage = request.getParameter("curPage");
		String name = request.getParameter("name");
		name=name==null?"":name;
		int pageSize=2;
		int count=service.getCount(name);
		Page page = new Page(curPage, count, pageSize);
		List<Person> list = service.findPersonAll(page,name);
		request.setAttribute("page", page);
		request.setAttribute("name", name);
		request.getSession().setAttribute("list",  list);
		try {
			request.getRequestDispatcher("/list.jsp").forward(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void addPerson(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Part part = request.getPart("photo");
		// 2.得到普通的表单域的值
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String birthday = request.getParameter("birthday");
		String[] hs = request.getParameterValues("hobbies");
		StringBuffer sb = new StringBuffer();
		for (String string : hs) {
			sb.append(",").append(string);
		}
		String hobbies = sb.substring(1);
		String sex = request.getParameter("sex");
		
		// 3.得到文件名
		// 3.1得到头:form-data; name="photo"; filename="cs10005.jpg"
		String header = part.getHeader("Content-Disposition");
		// 3.2根据头得到filename的值
		String filename = header.substring(header.indexOf("filename=") + 10, header.length() - 1);
		// 4.创建上传文件的目录
		String realPath = request.getServletContext().getRealPath("/upload/");
		// 5.创建File对象
		File dir = new File(realPath);
		// 6.判断文件夹是否存在
		if (!dir.exists()) {
			// 7.不存在就创建
			dir.mkdirs();
		}
		
		// 8.向目标文件写内容
		part.write(realPath + filename);
		String photoPath="upload/"+filename;
		Person person = new Person(name, Integer.parseInt(age), birthday, hobbies, sex, photoPath);
		service.addPerson(person);
		response.sendRedirect(request.getContextPath()+"/PersonServlet?m=list");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
