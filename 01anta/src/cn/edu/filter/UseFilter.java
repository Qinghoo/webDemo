package cn.edu.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.pojo.User;



/**
 * Servlet Filter implementation class UseFilter
 */
@WebFilter("/order/*")
public class UseFilter implements Filter {

	/**
	 * Default constructor. 
	 */
	public UseFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		//强转
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;

		String header = request.getHeader("referer");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//判断user是否为空
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){//没有登录，转到登录页面
			//if(header.contains("cartlist")){
				response.sendRedirect(request.getContextPath()+"/use/login.jsp");
			//}else {
				//request.getRequestDispatcher("/use/login.jsp").forward(request, response);
			
			
			return;
		}
		chain.doFilter(request, response);//放行
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
