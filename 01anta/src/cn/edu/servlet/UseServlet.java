package cn.edu.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tsc.util.Page;
import com.tsc.util.Sendmail;

import cn.edu.pojo.User;
import cn.edu.service.UserService;





/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/use/UseServlet")
public class UseServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	UserService us = new UserService();

	private String upheader;
	
	
	private void yanzheng(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String yanzheng = request.getParameter("yanzheng");
		
		String code = (String) request.getSession().getAttribute("code");
	   
		
		if(yanzheng.equals(code)){
			// 1.得到jsp传来的参数
			String uname = request.getParameter("uname");
			String upwd = request.getParameter("upwd");
			String utel = request.getParameter("utel");
			String uemail = request.getParameter("uemail");
			String uaddress = request.getParameter("uaddress");
			System.out.println(uaddress);
			//		String uaddress = request.getParameter("uaddress");
			// 2.创建user对象
			User u = new User(uname, upwd, utel,uemail,uaddress);
          if(us.add(u)){
  			request.getRequestDispatcher("/use/login.jsp").forward(request, response);
          }
		}else{
			request.setAttribute("message", "激活失败！！");
			request.getRequestDispatcher("/use/regist.jsp").forward(request, response);
		}

	}
	
	
	
	
	private void deluser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收数据
		String header = request.getHeader("referer");

		request.getSession().removeAttribute("user");
		
		response.sendRedirect(header);
	}

	
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String header = request.getHeader("referer");
//		System.out.println(header);
		String utel = request.getParameter("utel");
		String upwd = request.getParameter("upwd");

		request.setAttribute("utel", utel);
		request.setAttribute("upwd", upwd);
		

		User u = us.selectTel(utel);
		
		request.getSession().setAttribute("user", u);

		if(upwd.equals(u.getUpwd())){   
			
//			request.setAttribute("message", "登陆成功！");
//			request.getRequestDispatcher("/message.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath()+"/CartServlet?m=cartlist");
			response.sendRedirect(request.getContextPath()+"/HomePageServlet?m=homePageList");

		}else{
			request.setAttribute("message", "密码有误！");
			request.getRequestDispatcher("/use/login.jsp").forward(request, response);
		}


	}

	private void getBid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收数据
		upheader = request.getHeader("referer");

		int id = Integer.parseInt(request.getParameter("id"));

		User u = us.selectByid(id);
		request.setAttribute("user", u);
		request.getRequestDispatcher("/use/update.jsp").forward(request, response);

	}

	//修改用户
	private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//得到普通表单的值
		int uid = Integer.parseInt(request.getParameter("uid"));
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String utel = request.getParameter("utel");
		String uemail = request.getParameter("uemail");
		String uaddress = request.getParameter("uaddress");

		User u=new User(uid, uname, upwd, utel, uemail, uaddress);

		if(us.updateByid(u)){
			System.out.println(upheader);
			response.sendRedirect(upheader);
		}


	}

	//删除用户
	private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//接收数据

		String header = request.getHeader("referer");

		int id = Integer.parseInt(request.getParameter("id"));

		if(us.delByid(id)){
			//			response.sendRedirect(request.getContextPath()+"/UseServlet?m=list");
			response.sendRedirect(header);
		}

	}

	//查看用户
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//a)接收请求的参数:
		String curPage=request.getParameter("curPage");
		String name = request.getParameter("name");
		name=name==null?"":name;
		System.out.println("name="+name);
		//c)设置每页显示的条数:
		int pageSize=5;
		//d)取得总记录数:
		int count=us.getCount(name);

		Page page=new Page(curPage, count, pageSize);

		//g)取得分页的列表数据:
		List<User> list=us.list(page,name);

		// h)将得到的分页的列表数据放到request作用域中:
		request.setAttribute("list",list);

		request.setAttribute("page",page);
		request.setAttribute("name",name);
		request.setAttribute("count",count);
		// l)请求转发到list.jsp.
		request.getRequestDispatcher("/use/list.jsp").forward(request, response);

	}

	//注册验证电话是否存在
	private void validUtel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String utel = request.getParameter("utel");
		//验证手机号是否存在
		response.getWriter().println(us.getCountByTel(utel)==0);

		//				if(us.getCountByTel(utel)!=0){
//					request.setAttribute("err_utel", "该电话号码已存在！");
//					request.getRequestDispatcher("/use/regist.jsp").forward(request, response);
//					return ;
//				}

	}
	
	//登录验证电话是否存在
		private void valid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String utel = request.getParameter("utel");
			//验证手机号是否存在
			response.getWriter().println(us.getCountByTel(utel)!=0);

		

		}
	
	//添加用户
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 1.得到jsp传来的参数
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String utel = request.getParameter("utel");
		String uemail = request.getParameter("uemail");
		String uaddress = request.getParameter("uaddress");
		//		String uaddress = request.getParameter("uaddress");
		// 2.创建user对象
		User u = new User(uname, upwd, utel,uemail,uaddress);
		
		request.setAttribute("user", u);


		// 1.得到jsp上传的验证码
		String validcode = request.getParameter("validcode");
		// 2.得到session保存的验证码
		String code = (String) request.getSession().getAttribute("code");
		// 3.二者比对
		/*if (validcode != null) {
			if (!validcode.equalsIgnoreCase(code)) {// 二者不等
				request.setAttribute("err_code", "你输入的验证码不正确");
				request.getRequestDispatcher("/use/regist.jsp").forward(request, response);
				return ;
			}
			else{
				System.out.println("验证码正确");
			}
		}else{
			request.setAttribute("err_code", "验证码为空");
			request.getRequestDispatcher("/use/login.jsp").forward(request, response);
			return ;
		}
*/
		// 4.发邮件
		Sendmail sendmail = new Sendmail(u,code);
		sendmail.start();

		// 5.响应信息
		request.setAttribute("message", "恭喜您，注册成功，我们已经发了一封带了注册信息的电子邮件，请查收，如果没有收到，可能是网络原因，过一会儿就收到了！！");
		request.getRequestDispatcher("/message.jsp").forward(request, response);
	}
	
	
	private void noPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService service=new UserService();
		PrintWriter out=response.getWriter();
		Cookie[] cookies=request.getCookies();//查询浏览器存储的本地Cookie,返回结果是数组。
		if(cookies!=null){
			String username=null;
			String password=null;
			for (Cookie cookie : cookies) {
				String name = cookie.getName();
				String value = cookie.getValue();
				if (name.equals("username")) {
					username=value;
					request.setAttribute("username", value);
				}else if (name.equals("password")) {
					password=value;
					request.setAttribute("username", value);
				}
			}
			User user = service.selectTel(username);
			if (user!=null) {
				if(user.getUpwd().equals(password)) {
					//这里存一下session
					request.getSession().setAttribute("user", user);
					//此处重定向到主页
					response.sendRedirect(request.getContextPath()+"/HomePageServlet?m=homePageList");
					return;
				}else {//1.jsp为登录页面的jsp
					/*System.out.println("密码错误");*/
					response.sendRedirect(request.getContextPath()+"/use/login.jsp");
				}
			}else {
				/*System.out.println("没获取到用户");*/
				response.sendRedirect(request.getContextPath()+"/use/login.jsp");
			}
		}else {
			/*System.out.println("没cookie");*/
			response.sendRedirect(request.getContextPath()+"/use/login.jsp");
		}
	}
	
	
	private void noPasswordLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		UserService service=new UserService();
		request.setCharacterEncoding("UTF-8");
		String userName=request.getParameter("utel");
		String passWord=request.getParameter("upwd");
		String autologin=request.getParameter("autologin");
		User user = service.selectTel(userName);
		if(passWord.equals(user.getUpwd())){
			if("auto".equals(autologin))
				{//自动登录时，创建Cookie,保存用户名。
					Cookie cookieUserName=new Cookie("username", userName);
					cookieUserName.setMaxAge(10*60);//设置保存时间为7天
					response.addCookie(cookieUserName);
					Cookie cookieLogin=new Cookie("password", passWord);
					cookieLogin.setMaxAge(10*60);//设置保存时间为7天
					response.addCookie(cookieLogin);
				}
			request.getSession().setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/HomePageServlet?m=homePageList");
		}
		else {
			response.sendRedirect(request.getContextPath()+"/use/login.jsp");
		}
	}
	protected void logOut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("user");
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			//将cookie 的有效时间设置为0，即清除cookie
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}

}
